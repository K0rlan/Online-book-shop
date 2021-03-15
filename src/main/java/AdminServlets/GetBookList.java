package AdminServlets;

import DAO.MyDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/GetBookList")
public class GetBookList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyDao bookDao = new MyDao();
		List<?> books = null;
		try {
			books = bookDao.select();
		} catch (Exception e) {
			request.getSession().setAttribute("exception",e.getMessage());
		}
		request.getSession().setAttribute("books",books);
		response.sendRedirect("admin/AdminHome.jsp");
	}

}
