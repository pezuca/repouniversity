package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.ComentarioDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.ComentarioRowMapper;
import com.repouniversity.model.entity.Comentario;

@Repository
public class ComentarioDAOImpl extends GenericDAOImpl<Comentario> implements ComentarioDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    protected Class<Comentario> getEntityClass() {
        return Comentario.class;
    }

    @Override
    protected String getTableName() {
        return "comentario";
    }

    @Override
    protected Comentario extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
    	Comentario result = new Comentario();
         
         result.setId(rs.getLong("id_comentario"));
         result.setDescripcion(rs.getString("descripcion"));
         result.setIdPersona(rs.getLong("id_persona"));
         result.setActivo(rs.getBoolean("activo"));
         result.setFechasys(rs.getDate("fecsys"));
         
         return result;
    }


    @Override
    protected String getColumnIdName() {
        return "id_comentario";
    }
    
    @Override
    public List<Comentario> findComentariosForTpGrupo(final Long tpGrupoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT c.* FROM comentario c JOIN comentario_tp ctp ON c.id_comentario = ctp.id_comentario ");
        sql.append("WHERE ctp.id_tpgrupo = ? ");
        sql.append("AND c.activo = 1 AND ctp.activo = 1");

        List<Comentario> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, tpGrupoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new ComentarioRowMapper(), "findComentariosForTpGrupo: " + tpGrupoId);

        if (list.isEmpty()) {
            return new ArrayList<Comentario>();
        }

        return list;
    }
    
    protected InsertSQLStatement buildInsertSQLStatement(final Comentario t) {
        return new InsertSQLStatement("INSERT INTO comentario (descripcion, id_persona) values (?, ?, ?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getDescripcion());
                ps.setLong(2, t.getIdPersona());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Comentario t) {
        return new SQLStatement("UPDATE tp_grupo SET id_grupo = ?, id_archivo = ?, descripcion = ?, nota = ?, activo = ?, fecsys = now() WHERE idtp_grupo = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
         
                ps.setBoolean(5, t.isActivo());
                ps.setLong(6, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }


}
