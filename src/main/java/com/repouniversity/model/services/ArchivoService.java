package com.repouniversity.model.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.repouniversity.model.dao.ArchivoDAO;
import com.repouniversity.model.entity.Archivo;

@Service
@Transactional
public class ArchivoService {

	@Autowired
	private ArchivoDAO archivoDao;

	public void subirArchivo(Archivo nuevoArchivo) {
		archivoDao.subirArchivo(nuevoArchivo);
	}

}
