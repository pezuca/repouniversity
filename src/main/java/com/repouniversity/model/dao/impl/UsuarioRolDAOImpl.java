package com.repouniversity.model.dao.impl;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.UsuarioRolDAO;
import com.repouniversity.model.entity.UsuarioRol;

/**
 * @author Federico Tray
 */
@Repository
public class UsuarioRolDAOImpl extends GenericDAOImpl<UsuarioRol, Integer> implements
		UsuarioRolDAO {

	protected UsuarioRolDAOImpl() {
		super(UsuarioRol.class);
	}
}
