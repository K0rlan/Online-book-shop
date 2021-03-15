<%@page import="DAO.MyDao"%>
<%@page	import="Model.Book"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Product Details</title>

	<%
		Book book = new Book();
		book = (Book) request.getSession().getAttribute("book");
		if (book == null) {
			request.getSession().setAttribute("message", "Error");
			response.sendRedirect("AdminHome.jsp");
		}
		assert book != null;%>
</head>
<body>
<div>
	<form action="../EditBookServlet" method="post">
		<table>
			<tr>
				<td>Book Id:</td>
				<td ><input type="text" name="book_id" readonly="readonly" value="<%=book.getBookId()%>" /></td>
			</tr>
			<tr>
				<td>Book Name:</td>
				<td><input type="text" name="book_name" required="true" value="<%=book.getBookName()%>" /></td>
			</tr>
			<tr>
				<td>Book Price:</td>
				<td><input type="text" name="book_price" required="true" value="<%=book.getBookPrice()%>" pattern="[0-9.]+" /></td>
			</tr>
			<tr>
				<td>Book Year:</td>
				<td><input type="text" name="book_year" required="true" value="<%=book.getBookYear()%>" pattern="[0-9.]+" /></td>
			</tr>
			<tr>
				<td colspan="2"><input value="Update Product" type="submit" /></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
