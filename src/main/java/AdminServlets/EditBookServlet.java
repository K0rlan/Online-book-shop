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

@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookId = request.getParameter("bookId");
		Book book = new Book();

		if(bookId != null && !(bookId.equals(""))){
			try {
				book = new MyDao().selectOne(Integer.parseInt(bookId));
			} catch (Exception e) {
				request.getSession().setAttribute("exception",e.getMessage());
			}
			request.getSession().setAttribute("book", book);
			response.sendRedirect("admin/EditBook.jsp");
		}else{
			request.getSession().setAttribute("message", "Error !!!! Please select one Category!!!!!!");
			response.sendRedirect("admin/AdminHome.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bookId = Integer.parseInt(request.getParameter("book_id"));
		String bookName= request.getParameter("book_name");
		String bookAuthor= request.getParameter("book_author");
		String bookImg= request.getParameter("book_img");
		String bookDescription= request.getParameter("book_description");
		String bookPrice = request.getParameter("book_price");
		String bookYear = request.getParameter("book_year");
		Book book = new Book();
		HttpSession adminSession = request.getSession(false);

		boolean status = false;
		PrintWriter out = response.getWriter();
		if(bookName != null && bookPrice != null && bookYear != null && bookId != 0){
			book.setBookId(bookId);
			book.setBookName(bookName);
			book.setBookAuthor(bookAuthor);
			book.setBookImg(bookImg);
			book.setBookDescription(bookDescription);
			book.setBookPrice(Double.parseDouble(bookPrice));
			book.setBookYear(Integer.parseInt(bookYear));
			try {
				status = new MyDao().update(book);
				book.toString();
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
