package com.repouniversity.model.dao.impl;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.DocenteDAO;
import com.repouniversity.model.entity.Docente;

@Repository
public class DocenteDAOImpl extends GenericDAOImpl<Docente, Integer> implements
		DocenteDAO {

	protected DocenteDAOImpl() {
		super(Docente.class);
	}
}
