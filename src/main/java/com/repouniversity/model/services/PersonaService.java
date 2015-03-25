package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.DatosPersonaDAO;
import com.repouniversity.model.dao.PersonaDAO;
import com.repouniversity.model.entity.DatosPersona;
import com.repouniversity.model.entity.Persona;

@Service
public class PersonaService {

	@Autowired
	private PersonaDAO personaDao;

	@Autowired
	private DatosPersonaDAO datosPersonaDao;

	public Persona getById(Integer personaId) {
		return personaDao.findById(personaId);
	}

	public List<DatosPersona> getAllDatosPersona() {
		return datosPersonaDao.getAll();
	}

}
