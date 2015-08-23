package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.ColorDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.ColorRowMapper;
import com.repouniversity.model.entity.Color;

/**
 * @author Federico Paradela
 */
@Repository
public class ColorDAOImpl extends GenericDAOImpl<Color> implements ColorDAO {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
   
    @Override
    protected Class<Color> getEntityClass() {
        return Color.class;
    }

    @Override
    protected String getTableName() {
        return "color";
    }

    @Override
    protected Color extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new ColorRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Color t) {
        return new InsertSQLStatement("INSERT INTO color (color, colorPantalla, activo) values (?, ?, 1)") {
 
            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
            	ps.setString(1, t.getColor());
            	ps.setString(2, t.getColorPantalla());
        
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Color t) {
        return new SQLStatement("UPDATE parametro SET color = ?, colorPantalla = ?  WHERE id_color = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
            	ps.setString(1, t.getColor());
            	ps.setString(2, t.getColorPantalla());
                ps.setLong(3, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }
    
   
    @Override
    protected String getColumnIdName() {
        return "id_color";
    }
}
