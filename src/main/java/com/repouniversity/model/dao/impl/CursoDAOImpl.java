package com.repouniversity.model.dao.impl;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.CursoDAO;
import com.repouniversity.model.entity.Curso;

@Repository
public class CursoDAOImpl extends GenericDAOImpl<Curso, Integer> implements
		CursoDAO {

	protected CursoDAOImpl() {
		super(Curso.class);
	}
}
