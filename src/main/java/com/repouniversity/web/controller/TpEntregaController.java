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

import com.repouniversity.model.entity.to.TpEntregaTO;
import com.repouniversity.model.entity.to.TpGrupoTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.TpEntregaService;

@Controller
@SessionAttributes("login")
public class TpEntregaController {



	@Autowired
	private AlumnoService alumnoService;

	@Autowired
	private TpEntregaService tpEntregaService;

	
	@RequestMapping(value = "tpgrupo/nuevoEntregaTp", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public TpEntregaTO nuevoEntregaTpAjax(
			@RequestParam(value = "tpGrupoId", required = true) Long tpGrupoId,
			@RequestParam(value = "descripcion", required = true) String descripcion,
			@RequestParam(value = "archivoId", required = true) Long archivoId) {

		return tpEntregaService.nuevoEntregaTp(tpGrupoId, descripcion, archivoId);
		

	}
	@RequestMapping(value = "tpgrupo/editarEntregaTp", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public TpEntregaTO editarEntregaTpAjax(
			@RequestParam(value = "tpGrupoId", required = true) Long tpGrupoId,
			@RequestParam(value = "tpEntregaId", required = true) Long tpEntregaId,
			@RequestParam(value = "descripcion", required = true) String descripcion,
			@RequestParam(value = "archivoId", required = true) Long archivoId) {

	return	tpEntregaService.editarEntregaTp(tpGrupoId, tpEntregaId, descripcion, archivoId);
		

	}
	
	@RequestMapping(value = "tpgrupo/eliminarEntregaTp", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public void eliminarEntregaTpAjax(
			@RequestParam(value = "tpEntregaId", required = true) Long tpEntregaId) {

		tpEntregaService.eliminarEntregaTp(tpEntregaId);
		

	}
	
	  @RequestMapping(value = "tpgrupo/verEntregasTP", method = {RequestMethod.GET})
	    public ModelAndView verEntregasTP(HttpServletRequest request, @RequestParam("tpEntregaId") Long tpEntregaId) {
		  TpEntregaTO tpEntrega = tpEntregaService.getTpEntregaById(tpEntregaId);

	        return new ModelAndView("verTpGrupoDocente").addObject("tpEntregaId", tpEntregaId);
	    }
	


}
