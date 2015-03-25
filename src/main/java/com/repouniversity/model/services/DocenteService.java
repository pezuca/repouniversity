package com.repouniversity.model.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.DocenteDAO;
import com.repouniversity.model.entity.Docente;

@Service
@Transactional
public class DocenteService {

	@Autowired
	private DocenteDAO docenteDao;
	
	public List<Docente> getAll() {
		return docenteDao.getAll();
	}

	public Docente getById(Integer idAluDoc) {
		
		return docenteDao.findById(idAluDoc);
		
	}
}
