package com.repouniversity.model.dao;

import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Docente;

public interface AlumnoDAO extends GenericDAO<Alumno, Integer> {

	Alumno findAlumnoByPersonaId(Integer personaId);

	Docente findDocenteByPersonaId(Integer personaId);

}
