package web.action.index;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import service.BlogService;
import service.BlogTypeService;
import web.action.BaseAction;
import web.form.BlogForm;
import web.form.BlogTypeForm;
import web.form.Datagrid;


@Namespace("/index")
@Action("IndexBlogsAction")
@Results({
	@Result(name="dateArchiving", location="/indexjsp/dateArchiving.jsp"),
	@Result(name="typeArchiving", location="/indexjsp/typeArchiving.jsp")
	
})
public class IndexBlogsAction extends BaseAction implements ModelDriven<BlogForm>{
	private BlogForm blogForm = new BlogForm();

	public BlogForm getModel() {
		return blogForm;
	}
	@Resource(name = BlogService.SERVICE_NAME)
	private BlogService blogService;
	@Resource(name = BlogTypeService.SERVICE_NAME)
	private BlogTypeService blogTypeService;
	public void getBlogsData(){
		Datagrid datagrid = blogService.findIndexData(blogForm);
		writeJson(datagrid);
	}
	public void dateArchiving(){
		List list = blogService.dateArchiving();
		writeJson(list);
	}
	public String forwdateArchivingJsp(){
		ActionContext.getContext().getValueStack().push(blogForm.getReleaseDate());
		return "dateArchiving";
	}
	public String forwtypeArchivingJsp(){
		BlogTypeForm bt = blogTypeService.getBlogTypeById(blogForm);
		ActionContext.getContext().getValueStack().push(bt);
		return "typeArchiving";
	}
	
	/** 
	 * @Title: dateArchivingContent 
	 * @Description: 返回某个月份下的分页博文列表
	 * @param     设定文件 
	 * @return void    返回类型 
	 * @throws 
	 */  
	public void dateArchivingContent(){
		Datagrid datagrid = blogService.findBlogsByDate(blogForm);
		writeJson(datagrid);
	}
	/** 
	 * @Title: typeArchivingContent 
	 * @Description:  返回某个type下的分页博文列表
	 * @param     设定文件 
	 * @return void    返回类型 
	 * @throws 
	 */  
	public void typeArchivingContent(){ 
		Datagrid datagrid = blogService.findBlogsByTypeId(blogForm);
		writeJson(datagrid);
	}

}
