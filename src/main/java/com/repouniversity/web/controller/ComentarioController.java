package com.repouniversity.web.controller;

import java.io.IOException;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.ComentarioTO;
import com.repouniversity.model.entity.to.TpEntregaTO;
import com.repouniversity.model.entity.to.TpGrupoTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.ArchivoService;
import com.repouniversity.model.services.ComentarioService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.GrupoService;
import com.repouniversity.model.services.TpGrupoService;

@Controller
@SessionAttributes("login")
public class ComentarioController {

	@Autowired
	private CursoService cursoService;

	@Autowired
	private DocenteService docenteService;

	@Autowired
	private GrupoService grupoService;

	@Autowired
	private TpGrupoService tpGrupoService;
	
	@Autowired
	private ComentarioService comentarioService;

	@Autowired
	private ArchivoService archivoService;
	
	@RequestMapping(value = "comentario/nuevoComentario", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public ComentarioTO nuevoComentarioAjax(
			@RequestParam(value = "tpGrupoId", required = true) Long tpGrupoId,
			@RequestParam(value = "comentario", required = true) String descripcion,
			@ModelAttribute("login") UsuarioRol usuario) throws IOException {

		return comentarioService.nuevoComentario(tpGrupoId, descripcion, usuario);
		

	}


	@RequestMapping(value = "comentario/eliminarComentario", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public void eliminarComentarioAjax(
			@RequestParam(value = "comentarioId", required = true) Long comentarioId) {

		comentarioService.eliminarComentario(comentarioId);
		

	}

}
