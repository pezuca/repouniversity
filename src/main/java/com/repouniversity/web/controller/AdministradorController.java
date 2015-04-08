package com.repouniversity.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.to.UsuarioTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.PersonaService;
import com.repouniversity.model.services.UsuarioService;

@Controller
public class AdministradorController {

    @Autowired
    public PersonaService personaService;
    
    @Autowired
    public AlumnoService alumnoService;

    @Autowired
    public UsuarioService usuarioService;
    
    @RequestMapping(value = "admin/verUsuarios", method = {RequestMethod.GET})
    public ModelAndView getPersonas() {
        
        List<UsuarioTO> listaUsuarios = usuarioService.getAll();
        return new ModelAndView("verUsuariosAdmin").addObject("usuarios", listaUsuarios);
    }
}
