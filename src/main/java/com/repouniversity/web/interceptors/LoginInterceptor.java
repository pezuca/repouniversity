package com.repouniversity.web.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.web.enums.UrlsApplicationEmun;
import com.repouniversity.web.utils.HTTPSessionManagerUtil;

/**
 * @author Martin Medina - martin.medina@movile.com
 * @author Carlos Valdes - carlos.valdes@movile.com
 * @author Federico Tray - federico.triay@movile.com
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		UsuarioRol login = (UsuarioRol) HTTPSessionManagerUtil.getSessionAttribute(
				request, HTTPSessionManagerUtil.ATTR_LOGIN);
		String redirectUrl = UrlsApplicationEmun.DASHBOARD.getUrl();

		if (login != null) {
			response.sendRedirect(request.getContextPath() + redirectUrl);
			return false;
		}

		return true;
	}
}
