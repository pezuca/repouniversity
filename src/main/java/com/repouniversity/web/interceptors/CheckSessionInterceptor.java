package com.repouniversity.web.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.web.enums.UrlsApplicationEmun;
import com.repouniversity.web.utils.HTTPSessionManagerUtil;

/**
 * @author Federico Tray - federico.triay@movile.com
 */
public class CheckSessionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		UsuarioRol login = (UsuarioRol) HTTPSessionManagerUtil.getSessionAttribute(
				request, HTTPSessionManagerUtil.ATTR_LOGIN);

		if (login != null) {
			return true;
		}

		response.sendRedirect(request.getContextPath()
				+ UrlsApplicationEmun.LOGIN.getUrl());
		return false;
	}
}
