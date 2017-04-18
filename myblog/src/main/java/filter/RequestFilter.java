package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Blogger;


public class RequestFilter implements Filter {

	//需要定义系统页面访问中可放行的连接
	private List<String> list = new ArrayList<String>();

    public RequestFilter() {
        // TODO Auto-generated constructor stub
    }


	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		 HttpServletRequest request = (HttpServletRequest) req;
		 HttpServletResponse response = (HttpServletResponse) resp;
			//1、获取页面中的访问的路径连接
			String path = request.getServletPath();
			if(list!=null && list.contains(path)){
				//如果页面中获取的访问连接于定义的可放行的连接一致，则放行
				chain.doFilter(request, response);
				return;
			}   
			Blogger blogger = (Blogger) request.getSession().getAttribute("blogger");
		    if (blogger != null) {
				//如果从session中获取的用户对象不为空，则放行
				chain.doFilter(request, response);
		        return;
		    }
			//如果不满足条件1和2，则不能放行，回到系统的登录页面
			response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		//登陆界面放行
		list.add("/admin/login.jsp");
		//后台登陆action放行
		list.add("/admin/BloggerAction!login.action");

	}

}
