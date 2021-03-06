package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class StringRowMapper implements RowMapper<String> {

    @Override
    public String mapRow(ResultSet rs, int line) throws SQLException {
        return rs.getString(1);
    }

}
