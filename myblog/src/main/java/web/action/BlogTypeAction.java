package web.action;

import org.apache.log4j.Logger;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

import com.opensymphony.xwork2.ModelDriven;

import service.BlogTypeService;
import web.form.BlogTypeForm;
import web.form.Datagrid;
import web.form.Json;

@Namespace("/admin")
@Action("BlogTypeAction")
public class BlogTypeAction extends BaseAction implements ModelDriven<BlogTypeForm> {
	/**
	 * Logger for this class
	 */
	private BlogTypeForm typeForm = new BlogTypeForm();

	public BlogTypeForm getModel() {
		return typeForm;
	}

	private static final Logger logger = Logger.getLogger(BlogTypeAction.class);

	@Resource(name = BlogTypeService.SERVICE_NAME)
	private BlogTypeService blogTypeService;
	public void listNoPage(){
		List<BlogTypeForm> list = blogTypeService.list();
		writeJson(list);
	}
	
	public void list() {
		Datagrid datagrid = blogTypeService.list(typeForm);
		writeJson(datagrid);
	}
	

	public void remove() {
		Json json = new Json();
		try {
			blogTypeService.delete(typeForm);
			json.setMsg("删除成功！");
			json.setSuccess(true);
		} catch (Exception e) {
			json.setMsg("删除失败");
			json.setSuccess(false);
			e.printStackTrace();
		}
		writeJson(json);
	}

	public void modifyBlogType() {
		Json json = new Json();
		try {
			blogTypeService.update(typeForm);
			json.setMsg("更新成功！");
			json.setSuccess(true);
		} catch (Exception e) {
			json.setMsg("更新失败");
			json.setSuccess(false);
			e.printStackTrace();
		}
		writeJson(json);
	}

	public void add() {
		Json json = new Json();
		try {
			blogTypeService.addType(typeForm);
			json.setMsg("添加成功！");
			json.setSuccess(true);
		} catch (Exception e) {
			json.setMsg("添加失败");
			json.setSuccess(false);
			e.printStackTrace();
		}
		writeJson(json);

	}

	public void get() {
		BlogTypeForm tf = blogTypeService.getBlogTypeById(typeForm);
		writeJson(tf);
	}
}
