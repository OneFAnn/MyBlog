package dao;

import domain.Blogger;

public interface BloggerDao extends CommonDao<Blogger>{
	public static final String SERVICE_NAME = "dao.impl.BloggerDaoImpl";
}
