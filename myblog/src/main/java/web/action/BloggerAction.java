package web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import domain.Blogger;
import service.BloggerService;
import utils.MD5keyBean;
import web.form.BloggerForm;
import web.form.Json;

@Namespace("/admin")
@Action(value="BloggerAction")	
@Results({  
	@Result(name="login", location="/admin/login.jsp"),
    @Result(name="home",type="redirect",location="/admin/main.jsp")
  })
public class BloggerAction extends BaseAction implements ServletRequestAware, ModelDriven<BloggerForm>{

	private BloggerForm bloggerForm = new BloggerForm();
	public BloggerForm getModel() {
		return bloggerForm;
	}
	@Resource(name = BloggerService.SERVICE_NAME)
	private BloggerService bloggerService;
	
	public String login(){
		String logonName = bloggerForm.getUserName();
		String password = bloggerForm.getPassword();
		MD5keyBean md5 = new MD5keyBean();
		String md5Pws = md5.getkeyBeanofStr(password);
		Blogger b = bloggerService.findBloggerByName(logonName);
		
		Json json = new Json();
		if (b == null) {
			json.setSuccess(false);
			json.setMsg("未找到用户名！");
			ActionContext.getContext().getValueStack().push(json);
			return "login";
		}
		if (password == null || password.equals("") || !b.getPassword().equals(md5Pws)) {
			json.setSuccess(false);
			json.setMsg("密码输入错误");
			ActionContext.getContext().getValueStack().push(json);
			return "login";
		}
		request.getSession().setAttribute("blogger", b);
		return "home";
	}

	
	
	public void saveOrUpdate(){
		Json json = new Json();
		try{
			bloggerService.saveOrUpdate(bloggerForm);
			json.setSuccess(true);
			json.setMsg("修改个人信息成功！");
		}catch(Exception e){
			e.printStackTrace();
			json.setSuccess(false);
			json.setMsg("修改个人信息失败！");
		}
		writeJson(json);
	}
	public void getBloggerData(){
		BloggerForm bloggerForm = bloggerService.getBloggerData();
		writeJson(bloggerForm);
	}
	public void updatePwd(){
		Json json = new Json();
		try{
			bloggerService.updatePwd(request,bloggerForm);
			json.setSuccess(true);
			json.setMsg("密码修改成功");
		}catch(Exception e){
			json.setSuccess(false);
			json.setMsg("密码修改失败");
		}
		writeJson(json);
	}

	private HttpServletRequest request;  
	public void setServletRequest(HttpServletRequest request) {
			this.request = request;
	}

	
}
