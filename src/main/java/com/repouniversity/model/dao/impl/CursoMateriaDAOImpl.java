package com.repouniversity.model.dao.impl;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.CursoMateriaDAO;
import com.repouniversity.model.entity.CursoMateria;

@Repository
public class CursoMateriaDAOImpl extends GenericDAOImplOld<CursoMateria, Integer>
		implements CursoMateriaDAO {

	protected CursoMateriaDAOImpl() {
		super(CursoMateria.class);
	}
}
