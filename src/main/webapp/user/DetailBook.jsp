<%@ page import="Model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Book</title>
    <%
        Book book = new Book();
        book = (Book) request.getSession().getAttribute("book");
        if (book == null) {
            request.getSession().setAttribute("message", "Error");
            response.sendRedirect("Menu.jsp");
        }
        assert book != null;%>
</head>
<body>
<h2>Add New Book</h2>
<div>
    <form action="../BookDetailServlet" method="post">
        <table>
            <tr>
                <td>Book Id:</td>
                <td><%=book.getBookId()%></td>
            </tr>
            <tr>
                <td>Book Name:</td>
                <td><%=book.getBookName()%></td>
            </tr>
            <tr>
                <td>Book Price:</td>
                <td><%=book.getBookPrice()%></td>
            </tr>
            <tr>
                <td>Book Year:</td>
                <td><%=book.getBookYear()%></td>
            </tr>
            <tr>
                <td><a href="../BuyCartServlet?bookId=<%=book.getBookId()%>">
                    <button type="button">Buy Carts</button>
                </a></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>

