package dao;

import domain.Comment;

public interface CommentDao extends CommonDao<Comment>{
	public static final String SERVICE_NAME= "dao.impl.CommentDaoImpl";
}
