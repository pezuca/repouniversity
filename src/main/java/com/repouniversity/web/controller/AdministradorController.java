package com.repouniversity.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.UsuarioTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.PersonaService;
import com.repouniversity.model.services.UsuarioRolService;
import com.repouniversity.model.services.UsuarioService;

@Controller
public class AdministradorController {

    @Autowired
    public PersonaService personaService;

    @Autowired
    public AlumnoService alumnoService;
    
    @Autowired
    public DocenteService docenteService;

    @Autowired
    public UsuarioService usuarioService;
    
    @Autowired
    public UsuarioRolService usuarioRolService;

    @RequestMapping(value = "admin/verUsuarios", method = {RequestMethod.GET})
    public ModelAndView getPersonas() {

        List<UsuarioTO> listaUsuarios = usuarioService.getAll();
        return new ModelAndView("verUsuariosAdmin").addObject("usuarios", listaUsuarios);
    }

    @RequestMapping(value = "admin/nuevoUsuario", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public void crearUsuarioAjax(@RequestParam(value = "nombre") String nombre, @RequestParam(value = "apellido") String apellido,
            @RequestParam(value = "mail") String mail, @RequestParam(value = "user") String user, @RequestParam(value = "password") String password,
            @RequestParam(value = "activo") Boolean activo, @RequestParam(value = "rol") String rol) {

        usuarioService.saveUser(nombre, apellido, mail, user, password, activo, rol);
    }

    @RequestMapping(value = "admin/eliminarUsuario", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public void deleteUsuarioAjax(@RequestParam(value = "userId") Long userId) {
        UsuarioRol usuarioRol = usuarioRolService.getUsuarioById(userId);
        
        usuarioService.completelyDeleteUsuario(usuarioRol);
    }
}
