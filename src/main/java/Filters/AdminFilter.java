package Filters;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName="AdminFilter", urlPatterns={"/AddBookServlet",
		"/DeleteBookServlet", "/EditBookServlet", "/GetBookList",
		"/admin/AddBook.jsp","/admin/AdminHome.jsp", "/admin/EditBook.jsp",
		"/admin/ListBooks.jsp"})
public class AdminFilter extends AdminGenericFilter{
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
	ServletException{
		
		HttpSession adminSession = ((HttpServletRequest)request).getSession(false);
		String admin_status = (String)adminSession.getAttribute("admin_status");
		String adminAttr = (String)adminSession.getAttribute("admin_sessionattr");
		String admin = (String)adminSession.getAttribute("admin");
		response.setContentType("text/html");
		
		if(adminAttr != null && !admin_status.equals("false") && admin.equals("admin")){
			chain.doFilter(request, response);
		}else{
			((HttpServletResponse) response).sendRedirect("../AdminLogin.jsp");
		}
	}
}
