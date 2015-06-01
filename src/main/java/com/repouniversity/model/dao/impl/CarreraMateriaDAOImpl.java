package com.repouniversity.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.CarreraMateriaDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.CarreraMateriaRowMapper;
import com.repouniversity.model.entity.CarreraMateria;

@Repository
public class CarreraMateriaDAOImpl extends GenericDAOImpl<CarreraMateria> implements CarreraMateriaDAO {

    protected static final String TABLE_NAME = "carrera_materia";

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    protected Class<CarreraMateria> getEntityClass() {
        return CarreraMateria.class;
    }

    @Override
    protected String getTableName() {
        return TABLE_NAME;
    }

    @Override
    protected CarreraMateria extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new CarreraMateriaRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final CarreraMateria t) {

        return new InsertSQLStatement("insert into " + TABLE_NAME + " (idmateria, idcarrera) values (?, ?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdMateria());
                ps.setLong(2, t.getIdCarrera());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final CarreraMateria t) {

        return new SQLStatement("update " + TABLE_NAME + " set idmateria = ? where iscarrera = ?") {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdMateria());
                ps.setLong(2, t.getIdCarrera());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected String getColumnIdName() {
        return null;
    }

    @Override
    public boolean delete(final CarreraMateria carreraMateria) {
        try {
            int result = 0;

            result = jdbcTemplate.update(new PreparedStatementCreator() {

                @Override
                public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                    PreparedStatement ps = connection.prepareStatement("DELETE FROM " + getTableName() + " WHERE idmateria = ? AND idcarrera = ?");
                    ps.setLong(1, carreraMateria.getIdMateria());
                    ps.setLong(2, carreraMateria.getIdCarrera());
                    return ps;
                }
            });

            return result == 1;
        } catch (RuntimeException e) {
            throw e;
        }
    }
    
    @Override
    public CarreraMateria insert(final CarreraMateria carreraMateria) {
        try {
            KeyHolder keyHolder = new GeneratedKeyHolder();

            final InsertSQLStatement sqlStatement = buildInsertSQLStatement(carreraMateria);

            jdbcTemplate.update(new PreparedStatementCreator() {

                @Override
                public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                    PreparedStatement ps = connection.prepareStatement(sqlStatement.getQuery(), Statement.RETURN_GENERATED_KEYS);
                    sqlStatement.buildPreparedStatement(ps);
                    return ps;
                }

            }, keyHolder);

            return carreraMateria;

        } catch (RuntimeException e) {
            throw e;
        }
    }
}
