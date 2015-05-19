package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.CursoDAO;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.CursoMateria;
import com.repouniversity.model.entity.Notificacion;
import com.repouniversity.model.entity.to.CursoTO;

@Service
public class CursoService {

	@Autowired
	private CursoDAO cursoDao;

	@Autowired
	private AlumnoService alumnoService;

	@Autowired
	private DocenteService docenteService;

	@Autowired
	private GrupoService grupoService;

	@Autowired
	private MateriaService materiaService;

	@Autowired
	private NotificacionService notificacionService;

	public List<CursoTO> getAll() {
		List<Curso> cursos = cursoDao.findAll();
		List<CursoTO> cursosTo = buildCursos(cursos);

		return cursosTo;
	}

	public List<CursoTO> buildCursos(List<Curso> cursos) {
		List<CursoTO> cursosTo = new ArrayList<CursoTO>();

		for (Curso curso : cursos) {
			cursosTo.add(buildCurso(curso));
		}
		return cursosTo;
	}

	public CursoTO buildCurso(Curso curso) {
		CursoTO cursoTo = new CursoTO();
		cursoTo.setId(curso.getId());
		cursoTo.setNombre(curso.getNombre());
		cursoTo.setDescripcion(curso.getDescripcion());
		cursoTo.setCodigo(curso.getCodigo());
		cursoTo.setFechasys(curso.getFechasys());
		cursoTo.setDocente(docenteService.getCompleteById(curso.getDocenteId()));
		cursoTo.setMateria(materiaService.getById(curso.getMateriaId()));
		return cursoTo;
	}

	public Curso getById(Long cursoId) {
		return cursoDao.findById(cursoId);
	}

	public List<CursoMateria> getCursosMateriaDisponiblesParaAlumno(
			Long alumnoId) {
		List<CursoMateria> cursoMateriaList = cursoDao
				.findCursosMateriaDisponiblesParaAlumno(alumnoId);

		for (CursoMateria cursoMateria : cursoMateriaList) {
			cursoMateria.setDocente(docenteService
					.getByCursoMateriaId(cursoMateria.getId()));
		}

		return cursoMateriaList;
	}

	public void save(Curso curso) {
		cursoDao.insert(curso);
	}

	public void registrarAlumnoACurso(Notificacion noti) {
		cursoDao.saveAlumnoCursoGrupo(noti.getAlumnoId(), noti.getCursoId(), 0L);

		notificacionService.insertarNotificacion(noti.getAlumnoId(),
				noti.getCursoId(), noti.getDocenteId(), 3L);

		notificacionService.remove(noti);
	}

	public void rechazarAlumnoACurso(Notificacion noti) {
		notificacionService.insertarNotificacion(noti.getAlumnoId(),
				noti.getCursoId(), noti.getDocenteId(), 4L);

		notificacionService.remove(noti);
	}

	public List<Curso> getCursosForAlumno(Long idAluDoc) {
		return cursoDao.findCursosForAlumnoId(idAluDoc);
	}

	public List<CursoMateria> getCursosMateriaDisponiblesParaDocente(
			Long idAluDoc) {
		List<CursoMateria> cursoMateriaList = cursoDao
				.findCursosForDocenteId(idAluDoc);

		for (CursoMateria cursoMateria : cursoMateriaList) {
			cursoMateria.setDocente(docenteService.getById(idAluDoc));
		}

		return cursoMateriaList;
	}

	public void delete(Long cursoId) {
		cursoDao.delete(getById(cursoId));
	}

	public Curso save(String nombre, String descripcion, String codigo,
			Long materiaId, Long docenteId) {
		Curso curso = new Curso();
		curso.setNombre(nombre);
		curso.setDescripcion(descripcion);
		curso.setCodigo(codigo);
		curso.setMateriaId(materiaId);
		curso.setDocenteId(docenteId);

		return cursoDao.insert(curso);
	}

	public Curso update(Long cursoId, String nombre, String descripcion,
			String codigo, Long materiaId, Long docenteId) {
		Curso curso = cursoDao.findById(cursoId);

		curso.setNombre(nombre);
		curso.setDescripcion(descripcion);
		curso.setCodigo(codigo);
		curso.setMateriaId(materiaId);
		curso.setDocenteId(docenteId);

		cursoDao.update(curso);

		return curso;
	}
}
