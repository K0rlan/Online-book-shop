<%@page import="java.util.List"%>
 <%@ page import="java.io.*" %>
<%@ page import="Model.Book" %>
<META HTTP-EQUIV="Refresh" CONTENT="5">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<% List<?> books = (List<?>) request.getSession().getAttribute("books");%>
	<%! Book book; %>
</head>
<%@ include file = "../bodyStart.jsp" %>
	<div>
		<table>
			<tr>
				<th width="200">Book Name</th>
				<th width="200">Book Price</th>
				<th width="200">Book Year</th>
				<th width="200">Edit</th>
				<th width="200">Delete</th>
			</tr>
			<%
				for (Object obj : books) {
					book = (Book) obj;
			%>
			<tr>
				<td align="center"><%=book.getBookName()%></td>
				<td align="center"><%=book.getBookPrice()%></td>
				<td align="center"><%=book.getBookYear()%></td>
				<td align="center"><a href="../EditBookServlet?bookId=<%=book.getBookId()%>"> <button type="button">Edit</button>
				</a></td>
				<td align="center"><a href="../DeleteBookServlet?bookId=<%=book.getBookId()%>"><button type="button">Delete</button>
				</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
<%@ include file = "../footer.jsp" %>
