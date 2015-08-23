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

import com.repouniversity.model.dao.ParametroDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.ParametroRowMapper;
import com.repouniversity.model.entity.Parametro;
import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioParametro;

/**
 * @author Federico Paradela
 */
@Repository
public class ParametroDAOImpl extends GenericDAOImpl<Parametro> implements ParametroDAO {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
   
    @Override
    protected Class<Parametro> getEntityClass() {
        return Parametro.class;
    }

    @Override
    protected String getTableName() {
        return "parametro";
    }

    @Override
    protected Parametro extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new ParametroRowMapper()).mapRow(rs, line);
    }
    
    @Override
    public List<Parametro> findParametrosByRole(final Long roleId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM repouniversity.parametro ");
        sql.append("WHERE id_role = ? ");
                

        List<Parametro> list = doQueryById(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, roleId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, "findParametrosByRole: " + roleId);

        return list;
    }

    
    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Parametro t) {
        return new InsertSQLStatement("INSERT INTO parametro (id_role, parametro, descripcion, variable, icono, link, activo, fesys) values (?, ?, ?, ?, ?, ?, 1, now())") {
 
            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
            	ps.setLong(1, t.getRole());
            	ps.setString(2, t.getParametro());
                ps.setString(3, t.getDescricpion());
                ps.setString(4, t.getVariable());
                ps.setString(5, t.getIcono());
                ps.setString(6, t.getLink());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Parametro t) {
        return new SQLStatement("UPDATE parametro SET id_role = ?, parametro = ?, descripcion = ?, variable = ?, icono = ?, link = ?, fesys = now()  WHERE id_parametro = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
            	ps.setLong(1, t.getRole());
            	ps.setString(2, t.getParametro());
                ps.setString(3, t.getDescricpion());
                ps.setString(4, t.getVariable());
                ps.setString(5, t.getIcono());
                ps.setString(6, t.getLink());
                ps.setLong(7, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }
    
   
    @Override
    protected String getColumnIdName() {
        return "id_parametro";
    }
}
