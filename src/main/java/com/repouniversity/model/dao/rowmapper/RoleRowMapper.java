package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Role;

public class RoleRowMapper implements RowMapper<Role> {

    @Override
    public Role mapRow(ResultSet rs, int paramInt) throws SQLException {
    	Role result = new Role();

        result.setId(rs.getLong("id_role"));
        result.setRole(rs.getString("role"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        
        return result;
    }

}
