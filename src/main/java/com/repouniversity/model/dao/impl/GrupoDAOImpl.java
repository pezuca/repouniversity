package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.GrupoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.GrupoRowMapper;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Grupo;

@Repository
public class GrupoDAOImpl extends GenericDAOImpl<Grupo> implements GrupoDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Alumno findAlumnoByGrupoId(Integer grupoId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected Class<Grupo> getEntityClass() {
        return Grupo.class;
    }

    @Override
    protected String getTableName() {
        return "grupo";
    }

    @Override
    protected Grupo extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(Grupo t) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(Grupo t) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected String getColumnIdName() {
        return "id_grupo";
    }

    @Override
    public List<Grupo> findGruposByCurso(final Long cursoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT DISTINCT g.* ");
        sql.append("FROM grupo g JOIN alumno_curso ac ON ac.id_grupo = g.id_grupo ");
        sql.append("WHERE ac.id_curso = ? ");
        sql.append("AND g.activo = 1");

        List<Grupo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, cursoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new GrupoRowMapper(), "findCursosForDocenteId: " + cursoId);

        if (list.isEmpty()) {
            return new ArrayList<Grupo>();
        }

        return list;
    }
}
