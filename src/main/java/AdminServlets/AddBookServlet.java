package AdminServlets;

import DAO.MyDao;
import Model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book book = new Book();
		boolean status = false;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		String bookName= request.getParameter("book_name");
		String bookAuthor= request.getParameter("book_author");
		String bookImg= request.getParameter("book_img");
		String bookDescription= request.getParameter("book_description");
		String bookPrice = request.getParameter("book_price");
		String bookYear = request.getParameter("book_year");
		HttpSession adminSession = request.getSession(false);

		if(bookName != null && bookAuthor != null && bookImg != null && bookDescription != null && bookPrice != null && bookYear != null){
			book.setBookName(bookName);
			book.setBookAuthor(bookAuthor);
			book.setBookImg(bookImg);
			book.setBookDescription(bookDescription);
			book.setBookPrice(Double.parseDouble(bookPrice));
			book.setBookYear(Integer.parseInt(bookYear));
			try {
				status = new MyDao().insert(book);
			} catch (Exception e) {
				adminSession.setAttribute("exception",e);
				e.printStackTrace();
			}
			if(status){
				out.println("<script>alert('You Have Succesfully Added new Book !!!')</script>");
				adminSession.setAttribute("message","You Have Succesfully Added new Book !!!" );
				response.sendRedirect("admin/AdminHome.jsp");
			}else{
				out.println("<script>alert('Error !!! You Have Added duplicate Book  !!!')</script>");
				adminSession.setAttribute("message","Error !!! You Have Added duplicate Book !!!" );
				response.sendRedirect("admin/AdminHome.jsp");
			}
		}else{
			out.println("<script>alert('Write Book Details Again !!!')</script>");
			response.sendRedirect("AdminLogin.jsp");
		}


	}

}
