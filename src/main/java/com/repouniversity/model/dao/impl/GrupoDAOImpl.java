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
    	Grupo result = new Grupo();
         
         result.setId(rs.getLong("id_grupo"));
         result.setNombre(rs.getString("nombre"));
         result.setActivo(rs.getBoolean("activo"));
         result.setFechasys(rs.getDate("fecsys"));
         
         return result;
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
        sql.append("AND ac.id_grupo <> 1 ");
        sql.append("AND g.activo = 1");

        List<Grupo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, cursoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new GrupoRowMapper(), "findGruposByCurso: " + cursoId);

        if (list.isEmpty()) {
            return new ArrayList<Grupo>();
        }

        return list;
    }
    @Override
    public List<Grupo> findGrupoByCursoAlumno(final Long idCurso, Long idAlumno) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT DISTINCT g.* ");
        sql.append("FROM grupo g JOIN alumno_curso ac ON ac.id_grupo = g.id_grupo ");
        sql.append("WHERE ac.id_curso = ? ");
        sql.append("AND ac.id_alumno = ? ");
        sql.append("AND ac.id_grupo <> 1 ");
        sql.append("AND g.activo = 1");
        
         List<Grupo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, idCurso);
                ps.setLong(2, idAlumno);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new GrupoRowMapper(), "findGruposByCursoAlumno: " + idCurso);

        if (list.isEmpty()) {
            return new ArrayList<Grupo>();
        }

        return list;
    }
    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Grupo t) {
        return new InsertSQLStatement("INSERT INTO grupo (nombre) values (?)") {

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
    protected SQLStatement buildUpdateSQLStatement(final Grupo t) {
        return new SQLStatement("UPDATE grupo SET nombre = ?, activo = ?, fecsys = now() WHERE id = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
                ps.setBoolean(2, t.isActivo());
                ps.setLong(4, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }
    
    @Override
    public List<Grupo> findGruposDeAlumno(final long idAlumno) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT DISTINCT g.* ");
        sql.append("FROM grupo g JOIN alumno_curso ac ON ac.id_grupo = g.id_grupo ");
        sql.append("WHERE ac.id_alumno = ? ");
        sql.append("AND ac.id_grupo <> 1 ");
        sql.append("AND g.activo = 1");
        
        List<Grupo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, idAlumno);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new GrupoRowMapper(), "findGruposDeAlumno: " + idAlumno);

        if (list.isEmpty()) {
            return new ArrayList<Grupo>();
        }

        return list;
    }

    
    @Override
    public long findIdCursoForGrupo(long grupoId) {
        
        long id = jdbcTemplate.queryForLong("select id_curso from alumno_curso where id_grupo = " + grupoId + " LIMIT 1");


        return id;
    }
}
