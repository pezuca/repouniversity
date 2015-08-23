package com.repouniversity.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Color;
import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.TpGrupoTO;
import com.repouniversity.model.entity.to.UsuarioParametroTO;
import com.repouniversity.model.services.ColorService;
import com.repouniversity.model.services.UsuarioParametroService;
import com.repouniversity.model.services.UsuarioRolService;
import com.repouniversity.model.services.UsuarioService;
import com.repouniversity.web.utils.HTTPSessionManagerUtil;

@Controller
public class UsuarioParametroController {

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    ColorService colorService;

    @Autowired
    UsuarioRolService usuarioRolService;
    
    @Autowired
    UsuarioParametroService usuarioParametroService;

    @RequestMapping(value = "usuario/misParametros", method = RequestMethod.GET)
    public ModelAndView displayInformation(HttpServletRequest request) {
        UsuarioRol usuarioRol = (UsuarioRol) HTTPSessionManagerUtil.getSessionAttribute(request, "login");

        List<UsuarioParametroTO> usuarioParametros = usuarioParametroService.getUsuarioParametroforUsuario(usuarioRol.getId());
        List<Color> colores = colorService.getAll();
        ModelAndView mav = new ModelAndView("verUsuarioParametro").addObject("usuarioParametros", usuarioParametros).addObject("colores", colores);

        return mav;
    }
    
    @RequestMapping(value = "usuario/editarParametro", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public UsuarioParametroTO editarParametroAjax(
			@RequestParam(value = "userParamId", required = true) Long userParamId,
			@RequestParam(value = "orden", required = true) Long orden,
			@RequestParam(value = "color", required = true) Long color,
			@RequestParam(value = "activo", required = true) boolean activo) {

	return	usuarioParametroService.editarParametro(userParamId, orden, color, activo);
		

	}

    }
