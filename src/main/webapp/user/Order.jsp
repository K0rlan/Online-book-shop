<%@ page import="Model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign In Page</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">

    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
    <title>Order</title>
    <%! Book book; %>
    <%
        book = (Book) request.getSession().getAttribute("book");
        if (book == null) {
            request.getSession().setAttribute("message",
                    "Error");
            response.sendRedirect("AdminHome.jsp");
        }
        assert book != null;%>
</head>
<jsp:include page="../bodyStart.jsp"/>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark" style="background-color: darkslategrey">
    <a class="navbar-brand" href="Menu.jsp">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
            aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="../UserLogoutServlet"> Logout </a>
</nav>
<h3 class="text-center font-weight-bold text-dark text-uppercase pb-2 mb-4" style="padding-top: 100px">Buy Cart</h3>
<div class="container py-5 z-depth-1">
 <form action="../BuyCartServlet" method="post">
        <table class="table">
            <tr>
                <td scope="col">Book Name:</td>
                <td><%=book.getBookName()%></td>
            </tr>
            <tr>
                <td scope="col">Book Price:</td>
                <td><%=book.getBookPrice()%></td>
            </tr>
            <tr>
                <td scope="col">How many books:</td>
                <td><input class="form-control"  type="text" name="amount" required="true" style="width: 200px"
                           placeholder="1" /></td>
            </tr>
            <tr>
                <td scope="col">Your email:</td>
                <td><input class="form-control"  type="text" name="user_email" required="true" style="width: 200px"
                           placeholder="user@m.ru" /></td>
            </tr>
            <tr>
                <td scope="col"><input value="Buy" type="submit" class="btn btn-elegant"/></td>
            </tr>
        </table>
 </form>
</div>
<jsp:include page="../footer.jsp"/>
