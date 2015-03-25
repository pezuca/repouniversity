package com.repouniversity.model.dao.impl;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.AlumnoDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Docente;

@Repository
public class AlumnoDAOImpl extends GenericDAOImpl<Alumno, Integer> implements
		AlumnoDAO {

	protected AlumnoDAOImpl() {
		super(Alumno.class);
	}

	@Override
	public Alumno findAlumnoByPersonaId(Integer personaId) {
		Alumno alumno = (Alumno) getCurrentSession()
				.createQuery("FROM Alumno a WHERE a.persona.id = :personaId")
				.setInteger("personaId", personaId).uniqueResult();
		return alumno;
	}

	@Override
	public Docente findDocenteByPersonaId(Integer personaId) {
		Docente docente = (Docente) getCurrentSession()
				.createQuery("FROM Docente d WHERE d.persona.id = :personaId")
				.setInteger("personaId", personaId).uniqueResult();
		return docente;
	}
}
