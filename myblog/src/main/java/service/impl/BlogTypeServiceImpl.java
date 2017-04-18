package service.impl;

import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.BlogTypeDao;
import domain.BlogType;
import service.BlogTypeService;
import web.form.BlogForm;
import web.form.BlogTypeForm;
import web.form.Datagrid;
import web.form.TypeArchiving;
@Service(BlogTypeService.SERVICE_NAME)
public class BlogTypeServiceImpl implements BlogTypeService{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(BlogTypeServiceImpl.class);

	@Resource(name = BlogTypeDao.SERVICE_NAME )
	private BlogTypeDao blogTypeDao;
	public Datagrid list(BlogTypeForm typeForm) {
		String hql = "from BlogType";
		List<BlogType> list = blogTypeDao.find(hql,Integer.parseInt(typeForm.getPage()), Integer.parseInt(typeForm.getRows()));
		//logger.info(list);
		List<BlogTypeForm> listForm = new ArrayList<BlogTypeForm>();
		if(list!=null && list.size()>0){
			BlogTypeForm blogTypeForm = null;
			for(int i=0;i<list.size();i++){
				blogTypeForm = new BlogTypeForm();
				blogTypeForm.setId(list.get(i).getId().toString());
				blogTypeForm.setTypeName(list.get(i).getTypeName());
				if(list.get(i).getOrderNo()!=null){
					blogTypeForm.setOrderNo(list.get(i).getOrderNo().toString());
				}
				
				listForm.add(blogTypeForm);
			}
		}
		String totalHql = "select count(*) " + hql;
		Long total = blogTypeDao.count(totalHql);

		Datagrid datagrid = new Datagrid();
		datagrid.setTotal(total);
		datagrid.setRows(listForm);
		return datagrid;

	}
	public List typeArchiving() {
		String hql = "select b.blogType.id as typeId,"
				+ " b.blogType.typeName as typeName,"
				+ " count(*) as cnt "
				+ "from Blog b "
				+ "group by b.blogType.id";
		List list = blogTypeDao.getFields(hql);
		List<TypeArchiving> l2 = null;
		if(list!=null && list.size()>0){
			l2 = new ArrayList<TypeArchiving>();
			TypeArchiving ta = null;
			Object[] o;
			for(int i=0;i<list.size();i++){
				ta = new TypeArchiving();
				o = (Object[]) list.get(i);
				ta.setTypeId(o[0].toString());
				ta.setTypeName(o[1].toString());
				ta.setCnt(o[2].toString());
				l2.add(ta);
			}
		}

		return l2;
	}
	public BlogTypeForm getBlogTypeById(BlogForm blogForm) {
		if(blogForm.getTypeId()!=null && !blogForm.getTypeId().equals("")){
			BlogType blogType = blogTypeDao.get(BlogType.class, Integer.parseInt(blogForm.getTypeId()));
			BlogTypeForm form = null;
			if(blogType!=null){
				form = new BlogTypeForm();
				form.setId(blogType.getId().toString());
				form.setTypeName(blogType.getTypeName());
				return form;
			}
		}
		return null;
	}
	public void delete(BlogTypeForm typeForm){
		if (typeForm.getIds() != null && !typeForm.getIds().equals("")) {
			String hql = "delete BlogType where id in(";
			String[] ids = typeForm.getIds().split(",");
			for (int i = 0; i < ids.length; i++) {
				if (i > 0) {
					hql += ",";
				}
				hql += "'" + ids[i] + "'";
			}
			hql += ")";
			blogTypeDao.executeHql(hql);
		}
	}
	public void update(BlogTypeForm typeForm) {
		if(typeForm.getId()!=null && !typeForm.getId().equals("")){
			BlogType bt = new BlogType();
			bt.setId(Integer.parseInt(typeForm.getId()));
			bt.setTypeName(typeForm.getTypeName());
			if(typeForm.getOrderNo()!=null && !typeForm.getOrderNo().equals("")){
				bt.setOrderNo(Integer.parseInt(typeForm.getOrderNo()));
			}
			blogTypeDao.saveOrUpdate(bt);
		}
	}
	public void addType(BlogTypeForm typeForm) {
		if(typeForm.getTypeName()!=null){
			BlogType blogType = new BlogType();
			blogType.setTypeName(typeForm.getTypeName());
			blogTypeDao.save(blogType);
		}
	}
	public BlogTypeForm getBlogTypeById(BlogTypeForm typeForm) {
		if(typeForm.getId()!=null && !typeForm.getId().equals("")){
			BlogType blogType = blogTypeDao.get(BlogType.class, Integer.parseInt(typeForm.getId()));
			BlogTypeForm form = null;
			if(blogType!=null){
				form = new BlogTypeForm();
				form.setId(blogType.getId().toString());
				form.setTypeName(blogType.getTypeName());
				form.setOrderNo(blogType.getOrderNo().toString());

				return form;
			}
		}
		return null;
	}
	public List<BlogTypeForm> list() {
		String hql = "from BlogType";
		List<BlogType> list = blogTypeDao.find(hql);
		logger.info(list);
		List<BlogTypeForm> listForm = new ArrayList<BlogTypeForm>();
		if(list!=null && list.size()>0){
			BlogTypeForm blogTypeForm = null;
			for(int i=0;i<list.size();i++){
				blogTypeForm = new BlogTypeForm();
				blogTypeForm.setId(list.get(i).getId().toString());
				blogTypeForm.setTypeName(list.get(i).getTypeName());
				if(list.get(i).getOrderNo()!=null){
					blogTypeForm.setOrderNo(list.get(i).getOrderNo().toString());
				}
				
				listForm.add(blogTypeForm);
			}
		}
		
		return listForm;
	}
   
}
