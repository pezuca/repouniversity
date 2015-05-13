package com.repouniversity.model.dao.impl;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.AlumnoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.AlumnoRowMapper;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Docente;

@Repository
public class AlumnoDAOImpl extends GenericDAOImpl<Alumno> implements AlumnoDAO {
    
    protected static final String TABLE_NAME = "alumno";

    @Override
    public Alumno findAlumnoByPersonaId(Integer personaId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Docente findDocenteByPersonaId(Integer personaId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected Class<Alumno> getEntityClass() {
        return Alumno.class;
    }

    @Override
    protected String getTableName() {
        return TABLE_NAME;
    }

    @Override
    protected Alumno extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new AlumnoRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Alumno t) {
        return new InsertSQLStatement("insert into alumno (id_persona, Idcarrera, activo, fecsys) values (?, ?, 1, now())") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdPersona());
                
                Long carreraId = t.getIdCarrera();
                if(carreraId != null) {
                    ps.setLong(2, carreraId);
                } else {
                    ps.setLong(2, 1L);
                }
                ps.setBoolean(3, t.isActivo());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Alumno t) {

        return new SQLStatement("update alumno set id_persona = ?, Idcarrera = ?, fechasys = now()  where id = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdPersona());
                ps.setLong(2, t.getIdCarrera());
                ps.setLong(3, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    public List<Alumno> findAlumnoForGrupo(final Long grupoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT a.* FROM alumno a JOIN grupo_alumno_curso gac ON a.id_alumno = gac.alumno_curso_alumno_id_alumno ");
        sql.append("WHERE gac.grupo_id_grupo = ? ");
        sql.append("AND a.activo = 1");

        List<Alumno> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, grupoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new AlumnoRowMapper(), "findAlumnoForGrupo: " + grupoId);

        if (list.isEmpty()) {
            return new ArrayList<Alumno>();
        }

        return list;
    }

    @Override
    protected String getColumnIdName() {
        return "id_alumno";
    }

    @Override
    public List<Alumno> findAlumnoForCurso(final Long cursoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT a.* FROM alumno a JOIN alumno_curso ac ON a.id_alumno = ac.id_alumno ");
        sql.append("WHERE ac.id_curso = ? ");
        sql.append("AND a.activo = 1");

        List<Alumno> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, cursoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new AlumnoRowMapper(), "findAlumnoForGrupo: " + cursoId);

        if (list.isEmpty()) {
            return null;
        }

        return list;
    }

}
