package service;

import java.util.List;

import web.form.BlogForm;
import web.form.Datagrid;

public interface BlogService {
	public static final String SERVICE_NAME = "service.impl.BlogServiceImpl";

	void save(BlogForm blogForm);

	Datagrid find(BlogForm blogForm);

	void delete(BlogForm blogForm);

	BlogForm get(BlogForm blogForm);

	void update(BlogForm blogForm);
	
	public Datagrid findIndexData(BlogForm blogForm);
	
	public List dateArchiving();

	Datagrid findBlogsByDate(BlogForm blogForm);

	Datagrid findBlogsByTypeId(BlogForm blogForm);


}
