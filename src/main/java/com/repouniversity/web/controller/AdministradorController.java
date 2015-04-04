package com.repouniversity.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.to.AlumnoTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.PersonaService;

@Controller
public class AdministradorController {

    @Autowired
    public PersonaService personaService;
    
    @Autowired
    public AlumnoService alumnoService;

    @RequestMapping(value = "admin/verAlumnos", method = {RequestMethod.GET})
    public ModelAndView getPersonas() {
        
        List<AlumnoTO> listaAlumnos = alumnoService.getAll();
        return new ModelAndView("verAlumnosAdmin").addObject("alumnos", listaAlumnos);
    }
}
