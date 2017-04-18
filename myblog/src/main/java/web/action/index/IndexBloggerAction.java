package web.action.index;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

import com.opensymphony.xwork2.ModelDriven;

import service.BloggerService;
import web.action.BaseAction;
import web.form.BloggerForm;
@Namespace("/index")
@Action("IndexBloggerAction")
public class IndexBloggerAction extends BaseAction{

	@Resource(name = BloggerService.SERVICE_NAME)
	private BloggerService bloggerService;
	public void getMeInfo(){
		BloggerForm bf = bloggerService.getBloggerData();
		writeJson(bf);
	}
	
}
