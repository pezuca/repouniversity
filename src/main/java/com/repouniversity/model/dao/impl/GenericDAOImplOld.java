package com.repouniversity.model.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.repouniversity.model.dao.GenericDAO;

/**
 * @author Federico Tray
 * @param <E>
 *            entity
 * @param <I>
 *            id
 */
@SuppressWarnings("unchecked")
// for casts
public class GenericDAOImplOld<E, I extends Serializable> implements
		GenericDAO<E, I> {

	private Class<E> entityClass;

	@Autowired
	private SessionFactory sessionFactory;

	protected GenericDAOImplOld(Class<E> entityClass) {
		this.entityClass = entityClass;
	}

	/**
	 * Retrieves factory hibernate session
	 * 
	 * @return current hibernate session for thread
	 */
	public Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public void saveOrUpdate(E e) {
		getCurrentSession().saveOrUpdate(e);
		getCurrentSession().flush();
	}

	@Override
	public void delete(E e) {
		getCurrentSession().delete(e);
		getCurrentSession().flush();
	}

	@Override
	public E findById(I id) {
		return (E) getCurrentSession().get(this.entityClass, id);
	}

	@Override
	public List<E> getByIds(List<Integer> ids) {
		List<E> result = getCurrentSession().createCriteria(this.entityClass)
				.add(Restrictions.in("id", ids)).list();

		return result;
	}

	@Override
	public E findByIdSafe(I id) {
		E entity = (E) getCurrentSession().get(this.entityClass, id);
		getCurrentSession().evict(entity);
		return entity;
	}

	@Override
	public List<E> getAll() {
		Criteria criteria = getCurrentSession()
				.createCriteria(this.entityClass);
		List<E> result = (List<E>) criteria.setResultTransformer(
				Criteria.DISTINCT_ROOT_ENTITY).list();
		return result;
	}
}
