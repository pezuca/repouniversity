package com.repouniversity.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.GrupoTO;
import com.repouniversity.model.entity.to.TpGrupoTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.GrupoService;
import com.repouniversity.model.services.TpGrupoService;

@Controller
@SessionAttributes("login")
public class GrupoController {

	@Autowired
	private CursoService cursoService;

	@Autowired
	private DocenteService docenteService;

	@Autowired
	private GrupoService grupoService;

	@Autowired
	private TpGrupoService tpGrupoService;
	
	@Autowired
	private AlumnoService alumnoService;

	
//	@RequestMapping(value = "curso/crearGrupo", method = { RequestMethod.POST })
//	@ResponseBody
//	public void solicitarCursoAjax(
//			@RequestParam(value = "cursos", required = true) Integer cursos,
//			@RequestParam(value = "alumnoId", required = true) Integer alumnos,
//			@RequestParam(value = "nombreGrupo", required = true) String nombre) {
//
//		
//		notificacionService.insertarNotificacion(alumnoService.getAlumnoById(alumnoId),
//				cursoService.getCursoById(cursoId), null, tipoNotificacion);
//	}
	
	  @RequestMapping(value = "docente/verTrabajosPracticos", method = {RequestMethod.GET})
	    public ModelAndView verTrabajosPracticos(HttpServletRequest request, @RequestParam("tpId") Long tpId) {
	        TpGrupoTO tpgrupo = tpGrupoService.getTpGrupoById(tpId);

	        return new ModelAndView("verTpGrupoDocente").addObject("tpgrupo", tpgrupo);
	    }

	  @RequestMapping(value = "grupo/agregarAlumnos", method = {RequestMethod.POST})
		@ResponseBody
	    @ResponseStatus(value = HttpStatus.OK)
	  public GrupoTO agregarAlumnosGrupo(@RequestParam(value = "grupoId", required = true) Long grupoId,
	            @RequestParam(value = "alumnosIds", required = true) Long[] listaAlumnoId) {

	        return grupoService.agregarAlumnosGrupo(grupoId, listaAlumnoId);
     
	   }
		@RequestMapping(value = "grupo/eliminarAlumno", method = { RequestMethod.POST })
		@ResponseBody
	    @ResponseStatus(value = HttpStatus.OK)
		public void eliminarAlumnoAjax(
				@RequestParam(value = "alumnoId", required = true) Long alumnoId,
				@RequestParam(value = "cursoId", required = true) Long cursoId) {

			grupoService.eliminarAlumno(alumnoId, cursoId);
			

		}
		
	    @RequestMapping(value = "alumno/verGrupos", method = {RequestMethod.GET})
	    public ModelAndView verGrupos(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario) {

	        List<GrupoTO> grupos = grupoService.getGruposDeAlumno(usuario.getIdAluDoc());

	        return new ModelAndView("verGrupos").addObject("grupos", grupos);
	    }


}
