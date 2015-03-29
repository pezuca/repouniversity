package com.repouniversity.web.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.CursoMateria;
import com.repouniversity.model.entity.Docente;
import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.entity.Notificacion;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.GrupoService;
import com.repouniversity.model.services.NotificacionService;
import com.repouniversity.model.services.TipoNotificacionService;

@Controller
@SessionAttributes("login")
public class CursoController {

	@Autowired
	private CursoService cursoService;

	@Autowired
	private DocenteService docenteService;

	@Autowired
	private NotificacionService notificacionService;

	@Autowired
	private TipoNotificacionService tipoNotificacionService;

	@Autowired
	private AlumnoService alumnoService;

	@Autowired
	private GrupoService grupoService;

	@RequestMapping(value = "alumno/cursos", method = { RequestMethod.GET })
	public ModelAndView sendAlumnoCursos(HttpServletRequest request,
			@ModelAttribute("login") UsuarioRol usuario) {

		List<Curso> cursos = cursoService.getCursosForAlumno(usuario.getIdAluDoc());

		return new ModelAndView("cursos").addObject("cursos", cursos);
	}

	@RequestMapping(value = "docente/cursosMaterias", method = { RequestMethod.GET })
	public ModelAndView sendCursoMateriaDocente(HttpServletRequest request,
			@ModelAttribute("login") UsuarioRol usuario) {

		List<CursoMateria> cursosMaterias = alumnoService
				.getCursosMateriasForDocente(usuario.getPersona().getId());

		return new ModelAndView("cursosMaterias").addObject("cursos",
				cursosMaterias);
	}

	@RequestMapping(value = "alumno/verCursoDocente", method = { RequestMethod.GET })
	public ModelAndView verCurso(
			@RequestParam(value = "cursoId", required = true) Integer cursoId) {
		Curso curso = cursoService.getCursoById(cursoId);

		return new ModelAndView("verCurso").addObject("curso", curso);
		
		
	}

	@RequestMapping(value = "alumno/solicitarCurso", method = { RequestMethod.GET })
	public ModelAndView solicitarCurso(
			@ModelAttribute("login") UsuarioRol usuario) {

		List<CursoMateria> cursos = cursoService
				.getCursosMateriaDisponiblesParaAlumno(usuario.getIdAluDoc());
		return new ModelAndView("solicitarCurso").addObject("cursosMaterias",
				cursos);
	}

	@RequestMapping(value = "docente/verCursos", method = { RequestMethod.GET })
	public ModelAndView verCursosDocente(HttpServletRequest request,
			@ModelAttribute("login") UsuarioRol usuario) {

		Docente docente = docenteService.getById(usuario.getIdAluDoc());

		return new ModelAndView("verCursosDocente").addObject("cursosMaterias",
				docente.getCursosMaterias());

	}

	@RequestMapping(value = "docente/verCurso", method = { RequestMethod.GET })
	public ModelAndView verCursoDocente(HttpServletRequest request,
			@RequestParam("cursoId") Integer cursoId) {

		Curso curso = cursoService.getCursoById(cursoId);
		List<Notificacion> notificaciones = notificacionService
				.getNotificacionPorCurso(curso.getId());
		curso.setNotificaciones(notificaciones);
		curso.getAlumnos();		
		return new ModelAndView("verCursoDocente").addObject("curso", curso);
		
	}
	
	@RequestMapping(value = "docente/crearGrupo", method = { RequestMethod.GET })
//	@ResponseBody
	public ModelAndView solicitarCursoAjax(
			@RequestParam(value = "curso", required = false) Integer curso,
			@RequestParam(value = "listaAlumnoId", required = false) Integer[] listaAlumnoId,
			@RequestParam(value = "nombreGrupo", required = false) String nombre) {

		List<Alumno> alumnos = alumnoService.getAlumnosByIds(listaAlumnoId);	
		cursoService.crearGrupo(curso, alumnos, nombre);
		
		return new ModelAndView("verCursoDocente").addObject("curso", curso);
	}
	
	
	@RequestMapping(value = "docente/verGrupo", method = { RequestMethod.GET })
	public ModelAndView verGrupoDocente(HttpServletRequest request,
			@RequestParam("grupoId") Integer grupoId) {

		Grupo grupo = grupoService.getGrupoById(grupoId);
		

		return new ModelAndView("verGrupoDocente").addObject("grupo", grupo);
		
	}
}
