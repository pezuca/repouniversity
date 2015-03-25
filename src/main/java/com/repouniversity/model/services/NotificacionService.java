package com.repouniversity.model.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.NotificacionDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.Docente;
import com.repouniversity.model.entity.Notificacion;

@Service
@Transactional
public class NotificacionService {

	@Autowired
	private NotificacionDAO notificacionDao;
	
	@Autowired
	private TipoNotificacionService tipoNotificacionService;

	public void insertarNotificacion(Alumno alumno, Curso curso, Docente docente, Integer tipoNotificacion) {
		Notificacion nuevaNoti = new Notificacion();
		nuevaNoti.setAlumno(alumno);
		nuevaNoti.setCurso(curso);
		nuevaNoti.setDocente(docente);
		// Id de notificacion tipo 3 es solicitud confirmada
		nuevaNoti.setTipo(tipoNotificacionService.getTipoNotificacionById(tipoNotificacion));
		
		notificacionDao.saveOrUpdate(nuevaNoti);
	}

	public Notificacion getByID(Integer notificacionId) {
		return notificacionDao.findById(notificacionId);
	}

	public void remove(Notificacion noti) {
		// TODO Auto-generated method stub
		notificacionDao.delete(noti);
	}

	public List<Notificacion> getNotificacionPorCurso(Integer id) {
		return notificacionDao.getNotificacionesSinConfirmar(id);
	}

}
