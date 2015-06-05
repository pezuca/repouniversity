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
import com.repouniversity.model.dao.rowmapper.TpGrupoRowMapper;
import com.repouniversity.model.entity.TpGrupo;

@Repository
public class TpGrupoDAOImpl extends GenericDAOImpl<TpGrupo> implements TpGrupoDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

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
         result.setNota(rs.getLong("nota"));
         result.setActivo(rs.getBoolean("activo"));
         result.setFechasys(rs.getDate("fecsys"));
         
         return result;
    }


    @Override
    protected String getColumnIdName() {
        return "idtp_grupo";
    }

    @Override
    public List<TpGrupo> findTpGrupoForGrupo(final Long grupoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM tp_grupo ");
        sql.append("WHERE id_grupo = ? ");
        sql.append("AND activo = 1");

        List<TpGrupo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, grupoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new TpGrupoRowMapper(), "findTpGrupoForGrupo: " + grupoId);

        if (list.isEmpty()) {
            return new ArrayList<TpGrupo>();
        }

        return list;
    }
    
    protected InsertSQLStatement buildInsertSQLStatement(final TpGrupo t) {
        return new InsertSQLStatement("INSERT INTO tp_grupo (id_grupo, id_archivo, descripcion, nota) values (?, ?, ?, ?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdGrupo());
                ps.setLong(2, t.getIdArchivo());
                ps.setString(3, t.getDescripcion());
                ps.setLong(4, t.getNota());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final TpGrupo t) {
        return new SQLStatement("UPDATE tp_grupo SET id_grupo = ?, id_archivo = ?, descripcion = ?, nota = ?, activo = ?, fecsys = now() WHERE idtp_grupo = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdGrupo());
                ps.setLong(2, t.getIdArchivo());
                ps.setString(3, t.getDescripcion());
                ps.setLong(4, t.getNota());
                ps.setBoolean(5, t.isActivo());
                ps.setLong(6, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }
    


}
