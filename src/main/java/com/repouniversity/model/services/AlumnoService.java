package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.repouniversity.model.dao.AlumnoDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.CursoMateria;
import com.repouniversity.model.entity.Docente;
import com.repouniversity.model.entity.Persona;

@Service
public class AlumnoService {

	@Autowired
	private PersonaService personaService;

	@Autowired
	private AlumnoDAO alumnoDao;

	public List<Curso> getCursosForAlumno(Integer personaId) {
		Persona persona = personaService.getById(personaId);

		Alumno alumno = alumnoDao.findAlumnoByPersonaId(persona.getId());
		return new ArrayList<Curso>(alumno.getCursos());
	}

	public List<CursoMateria> getCursosMateriasForDocente(Integer personaId) {
		Persona persona = personaService.getById(personaId);

		Docente docente = alumnoDao.findDocenteByPersonaId(persona.getId());
		return new ArrayList<CursoMateria>(docente.getCursosMaterias());
	}

	public Alumno getAlumnoById(Integer alumnoId) {
		return alumnoDao.findById(alumnoId);
	}

	public void saveOrUpdate(Alumno alumno) {
		alumnoDao.saveOrUpdate(alumno);
	}

	public List<Alumno> getAlumnosByIds(Integer[] listaAlumnoId) {
		return alumnoDao.getByIds(CollectionUtils.arrayToList(listaAlumnoId));
	}

}
