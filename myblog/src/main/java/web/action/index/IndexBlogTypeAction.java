package web.action.index;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

import com.opensymphony.xwork2.ModelDriven;

import service.BlogTypeService;
import web.action.BaseAction;
import web.form.BlogTypeForm;

@Namespace("/index")
@Action("IndexBlogTypeAction")
public class IndexBlogTypeAction extends BaseAction implements ModelDriven<BlogTypeForm>{
	private BlogTypeForm blogTypeForm = new BlogTypeForm();
	public BlogTypeForm getModel() {
		return blogTypeForm;
	}
	
	@Resource(name = BlogTypeService.SERVICE_NAME)
	private BlogTypeService blogTypeService;
	
	public void typeArchiving(){
		List list = blogTypeService.typeArchiving();
		writeJson(list);
	}
}
