package com.repouniversity.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.services.LoginService;
import com.repouniversity.web.enums.UrlsApplicationEmun;
import com.repouniversity.web.exceptions.LoginFailException;

/**
 * Handle all user login flow.
 * 
 * @author federico triay
 */
@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	/**
	 * @return Model and View for login
	 */
	@RequestMapping(value = "/login", method = { RequestMethod.GET })
	public ModelAndView login() {
		return new ModelAndView("login");
	}

	/**
	 * @return root Model and View
	 */
	@RequestMapping(value = "/", method = { RequestMethod.GET })
	public ModelAndView root() {
		return new ModelAndView("redirect:/login");
	}

	/**
	 * @param request
	 * @param user
	 * @param pass
	 * @return Model and View for login
	 */
	@RequestMapping(value = "/login", method = { RequestMethod.POST })
	public ModelAndView login(HttpServletRequest request,
			@RequestParam(value = "user", required = true) String user,
			@RequestParam(value = "password", required = true) String pass) {

		String redirectUrl = loginService.login(user, pass, request);

		return new ModelAndView("redirect:" + redirectUrl);
	}
	
	/**
	 * @param request
	 * @return Model and View for loginAnonimo
	 */
	@RequestMapping(value = "/loginAnonimo", method = { RequestMethod.GET })
	public ModelAndView loginAnonimo(HttpServletRequest request)
	{
		loginService.loginAnonimo(request);
		
		return new ModelAndView("loginAnonimo");
	}

	
	/**
	 * @param request
	 * @return Model and View for logout action
	 */
	@RequestMapping(value = "/logout", method = { RequestMethod.GET })
	public ModelAndView login(HttpServletRequest request) {

		this.loginService.logout(request);

		return new ModelAndView("redirect:"
				+ UrlsApplicationEmun.LOGIN.getUrl());
	}

	/**
	 * @param request
	 * @param exception
	 * @return Model and View for Login with Exception
	 */
	@ExceptionHandler(LoginFailException.class)
	public ModelAndView handleLoginException(HttpServletRequest request,
			LoginFailException exception) {
		return new ModelAndView(UrlsApplicationEmun.LOGIN.getUrl()).addObject(
				"loginexception", exception);
	}
}
