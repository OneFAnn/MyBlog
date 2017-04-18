package service.impl;

import org.apache.log4j.Logger;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.BlogDao;
import dao.BlogTypeDao;
import domain.Blog;
import domain.BlogType;
import service.BlogService;
import web.form.BlogForm;
import web.form.Datagrid;
import web.form.DateArchiving;

@Service(BlogService.SERVICE_NAME)
public class BlogServiceImpl implements BlogService {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(BlogServiceImpl.class);

	@Resource(name = BlogDao.SERVICE_NAME)
	private BlogDao blogDao;

	@Resource(name = BlogTypeDao.SERVICE_NAME)
	private BlogTypeDao blogTypeDao;

	public void save(BlogForm blogForm) {
		Blog blog = new Blog();
		BlogType blogType = new BlogType();
		blogType.setId(Integer.parseInt(blogForm.getTypeId()));
		blog.setBlogType(blogType);
		blog.setContent(blogForm.getContent());
		blog.setTitle(blogForm.getTitle());
		blog.setSummary(blogForm.getSummary());
		blog.setReleaseDate(new Date());
		blog.setKeyWord(blogForm.getKeyWord());
		blogDao.save(blog);
	}
	public Datagrid findIndexData(BlogForm blogForm){
		String hql = "from Blog where 1=1";
		String title = "";
		Map<String, Object> params = new HashMap<String, Object>();
		if (blogForm.getTitle() != null && !blogForm.getTitle().equals("")) {
			title = "%" + blogForm.getTitle().trim() + "%";
			hql += " and title like :title";
			params.put("title", title);
		}
		if (blogForm.getSort() != null && !blogForm.getSort().equals("")) {
			hql += " order by " + blogForm.getSort() + " " + blogForm.getOrder();
		}
		List<Blog> list = blogDao.find(hql, params, Integer.parseInt(blogForm.getPage()),
				Integer.parseInt(blogForm.getRows()));
		List<BlogForm> listForm = null;
		if (list != null && list.size() > 0) {
			listForm = new ArrayList<BlogForm>();
			BlogForm bf = null;
			BlogType blogType = null;
			for (int i = 0; i < list.size(); i++) {
				bf = new BlogForm();
				bf.setId(list.get(i).getId().toString());
				bf.setReleaseDate(dateFormate(list.get(i).getReleaseDate()));
				bf.setTitle(list.get(i).getTitle());
				bf.setSummary(list.get(i).getSummary());
				blogType = blogTypeDao.get(BlogType.class, list.get(i).getBlogType().getId());
				bf.setTypeName(blogType.getTypeName());

				listForm.add(bf);
			}
		}

		String totalHql = "select count(*) " + hql;
		Long total = blogDao.count(totalHql, params);

		Datagrid datagrid = new Datagrid();
		datagrid.setTotal(total);
		datagrid.setRows(listForm);
		return datagrid;
	}
	public Datagrid find(BlogForm blogForm) {
		String hql = "from Blog where 1=1";
		String title = "";
		Map<String, Object> params = new HashMap<String, Object>();
		if (blogForm.getTitle() != null && !blogForm.getTitle().equals("")) {
			title = "%" + blogForm.getTitle().trim() + "%";
			hql += " and title like :title";
			params.put("title", title);
		}
		if (blogForm.getSort() != null && !blogForm.getSort().equals("")) {
			hql += " order by " + blogForm.getSort() + " " + blogForm.getOrder();
		}
		List<Blog> list = blogDao.find(hql, params, Integer.parseInt(blogForm.getPage()),
				Integer.parseInt(blogForm.getRows()));
		List<BlogForm> listForm = null;
		if (list != null && list.size() > 0) {
			listForm = new ArrayList<BlogForm>();
			BlogForm bf = null;
			BlogType blogType = null;
			for (int i = 0; i < list.size(); i++) {
				bf = new BlogForm();
				bf.setId(list.get(i).getId().toString());
				bf.setReleaseDate(dateFormate(list.get(i).getReleaseDate()));
				bf.setTitle(list.get(i).getTitle());

				blogType = blogTypeDao.get(BlogType.class, list.get(i).getBlogType().getId());
				bf.setTypeName(blogType.getTypeName());

				listForm.add(bf);
			}
		}

		String totalHql = "select count(*) " + hql;
		Long total = blogDao.count(totalHql, params);

		Datagrid datagrid = new Datagrid();
		datagrid.setTotal(total);
		datagrid.setRows(listForm);
		return datagrid;
	}

