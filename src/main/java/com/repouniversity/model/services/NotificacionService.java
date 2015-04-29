package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.NotificacionDAO;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.Notificacion;
import com.repouniversity.model.entity.to.NotificacionTO;

@Service
public class NotificacionService {

    @Autowired
    private NotificacionDAO notificacionDao;

    @Autowired
    private TipoNotificacionService tipoNotificacionService;

    @Autowired
    private AlumnoService alumnoService;

    @Autowired
    private DocenteService docenteService;

    @Autowired
    private CursoService cursoService;

    public void insertarNotificacion(Long alumnoId, Long cursoId, Long docenteId, Long tipoNotificacion) {
        Notificacion nuevaNoti = new Notificacion();
        nuevaNoti.setAlumnoId(alumnoId);
        nuevaNoti.setCursoId(cursoId);
        nuevaNoti.setDocenteId(docenteId);
        // Id de notificacion tipo 3 es solicitud confirmada
        nuevaNoti.setTipoId(tipoNotificacion);

        notificacionDao.insert(nuevaNoti);
    }

    public Notificacion getById(Long notificacionId) {
        return notificacionDao.findById(notificacionId);
    }

    public void remove(Notificacion noti) {
        notificacionDao.delete(noti);
    }

    public List<NotificacionTO> getNotificacionPorCurso(Long id) {
        List<Notificacion> rawNotificacionList = notificacionDao.getNotificacionesSinConfirmar(id);
        List<NotificacionTO> notificacionList = new ArrayList<NotificacionTO>();

        for (Notificacion notificacion : rawNotificacionList) {
            notificacionList.add(buildNotificacion(notificacion));
        }

        return notificacionList;
    }

    private NotificacionTO buildNotificacion(Notificacion notificacion) {
        NotificacionTO noti = new NotificacionTO();
        
        noti.setAlumno(alumnoService.getAlumnoById(notificacion.getAlumnoId()));
        noti.setDocente(docenteService.getById(notificacion.getDocenteId()));
        noti.setCurso(cursoService.getById(notificacion.getCursoId()));
        noti.setTipo(tipoNotificacionService.getTipoNotificacionById(notificacion.getTipoId()));
        noti.setId(notificacion.getId());
        
        return noti;
    }

	public List<NotificacionTO> getNotificacionesForAlumno(Long idAluDoc) {
		
		List<Notificacion> notifi = notificacionDao.findNotificacionesForAlumnoId(idAluDoc);
		
		List<NotificacionTO> notificacionList = new ArrayList<NotificacionTO>();

	        for (Notificacion notificacion : notifi) {
	            notificacionList.add(buildNotificacion(notificacion));
	        }

	        return notificacionList;

		
		
	}
}
