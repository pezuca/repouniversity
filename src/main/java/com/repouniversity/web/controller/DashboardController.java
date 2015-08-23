package com.repouniversity.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.UsuarioParametroTO;
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
import com.repouniversity.model.services.UsuarioParametroService;
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
	@Autowired
	private UsuarioParametroService usuarioParametroService;

	@RequestMapping(value = "/dashboard", method = { RequestMethod.GET })
	public ModelAndView dashboard(HttpServletRequest request,
			@ModelAttribute("login") UsuarioRol usuario) {
		ModelAndView model = new ModelAndView("dashboard");
	
		if (usuario.getRol().equals("alumno")) {
			model = new ModelAndView("dashboardAlumno");
		}

		if (usuario.getRol().equals("docente")) {
			// List<NotificacionTO> notificaciones = null;
			model = new ModelAndView("dashboardDocente");
		}

		if (usuario.getRol().equals("administrador")) {

					
			model = new ModelAndView("dashboardAdmin");
			
		}
		
		List<UsuarioParametroTO> usuarioParametros = usuarioParametroService.getUsuarioParametroActivoforUsuario(usuario.getId());
		
		model.addObject("usuarioParametros", usuarioParametros);
		return model;
	}
	
    @RequestMapping(value = "dashboard/datos", method = { RequestMethod.GET })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public Map<Integer,Integer> datosAjax(HttpServletRequest request,
					@ModelAttribute("login") UsuarioRol usuario) {
    	
    	Map<Integer,Integer> mapa = new HashMap<Integer,Integer>();
		
    	
    	if (usuario.getRol().equals("alumno")) {
			
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
			
			mapa.put(12, notificaciones);
			mapa.put(11, cursos);
			mapa.put(13, grupos);
			mapa.put(15, (int)tps);
			mapa.put(14, archivos);
			
			
		}

		if (usuario.getRol().equals("docente")) {
			
			int notificaciones = notificacionService
					.getNotificacionesForDocente(usuario.getIdAluDoc()).size();

			int cursos = cursoService.getCursosMateriaDisponiblesParaDocente(
					usuario.getIdAluDoc()).size();

			long alumnos = docenteService.getAlumnosAcargoForDocente(usuario
					.getIdAluDoc());

			int archivos = archivoService.getArchivosDePersona(
					usuario.getIdPersona()).size();

			long tps = tpGrupoService.getTPSinNotaForDocente(usuario
					.getIdAluDoc());

			mapa.put(7, notificaciones);
			mapa.put(6, cursos);
			mapa.put(8, (int)alumnos);
			mapa.put(10, (int)tps);
			mapa.put(9, archivos);

		}
		if (usuario.getRol().equals("administrador")) {
	
			int usuarios = usuarioService.getAll().size();
			int cursos = cursoService.getAll().size();
		//	int docentes = docenteService.getAll().size();
		//	int alumnos = alumnoService.getAll().size();
			int materias = materiaService.getAll().size();
			int carreras = carreraService.getAll().size();
			int archivos = archivoService.getAll().size();
			int notificaciones = errorArchivoService.getErrores().size();
	
			//Map<Integer,Integer> mapa = new HashMap<Integer,Integer>();
			mapa.put(2, usuarios);
			mapa.put(3, cursos);
			mapa.put(0, materias);
			mapa.put(5, carreras);
			mapa.put(4, archivos);
			mapa.put(1, notificaciones);
			
		}	
	
		return	mapa;
		

	}

}
