package service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.DataFormatException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.CommentDao;
import domain.Blog;
import domain.BlogType;
import domain.Comment;
import service.CommentService;
import web.form.BlogForm;
import web.form.CommentForm;
import web.form.Datagrid;

@Service(CommentService.SERVICE_NAME)
public class CommentServiceImpl implements CommentService {
	@Resource(name = CommentDao.SERVICE_NAME)
	private CommentDao commentDao;

	public Datagrid getCommentByBlogId(CommentForm commentForm) {
		Datagrid datagrid = null;
		if (commentForm.getBlogId() != null && !commentForm.getBlogId().equals("")) {
			String hql = "from Comment c where c.blog.id=:id " + "order by c.commentDate desc";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", Integer.parseInt(commentForm.getBlogId()));
			List<Comment> list = commentDao.find(hql, params);
			System.out.println(list.size());
			if (list != null && list.size() > 0) {
				CommentForm cf = null;
				datagrid = new Datagrid();
				List l2 = new ArrayList();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				for (int i = 0; i < list.size(); i++) {
					cf = new CommentForm();
					cf.setCommentDate(sdf.format(list.get(i).getCommentDate()));
					cf.setId(list.get(i).getId().toString());
					cf.setContent(list.get(i).getContent());
					cf.setUserIp(list.get(i).getUserIp());
					cf.setState(list.get(i).getState().toString());
					l2.add(cf);
				}
				datagrid.setRows(l2);
			}
		}
		return datagrid;
	}

	public void save(CommentForm commentForm) {
		if (commentForm != null) {
			Comment c = new Comment();
			Blog b = new Blog();
			b.setId(Integer.parseInt(commentForm.getBlogId()));
			c.setBlog(b);
			c.setContent(commentForm.getContent());
			c.setState(0);
			c.setUserIp(commentForm.getUserIp());
			c.setCommentDate(new Date());
			commentDao.save(c);
		}
	}

	public Datagrid CommentList(CommentForm commentForm) {
		String hql = "from Comment where 1=1";
		Map<String, Object> params = new HashMap<String, Object>();
		if (commentForm.getSort() != null && !commentForm.getSort().equals("")) {
			hql += " order by " + commentForm.getSort() + " " + commentForm.getOrder();
		}
		List<Comment> list = commentDao.find(hql, params, Integer.parseInt(commentForm.getPage()),
				Integer.parseInt(commentForm.getRows()));
		List<CommentForm> listForm = null;
		if (list != null && list.size() > 0) {
			listForm = new ArrayList<CommentForm>();
			CommentForm cf = null;
			for (int i = 0; i < list.size(); i++) {
				cf = new CommentForm();
				cf.setId(list.get(i).getId().toString());
				cf.setBlogTitle(list.get(i).getBlog().getTitle());
				cf.setCommentDate(list.get(i).getCommentDate().toString());
				cf.setContent(list.get(i).getContent());
				cf.setUserIp(list.get(i).getUserIp());
				listForm.add(cf);
			}

		}
		String totalHql = "select count(*) " + hql;
		Long total = commentDao.count(totalHql, params);

		Datagrid datagrid = new Datagrid();
		datagrid.setTotal(total);
		datagrid.setRows(listForm);
		return datagrid;

	}

	public void removeComment(CommentForm commentForm) {
		if (commentForm.getIds() != null && !commentForm.getIds().equals("")) {
			String hql = "delete Comment where id in(";
			String[] ids = commentForm.getIds().split(",");
			for (int i = 0; i < ids.length; i++) {
				if (i > 0) {
					hql += ",";
				}
				hql += "'" + ids[i] + "'";
			}
			hql += ")";
			commentDao.executeHql(hql);
		}
		
	}
}