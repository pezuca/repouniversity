package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Permiso;
import com.repouniversity.model.entity.Role;

public class PermisoRowMapper implements RowMapper<Permiso> {

    @Override
    public Permiso mapRow(ResultSet rs, int paramInt) throws SQLException {
    	Permiso result = new Permiso();

        result.setId(rs.getLong("id_permiso"));
        result.setPermiso(rs.getString("permiso"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        
        return result;
    }

}
