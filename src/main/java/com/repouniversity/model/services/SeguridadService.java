package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.SeguridadDAO;
import com.repouniversity.model.entity.Role;
import com.repouniversity.model.entity.Seguridad;

@Service
public class SeguridadService {

    @Autowired
    private SeguridadDAO seguridadDAO;

    public List<Seguridad> getAll() {
        return seguridadDAO.findAll();
    }

   
    public Seguridad findById(Long id) {
        return seguridadDAO.findById(id);
    }
}
