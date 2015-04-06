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
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.CursoMateria;

@Repository
public class CursoDAOImpl extends GenericDAOImpl<Curso> implements CursoDAO {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Curso> findCursosForAlumnoId(final Long idAluDoc) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT c.* from curso c JOIN alumno_curso ac ON ac.curso_id_curso = c.id_curso ");
        sql.append("WHERE ac.alumno_id_alumno = ?");

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
        Curso result = new Curso();

        result.setId(rs.getLong("id_curso"));
        result.setNombre(rs.getString("nombre"));
        result.setCodigo(rs.getString("codigo"));
        result.setDescripcion(rs.getString("descripcion"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));

        return result;
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Curso t) {
        return new InsertSQLStatement("INSERT INTO curso (nombre, codigo, descripcion, activo, fechasys) values (?, ?, ?, ?, now())") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
                ps.setString(2, t.getCodigo());
                ps.setString(3, t.getDescripcion());
                ps.setBoolean(4, t.isActivo());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Curso t) {
        return new SQLStatement("UPDATE curso SET nombre = ?, codigo = ?, descripcion = ?, activo = ?, fecsys = now()  WHERE id = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
                ps.setString(2, t.getCodigo());
                ps.setString(3, t.getDescripcion());
                ps.setBoolean(4, t.isActivo());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    public List<CursoMateria> findCursosMateriaDisponiblesParaAlumno(final Long alumnoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT DISTINCT n.tiponotificacion, cm.id_curso_materia, m.id_materia, m.nombre, c.id_curso, c.codigo, c.descripcion ");
        sql.append("FROM materia m JOIN curso_materia cm ON cm.id_materia = m.id_materia ");
        sql.append("JOIN curso c ON c.id_curso = cm.id_curso ");
        sql.append("JOIN docente_curso_materia dc on dc.id_curso_materia = c.id_curso ");
        sql.append("LEFT JOIN notificacion n ON (n.idcurso = c.id_curso AND n.iddocente = dc.id_docente AND n.tiponotificacion = 1 AND n.idalumno = ?) ");
        sql.append("WHERE c.id_curso not in (select curso_id_curso from alumno_curso where alumno_id_alumno = ?)");

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

        sql.append("SELECT DISTINCT '0' as tiponotificacion, cm.id_curso_materia, m.id_materia, m.nombre, c.id_curso, c.codigo, c.descripcion ");
        sql.append("FROM materia m JOIN curso_materia cm ON cm.id_materia = m.id_materia ");
        sql.append("JOIN curso c ON c.id_curso = cm.id_curso ");
        sql.append("JOIN docente_curso_materia dcm ON dcm.id_curso_materia = cm.id_curso_materia ");
        sql.append("WHERE dcm.id_docente = ?");

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
    public void saveAlumnoCursoGrupo(final Long alumnoId, final Long cursoId, final Long grupoId) {
        KeyHolder keyHolder = new GeneratedKeyHolder();

        final InsertSQLStatement sqlStatement = new InsertSQLStatement(
                "INSERT INTO alumno_curso (alumno_id_alumno, curso_id_curso, grupo_id_grupo) values (?, ?, ?)") {
            @Override
            public void doAfterInsert(Long id) {
            }
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, alumnoId);
                ps.setLong(2, cursoId);
                ps.setLong(3, grupoId);
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
}
