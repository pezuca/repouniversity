package com.repouniversity.model.dao;

import com.repouniversity.model.entity.Role;

public interface RoleDAO extends GenericDAO<Role> {

    Role findByRoleName(String role);

}
