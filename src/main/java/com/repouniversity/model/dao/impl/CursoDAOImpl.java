package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.repouniversity.model.dao.CursoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.entity.Curso;

public class CursoDAOImpl extends GenericDAOImpl<Curso> implements CursoDAO {

    @Override
    public List<Curso> findCursosForAlumnoId(final Long idAluDoc) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT curso.* from curso c JOIN alumno_curso ac ON ac.curso_id_curso = c.id_curso ");
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
}
