package com.repouniversity.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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

}
