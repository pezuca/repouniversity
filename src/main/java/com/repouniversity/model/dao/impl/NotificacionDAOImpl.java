package com.repouniversity.model.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.NotificacionDAO;
import com.repouniversity.model.entity.Notificacion;

@Repository
public class NotificacionDAOImpl extends GenericDAOImplOld<Notificacion, Integer>
		implements NotificacionDAO {

	protected NotificacionDAOImpl() {
		super(Notificacion.class);
	}

	public List<Notificacion> getNotificacionesSinConfirmar(Integer cursoId) {
		Criteria criteria = getCurrentSession().createCriteria(
				Notificacion.class);
		criteria.add(Restrictions.eq("curso.id", cursoId));
		criteria.add(Restrictions.not(Restrictions.eq("tipo.id", 3)));
		criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);

		List<Notificacion> notificaciones = (List<Notificacion>) criteria
				.list();

		return notificaciones;
	}
}
