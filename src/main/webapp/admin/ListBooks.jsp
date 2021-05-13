<%@page import="java.util.List"%>
 <%@ page import="java.io.*" %>
<%@ page import="Model.Book" %>
<META HTTP-EQUIV="Refresh" CONTENT="5">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<% List<?> books = (List<?>) request.getSession().getAttribute("books");%>
	<%! Book book; %>
</head>
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
<h3 class="text-center font-weight-bold text-dark text-uppercase pb-2 mb-4" style="padding-top: 100px">Books</h3>
	<div class="container py-5 z-depth-1">
		<table class="table">
			<tr>
				<th scope="col">Book Name</th>
				<th scope="col">Book Author</th>
				<th scope="col">Book Img</th>
				<th scope="col">Book Description</th>
				<th scope="col">Book Price</th>
				<th scope="col">Book Year</th>
				<th scope="col">Edit</th>
				<th scope="col">Delete</th>
			</tr>
			<%
				for (Object obj : books) {
					book = (Book) obj;
			%>
			<tr>
				<td><%=book.getBookName()%></td>
				<td><%=book.getBookAuthor()%></td>
				<td><%=book.getBookImg()%></td>
				<td><%=book.getBookDescription()%></td>
				<td><%=book.getBookPrice()%></td>
				<td><%=book.getBookYear()%></td>
				<td><a href="../EditBookServlet?bookId=<%=book.getBookId()%>" style = "color: cornflowerblue">Edit
				</a></td>
				<td><a href="../DeleteBookServlet?bookId=<%=book.getBookId()%>" style = "color: cornflowerblue">Delete
				</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
<jsp:include page="../footer.jsp"/>