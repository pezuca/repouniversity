package com.repouniversity.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.GrupoService;

@Controller
@SessionAttributes("login")
public class TpGrupoController {

	@Autowired
	private CursoService cursoService;

	@Autowired
	private DocenteService docenteService;

	@Autowired
	private GrupoService grupoService;


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
	


}
