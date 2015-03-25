package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Notificacion;

public interface NotificacionDAO extends GenericDAO<Notificacion, Integer> {
	public List<Notificacion> getNotificacionesSinConfirmar(Integer cursoId);
}
