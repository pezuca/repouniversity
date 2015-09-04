package com.repouniversity.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.VwLogArchivo;
import com.repouniversity.model.entity.to.LogArchivoTO;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.LogArchivoService;

@Controller
@SessionAttributes("login")
public class LogArchivoController {

	@Autowired
	private CursoService cursoService;

	@Autowired
	private LogArchivoService logArchivoService;

	
	
	  @RequestMapping(value = "logArchivos/verLogArchivos", method = {RequestMethod.GET})
	    public ModelAndView verLogArchivos(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario) {
		  List<VwLogArchivo> vwLogArchivo = logArchivoService.getMisArchivosBajados(usuario.getIdPersona());

	        return new ModelAndView("verLogArchivos").addObject("vwLogArchivo", vwLogArchivo);
	    }
	  
	  @RequestMapping(value = "logArchivos/verLogArchivo", method = {RequestMethod.GET})
	    public ModelAndView verLogArchivo(HttpServletRequest request, @RequestParam("archivoId") Long archivoId) {
		  List<LogArchivoTO> logArchivoList = logArchivoService.getLogArchivoForArchivoId(archivoId);

	        return new ModelAndView("verLogArchivo").addObject("logArchivoList", logArchivoList);
	    }
	  	    

	}
