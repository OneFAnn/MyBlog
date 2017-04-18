package dao.impl;

import org.springframework.stereotype.Repository;

import dao.BlogTypeDao;
import domain.BlogType;
@Repository(BlogTypeDao.SERVICE_NAME)
public class BlogTypeDaoImpl extends CommonImpl<BlogType> implements BlogTypeDao{
	
}
