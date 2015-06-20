package com.repouniversity.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.to.TpGrupoTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.ArchivoService;
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

	@Autowired
	private ArchivoService archivoService;
	
	@RequestMapping(value = "grupo/nuevoTp", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public TpGrupoTO nuevoTpAjax(
			@RequestParam(value = "grupoId", required = true) Long grupoId,
			@RequestParam(value = "descripcion", required = true) String descripcion,
			@RequestParam(value = "archivoId", required = true) Long archivoId,
			@RequestParam(value = "nota", required = true) Long nota) {

		
		return tpGrupoService.nuevoTp(grupoId, descripcion, archivoId, nota);
		

	}
	@RequestMapping(value = "grupo/editarTp", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public TpGrupoTO editarTpAjax(
			@RequestParam(value = "grupoId", required = true) Long grupoId,
			@RequestParam(value = "tpId", required = true) Long tpId,
			@RequestParam(value = "descripcion", required = true) String descripcion,
			@RequestParam(value = "archivoId", required = true) Long archivoId,
			@RequestParam(value = "nota", required = true) Long nota) {

	return	tpGrupoService.editarTp(grupoId, tpId, descripcion, archivoId, nota);
		

	}
	
	@RequestMapping(value = "grupo/eliminarTp", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public void eliminarTpAjax(
			@RequestParam(value = "tpId", required = true) Long tpId) {

		tpGrupoService.eliminarTp(tpId);
		

	}
	
	  @RequestMapping(value = "grupo/verTrabajosPracticos", method = {RequestMethod.GET})
	    public ModelAndView verTrabajosPracticos(HttpServletRequest request, @RequestParam("tpGrupoId") Long tpGrupoId) {
	        TpGrupoTO tpgrupo = tpGrupoService.getTpGrupoById(tpGrupoId);

	        return new ModelAndView("verTpGrupoDocente").addObject("tpgrupo", tpgrupo);
	    }

}
