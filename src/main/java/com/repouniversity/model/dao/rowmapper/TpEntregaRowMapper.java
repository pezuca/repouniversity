package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.TpEntrega;
import com.repouniversity.model.entity.TpGrupo;

public class TpEntregaRowMapper implements RowMapper<TpEntrega> {

    @Override
    public TpEntrega mapRow(ResultSet rs, int paramInt) throws SQLException {
    	TpEntrega result = new TpEntrega();
        
        result.setId(rs.getLong("idtp_entrega"));
        result.setIdArchivo(rs.getLong("id_archivo"));
        result.setIdTpGrupo(rs.getLong("idtp_grupo"));
        result.setDescripcion(rs.getString("descripcion"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        
        return result;
    }

}
