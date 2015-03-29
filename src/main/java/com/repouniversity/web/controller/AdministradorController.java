package com.repouniversity.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.services.PersonaService;

@Controller
public class AdministradorController {

	@Autowired
	public PersonaService personaService;

	@RequestMapping(value = "admin/verPersonas", method = { RequestMethod.GET })
	public ModelAndView getPersonas() {

		return new ModelAndView("verPersonasAdmin");
	}
}
