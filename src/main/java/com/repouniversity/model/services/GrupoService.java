package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.GrupoDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.entity.Persona;

@Service
@Transactional
public class GrupoService {

	@Autowired
	private GrupoDAO grupoDao;
	

	public void saveOrUpdate(Grupo grupo) {
		grupoDao.saveOrUpdate(grupo);
	}
	
/*	public void crearGrupo(Alumno alumno, Curso curso, String nombreGrupo) {
		Notificacion nuevaNoti = new Notificacion();
		nuevaNoti.setAlumno(alumno);
		nuevaNoti.setCurso(curso);
		nuevaNoti.setDocente(docente);
		// Id de notificacion tipo 3 es solicitud confirmada
		nuevaNoti.setTipo(tipoNotificacionService.getTipoNotificacionById(tipoNotificacion));
		
		notificacionDao.saveOrUpdate(nuevaNoti);
	}
*/
	


	public Grupo getGrupoById(Integer grupoId) {
		return grupoDao.findById(grupoId);
	}



	
	
	
}
