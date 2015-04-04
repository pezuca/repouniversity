package com.repouniversity.model.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.UsuarioRolDAO;
import com.repouniversity.model.entity.UsuarioRol;

@Service
@Transactional
public class UsuarioRolService {

    @Autowired
    private UsuarioRolDAO usuarioRolDao;

    public UsuarioRol getUsuarioById(Long usuarioId) {
        return usuarioRolDao.findById(usuarioId);
    }

}
