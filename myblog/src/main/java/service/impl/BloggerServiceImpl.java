package service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;

import dao.BloggerDao;
import domain.Blogger;
import service.BloggerService;
import utils.MD5keyBean;
import web.form.BloggerForm;

@Service(BloggerService.SERVICE_NAME)
public class BloggerServiceImpl implements BloggerService {
	@Resource(name = BloggerDao.SERVICE_NAME)
	private BloggerDao bloggerDao;

	public void saveOrUpdate(BloggerForm bloggerForm) throws Exception{
		if(bloggerForm.getId()!=null&&!bloggerForm.getId().equals("")){
			Blogger blogger = new Blogger();
			blogger.setId(Integer.parseInt(bloggerForm.getId()));
			blogger.setUserName(bloggerForm.getUserName());
			blogger.setNickName(bloggerForm.getNickName());
			blogger.setSign(bloggerForm.getSign());
			blogger.setProFile(bloggerForm.getProFile());
			String imageUrl = "";
			String imageName = "";
			if(bloggerForm.getImageFile()!=null){
					imageName += bloggerForm.getImageFileFileName();
				    imageUrl += ServletActionContext.getServletContext().getRealPath("/upload")+"/bloggerImage/"+bloggerForm.getImageFileFileName();
					FileOutputStream fos = new FileOutputStream(imageUrl);
					FileInputStream fis = new FileInputStream(bloggerForm.getImageFile());
					byte[] buffer = new byte[1024];
					int len = 0;
					while((len = fis.read(buffer))>0){
						fos.write(buffer, 0, len);
					}
					fos.flush();
					if(fos!=null){
						fos.close();
					}
					if(fis!=null){
						fis.close();
					}
				
			}
			blogger.setImageName(imageName);
			String hql = "update from Blogger set "
					+ "userName = :userName,"
					+ "nickName = :nickName,"
					+ "sign =:sign,"
					+ "proFile = :proFile,"
					+ "imageName = :imageUrl"
					+ " where id = :id";
			Map params = new HashMap<String, Object>();
			params.put("userName", blogger.getUserName());
			params.put("nickName", blogger.getNickName());
			params.put("sign", blogger.getSign());
			params.put("proFile", blogger.getProFile());
			params.put("imageUrl", blogger.getImageName());
			params.put("id", blogger.getId());
			bloggerDao.executeHqlAndParams(hql, params);
		}else{
			Blogger blogger = new Blogger();
			blogger.setUserName(bloggerForm.getUserName());
			blogger.setNickName(bloggerForm.getNickName());
			blogger.setSign(bloggerForm.getSign());
			blogger.setProFile(bloggerForm.getProFile());
			MD5keyBean md5 = new MD5keyBean();
			String md5Password = md5.getkeyBeanofStr("1234");
			blogger.setPassword(md5Password);
			bloggerDao.saveOrUpdate(blogger);	
		}
		
		
	}

	public BloggerForm getBloggerData() {
		String hql = "from Blogger";
		Blogger blogger = bloggerDao.get(hql);
		BloggerForm bloggerForm = null;
		if (blogger != null) {
			bloggerForm = new BloggerForm();
			bloggerForm.setId(blogger.getId().toString());
			bloggerForm.setUserName(blogger.getUserName());
			bloggerForm.setNickName(blogger.getNickName());
			bloggerForm.setSign(blogger.getSign());
			bloggerForm.setProFile(blogger.getProFile());
			bloggerForm.setImageUrl(blogger.getImageName());
		}
		return bloggerForm;
	}

	public String getNickName() {
		String hql = "from Blogger";
		Blogger blogger = bloggerDao.get(hql);
		String nickName ="";
		if(blogger.getNickName()!=null && !blogger.getNickName().equals("")){
			nickName = blogger.getNickName();
		}
		return nickName;
	}

	public Blogger findBloggerByName(String logonName) {
		String hql = "from Blogger where userName =:logonName";
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("logonName", logonName);
		Blogger b = bloggerDao.get(hql, params);
		return b;
	}

	public void updatePwd(HttpServletRequest request,BloggerForm bloggerForm) {
		if(request.getSession().getAttribute("blogger")!=null && bloggerForm.getPassword()!=null){
			Blogger b = (Blogger) request.getSession().getAttribute("blogger");
			String hql = "update from Blogger set "
					+ "password = :password "
					+ "where id = :id";
			Map<String,Object> params = new HashMap<String, Object>();
			MD5keyBean md5 = new MD5keyBean();
			String pwdMd5 = md5.getkeyBeanofStr(bloggerForm.getPassword());
			params.put("password", pwdMd5);
			params.put("id", b.getId());
			System.out.println(b.getId());
			bloggerDao.executeHqlAndParams(hql, params);
		}
	}

}
