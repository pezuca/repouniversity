package com.repouniversity.model.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.repouniversity.model.dao.UsuarioDAO;
import com.repouniversity.model.entity.Usuario;

/**
 * @author Federico Tray
 */
@Repository
public class UsuarioDAOImpl extends GenericDAOImpl<Usuario, Integer> implements
		UsuarioDAO {

	protected UsuarioDAOImpl() {
		super(Usuario.class);
	}

	@Override
	public Usuario getUserByUsernameAndPass(String username, String password) {
		Criteria criteria = getCurrentSession().createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("user", username));
		criteria.add(Restrictions.eq("pass", password));
//		DigestUtils.sha1Hex(password)
		
		List<Usuario> users = (List<Usuario>) criteria.list();

		if (CollectionUtils.isEmpty(users)) {
			return null;
		}

		return users.get(0);
	}
}
