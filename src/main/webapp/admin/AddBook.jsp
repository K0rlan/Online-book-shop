<%@page import="DAO.MyDao"%>
<%@page import="Model.Book"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Book Details</title>
</head>
<%@ include file = "../bodyStart.jsp" %>
<h2>Add New Product</h2>
	<div>
		<form action="../AddBookServlet" method="post">
			<table>
				<tr>
					<td>Book Name:</td>
					<td><input type="text" name="book_name" required="true" /></td>
				</tr>
				<tr>
					<td>Book Price:</td>
					<td><input type="text" name="book_price" required="true" pattern="[0-9.]+"/></td>
				</tr>
				<tr>
					<td>Book Year:</td>
					<td><input type="text" name="book_year" required="true"/></td>
				</tr>
				<tr>
					<td colspan="2"><input value="Submit" type="submit" /></td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file = "../footer.jsp" %>
