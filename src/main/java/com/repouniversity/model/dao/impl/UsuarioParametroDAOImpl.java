package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.UsuarioParametroDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.UsuarioParametroRowMapper;
import com.repouniversity.model.entity.UsuarioParametro;

/**
 * @author Federico Paradela
 */
@Repository
public class UsuarioParametroDAOImpl extends GenericDAOImpl<UsuarioParametro> implements UsuarioParametroDAO {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
   
    @Override
    protected Class<UsuarioParametro> getEntityClass() {
        return UsuarioParametro.class;
    }

    @Override
    protected String getTableName() {
        return "usuario_parametro";
    }

    @Override
    protected UsuarioParametro extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new UsuarioParametroRowMapper()).mapRow(rs, line);
    }
	@Override
	public void eliminarParametro(final Long idUsuario) {
	        StringBuilder sql = new StringBuilder();
	        sql.append("DELETE from usuario_parametro ");
	        sql.append("WHERE (id_usuario = " + idUsuario + ")");

	        jdbcTemplate.update(sql.toString());

	    }
    
    @Override
    public List<UsuarioParametro> findUsuarioParametroforUsuario(final Long usuarioId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM repouniversity.usuario_parametro ");
        sql.append("WHERE id_usuario = ? ");
        sql.append("Order by orden ");
        

        List<UsuarioParametro> list = doQueryById(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, usuarioId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, "findUsuarioParametroforusuario: " + usuarioId);

        return list;
    }
    
    @Override
    public List<UsuarioParametro> findUsuarioParametroActivoforUsuario(final Long usuarioId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM repouniversity.usuario_parametro ");
        sql.append("WHERE id_usuario = ? ");
        sql.append("AND activo = 1 ");
        sql.append("Order by orden asc");
        

        List<UsuarioParametro> list = doQueryById(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, usuarioId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, "findUsuarioParametroActivoforUsuario: " + usuarioId);

        return list;
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final UsuarioParametro t) {
        return new InsertSQLStatement("INSERT INTO usuario_parametro (id_usuario, id_parametro, orden, color, fesys, activo) values (?, ?, ?, ?, now(), 1)") {
        	
            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
            	ps.setLong(1, t.getUsuario());
            	ps.setLong(2, t.getParametro());
                ps.setLong(3, t.getOrden());
                ps.setLong(4, t.getColor());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final UsuarioParametro t) {
        return new SQLStatement("UPDATE usuario_parametro SET id_usuario = ?, id_parametro = ?, orden = ?, color = ?, activo = ?, fesys = now()  WHERE id_usuario_parametro = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
             	ps.setLong(1, t.getUsuario());
            	ps.setLong(2, t.getParametro());
                ps.setLong(3, t.getOrden());
                ps.setLong(4, t.getColor());
                ps.setBoolean(5, t.isActivo());
                ps.setLong(6, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }
    
   
    @Override
    protected String getColumnIdName() {
        return "id_usuario_parametro";
    }
}
