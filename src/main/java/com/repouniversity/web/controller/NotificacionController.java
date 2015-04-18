package com.repouniversity.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.repouniversity.model.entity.Notificacion;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
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

    @RequestMapping(value = "alumno/solicitarCurso", method = {RequestMethod.POST})
    @ResponseBody
    public void solicitarCursoAjax(@RequestParam(value = "cursoId", required = true) Long cursoId,
            @RequestParam(value = "alumnoId", required = true) Long alumnoId, @RequestParam(value = "docenteId", required = true) Long docenteId,
            @RequestParam(value = "tipoNotif", required = true) Long tipoNotificacion) {

        notificacionService.insertarNotificacion(alumnoId, cursoId, docenteId, tipoNotificacion);
    }

}
