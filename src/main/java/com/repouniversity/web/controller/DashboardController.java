package com.repouniversity.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.VwArchivo;
import com.repouniversity.model.entity.to.GrupoTO;
import com.repouniversity.model.entity.to.NotificacionTO;
import com.repouniversity.model.services.ArchivoService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.GrupoService;
import com.repouniversity.model.services.NotificacionService;
import com.repouniversity.model.services.TpGrupoService;

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
	private TpGrupoService tpGrupoService;
    
	@RequestMapping(value = "/dashboard", method = { RequestMethod.GET })
	public ModelAndView dashboard(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario) {
		ModelAndView model = new ModelAndView("dashboard");
		
		if (usuario.getRol().equals("alumno"))
    	{
		//	List<NotificacionTO> notificaciones = null;
			model = new ModelAndView("dashboardAlumno");
			int notificaciones = notificacionService.getNotificacionesForAlumno(usuario.getIdAluDoc()).size();
    		    	   		
			int cursos = cursoService.getCursosForAlumno(usuario.getIdAluDoc()).size();
    
			 int grupos = grupoService.getGruposDeAlumno(usuario.getIdAluDoc()).size();
			
			 int archivos = archivoService.getArchivosDePersona(usuario.getIdPersona()).size();
			 
			 long tps = tpGrupoService.getTPsAprobadoForAlumno(usuario.getIdAluDoc());
			 
			 
    		model.addObject("notificaciones", notificaciones).addObject("cursos", cursos).addObject("grupos", grupos).addObject("archivos", archivos).addObject("tps", tps);
	   	}
		
		
		return model;
	}

	
	
}
