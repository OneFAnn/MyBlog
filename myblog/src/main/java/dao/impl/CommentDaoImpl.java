package dao.impl;

import org.springframework.stereotype.Repository;

import dao.CommentDao;
import domain.Comment;
@Repository(CommentDao.SERVICE_NAME)
public class CommentDaoImpl extends CommonImpl<Comment> implements CommentDao{
	
}
