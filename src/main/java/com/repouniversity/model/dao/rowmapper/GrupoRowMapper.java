package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Grupo;

public class GrupoRowMapper implements RowMapper<Grupo> {

    @Override
    public Grupo mapRow(ResultSet rs, int paramInt) throws SQLException {
        Grupo grupo = new Grupo();
        
        grupo.setId(rs.getLong("id_grupo"));
        return grupo;
    }

}
