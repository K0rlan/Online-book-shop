<%@ page import="Model.Admin" language="java" %>
<%@ page import="Model.Book" %>
<%@ page import="java.util.List" %>
<html>
<head>
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
    <title>Admin Home Page</title>
    <% List<?> books = (List<?>) request.getSession().getAttribute("books");%>
    <%! Book book; %>

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
<style>
    .news {
        background-color: #70747f;
        color: white;
        text-align: center;
        padding-top: 15px;
        padding-bottom: 15px;
        margin-top: 0px;
        margin-right: 30px;
        margin-left: 30px;
        border-radius: 5px;
    }

    .row {
        margin-left: 7px;
        margin-right: 7px;
        margin-top: 20px;
    }

    .card {
        border-radius: 5px;
        margin-left: 10px;
        margin-right: 10px;
    }
</style>
<jsp:include page="../bodyStart.jsp"/>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark" style="background-color: darkslategrey">
    <a class="navbar-brand" href="AdminHome.jsp">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
            aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="AddBook.jsp"> New Book </a>
    <a class="navbar-brand" href="ListBooks.jsp"> List Book </a>
    <a class="navbar-brand" href="../AdminLogoutServlet"> Logout </a>
</nav>
<h3 class="text-center font-weight-bold text-dark text-uppercase pb-2 mb-4" style="padding-top: 100px">Admin Home Page</h3>
<hr class="w-header my-4 white">
<h3 class="lead text-center text-dark pt-2 mb-5">My Login: <%out.print(admin);%></h3>
<div class=" intro-2" style="background-image: url('https://images.unsplash.com/photo-1526243741027-444d633d7365?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1651&q=80'); height: 350px">
    <div class="full-bg-img mask rgba-black-light flex-center">
        <div class="container text-center white-text wow fadeInUp" style="height: 300px; margin-bottom: 100px;">
        </div>
    </div>
</div>
<div class="container my-5">
    <section>
        <h6 class="font-weight-bold text-center grey-text text-uppercase small mb-4">books</h6>
        <hr class="w-header my-4">
        <p class="lead text-center text-muted pt-2 mb-5">You can find your lovely book on our site.</p>

        <div class="card-columns" style="margin-left: 50px">
            <%
                for (Object obj : books) {
                    book = (Book) obj;
            %>
            <!-- Card -->
            <div class="card hoverable mb-4" data-toggle="modal" data-target="#basicExampleModal" style="width: 300px">
                <!-- Card image -->
                <img class="card-img-top mainPictures" src="<%=book.getBookImg()%>" alt="Card image cap" width="150px">
                <!-- Card content -->
                <div class="card-body">
                    <h5 class="my-3"><%=book.getBookName()%></h5>
                    <p class="card-text text-uppercase mb-3"><%=book.getBookDescription()%></p>
                    <hr>
                    <a href="../BookDetailServlet?bookId=<%=book.getBookId()%>" style = "color: cornflowerblue">More</a>
                </div>
            </div>
            <!-- Card -->
            <%
                }
            %>
        </div>

    </section>
</div>
<jsp:include page="../footer.jsp"/>