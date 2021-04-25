<%@ page import="Model.Admin" language="java" %>
<html>
<head>
    <title>Admin Home Page</title>
    <%! String admin; %>
    <%
        admin = (String) request.getSession().getAttribute("admin_name");
        if (admin == null) {
            request.getSession().setAttribute("message",
                    "Error!!!!!!!! Select Product First.");
            response.sendRedirect("Login.jsp");
        }
        assert admin != null;%>
</head>
<%@ include file = "../bodyStart.jsp" %>
<h1>Admin Home Page</h1>
<h1>My Login: <%out.print(admin);%></h1>
    <li><a href="AddBook.jsp">New Book</a></li>
    <li><a href="ListBooks.jsp">List Book</a></li>
<a href="../AdminLogoutServlet">
    <button type="button">Logout</button>
</a>
<%@ include file = "../footer.jsp" %>
