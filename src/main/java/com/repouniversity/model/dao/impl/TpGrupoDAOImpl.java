package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.TpGrupoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.GrupoRowMapper;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.entity.TpGrupo;

@Repository
public class TpGrupoDAOImpl extends GenericDAOImpl<TpGrupo> implements TpGrupoDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Alumno findAlumnoByGrupoId(Integer grupoId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected Class<TpGrupo> getEntityClass() {
        return TpGrupo.class;
    }

    @Override
    protected String getTableName() {
        return "tp_grupo";
    }

    @Override
    protected TpGrupo extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
    	TpGrupo result = new TpGrupo();
         
         result.setId(rs.getLong("idtp_grupo"));
         result.setIdArchivo(rs.getLong("id_archivo"));
         result.setIdGrupo(rs.getLong("id_grupo"));
         result.setDescripcion(rs.getString("descripcion"));
         result.setActivo(rs.getBoolean("activo"));
         result.setFechasys(rs.getDate("fecsys"));
         
         return result;
    }


    @Override
    protected String getColumnIdName() {
        return "idtp_grupo";
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
    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final TpGrupo t) {
        return new InsertSQLStatement("INSERT INTO tp_grupo (id_grupo, id_archivo, descripcion) values (?, ?, ?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdGrupo());
                ps.setLong(2, t.getIdArchivo());
                ps.setString(3, t.getDescripcion());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final TpGrupo t) {
        return new SQLStatement("UPDATE tp_grupo SET id_grupo = ?, id_archivo = ?, descripcion = ?, activo = ?, fecsys = now() WHERE idtp_grupo = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdGrupo());
                ps.setLong(2, t.getIdArchivo());
                ps.setString(3, t.getDescripcion());
                ps.setBoolean(4, t.isActivo());
                ps.setLong(4, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }
    


}
