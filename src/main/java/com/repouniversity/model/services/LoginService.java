package com.repouniversity.model.services;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.repouniversity.model.dao.UsuarioDAO;
import com.repouniversity.model.dao.UsuarioRolDAO;
import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.web.enums.UrlsApplicationEmun;
import com.repouniversity.web.exceptions.LoginFailException;
import com.repouniversity.web.utils.HTTPSessionManagerUtil;

/**
 * 
 * @author federico triay
 *
 */
@Service
@Transactional
public class LoginService {

	@Autowired
	private UsuarioDAO userDao;
	
	@Autowired
	private UsuarioRolDAO usuarioRolDao;
	
	@Autowired
	private UsuarioRolService usuarioRolService;

	/**
	 * Attempts to perform user login with username and password given, setting
	 * up session if successful
	 * 
	 * @param username
	 * @param pass
	 * @param request
	 * @return Redirect url for login
	 */
	public String login(String username, String pass, HttpServletRequest request) {

		String result = UrlsApplicationEmun.DASHBOARD.getUrl();
		Usuario user = this.userDao.getUserByUsernameAndPass(username, pass);

		if (user == null) {
			throw new LoginFailException("User or password are not correct.");
		}

		UsuarioRol usuarioRol = usuarioRolService.getUsuarioById(user.getId());
		HTTPSessionManagerUtil.setSessionAttribute(request,
				HTTPSessionManagerUtil.ATTR_LOGIN, usuarioRol);
		return result;
	}

	/**
	 * Reacts to user logout, removing user data/session
	 * 
	 * @param request
	 */
	public void logout(HttpServletRequest request) {
		HTTPSessionManagerUtil.removeSessionAttribute(request,
				HTTPSessionManagerUtil.ATTR_LOGIN);
	}
}
