<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file = "bodyStart.jsp" %>
    <h3>Sign in</h3>
    <form action="AdminLoginServlet" method="POST">
        <input  type="email" name="admin-username" placeholder="Login"/><br><br>
        <input type="password"  name="admin-password" placeholder="Password"/><br><br>
        <button type="submit">Sign in</button>
    </form>
<%@ include file = "footer.jsp" %>

