package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.PermisoDAO;
import com.repouniversity.model.entity.Permiso;

@Service
public class PermisoService {

    @Autowired
    private PermisoDAO permisoDAO;

    public List<Permiso> getAll() {
        return permisoDAO.findAll();
    }

/*    public Permiso findByRoleName(String permiso) {
        return permisoDAO.findByRoleName(permiso);
    }
  */  
    public Permiso findById(Long id) {
        return permisoDAO.findById(id);
    }
}
