package com.repouniversity.model.dao.impl;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.DatosPersonaDAO;
import com.repouniversity.model.entity.DatosPersona;

@Repository
public class DatosPersonaDAOImpl extends GenericDAOImpl<DatosPersona, Integer>
		implements DatosPersonaDAO {

	protected DatosPersonaDAOImpl() {
		super(DatosPersona.class);
	}
}
