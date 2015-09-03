package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.VwLogArchivo;

public class VwLogArchivoRowMapper implements RowMapper<VwLogArchivo> {

    @Override
    public VwLogArchivo mapRow(ResultSet rs, int paramInt) throws SQLException {
    	VwLogArchivo result = new VwLogArchivo();

        result.setId(rs.getLong("id_archivo"));
        result.setIdCreador(rs.getLong("id_creador"));
        result.setCantidadDownload(rs.getLong("cantidadDownload"));
        result.setNombre(rs.getString("nombre"));
        
        return result;
    }

}
