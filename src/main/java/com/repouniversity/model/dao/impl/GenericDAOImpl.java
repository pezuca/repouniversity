package com.repouniversity.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.PostConstruct;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.repouniversity.model.dao.GenericDAO;
import com.repouniversity.model.dao.IdentifiedObject;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.LongRowMapper;
import com.repouniversity.web.exceptions.EntityUpdateException;

public abstract class GenericDAOImpl<E extends IdentifiedObject> implements GenericDAO<E> {

    protected static final String NOW = "NOW()";

    protected static final String FIELD_ID = "id";
    protected static final String FIELD_INSERTED_TIME = "inserted_time";
    protected static final String FIELD_UPDATED_TIME = "updated_time";
    protected static final String FIELD_ENABLED = "enabled";

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private String databaseName;

    protected abstract Class<E> getEntityClass();

    protected abstract String getTableName();

    protected abstract E extractEntityFromResultSet(ResultSet rs, int line) throws SQLException;

    protected abstract InsertSQLStatement buildInsertSQLStatement(final E t);

    protected abstract SQLStatement buildUpdateSQLStatement(final E t);

    @PostConstruct
    public void init() {

        String url = ((BasicDataSource) jdbcTemplate.getDataSource()).getUrl();

        Pattern pattern = Pattern.compile(".*:\\d*/(.*)\\?");
        Matcher m = pattern.matcher(url);

        if (m.find()) {
            databaseName = m.group(1);
        } else {
            throw new RuntimeException("Could not extract database name from DataSource");
        }
    }

    protected String getDatabaseName() {
        return databaseName;
    }

    /**
     * Returns the name of the id column. Overrides if needed.
     * @return
     */
    protected String getColumnIdName() {
        return FIELD_ID;
    }

    protected final Long extractId(KeyHolder keyHolder) {
        return Long.valueOf(keyHolder.getKey().longValue());
    }

    public GenericDAOImpl() {
    }

    @Override
    public E findById(final Long k) {
        List<E> list = findByIds(k);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<E> findByIds(final Long... keys) {
        if (keys.length == 0) {
            return Collections.emptyList();
        }

        List<Long> ids = Arrays.asList(keys);
        final List<Long> idsToFind = new ArrayList<Long>(ids.size());

        List<E> queryList = new ArrayList<E>();

        if (!ids.isEmpty()) {

            queryList = jdbcTemplate.query(new PreparedStatementCreator() {
                @Override
                public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                    PreparedStatement ps = connection.prepareStatement("SELECT DISTINCT * FROM " + getTableName() + " WHERE " + getColumnIdName() + " IN ("
                            + getQuestionMarks(idsToFind) + ") AND DELETED = FALSE");

                    for (int i = 0; i < idsToFind.size(); i++) {
                        ps.setLong(i + 1, idsToFind.get(i));
                    }

                    return ps;
                }
            }, new RowMapper<E>() {
                @Override
                public E mapRow(ResultSet rs, int line) throws SQLException {
                    return extractEntityFromResultSet(rs, line);
                }

            });
        }

        return queryList;
    }

    /**
     * Inserts a new entity.
     * It supposes that the primary key is long. If T has another type, this method must be overridden.
     */
    @Override
    public E insert(final E t) {
        try {
            KeyHolder keyHolder = new GeneratedKeyHolder();

            final InsertSQLStatement sqlStatement = buildInsertSQLStatement(t);

            jdbcTemplate.update(new PreparedStatementCreator() {

                @Override
                public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                    PreparedStatement ps = connection.prepareStatement(sqlStatement.getQuery(), Statement.RETURN_GENERATED_KEYS);
                    sqlStatement.buildPreparedStatement(ps);
                    return ps;
                }

            }, keyHolder);

            Long id = extractId(keyHolder);

            t.setId(id);

            sqlStatement.doAfterInsert(id);

            return t;

        } catch (RuntimeException e) {
            throw e;
        }
    }

    @Override
    public void update(final E t) {
        try {
            final SQLStatement sqlStatement = buildUpdateSQLStatement(t);
            int result = jdbcTemplate.update(new PreparedStatementCreator() {
                @Override
                public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                    PreparedStatement ps = connection.prepareStatement(sqlStatement.getQuery(), Statement.RETURN_GENERATED_KEYS);
                    sqlStatement.buildPreparedStatement(ps);
                    return ps;
                }
            });

            if (result == 0) {
                throw new EntityUpdateException("Error on update " + getTableName());
            }

            sqlStatement.doAfterTransaction(result);

        } catch (RuntimeException e) {
            throw e;
        }
    }

    private class Constraint {
        String tableName;
        String columnName;
    }

    @Override
    public boolean delete(final E t) {
        try {
            int result = 0;

            result = jdbcTemplate.update(new PreparedStatementCreator() {

                @Override
                public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                    PreparedStatement ps = connection.prepareStatement("UPDATE " + getTableName() + " SET deleted = TRUE, deleted_time = NOW() WHERE id = ?");
                    ps.setLong(1, t.getId());
                    return ps;
                }
            });

            return result == 1;
        } catch (RuntimeException e) {
            throw e;
        }
    }

    @Override
    public List<E> findAll() {

        List<Long> ids = jdbcTemplate.query("SELECT * FROM " + getTableName(), new LongRowMapper());

        return findByIds(ids.toArray(new Long[ids.size()]));
    }

    /* Auxiliary methods */

    protected Object[] collectionToObjectArray(Collection<? extends Object> collection, Object... params) {

        int arraySize = collection.size() + params.length;

        Object[] objectArray = new Object[arraySize];

        Iterator<? extends Object> it = collection.iterator();

        for (int count = 0; count < collection.size(); count++) {

            Object element = it.next();

            if (element instanceof Enum) {
                objectArray[count] = element.toString();
            } else {
                objectArray[count] = element;
            }
        }

        int offset = collection.size();
        for (int count = offset; count < arraySize; count++) {
            objectArray[count] = params[count - offset];
        }
        return objectArray;
    }

    protected String getQuestionMarks(Collection<? extends Object> collection) {

        if (collection.isEmpty()) {
            return StringUtils.EMPTY;
        }

        StringBuilder questions = new StringBuilder();

        for (int count = 0; count < collection.size(); count++) {
            questions.append("?,");
        }
        questions.setLength(questions.length() - 1);

        return questions.toString();
    }

    protected String getQuestionMarks(Object[] objects) {

        if (objects.length == 0) {
            return StringUtils.EMPTY;
        }

        StringBuilder questions = new StringBuilder();

        for (int count = 0; count < objects.length; count++) {
            questions.append("?,");
        }
        questions.setLength(questions.length() - 1);

        return questions.toString();
    }

    /**
     * @param psc
     * @param rowMapper
     * @param logMessage
     * @return
     */
    protected <Y> List<Y> doQuery(final SQLStatement sql, RowMapper<Y> rowMapper, String logMessage) {
        List<Y> result = jdbcTemplate.query(new DefaultPreparedStatementCreator(sql), rowMapper);

        return result;
    }

    /**
     * The PreparedStatement query must return an id list!!!
     * @param logMessage
     * @param ps
     * @return
     */
    protected List<E> doQueryById(final SQLStatement sql, String logMessage) {
        List<Long> ids = jdbcTemplate.query(new DefaultPreparedStatementCreator(sql), new LongRowMapper());

        return findByIds(ids.toArray(new Long[ids.size()]));
    }

    protected int doUpdate(final SQLStatement sql, String logMessage) {
        int result = jdbcTemplate.update(new DefaultPreparedStatementCreator(sql));

        return result;
    }
}
