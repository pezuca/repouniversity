package com.repouniversity.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.CursoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.CursoMateriaRowMapper;
import com.repouniversity.model.dao.rowmapper.CursoRowMapper;
import com.repouniversity.model.dao.rowmapper.LongRowMapper;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.CursoMateria;

@Repository
public class CursoDAOImpl extends GenericDAOImpl<Curso> implements CursoDAO {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Curso> findCursosForAlumnoId(final Long idAluDoc) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT c.* from curso c JOIN alumno_curso ac ON ac.id_curso = c.id_curso ");
        sql.append("WHERE ac.id_alumno = ? ");
        sql.append("AND c.activo = 1");

        List<Curso> list = doQueryById(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, idAluDoc);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, "findCursosForAlumnoId: " + idAluDoc);

        if (list.isEmpty()) {
            return null;
        }

        return list;
    }

    @Override
    protected Class<Curso> getEntityClass() {
        return Curso.class;
    }

    @Override
    protected String getTableName() {
        return "curso";
    }

    @Override
    protected Curso extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return new CursoRowMapper().mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Curso t) {
        return new InsertSQLStatement("INSERT INTO curso (nombre, codigo, descripcion, id_materia, id_docente, activo, fecsys) values (?, ?, ?, ?, ?, 1, now())") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
                ps.setString(2, t.getCodigo());
                ps.setString(3, t.getDescripcion());
                ps.setLong(4, t.getMateriaId());
                ps.setLong(5, t.getDocenteId());
               
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Curso t) {
        return new SQLStatement("UPDATE curso SET nombre = ?, codigo = ?, descripcion = ?, id_materia = ?, id_docente = ?, fecsys = now()  WHERE " + getColumnIdName() + " = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
                ps.setString(2, t.getCodigo());
                ps.setString(3, t.getDescripcion());
                ps.setLong(4, t.getMateriaId());
                ps.setLong(5, t.getDocenteId());
                ps.setLong(6, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    public List<CursoMateria> findCursosMateriaDisponiblesParaAlumno(final Long alumnoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT DISTINCT n.tiponotificacion, m.id_materia, m.nombre, c.id_curso, c.codigo, c.descripcion ");
        sql.append("FROM curso c ");
        sql.append("JOIN materia m ON m.id_materia = c.id_materia ");
        sql.append("JOIN carrera_materia cm on cm.idmateria = m.id_materia ");
        sql.append("LEFT JOIN notificacion n ON n.idcurso = c.id_curso AND tiponotificacion = 1 AND n.idalumno = ? ");
        sql.append("WHERE c.id_curso not in (SELECT alumno_curso.id_curso from alumno_curso WHERE alumno_curso.id_alumno = ?) ");
        sql.append("AND c.activo = 1 AND m.activo = 1");
        
        List<CursoMateria> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, alumnoId);
                ps.setLong(2, alumnoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new CursoMateriaRowMapper(), "findCursosMateriaDisponiblesParaAlumno: " + alumnoId);

        if (list.isEmpty()) {
            return null;
        }

        return list;
    }

    @Override
    public List<CursoMateria> findCursosForDocenteId(final Long docenteId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT DISTINCT '0' as tiponotificacion, m.id_materia, m.nombre, c.id_curso, c.codigo, c.descripcion ");
        sql.append("FROM curso c JOIN materia m ON c.id_materia = m.id_materia ");
        sql.append("WHERE c.id_docente = ? ");
        sql.append("AND c.activo = 1 AND m.activo = 1");

        List<CursoMateria> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, docenteId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new CursoMateriaRowMapper(), "findCursosForDocenteId: " + docenteId);

        if (list.isEmpty()) {
            return new ArrayList<CursoMateria>();
        }

        return list;
    }
    
    @Override
    public void saveAlumnoCursoGrupo(final Long grupoId, final Long cursoId, final Long alumnoId) {
        KeyHolder keyHolder = new GeneratedKeyHolder();

        final InsertSQLStatement sqlStatement = new InsertSQLStatement(
                "UPDATE alumno_curso set id_grupo = ? where id_alumno = ? and id_curso = ?") {
            @Override
            public void doAfterInsert(Long id) {
            }
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, grupoId);
                ps.setLong(2, alumnoId);
                ps.setLong(3, cursoId);
            }
            @Override
            public void doAfterTransaction(int result) {
            }
        };

        jdbcTemplate.update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                PreparedStatement ps = connection.prepareStatement(sqlStatement.getQuery(), Statement.RETURN_GENERATED_KEYS);
                sqlStatement.buildPreparedStatement(ps);
                return ps;
            }
        }, keyHolder);
    }

    @Override
    protected String getColumnIdName() {
        return "id_curso";
    }

  @Override
  public List<Long> ObtenerAlumnosSinGrupo(final Long idCurso) {
        StringBuilder sql = new StringBuilder();

        sql.append("select id_alumno from alumno_curso where id_grupo = 1 and id_curso = ? ");

        List<Long> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, idCurso);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new LongRowMapper(), "ObtenerAlumnosSinGrupo: " + idCurso);

        if (list.isEmpty()) {
            return new ArrayList<Long>();
        }

        return list;
    }

	@Override
	public void bajaCursoAlumno(final Long cursoId, final Long idAluDoc) {
	        StringBuilder sql = new StringBuilder();
	        sql.append("DELETE from alumno_curso ");
	        sql.append("WHERE (id_alumno = " + idAluDoc + ") AND (id_curso = " + cursoId + ")");

	        jdbcTemplate.update(sql.toString());

	    }
	
    
}
