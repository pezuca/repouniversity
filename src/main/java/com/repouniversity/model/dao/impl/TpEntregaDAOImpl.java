package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.TpEntregaDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.TpEntregaRowMapper;
import com.repouniversity.model.entity.TpEntrega;

@Repository
public class TpEntregaDAOImpl extends GenericDAOImpl<TpEntrega> implements TpEntregaDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    protected Class<TpEntrega> getEntityClass() {
        return TpEntrega.class;
    }

    @Override
    protected String getTableName() {
        return "tp_entrega";
    }

    @Override
    protected TpEntrega extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
    	TpEntrega result = new TpEntrega();
         
         result.setId(rs.getLong("idtp_entrega"));
         result.setIdArchivo(rs.getLong("id_archivo"));
         result.setIdTpGrupo(rs.getLong("idtp_grupo"));
         result.setDescripcion(rs.getString("descripcion"));
         result.setActivo(rs.getBoolean("activo"));
         result.setFechasys(rs.getDate("fecsys"));
         
         return result;
    }
    
    @Override
    protected String getColumnIdName() {
        return "idtp_entrega";
    }

    @Override
    public List<TpEntrega> findTpEntregaForTpGrupo(final Long tpGrupoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM tp_entrega ");
        sql.append("WHERE idtp_grupo = ? ");
        sql.append("AND activo = 1");

        List<TpEntrega> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, tpGrupoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new TpEntregaRowMapper(), "findTpEntregaForTpGrupo: " + tpGrupoId);

        if (list.isEmpty()) {
            return new ArrayList<TpEntrega>();
        }

        return list;
    }
    
    
      @Override
    protected InsertSQLStatement buildInsertSQLStatement(final TpEntrega t) {
        return new InsertSQLStatement("INSERT INTO tp_entrega (idtp_grupo, id_archivo, descripcion) values (?, ?, ?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdTpGrupo());
                ps.setLong(2, t.getIdArchivo());
                ps.setString(3, t.getDescripcion());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final TpEntrega t) {
        return new SQLStatement("UPDATE tp_entrega SET idtp_grupo = ?, id_archivo = ?, descripcion = ?, activo = ?, fecsys = now() WHERE idtp_entrega = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdTpGrupo());
                ps.setLong(2, t.getIdArchivo());
                ps.setString(3, t.getDescripcion());
                ps.setBoolean(4, t.isActivo());
                ps.setLong(5, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }
    


}
