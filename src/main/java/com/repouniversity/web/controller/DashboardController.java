package com.repouniversity.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.ArchivoService;
import com.repouniversity.model.services.CarreraService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.ErrorArchivoService;
import com.repouniversity.model.services.GrupoService;
import com.repouniversity.model.services.MateriaService;
import com.repouniversity.model.services.NotificacionService;
import com.repouniversity.model.services.TpGrupoService;
import com.repouniversity.model.services.UsuarioService;

@Controller
@SessionAttributes("login")
public class DashboardController {
	
	@Autowired
	private NotificacionService notificacionService;
	@Autowired
	private CursoService cursoService;
	@Autowired
	private GrupoService grupoService;
	@Autowired
	private ArchivoService archivoService;
	@Autowired
	private DocenteService docenteService;
	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private MateriaService materiaService;
	@Autowired
	private CarreraService carreraService;
	@Autowired
	private ErrorArchivoService errorArchivoService;
	@Autowired
	private AlumnoService alumnoService;
	@Autowired
	private TpGrupoService tpGrupoService;

	@RequestMapping(value = "/dashboard", method = { RequestMethod.GET })
	public ModelAndView dashboard(HttpServletRequest request,
			@ModelAttribute("login") UsuarioRol usuario) {
		ModelAndView model = new ModelAndView("dashboard");

		if (usuario.getRol().equals("alumno")) {
			model = new ModelAndView("dashboardAlumno");
			int notificaciones = notificacionService
					.getNotificacionesForAlumno(usuario.getIdAluDoc()).size();

			int cursos = cursoService.getCursosForAlumno(usuario.getIdAluDoc())
					.size();

			int grupos = grupoService.getGruposDeAlumno(usuario.getIdAluDoc())
					.size();

			int archivos = archivoService.getArchivosDePersona(
					usuario.getIdPersona()).size();

			long tps = tpGrupoService.getTPsAprobadoForAlumno(usuario
					.getIdAluDoc());

			model.addObject("notificaciones", notificaciones)
					.addObject("cursos", cursos).addObject("grupos", grupos)
					.addObject("archivos", archivos).addObject("tps", tps);
		}

		if (usuario.getRol().equals("docente")) {
			// List<NotificacionTO> notificaciones = null;
			model = new ModelAndView("dashboardDocente");
			int notificaciones = notificacionService
					.getNotificacionesForAlumno(usuario.getIdAluDoc()).size();

			int cursos = cursoService.getCursosMateriaDisponiblesParaDocente(
					usuario.getIdAluDoc()).size();

			long alumnos = docenteService.getAlumnosAcargoForDocente(usuario
					.getIdAluDoc());

			int archivos = archivoService.getArchivosDePersona(
					usuario.getIdPersona()).size();

			long tps = tpGrupoService.getTPSinNotaForDocente(usuario
					.getIdAluDoc());

			model.addObject("notificaciones", notificaciones)
					.addObject("cursos", cursos).addObject("alumnos", alumnos)
					.addObject("archivos", archivos).addObject("tps", tps);
		}

		if (usuario.getRol().equals("administrador")) {

			model = new ModelAndView("dashboardAdmin");
			int usuarios = usuarioService.getAll().size();
			int cursos = cursoService.getAll().size();
			int docentes = docenteService.getAll().size();
			int alumnos = alumnoService.getAll().size();
			int materias = materiaService.getAll().size();
			int carreras = carreraService.getAll().size();
			int archivos = archivoService.getAll().size();
			int notificaciones = errorArchivoService.getErrores().size();

			model.addObject("notificaciones", notificaciones)
					.addObject("cursos", cursos).addObject("alumnos", alumnos)
					.addObject("archivos", archivos)
					.addObject("materias", materias)
					.addObject("docentes", docentes)
					.addObject("usuarios", usuarios)
					.addObject("carreras", carreras);
		}
		return model;
	}

}
