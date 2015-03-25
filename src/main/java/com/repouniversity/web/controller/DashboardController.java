package com.repouniversity.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardController {

	@RequestMapping(value = "/dashboard", method = { RequestMethod.GET })
	public ModelAndView dashboard(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("dashboard");
		return model;
	}
}
