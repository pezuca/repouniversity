package com.repouniversity.model.dao.impl;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.GrupoDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Grupo;

@Repository
public class GrupoDAOImpl extends GenericDAOImplOld<Grupo, Integer> implements
		GrupoDAO {

	protected GrupoDAOImpl() {
		super(Grupo.class);
	}

	@Override
	public Alumno findAlumnoByGrupoId(Integer grupoId) {
		// TODO Auto-generated method stub
		return null;
	}
}
