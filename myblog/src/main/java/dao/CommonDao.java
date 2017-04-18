package dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface CommonDao<T>{
	public Serializable save(T t);

	public void delete(T o);

	public void saveOrUpdate(T o);

	public T get(String hql);

	public T get(String hql, Map<String, Object> params);
	
	public T get(Class clazz,Serializable id);
	
	public int executeHql(String hql);
	
	public int executeHqlAndParams(String hql,Map<String, Object> params);
	
	public void update(T o);

	public List<T> find(String hql);

	public List<T> find(String hql, Map<String, Object> params);

	public List<T> find(String hql, int page, int rows);

	public List<T> find(String hql, Map<String, Object> params, int page, int rows);

	public Long count(String hql);

	public Long count(String hql, Map<String, Object> params);
	
	public List<T> getFields(String hql);
}
