package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.CarreraMateria;

public class CarreraMateriaRowMapper implements RowMapper<CarreraMateria> {

    @Override
    public CarreraMateria mapRow(ResultSet rs, int line) throws SQLException {
        CarreraMateria result = new CarreraMateria();
        
        result.setIdCarrera(rs.getLong("idcarrera"));
        result.setIdMateria(rs.getLong("idmateria"));
        
        return result;
    }
}
