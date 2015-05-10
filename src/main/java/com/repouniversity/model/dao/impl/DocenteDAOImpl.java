package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.DocenteDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.DocenteRowMapper;
import com.repouniversity.model.entity.Docente;

@Repository
public class DocenteDAOImpl extends GenericDAOImpl<Docente> implements DocenteDAO {

    @Override
    public Docente getByCursoMateriaId(final Long cursoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT distinct d.*, p.* from curso c JOIN docente d ON c.id_docente = c.id_docente ");
        sql.append("JOIN persona p ON p.id_persona = d.id_persona ");
        sql.append("WHERE c.id_curso =  ? ");
        sql.append("AND d.activo = 1 AND p.activo = 1");

        List<Docente> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, cursoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new DocenteRowMapper(), "getByCursoMateriaId: " + cursoId);

        if (list.isEmpty()) {
            return null;
        }

        return list.get(0);
    }

    @Override
    protected Class<Docente> getEntityClass() {
        return Docente.class;
    }

    @Override
    protected String getTableName() {
        return "docente";
    }

    @Override
    protected Docente extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        Docente result = new Docente();

        result.setId(rs.getLong("id_docente"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));

        return result;
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Docente t) {
        return new InsertSQLStatement("INSERT INTO docente (id_persona, activo, fecsys) values (?, ?, now())") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getPersona().getId());
                ps.setBoolean(2, t.isActivo());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Docente t) {
        return new SQLStatement("UPDATE docente SET id_persona = ?, activo = ?, fecsys = now()  WHERE id_docente = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getPersona().getId());
                ps.setBoolean(2, t.isActivo());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected String getColumnIdName() {
        return "id_docente";
    }

}
