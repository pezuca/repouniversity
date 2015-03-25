package com.repouniversity.model.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.UsuarioRolDAO;
import com.repouniversity.model.entity.UsuarioRol;

@Service
public class UsuarioRolService {

	@Autowired
	private UsuarioRolDAO usuarioRolDao;

	public UsuarioRol getUsuarioById(Integer usuarioId) {
		return usuarioRolDao.findByIdSafe(usuarioId);
	}

}
