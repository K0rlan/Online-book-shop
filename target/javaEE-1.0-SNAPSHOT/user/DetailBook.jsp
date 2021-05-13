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
    <title>Detail Book</title>
    <jsp:useBean id="book" class="Model.Book" scope="session"/>
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

<div class="container py-5 z-depth-1" style=" margin-bottom: 80px; background-color: seashell">
    <!--Section: Content-->
    <section class="text-center" style="margin-top: 50px">
        <!-- Section heading -->
        <h3 class="font-weight-bold mb-2"><jsp:getProperty name="book" property="bookName"/></h3>
        <hr>
        <div class="row mt-5">
            <div class="col-lg-6">
                <!--Carousel Wrapper-->
                <div id="carousel-thumb1" class="carousel slide carousel-fade carousel-thumbnails mb-5 pb-4" data-ride="carousel">
                    <!--Slides-->
                    <div class="carousel-inner text-center text-md-center" role="listbox">
                        <div class="carousel-item active pictures">
                            <img src="<jsp:getProperty name="book" property="bookImg"/>"
                                 alt="First slide" class="img-fluid mainPictures z-depth-2" width="300px" style="margin-right: 0">
                        </div>
                    </div>
                    <!--/.Slides-->
                </div>
            </div>
            <div class="col-lg-5 text-center text-md-left">
                <h2 class="h2-responsive text-center text-md-left product-name font-weight-bold dark-grey-text mb-1 ml-xl-0 ml-4">
                    <jsp:getProperty name="book" property="bookName"/>
                </h2>
                <h3 class="h3-responsive text-center text-md-left mb-5 ml-xl-0 ml-4">
          <span class="grey-text">
            <small>
              <strong><jsp:getProperty name="book" property="bookPrice"/></strong>
            </small>
          </span>
                </h3>
                <div class="font-weight-normal">
                    <p class="ml-xl-0 ml-4"> Book author: <jsp:getProperty name="book" property="bookAuthor"/> </p>
                    <p class="ml-xl-0 ml-4"> Book released year: <jsp:getProperty name="book" property="bookYear"/> </p>
                    <p class="ml-xl-0 ml-4"> Book description: <jsp:getProperty name="book" property="bookDescription"/></p>
                    <div style="margin-top: 100px">
                        <div class="row mt-5 mb-4">
                            <div class="col-md-12 text-center text-md-left text-md-right">
                                <a href="../BuyCartServlet?bookId=<jsp:getProperty name="book" property="bookId"/>">
                                    <i class="fas fa-cart-plus mr-2" aria-hidden="true"></i>Add to basket</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<jsp:include page="../footer.jsp"/>