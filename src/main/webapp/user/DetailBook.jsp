<%@ page import="Model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Book</title>
    <jsp:useBean id="book" class="Model.Book" scope="session"/>
</head>
<%@ include file = "../bodyStart.jsp" %>
<h2>Add New Book</h2>
<div>
    <form action="../BookDetailServlet" method="post">
        <table>
            <tr>
                <td>Book Id:</td>
                <td><jsp:getProperty name="book" property="bookId"/></td>
            </tr>
            <tr>
                <td>Book Name:</td>
                <td><jsp:getProperty name="book" property="bookName"/></td>
            </tr>
            <tr>
                <td>Book Price:</td>
                <td><jsp:getProperty name="book" property="bookPrice"/></td>
            </tr>
            <tr>
                <td>Book Year:</td>
                <td><jsp:getProperty name="book" property="bookYear"/></td>
            </tr>
            <tr>
                <td><a href="../BuyCartServlet?bookId=<jsp:getProperty name="book" property="bookId"/>">
                    <button type="button">Buy Carts</button>
                </a></td>
            </tr>
        </table>
    </form>
</div>
<jsp:include page="../footer.jsp"/>

