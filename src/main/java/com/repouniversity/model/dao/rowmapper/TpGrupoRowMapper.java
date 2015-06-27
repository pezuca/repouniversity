package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.TpGrupo;

public class TpGrupoRowMapper implements RowMapper<TpGrupo> {

    @Override
    public TpGrupo mapRow(ResultSet rs, int paramInt) throws SQLException {
    	TpGrupo result = new TpGrupo();
        
        result.setId(rs.getLong("idtp_grupo"));
        result.setIdArchivo(rs.getLong("id_archivo"));
        result.setIdGrupo(rs.getLong("id_grupo"));
        result.setDescripcion(rs.getString("descripcion"));
        
        if(rs.getLong("nota") == 0) {
            result.setNota(null);
        } else {
            rs.getLong("nota");
        }
        
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        
        return result;
    }

}
