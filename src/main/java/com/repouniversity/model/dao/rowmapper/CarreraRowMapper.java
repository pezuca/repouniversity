package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Carrera;

public class CarreraRowMapper implements RowMapper<Carrera> {

    @Override
    public Carrera mapRow(ResultSet rs, int line) throws SQLException {
        Carrera carrera = new Carrera();
        carrera.setId(rs.getLong("idcarrera"));
        carrera.setNombre(rs.getString("nombre"));
        
        return carrera;
    }

}
