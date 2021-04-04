
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file = "bodyStart.jsp" %>
    <h3 >Sign in</h3>
    <form  action="UserLoginServlet" method="POST">
        <input type="email" name="form-username" placeholder="Login"/><br><br>
        <input type="password" name="form-password" placeholder="Password"/><br><br>
        <button type="submit" >Sign in</button>
    </form>
</section>
    <%@ include file = "footer.jsp" %>
