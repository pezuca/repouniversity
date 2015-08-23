package com.repouniversity.web.controller;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Carrera;
import com.repouniversity.model.entity.Role;
import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.UsuarioTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.ArchivoService;
import com.repouniversity.model.services.CarreraService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.ErrorArchivoService;
import com.repouniversity.model.services.MateriaService;
import com.repouniversity.model.services.PersonaService;
import com.repouniversity.model.services.RoleService;
import com.repouniversity.model.services.UsuarioRolService;
import com.repouniversity.model.services.UsuarioService;

@Controller
@SessionAttributes("login")
public class SeguridadController {

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

    @Autowired
    public CursoService cursoService;

    @Autowired
    public MateriaService materiaService;

    @Autowired
    public CarreraService carreraService;

    @Autowired
    public ArchivoService archivoService;

    @Autowired
    public RoleService roleService;

    @Autowired
    public ErrorArchivoService errorArchivoService;

    @RequestMapping(value = "seguridad/listaUsuarios", method = {RequestMethod.GET})
    public ModelAndView getUsuarios(@ModelAttribute("login") UsuarioRol usuario) {

        List<UsuarioTO> listaUsuarios = usuarioService.getAllForSeguridad(usuario);

        List<Carrera> listacarreras = carreraService.getAll();
        List<Role> listaRoles = roleService.getAll();

        return new ModelAndView("listaUsuariosSeguridad").addObject("usuarios", listaUsuarios).addObject("listacarreras", listacarreras)
                .addObject("listaRoles", listaRoles);
    }

    @RequestMapping(value = "seguridad/editarUsuarioRol", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public UsuarioTO editarUsuarioAjax(@RequestParam(value = "userId") Long userId, @RequestParam(value = "rol") String rol) {

        Usuario usuario = usuarioService.updateRol(userId, rol);

        UsuarioTO usuarioTo = usuarioService.getUserById(usuario.getId());
        return usuarioTo;
    }
}
