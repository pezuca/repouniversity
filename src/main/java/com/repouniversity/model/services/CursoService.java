package com.repouniversity.model.services;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.CursoDAO;
import com.repouniversity.model.dao.CursoMateriaDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.CursoMateria;
import com.repouniversity.model.entity.Grupo;

@Service
@Transactional
public class CursoService {

	@Autowired
	private CursoDAO cursoDao;

	@Autowired
	private CursoMateriaDAO cursoMateriaDao;

	@Autowired
	private AlumnoService alumnoService;

	@Autowired
	private GrupoService grupoService;

	public List<Curso> getAll() {
		return cursoDao.getAll();
	}

	public Curso getCursoById(Integer cursoId) {
		return cursoDao.findById(cursoId);
	}

	public List<CursoMateria> getAllCursoMateria() {
		return cursoMateriaDao.getAll();
	}

	public List<CursoMateria> getCursosMateriaDisponiblesParaAlumno(
			Integer alumnoId) {
		List<CursoMateria> cursos = cursoMateriaDao.getAll();
		Set<Curso> cursosAlu = alumnoService.getAlumnoById(alumnoId)
				.getCursos();

		for (Curso curso : cursosAlu) {
			for (CursoMateria cursoMat : cursos) {
				if (curso.getId() == cursoMat.getCurso().getId()) {
					cursos.remove(cursoMat);
					break;
				}
			}
		}

		return cursos;
	}

	public void saveOrUpdate(Curso curso) {
		cursoDao.saveOrUpdate(curso);
	}

	public void registrarAlumnoACurso(Curso curso, Alumno alumno) {
		// Alumno alumno = alumnoService.getAlumnoById(alumno);

		curso.getAlumnos().add(alumno);
		alumno.getCursos().add(curso);

		alumnoService.saveOrUpdate(alumno);

		saveOrUpdate(curso);
	}

	public void crearGrupo(Integer cursoId, List<Alumno> alumnos, String nombre) {
		Grupo grupo = new Grupo();
		
		grupo.setAlumnos(new TreeSet<Alumno>(alumnos));
		grupo.setNombre(nombre);
		grupo.setActivo(true);
		grupo.setCursos(new TreeSet<Curso>());

		Curso cursoo = getCursoById(cursoId);

		grupo.getCursos().add(cursoo);
		grupoService.saveOrUpdate(grupo);
		
		cursoo.getGrupos().add(grupo);
		
		for (Alumno alumno : alumnos) {
			alumno.getGrupos().add(grupo);
			
			Curso cursoRemove = null;
			for (Curso curso : alumno.getCursos()) {
				if(curso.getId().equals(cursoId)) {
					cursoRemove = curso; 
				}
			}
			
			alumno.getCursos().remove(cursoRemove);
			alumno.getCursos().add(cursoo);
			
			alumnoService.saveOrUpdate(alumno);
		}
		
		saveOrUpdate(cursoo);
	}
}
