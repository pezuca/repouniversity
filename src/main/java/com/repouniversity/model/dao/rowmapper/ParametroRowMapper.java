package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Parametro;
import com.repouniversity.model.entity.UsuarioParametro;

public class ParametroRowMapper implements RowMapper<Parametro> {

    @Override
    public Parametro mapRow(ResultSet rs, int paramInt) throws SQLException {
    	Parametro result = new Parametro();

        result.setId(rs.getLong("id_parametro"));
        result.setRole(rs.getLong("id_role"));
        result.setParametro(rs.getString("parametro"));
        result.setDescricpion(rs.getString("descripcion"));
        result.setVariable(rs.getString("variable"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fesys"));
        result.setIcono(rs.getString("icono"));
        result.setLink(rs.getString("link"));
        return result;
    }

}
