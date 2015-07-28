package com.repouniversity.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Notificacion;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.ErrorArchivoTO;
import com.repouniversity.model.entity.to.NotificacionTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.ErrorArchivoService;
import com.repouniversity.model.services.NotificacionService;
import com.repouniversity.model.services.TipoNotificacionService;

@Controller
@SessionAttributes("login")
public class NotificacionController {

    @Autowired
    private CursoService cursoService;

    @Autowired
    private DocenteService docenteService;

    @Autowired
    private NotificacionService notificacionService;

    @Autowired
    private ErrorArchivoService errorArchivoService;

    @Autowired
    private TipoNotificacionService tipoNotificacionService;

    @Autowired
    private AlumnoService alumnoService;

    @RequestMapping(value = "notificacion/confirmaaltancurso", method = {RequestMethod.POST})
    @ResponseBody
    public void confirmAltaCursoAjax(HttpServletRequest request, @RequestParam(value = "notificacionId", required = true) Long notificacionId) {

        Notificacion noti = notificacionService.getById(notificacionId);
        cursoService.registrarAlumnoACurso(noti);
    }
    
    @RequestMapping(value = "notificacion/rechazaaltancurso", method = {RequestMethod.POST})
    @ResponseBody
    public void rechazoAltaCursoAjax(HttpServletRequest request, @RequestParam(value = "notificacionId", required = true) Long notificacionId) {

        Notificacion noti = notificacionService.getById(notificacionId);
        cursoService.rechazarAlumnoACurso(noti);
    }
    @RequestMapping(value = "notificacion/borrarNotificacion", method = {RequestMethod.POST})
    @ResponseBody
    public void borrarNotificacionCursoAjax(HttpServletRequest request, @RequestParam(value = "notificacionId", required = true) Long notificacionId) {

    	 Notificacion noti = notificacionService.getById(notificacionId);
        notificacionService.remove(noti);
        
    }

    

    @RequestMapping(value = "alumno/solicitarCurso", method = {RequestMethod.POST})
    @ResponseBody
    public void solicitarCursoAjax(@RequestParam(value = "cursoId", required = true) Long cursoId,
            @RequestParam(value = "alumnoId", required = true) Long alumnoId, @RequestParam(value = "docenteId", required = true) Long docenteId,
            @RequestParam(value = "tipoNotif", required = true) Long tipoNotificacion) {

        notificacionService.insertarNotificacion(alumnoId, cursoId, docenteId, tipoNotificacion);
    }

//    @RequestMapping(value = "alumno/notificaciones", method = {RequestMethod.GET})
//    public ModelAndView listaNotificaciones(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario) {
//
//        List<Notificacion> Notificaciones = notificacionService.getNotificacionesForAlumno(usuario.getIdAluDoc());
//
//        return new ModelAndView("verNotificaciones").addObject("notificaciones", Notificaciones);
//    }
    
    @RequestMapping(value = "alumno/notificaciones", method = {RequestMethod.GET})
    public ModelAndView listaNotificaciones(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario) {

        List<NotificacionTO> Notificaciones = notificacionService.getNotificacionesForAlumno(usuario.getIdAluDoc());

        return new ModelAndView("verNotificaciones").addObject("notificaciones", Notificaciones);
    }
    
    @RequestMapping(value = "docente/notificaciones", method = {RequestMethod.GET})
    public ModelAndView laListaNotificaciones(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario) {

        List<NotificacionTO> Notificaciones = notificacionService.getNotificacionesForDocente(usuario.getIdAluDoc());

        return new ModelAndView("verNotificaciones").addObject("notificaciones", Notificaciones);
    }
    
    @RequestMapping(value = "/notificaciones", method = {RequestMethod.GET})
    @ResponseBody
    public int cantNotificaciones(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario) {
    	List<NotificacionTO> notificaciones = null;
    	List<ErrorArchivoTO> errores = null;
    	if (usuario.getRol().equals("alumno"))
    	{
    		notificaciones = notificacionService.getNotificacionesForAlumno(usuario.getIdAluDoc());
    		return notificaciones.size();
	   	}
    	if (usuario.getRol().equals("docente"))
    	{
    		notificaciones = notificacionService.getNotificacionesForDocente(usuario.getIdAluDoc());
    		return notificaciones.size();
	   	}
    	if (usuario.getRol().equals("administrador"))
    	{
    		errores = errorArchivoService.getErrores();
    		return errores.size();
	   	}	
    	
    	return 0;
        //return notificaciones;
    }
}
