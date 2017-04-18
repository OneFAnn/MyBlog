package service;

import web.form.CommentForm;
import web.form.Datagrid;

public interface CommentService {
	public static final String SERVICE_NAME = "service.impl.CommentServiceImpl";

	Datagrid getCommentByBlogId(CommentForm commentForm);

	void save(CommentForm commentForm);

	Datagrid CommentList(CommentForm commentForm);

	void removeComment(CommentForm commentForm);

}
