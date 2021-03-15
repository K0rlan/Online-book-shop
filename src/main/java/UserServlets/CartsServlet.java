package UserServlets;

import DAO.MyDao;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/CartsServlet")
public class CartsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyDao bookDao = new MyDao();
        User user = (User) request.getSession().getAttribute("user_session");
        List<?> carts = null;
        if (user.getUser_id() != 0) {
            try {
                carts = bookDao.cartList(user.getUser_id());
            } catch (Exception e) {
                request.getSession().setAttribute("exception", e.getMessage());
            }
            request.getSession().setAttribute("carts", carts);
            response.sendRedirect("user/MyCarts.jsp");
        }
    }
}
