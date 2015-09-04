package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.SeguridadDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.SeguridadRowMapper;
import com.repouniversity.model.entity.Seguridad;

/**
 * @author Federico Tray
 */
@Repository
public class SeguridadDAOImpl extends GenericDAOImpl<Seguridad> implements SeguridadDAO {

    @Override
    protected Class<Seguridad> getEntityClass() {
        return Seguridad.class;
    }

    @Override
    protected String getTableName() {
        return "seguridad";
    }

    @Override
    protected Seguridad extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new SeguridadRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(Seguridad t) {
        return null;
    }

    protected SQLStatement buildUpdateSQLStatement(final Seguridad t) {
        return new SQLStatement("UPDATE seguridad SET mayusculas = ?, minusculas = ?, especiales = ?, longMinima = ?, numeros = ?, vigencia = ?, activo = 1, fesys = now() WHERE id_seguridad = ?") {
        	
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
             	ps.setLong(1, t.getMayusculas());
            	ps.setLong(2, t.getMinusculas());
                ps.setLong(3, t.getEspeciales());
                ps.setLong(4, t.getLongMinima());
                ps.setLong(5, t.getNumeros());
                ps.setLong(6, t.getVigencia());
                ps.setLong(7, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected String getColumnIdName() {
        return "id_seguridad";
    }

}
