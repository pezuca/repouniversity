package com.repouniversity.model.dao.impl;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.PersonaDAO;
import com.repouniversity.model.entity.Persona;

@Repository
public class PersonaDAOImpl extends GenericDAOImpl<Persona, Integer> implements
		PersonaDAO {

	protected PersonaDAOImpl() {
		super(Persona.class);
	}

	
}
