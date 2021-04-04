<%@ page import="java.util.List" %>
<%@ page import="Model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My cart</title>
    <%
        List<?> carts = (List<?>) request.getSession().getAttribute("carts");
        Cart cart = new Cart();
    %>
</head>
<%@ include file = "../bodyStart.jsp" %>
<div id="edit">
    <h1>Cart of history</h1>
    <table>
        <tr>
            <th width="200">Cart id</th>
            <th width="200">Book name</th>
            <th width="200">Cart price</th>
            <th width="200">Amount</th>
            <th width="200">Total cost</th>
        </tr>
        <%
            for (Object obj : carts) {
                cart = (Cart) obj;
        %>
        <tr>
            <td align="center"><%=cart.getCart_id()%></td>
            <td align="center"><%=cart.getBook_name()%></td>
            <td align="center"><%=cart.getCost()%></td>
            <td align="center"><%=cart.getAmount()%></td>
            <td align="center"><%=cart.getTotal_cost()%></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<jsp:include page="../footer.jsp"/>
