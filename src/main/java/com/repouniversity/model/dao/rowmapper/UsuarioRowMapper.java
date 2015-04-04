package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Usuario;

public class UsuarioRowMapper implements RowMapper<Usuario> {

    @Override
    public Usuario mapRow(ResultSet rs, int paramInt) throws SQLException {
        Usuario result = new Usuario();

        result.setId(rs.getLong("id_usuario"));
        result.setUser(rs.getString("user"));
        result.setPass(rs.getString("pass"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        result.setPersona(rs.getLong("id_persona"));

        return result;
    }

}