	public void delete(BlogForm blogForm) {
		if (blogForm.getIds() != null && !blogForm.getIds().equals("")) {
			String hql = "delete Blog where id in(";
			String[] ids = blogForm.getIds().split(",");
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

	public BlogForm get(BlogForm blogForm) {
		Blog blog = null;
		if (blogForm.getId() != null && !blogForm.getId().equals("")) {
			String hql = "from Blog where id = :id";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id",Integer.parseInt(blogForm.getId()));
			blog = blogDao.get(hql, params);
		}

		BlogForm bf = null;
		if (blog != null) {
			bf = new BlogForm();
			bf.setId(blog.getId().toString());
			bf.setKeyWord(blog.getKeyWord());
			bf.setReleaseDate(dateFormate(blog.getReleaseDate()));
			bf.setTitle(blog.getTitle());
			bf.setTypeId(blog.getBlogType().getId().toString());
			bf.setTypeName(blog.getBlogType().getTypeName());
			bf.setContent(blog.getContent());
		}
		return bf;
	}

	public void update(BlogForm blogForm) {
		if(blogForm.getId()!=null && !blogForm.equals("")){
			Blog blog = new Blog();
			BlogType blogType = new BlogType();
			blogType.setId(Integer.parseInt(blogForm.getTypeId()));
			blog.setId(Integer.parseInt(blogForm.getId()));
			blog.setBlogType(blogType);
			blog.setContent(blogForm.getContent());
			blog.setTitle(blogForm.getTitle());
			blog.setSummary(blogForm.getSummary());
			blog.setReleaseDate(new Date());
			blog.setKeyWord(blogForm.getKeyWord());
			blogDao.saveOrUpdate(blog);	
		}
	}
	public List dateArchiving() {
		String hql = "select date_format(releaseDate, '%Y-%m') as pubtime, count(*) as cnt from Blog group by date_format(releaseDate, '%Y-%m') ";	
		List list = blogDao.getFields(hql);
		List<DateArchiving> l2 = null;
		if(list!=null&&list.size()>0){
			l2 = new ArrayList<DateArchiving>();
			Object[] o;
			DateArchiving dateArchiving = null;
			for(int i=0;i<list.size();i++){
				o = (Object[]) list.get(i);
				dateArchiving = new DateArchiving();
				dateArchiving.setPubtime(o[0].toString());
				dateArchiving.setCnt(o[1].toString());
				l2.add(dateArchiving);
			}
		}
		return l2;
	}
	
	public Datagrid findBlogsByDate(BlogForm blogForm) {
		String hql = "from Blog where 1=1";
		Map<String, Object> params = new HashMap<String, Object>();
		if (blogForm.getReleaseDate() != null && !blogForm.getReleaseDate().equals("")) {
			hql += " and date_format(releaseDate, '%Y-%m') = :releaseDate";
			params.put("releaseDate", blogForm.getReleaseDate());
		}
		if (blogForm.getSort() != null && !blogForm.getSort().equals("")) {
			hql += " order by " + blogForm.getSort() + " " + blogForm.getOrder();
		}
		List<Blog> list = blogDao.find(hql, params, Integer.parseInt(blogForm.getPage()),
				Integer.parseInt(blogForm.getRows()));
		List<BlogForm> listForm = null;
		if (list != null && list.size() > 0) {
			listForm = new ArrayList<BlogForm>();
			BlogForm bf = null;
			BlogType blogType = null;
			
			for (int i = 0; i < list.size(); i++) {
				bf = new BlogForm();
				bf.setId(list.get(i).getId().toString());
				bf.setReleaseDate(dateFormate(list.get(i).getReleaseDate()));
				bf.setTitle(list.get(i).getTitle());
				bf.setSummary(list.get(i).getSummary());
				//blogType = blogTypeDao.get(BlogType.class, list.get(i).getBlogType().getId());
				bf.setTypeName(list.get(i).getBlogType().getTypeName());

				listForm.add(bf);
			}
		}

		String totalHql = "select count(*) " + hql;
		Long total = blogDao.count(totalHql, params);

		Datagrid datagrid = new Datagrid();
		datagrid.setTotal(total);
		datagrid.setRows(listForm);
		return datagrid;
	}
	public Datagrid findBlogsByTypeId(BlogForm blogForm) {
		String hql = "from Blog b where 1=1";
		Map<String, Object> params = new HashMap<String, Object>();
		if (blogForm.getTypeId() != null && !blogForm.getTypeId().equals("")) {
			hql += " and b.blogType.id = :typeId";
			params.put("typeId",Integer.parseInt(blogForm.getTypeId()));
		}
		if (blogForm.getSort() != null && !blogForm.getSort().equals("")) {
			hql += " order by " + blogForm.getSort() + " " + blogForm.getOrder();
		}
		List<Blog> list = blogDao.find(hql, params, Integer.parseInt(blogForm.getPage()),
				Integer.parseInt(blogForm.getRows()));
		List<BlogForm> listForm = null;
		if (list != null && list.size() > 0) {
			listForm = new ArrayList<BlogForm>();
			BlogForm bf = null;
			BlogType blogType = null;
			for (int i = 0; i < list.size(); i++) {
				bf = new BlogForm();
				bf.setId(list.get(i).getId().toString());
				bf.setReleaseDate(dateFormate(list.get(i).getReleaseDate()));
				bf.setTitle(list.get(i).getTitle());
				bf.setSummary(list.get(i).getSummary());
				//blogType = blogTypeDao.get(BlogType.class, list.get(i).getBlogType().getId());
				bf.setTypeName(list.get(i).getBlogType().getTypeName());
				//logger.info(bf.getTypeName());

				listForm.add(bf);
			}
		}

		String totalHql = "select count(*) " + hql;
		Long total = blogDao.count(totalHql, params);

		Datagrid datagrid = new Datagrid();
		datagrid.setTotal(total);
		datagrid.setRows(listForm);
		return datagrid;
	}
	public String dateFormate(Date d){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(d);
	}
}
