package web.action;



import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import service.BlogService;
import web.form.BlogForm;
import web.form.Datagrid;
import web.form.Json;
@Namespace("/admin")
@Action(value="BlogAction")
@Results({  
    @Result(name="modifyBlog", location="/admin/modifyBlog.jsp")
  })
public class BlogAction extends BaseAction implements ModelDriven<BlogForm>{
    private BlogForm blogForm = new BlogForm();
	public BlogForm getModel() {
		return blogForm;
	}
	@Resource(name = BlogService.SERVICE_NAME)
	private BlogService blogService;
	public void save(){
		Json json = new Json();
		if(blogForm!=null){
			try{
				blogService.save(blogForm);
				json.setSuccess(true);
				json.setMsg("成功发表博客！");
			}catch(Exception e){
				json.setSuccess(false);
				json.setMsg("博客发表失败！");
				e.printStackTrace();
			}
			
		}
		writeJson(json);
	}
	public void list(){
		Datagrid datagrid = blogService.find(blogForm);
		writeJson(datagrid);
	}
	public void updateBlog(){
		Json json = new Json();
		//System.out.println(blogForm.getId() +"!");
		try{
			blogService.update(blogForm);
			json.setSuccess(true);
			json.setMsg("成功修改博客！");
		}catch(Exception e){
			json.setSuccess(false);
			json.setMsg("博客修改失败！");
			e.printStackTrace();
		}
		writeJson(json);
	}
	public void remove(){
		Json json = new Json();
		try{
			blogService.delete(blogForm);
			json.setSuccess(true);
			json.setMsg("博客删除成功");
		}catch(Exception e){
			json.setSuccess(false);
			json.setMsg("博客删除失败");
			e.printStackTrace();
		}
		writeJson(json);
	}
	public String modifyBlog(){
		ActionContext.getContext().getValueStack().push(blogForm);
		return "modifyBlog";
	}
	public void BlogUpdateData(){
		BlogForm bf = blogService.get(blogForm);
		writeJson(bf);
	}
}
