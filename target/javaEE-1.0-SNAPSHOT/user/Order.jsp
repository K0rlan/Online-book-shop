<%@ page import="Model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
    <%
        Book book = new Book();
        book = (Book) request.getSession().getAttribute("book");
        if (book == null) {
            request.getSession().setAttribute("message",
                    "Error");
            response.sendRedirect("AdminHome.jsp");
        }
        assert book != null;%>
</head>
<body>
<h2>Buy Cart</h2>
 <form action="../BuyCartServlet" method="post">
        <table>
            <tr>
                <td>Book Name:</td>
                <td><%=book.getBookName()%></td>
            </tr>
            <tr>
                <td>Book Price:</td>
                <td><%=book.getBookName()%></td>
            </tr>
            <tr>
                <td>How many books:</td>
                <td><input type="text" name="amount" required="true" /></td>
            </tr>
            <tr>
                <td>Your email:</td>
                <td><input type="text" name="user_email" required="true" /></td>
            </tr>
            <tr>
                <td colspan="2"><input value="Buy" type="submit" /></td>
            </tr>
        </table>
 </form>

</body>
</html>
