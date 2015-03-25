package com.repouniversity.model.dao;

import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Grupo;

public interface GrupoDAO extends GenericDAO<Grupo, Integer> {

	Alumno findAlumnoByGrupoId(Integer grupoId);
	
}
