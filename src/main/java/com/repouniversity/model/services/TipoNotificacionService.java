package com.repouniversity.model.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.TipoNotificacionDAO;
import com.repouniversity.model.entity.TipoNotificacion;

@Service
@Transactional
public class TipoNotificacionService {

	@Autowired
	private TipoNotificacionDAO tipoNotificacionDao;
	
	public TipoNotificacion getTipoNotificacionById(Integer tipoNotificacionId) {
		return tipoNotificacionDao.findById(tipoNotificacionId);
	}
}
