package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.RoleDAO;
import com.repouniversity.model.entity.Role;

@Service
public class RoleService {

    @Autowired
    private RoleDAO roleDAO;

    public List<Role> getAll() {
        return roleDAO.findAll();
    }

    public Role findByRoleName(String role) {
        return roleDAO.findByRoleName(role);
    }
}
