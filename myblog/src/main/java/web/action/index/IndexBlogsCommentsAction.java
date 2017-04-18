package web.action.index;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

import com.opensymphony.xwork2.ModelDriven;

import service.CommentService;
import web.action.BaseAction;
import web.form.CommentForm;
import web.form.Datagrid;
import web.form.Json;

@Namespace("/index")
@Action("IndexBlogsCommentsAction")
public class IndexBlogsCommentsAction extends BaseAction implements ModelDriven<CommentForm>{
	private CommentForm commentForm = new CommentForm();
	public CommentForm getModel() {
		return commentForm;
	}
	
	@Resource(name = CommentService.SERVICE_NAME)
	CommentService commentService;
	public void getComment(){
		Datagrid datagrid = commentService.getCommentByBlogId(commentForm);
		writeJson(datagrid);
	}
	
	public void save(){
		Json json = new Json();
		try{
			System.out.println(commentForm.getUserIp());
			commentService.save(commentForm);
			
			json.setSuccess(true);
			json.setMsg("评论提交成功！");
		}catch(Exception e){
			json.setSuccess(false);
			json.setMsg("评论提交失败！");
			e.printStackTrace();
		}
		writeJson(json);
	}

}
