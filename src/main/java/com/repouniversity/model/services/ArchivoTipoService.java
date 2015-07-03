package com.repouniversity.model.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.ArchivoTipoDAO;
import com.repouniversity.model.entity.ArchivoTipo;

@Service
public class ArchivoTipoService {
    
    @Autowired
    private ArchivoTipoDAO archivoTipoDao;
    
    public ArchivoTipo findById(Long archivoTipoId) {
        return archivoTipoDao.findById(archivoTipoId);
    }

}
