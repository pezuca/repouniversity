package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Notificacion;

public interface NotificacionDAO extends GenericDAO<Notificacion> {
	public List<Notificacion> getNotificacionesSinConfirmar(Long cursoId);

	public List<Notificacion> findNotificacionesForAlumnoId(Long idAluDoc);
}
