package UserServlets;

import DAO.MyDao;
import Model.Book;
import Model.Cart;
import Model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/BuyCartServlet")
public class BuyCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart = new Cart();
        boolean status = false;
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        User user = new User();
        Book book = new Book();
        book = (Book) request.getSession().getAttribute("book");

        String amount = request.getParameter("amount");
        String user_email = request.getParameter("user_email");

        if(book.getBookId() != 0  && user_email != null && !(user_email.equals(""))){
            try {
                book = new MyDao().selectOne(book.getBookId());
                user = new MyDao().selectUser(user_email);
                request.getSession().setAttribute("user_session", user);
            } catch (Exception e) {
                request.getSession().setAttribute("exception",e.getMessage());
            }
        }else{
            request.getSession().setAttribute("message", "Error !!!! Please select one Category!!!!!!");
            response.sendRedirect("user/Menu.jsp");
        }

        HttpSession userSession = request.getSession(false);

        if(amount != null && user.getUser_id() != 0
                && book.getBookName() != null && book.getBookPrice() != 0){
            cart.setBook_name(book.getBookName());
            cart.setCost(book.getBookPrice());
            cart.setAmount(Integer.parseInt(amount));
            cart.setTotal_cost(Double.parseDouble(String.valueOf(book.getBookPrice()*Integer.parseInt(amount))));
            cart.setUser_id(user.getUser_id());
            try {
                status = new MyDao().buyCart(cart);
            } catch (Exception e) {
                userSession.setAttribute("exception",e);
                e.printStackTrace();
            }
            if(status){
                String path = "/CartsServlet";
                ServletContext servletContext = getServletContext();
                RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher(path);
                requestDispatcher.forward(request, response);
                out.println("<script>alert('You Have Succesfully Added new Book !!!')</script>");
                userSession.setAttribute("message","You Have Succesfully Added new Book !!!" );
//                response.sendRedirect("user/MyCarts.jsp");
            }else{
                out.println("<script>alert('Error !!! You Have Added duplicate Book  !!!')</script>");
                userSession.setAttribute("message","Error !!! You Have Added duplicate Book !!!" );
                response.sendRedirect("user/Menu.jsp");
            }
        }else{
            out.println("<script>alert('Write Book Details Again !!!')</script>");
            response.sendRedirect("Login.jsp");
        }
    }

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
            response.sendRedirect("user/Order.jsp");
        }else{
            request.getSession().setAttribute("message", "Error !!!! Please select one Category!!!!!!");
            response.sendRedirect("user/Menu.jsp");
        }

    }
}
