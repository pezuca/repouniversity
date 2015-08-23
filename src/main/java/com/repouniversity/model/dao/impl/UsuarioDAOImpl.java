package com.repouniversity.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.UsuarioDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.UsuarioRowMapper;
import com.repouniversity.model.entity.Usuario;

/**
 * @author Federico Tray
 */
@Repository
public class UsuarioDAOImpl extends GenericDAOImpl<Usuario> implements UsuarioDAO {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public Usuario getUserByUsernameAndPass(final String username, final String password) {
        StringBuilder sql = new StringBuilder();
        
        sql.append("SELECT * FROM usuario u ");
        sql.append("WHERE u.user = ? AND u.pass = SHA1(?) AND u.activo = 1");
                
        List<Usuario> list = doQuery(new SQLStatement(sql.toString()) {
            
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
               ps.setString(1, username);
               ps.setString(2, password);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
            
        }, new UsuarioRowMapper(), "user: " + username);
        
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
        return (new UsuarioRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Usuario t) {
        return new InsertSQLStatement("INSERT INTO usuario (user, pass, activo, fecsys, id_persona, id_role) values (?, SHA1(?), 1, now(), ?, ?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getUser());
                ps.setString(2, t.getPass());
                ps.setLong(3, t.getIdPersona());
                ps.setLong(4, t.getRole());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Usuario t) {
        return new SQLStatement("UPDATE usuario SET user = ?, pass = SHA1(?), id_persona = ?, fecsys = now(), id_role = ?  WHERE id_usuario = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getUser());
                ps.setString(2, t.getPass());
                ps.setLong(3, t.getIdPersona());
                ps.setLong(4, t.getRole());
                ps.setLong(5, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }
    
    public void updateUserWithoutPass(final Usuario t) {
        KeyHolder keyHolder = new GeneratedKeyHolder();

        final InsertSQLStatement sqlStatement = new InsertSQLStatement(
                "UPDATE usuario SET user = ?, id_persona = ?, id_role = ? where id_usuario = ? ") {
            @Override
            public void doAfterInsert(Long id) {
            }
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getUser());
                ps.setLong(2, t.getIdPersona());
                ps.setLong(3, t.getRole());
                ps.setLong(4, t.getId());
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
        return "id_usuario";
    }

    @Override
    public Usuario findByUserName(String user) {
        StringBuilder sql = new StringBuilder();
        
        sql.append("SELECT * FROM usuario u ");
        sql.append("WHERE u.user = ? AND u.activo = 1"  );
                
        List<Usuario> list = doQuery(new SQLStatement(sql.toString()) {
            
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
               ps.setString(1, user);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
            
        }, new UsuarioRowMapper(), "user: " + user);
        
        if (list.isEmpty()){
            return null;
        }
        
        return list.get(0);
    }
}
