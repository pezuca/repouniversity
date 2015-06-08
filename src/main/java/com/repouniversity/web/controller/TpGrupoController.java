package com.repouniversity.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.GrupoService;
import com.repouniversity.model.services.TpGrupoService;

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
	private TpGrupoService tpGrupoService;
	
	@Autowired
	private AlumnoService alumnoService;

	
	@RequestMapping(value = "grupo/nuevoTp", method = { RequestMethod.POST })
	@ResponseBody
	public void nuevoTpAjax(
			@RequestParam(value = "descripcion", required = true) String descripcion,
			@RequestParam(value = "archivoId", required = true) Long archivoId,
			@RequestParam(value = "nota", required = true) Long nota) {

		tpGrupoService.nuevoTp(descripcion, archivoId, nota);
		

	}
	@RequestMapping(value = "grupo/editarTp", method = { RequestMethod.POST })
	@ResponseBody
	public void editarTpAjax(
			@RequestParam(value = "descripcion", required = true) String descripcion,
			@RequestParam(value = "archivoId", required = true) Long archivoId,
			@RequestParam(value = "nota", required = true) Long nota,
			@RequestParam(value = "activo", required = true) Boolean activo) {

		tpGrupoService.editarTp(descripcion, archivoId, nota, activo);
		

	}
	


}
