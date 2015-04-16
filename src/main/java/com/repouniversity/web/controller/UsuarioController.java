package com.repouniversity.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.UsuarioTO;
import com.repouniversity.model.services.UsuarioRolService;
import com.repouniversity.model.services.UsuarioService;
import com.repouniversity.web.utils.HTTPSessionManagerUtil;

@Controller
public class UsuarioController {

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    UsuarioRolService usuarioRolService;

    @RequestMapping(value = "usuario/misdatos", method = RequestMethod.GET)
    public ModelAndView displayInformation(HttpServletRequest request) {
        UsuarioRol usuarioRol = (UsuarioRol) HTTPSessionManagerUtil.getSessionAttribute(request, "login");

        UsuarioTO usuario = usuarioService.getUserById(usuarioRol.getId());
        ModelAndView mav = new ModelAndView("misDatos").addObject("usuario", usuario);

        return mav;
    }

    @RequestMapping(value = "usuario/misdatos/update", method = RequestMethod.POST)
    public ModelAndView updateInformation(HttpServletRequest request, @RequestParam(value = "id", required = true) Long id,
            @RequestParam(value = "nombre", required = true) String nombre, @RequestParam(value = "apellido", required = true) String apellido,
            @RequestParam(value = "mail", required = true) String mail, @RequestParam(value = "newPassword", defaultValue = "") String newPassword,
            @RequestParam(value = "repeatPassword", defaultValue = "") String repeatPassword) {

        Usuario usuario = usuarioService.updateUser(id, nombre, apellido, mail, null, newPassword, repeatPassword, null);

        UsuarioRol usuarioRol = usuarioRolService.getUsuarioById(usuario.getId());
        HTTPSessionManagerUtil.setSessionAttribute(request, "login", usuarioRol);

        return new ModelAndView("redirect:/dashboard");
    }
}
