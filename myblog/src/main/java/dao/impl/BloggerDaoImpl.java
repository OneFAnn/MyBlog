package dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import dao.BloggerDao;
import domain.Blogger;
@Repository(BloggerDao.SERVICE_NAME)
public class BloggerDaoImpl extends CommonImpl<Blogger> implements BloggerDao{

	
}
