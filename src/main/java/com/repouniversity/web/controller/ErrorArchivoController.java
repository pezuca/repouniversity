package com.repouniversity.web.controller;

import java.io.IOException;

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

import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.ErrorArchivoTO;
import com.repouniversity.model.services.ArchivoService;
import com.repouniversity.model.services.ComentarioService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.ErrorArchivoService;
import com.repouniversity.model.services.TpGrupoService;

@Controller
@SessionAttributes("login")
public class ErrorArchivoController {

	@Autowired
	private CursoService cursoService;

	@Autowired
	private DocenteService docenteService;

	@Autowired
	private ErrorArchivoService errorArchivoService;

	@Autowired
	private TpGrupoService tpGrupoService;
	
	@Autowired
	private ComentarioService comentarioService;

	@Autowired
	private ArchivoService archivoService;
	
	@RequestMapping(value = "errorArchivo/reportarError", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public ErrorArchivoTO reportarErrorAjax(
			@RequestParam(value = "archivoId", required = true) Long archivoId,
			@RequestParam(value = "descripcion", required = true) String descripcion,
			@ModelAttribute("login") UsuarioRol usuario) throws IOException {

		return errorArchivoService.reportarError(archivoId, descripcion, usuario);
		

	}


	@RequestMapping(value = "errorArchivo/eliminarError", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public void eliminarErrorAjax(
			@RequestParam(value = "errorArchivoId", required = true) Long errorArchivoId) {

		errorArchivoService.eliminarError(errorArchivoId);
		

	}

}
