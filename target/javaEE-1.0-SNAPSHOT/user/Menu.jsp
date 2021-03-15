<%@ page import="Model.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menu</title>
    <%
        List<?> books = (List<?>) request.getSession().getAttribute("books");
        Book book = new Book();
    %>
</head>
<body>
<h1>Menu for user</h1>
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
</body>
</html>
