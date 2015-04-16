package com.repouniversity.model.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.repouniversity.model.dao.TipoNotificacionDAO;
import com.repouniversity.model.entity.TipoNotificacion;

@Service
@Transactional
public class TipoNotificacionService {

	@Autowired
	private TipoNotificacionDAO tipoNotificacionDao;
	
	public TipoNotificacion getTipoNotificacionById(Long tipoNotificacionId) {
		return tipoNotificacionDao.findById(tipoNotificacionId);
	}
}
