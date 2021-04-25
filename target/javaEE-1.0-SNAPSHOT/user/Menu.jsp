<%@ page import="Model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menu</title>
    <% List<?> books = (List<?>) request.getSession().getAttribute("books");%>
    <%! Book book; %>

    <%! User user; %>
    <%
    user = (User) request.getSession().getAttribute("logged_user");
    if (user == null) {
    request.getSession().setAttribute("message",
    "Error!!!!!!!! Select Product First.");
    response.sendRedirect("Login.jsp");
    }
    assert user != null;%>
</head>
<%@ include file = "../bodyStart.jsp" %>
<h1>Welcome, <%out.print(user.getUsername());%></h1>
<h1 style="text-align: center">Menu</h1>
<div>
    <table>
        <tr>
            <th width="v">Book Name</th>
            <th width="200">Book Price</th>
            <th width="200">Book Year</th>
            <th width="200">More</th>
        </tr>
        <%
            for (Object obj : books) {
                book = (Book) obj;
        %>
        <tr>
            <td align="center"><%=book.getBookName()%></td>
            <td align="center">Rs. <%=book.getBookPrice()%></td>
            <td align="center"><%=book.getBookYear()%></td>
            <td align="center"><a href="../BookDetailServlet?bookId=<%=book.getBookId()%>"> <button type="button">More</button>
            </a></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<a href="../UserLogoutServlet">
    <button type="button">Logout</button>
</a>
<jsp:include page="../footer.jsp"/>
