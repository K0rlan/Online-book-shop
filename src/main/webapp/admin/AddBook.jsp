<%@page import="DAO.MyDao"%>
<%@page import="Model.Book"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Book Details</title>
</head>
<jsp:include page="../bodyStart.jsp"/>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark" style="background-color: crimson">
	<a class="navbar-brand" href="Menu.jsp">Home</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
			aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="../AdminLogoutServlet"> Logout </a>
</nav>
<h3 class="text-center font-weight-bold text-dark text-uppercase pb-2 mb-4" style="padding-top: 100px">Add New Book</h3>
	<div>
		<form action="../AddBookServlet" method="post">
			<table class="table">
				<tr>
					<td scope="col">Book Name:</td>
					<td><input class = "form-control" type="text" name="book_name" required="true" /></td>
				</tr>
				<tr>
					<td scope="col">Book Author:</td>
					<td><input class = "form-control" type="text" name="book_author" required="true" /></td>
				</tr>
				<tr>
					<td scope="col">Book Img:</td>
					<td><input class = "form-control" type="text" name="book_img" required="true" /></td>
				</tr>
				<tr>
					<td scope="col">Book Description:</td>
					<td><input class = "form-control" type="text" name="book_description" required="true" /></td>
				</tr>

				<tr>
					<td scope="col">Book Price:</td>
					<td><input class = "form-control" type="text" name="book_price" required="true" pattern="[0-9.]+"/></td>
				</tr>
				<tr>
					<td scope="col">Book Year:</td>
					<td><input class = "form-control" type="text" name="book_year" required="true"/></td>
				</tr>
				<tr>
					<td colspan="2"><input value="Submit" type="submit" class="brn btn-elegant"/></td>
				</tr>
			</table>
		</form>
	</div>
<jsp:include page="../footer.jsp"/>
