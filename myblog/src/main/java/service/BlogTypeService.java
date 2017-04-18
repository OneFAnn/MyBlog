package service;

import java.util.List;

import web.form.BlogForm;
import web.form.BlogTypeForm;
import web.form.Datagrid;

public interface BlogTypeService {
	public static final String SERVICE_NAME = "service.impl.BlogTypeServiceImpl";

	Datagrid list(BlogTypeForm typeForm);

	List<BlogTypeForm> list();

	List typeArchiving();

	BlogTypeForm getBlogTypeById(BlogForm blogForm);

	void delete(BlogTypeForm typeForm);

	void update(BlogTypeForm typeForm);

	void addType(BlogTypeForm typeForm);

	BlogTypeForm getBlogTypeById(BlogTypeForm typeForm);
}
