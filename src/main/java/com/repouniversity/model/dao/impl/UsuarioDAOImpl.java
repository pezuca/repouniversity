package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.UsuarioDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.entity.Usuario;

/**
 * @author Federico Tray
 */
@Repository
public class UsuarioDAOImpl extends GenericDAOImpl<Usuario> implements UsuarioDAO {

    public Usuario getUserByUsernameAndPass(final String username, final String password) {
        StringBuilder sql = new StringBuilder();
        
        sql.append("SELECT * FROM usuario ");
        sql.append("WHERE user = ? AND pass = ?" );
                
        List<Usuario> list = doQueryById(new SQLStatement(sql.toString()) {
            
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
               ps.setString(1, username);
               ps.setString(2, password);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
            
        }, "user: " + username);
        
        if (list.isEmpty()){
            return null;
        }
        
        return list.get(0);
    }

    @Override
    protected Class<Usuario> getEntityClass() {
        return Usuario.class;
    }

    @Override
    protected String getTableName() {
        return "usuario";
    }

    @Override
    protected Usuario extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        Usuario result = new Usuario();

        result.setId(rs.getLong("id_alumno"));
        result.setUser(rs.getString("user"));
        result.setPass(rs.getString("pass"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        result.setPersona(rs.getLong("id_alumno"));

        return result;
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(Usuario t) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(Usuario t) {
        // TODO Auto-generated method stub
        return null;
    }
}
