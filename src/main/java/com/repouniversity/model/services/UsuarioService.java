package com.repouniversity.model.services;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.UsuarioDAO;
import com.repouniversity.model.entity.Usuario;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioDAO usuarioDAO;

	public Usuario updateUser(Integer id, String nombre, String apellido,
			String mail, String newPassword, String repeatPassword) {

		Usuario usuario = usuarioDAO.findByIdSafe(id);

		if (checkChangePassword(newPassword, repeatPassword)) {
			usuario.setPass(newPassword);
		}

		usuario.getPersona().setNombre(nombre);
		usuario.getPersona().setApellido(apellido);
		usuario.getPersona().setMail(mail);

		usuarioDAO.saveOrUpdate(usuario);

		return usuario;
	}

	private boolean checkChangePassword(String newPassword,
			String repeatPassword) {

		if (StringUtils.isNotBlank(newPassword)
				&& StringUtils.isNotBlank(repeatPassword)
				&& StringUtils.equals(newPassword, repeatPassword)) {
			return true;
		}

		return false;
	}

	public Usuario getUserById(Integer usuarioId) {
		return usuarioDAO.findByIdSafe(usuarioId);
	}
}
