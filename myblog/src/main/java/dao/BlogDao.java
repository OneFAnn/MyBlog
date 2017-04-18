package dao;

import domain.Blog;

public interface BlogDao extends CommonDao<Blog>{
	public static final String SERVICE_NAME = "dao.impl.BlogDaoImpl";
}
