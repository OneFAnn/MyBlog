package dao.impl;

import org.apache.log4j.Logger;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import dao.CommonDao;

public class CommonImpl<T> implements CommonDao<T> {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(CommonImpl.class);

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	public Serializable save(T t) {
		return sessionFactory.getCurrentSession().save(t);

	}

	public void delete(T o) {
		sessionFactory.getCurrentSession().delete(o);

	}

	public void saveOrUpdate(T o) {
		sessionFactory.getCurrentSession().saveOrUpdate(o);

	}

	public T get(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		List<T> list = q.list();
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public T get(String hql, Map<String, Object> params) {

		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		if (q.list() != null && q.list().size() > 0) {
			return (T) q.list().get(0);
		}
		return null;

	}

	public void update(T o) {
		sessionFactory.getCurrentSession().update(o);

	}

	public List<T> find(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		List<T> list = q.list();
	//	logger.info(list);
		return list;

	}

	public List<T> find(String hql, Map<String, Object> params) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		return q.list();
	}

	public List<T> find(String hql, int page, int rows) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		q.setMaxResults(rows).setFirstResult((page - 1) * rows);
		return q.list();
	}

	public List<T> find(String hql, Map<String, Object> params, int page, int rows) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		q.setMaxResults(rows).setFirstResult((page - 1) * rows);
		return q.list();
	}

	public Long count(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return (Long) q.uniqueResult();

	}

	public Long count(String hql, Map<String, Object> params) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		return (Long) q.uniqueResult();
	}

	public T get(Class clazz, Serializable id) {

		return (T) sessionFactory.getCurrentSession().get(clazz, id);
	}

	public int executeHql(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return q.executeUpdate();

	}

	public int executeHqlAndParams(String hql, Map<String, Object> params) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		return q.executeUpdate();
	}

	public List<T> getFields(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return q.list();
	}

}
