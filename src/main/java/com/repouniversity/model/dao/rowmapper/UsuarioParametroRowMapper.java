package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioParametro;

public class UsuarioParametroRowMapper implements RowMapper<UsuarioParametro> {

    @Override
    public UsuarioParametro mapRow(ResultSet rs, int paramInt) throws SQLException {
    	UsuarioParametro result = new UsuarioParametro();

        result.setId(rs.getLong("id_usuario_parametro"));
        result.setUsuario(rs.getLong("id_usuario"));
        result.setParametro(rs.getLong("id_parametro"));
        result.setOrden(rs.getLong("orden"));
        result.setColor(rs.getLong("color"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fesys"));

        return result;
    }

}
