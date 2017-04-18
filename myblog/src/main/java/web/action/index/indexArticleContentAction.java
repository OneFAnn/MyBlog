package web.action.index;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import service.BlogService;
import service.BloggerService;
import web.action.BaseAction;
import web.form.BlogForm;
import web.form.BloggerForm;

@Namespace("/index")
@Action("indexArticleContentAction")
@Results({  
    @Result(name="BlogContent", location="/indexjsp/blogContent.jsp")
  })
public class indexArticleContentAction extends BaseAction implements ModelDriven<BlogForm>{
	private BlogForm blogForm = new BlogForm();
	public BlogForm getModel() {
		return blogForm;
	}
	@Resource(name = BlogService.SERVICE_NAME)
	private BlogService blogService;
	@Resource(name =BloggerService.SERVICE_NAME)
	private BloggerService bloggerService;
	
	public String getData(){
		BlogForm bf = blogService.get(blogForm);
		BloggerForm bloggerForm = bloggerService.getBloggerData();
		bf.setAuthor(bloggerForm.getNickName());
		ActionContext.getContext().getValueStack().push(bf);
		return "BlogContent";
	}
	
}
