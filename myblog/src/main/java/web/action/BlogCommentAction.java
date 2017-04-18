package web.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

import com.opensymphony.xwork2.ModelDriven;

import service.CommentService;
import web.form.CommentForm;
import web.form.Datagrid;
import web.form.Json;

@Namespace("/admin")
@Action("BlogCommentAction")
public class BlogCommentAction extends BaseAction implements ModelDriven<CommentForm> {
	private CommentForm commentForm = new CommentForm();

	public CommentForm getModel() {
		return commentForm;
	}

	@Resource(name = CommentService.SERVICE_NAME)
	private CommentService commentService;

	public void list() {
		Datagrid datagrid = commentService.CommentList(commentForm);
		writeJson(datagrid);
	}

	public void remove() {
		Json json = new Json();
		try {
			commentService.removeComment(commentForm);
			json.setSuccess(true);
			json.setMsg("评论删除成功！");
		} catch (Exception e) {
			json.setSuccess(false);
			json.setMsg("评论删除失败");
			e.printStackTrace();
		}
		writeJson(json);
	}
}
