package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.RoleDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.RoleRowMapper;
import com.repouniversity.model.entity.Role;

/**
 * @author Federico Tray
 */
@Repository
public class RoleDAOImpl extends GenericDAOImpl<Role> implements RoleDAO {

    @Override
    protected Class<Role> getEntityClass() {
        return Role.class;
    }

    @Override
    protected String getTableName() {
        return "role";
    }

    @Override
    protected Role extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new RoleRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(Role t) {
        return null;
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(Role t) {
        return null;
    }

    @Override
    protected String getColumnIdName() {
        return "id_role";
    }

    @Override
    public Role findByRoleName(String role) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * ");
        sql.append("FROM role WHERE role.role = ?");

        List<Role> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, role);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new RoleRowMapper(), "findByRoleName: " + role);

        if (list.isEmpty()) {
            return null;
        }

        return list.get(0);
    }
}
