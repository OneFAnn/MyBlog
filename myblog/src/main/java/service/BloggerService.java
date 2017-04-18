package service;

import javax.servlet.http.HttpServletRequest;

import domain.Blogger;
import web.form.BloggerForm;

public interface BloggerService {
	public static final String SERVICE_NAME = "service.impl.BloggerServiceImpl";

	void saveOrUpdate(BloggerForm bloggerForm) throws Exception;

	BloggerForm getBloggerData();
	
	String getNickName();

	Blogger findBloggerByName(String logonName);

	void updatePwd(HttpServletRequest request,BloggerForm bloggerForm);
}
