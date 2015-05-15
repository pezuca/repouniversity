package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.CarreraDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.CarreraRowMapper;
import com.repouniversity.model.entity.Carrera;
import com.repouniversity.model.entity.Materia;

@Repository
public class CarreraDAOImpl extends GenericDAOImpl<Carrera> implements CarreraDAO {

    protected static final String TABLE_NAME = "carrera";

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    protected Class<Carrera> getEntityClass() {
        return Carrera.class;
    }

    @Override
    protected String getTableName() {
        return TABLE_NAME;
    }

    @Override
    protected Carrera extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new CarreraRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Carrera t) {

        return new InsertSQLStatement("insert into carrera (nombre, activo) values (?, 1)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Carrera t) {

        return new SQLStatement("update alumno set nombre = ? where " + getColumnIdName() + "id = ?") {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
                ps.setLong(2, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected String getColumnIdName() {
        return "idcarrera";
    }

    @Override
    public List<Carrera> findByMateriaId(final Long materiaId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT c.* from carrera c JOIN carrera_materia cm ON cm.idcarrera = c.idcarrera ");
        sql.append("WHERE ac.id_alumno = ? ");
        sql.append("AND c.activo = 1");

        List<Carrera> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, materiaId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new CarreraRowMapper(), "findByCursoId: " + materiaId);

        return list;
    }

    @Override
    public List<Long> getMateriaIds(final Long carreraId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT cm.idmateria from carrera_materia cm ");
        sql.append("WHERE cm.idcarrera = ? ");

        SQLStatement sqlStatement = new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, carreraId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };

        List<Long> ids = getIdsFromQuery(sqlStatement);

        return ids;
    }

    @Override
    public void removerAsociacionesMaterias(Long carreraId, List<Long> materiasIds) {

        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM carrera_materia cm ");
        sql.append("WHERE (cm.idcarrera = ?) AND cm.idmateria IN (" + getQuestionMarks(materiasIds) + ")");

        jdbcTemplate.update(sql.toString(), collectionToObjectArray(materiasIds));

    }

    @Override
    public void asociaciarMaterias(final Long carreraId, List<Long> listaMaterias) {

        for (Long materiaId : listaMaterias) {
            final Long matId = materiaId; 
            StringBuilder sql = new StringBuilder();

            sql.append("INSERT INTO carrera_materia (idcarrera, idmateria) ");
            sql.append("VALUES (?, ?)");

            SQLStatement sqlStatement = new SQLStatement(sql.toString()) {
                @Override
                public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                    ps.setLong(1, carreraId);
                    ps.setLong(1, matId);
                }

                @Override
                public void doAfterTransaction(int result) {
                }
            };

            jdbcTemplate.update(sql.toString(), sqlStatement);
        }

    }
}
