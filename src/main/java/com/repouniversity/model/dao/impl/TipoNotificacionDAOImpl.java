package com.repouniversity.model.dao.impl;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.TipoNotificacionDAO;
import com.repouniversity.model.entity.TipoNotificacion;

@Repository
public class TipoNotificacionDAOImpl extends GenericDAOImplOld<TipoNotificacion, Integer> implements
		TipoNotificacionDAO {

	protected TipoNotificacionDAOImpl() {
		super(TipoNotificacion.class);
	}
}
