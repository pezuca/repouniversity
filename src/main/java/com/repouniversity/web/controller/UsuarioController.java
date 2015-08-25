package com.repouniversity.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Carrera;
import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.UsuarioTO;
import com.repouniversity.model.services.CarreraService;
import com.repouniversity.model.services.UsuarioRolService;
import com.repouniversity.model.services.UsuarioService;
import com.repouniversity.web.exceptions.StrongPasswordException;
import com.repouniversity.web.utils.HTTPSessionManagerUtil;

@Controller
public class UsuarioController {

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    CarreraService carreraService;

    @Autowired
    UsuarioRolService usuarioRolService;

    @RequestMapping(value = "usuario/misdatos", method = RequestMethod.GET)
    public ModelAndView displayInformation(HttpServletRequest request) {
        UsuarioRol usuarioRol = (UsuarioRol) HTTPSessionManagerUtil.getSessionAttribute(request, "login");

        UsuarioTO usuario = usuarioService.getUserById(usuarioRol.getId());
        List<Carrera> listacarreras = carreraService.getAll();
        ModelAndView mav = new ModelAndView("misDatos").addObject("usuario", usuario).addObject("listacarreras", listacarreras);

        return mav;
    }

    @RequestMapping(value = "usuario/misdatos/update", method = RequestMethod.POST)
    public ModelAndView updateInformation(HttpServletRequest request, @RequestParam(value = "id", required = true) Long id,
            @RequestParam(value = "nombre", required = true) String nombre, @RequestParam(value = "apellido", required = true) String apellido,
            @RequestParam(value = "mail", required = true) String mail, @RequestParam(value = "newPassword", defaultValue = "") String newPassword,
            @RequestParam(value = "repeatPassword", defaultValue = "") String repeatPassword, @RequestParam(value = "carrera", required = false) Long carreraId) {

        Usuario usuario = usuarioService.updateUser(id, nombre, apellido, mail, null, newPassword, repeatPassword, carreraId);

        UsuarioRol usuarioRol = usuarioRolService.getUsuarioById(usuario.getId());
        HTTPSessionManagerUtil.setSessionAttribute(request, "login", usuarioRol);

        return new ModelAndView("redirect:/dashboard");
    }

    @RequestMapping(value = "/preguntasFrecuentes", method = RequestMethod.GET)
    public ModelAndView preguntasFrecuentes(HttpServletRequest request) {

        return new ModelAndView("verPreguntasFrecuentes");

    }
    
    @ExceptionHandler(StrongPasswordException.class)
    public void strongPasswordExceptionHandler(StrongPasswordException ex, HttpServletResponse response) throws IOException {
        response.getWriter().write(ex.getMessage());
        response.setStatus(HttpStatus.CONFLICT.value());
        response.flushBuffer();
    }
}
