package dao.impl;

import org.springframework.stereotype.Repository;

import dao.BlogDao;
import domain.Blog;
@Repository(BlogDao.SERVICE_NAME)
public class BlogDaoImpl extends CommonImpl<Blog> implements BlogDao{
		
}
