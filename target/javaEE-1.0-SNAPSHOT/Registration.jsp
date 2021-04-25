<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<body>
    <h3>Sign up</h3>
    <hr>
    <form action="UserRegisterServlet" method="POST">
            <input type="text" placeholder="Name" name="name"/> <br><br>
            <input type="email" placeholder="Email" name="email"/><br><br>
            <input type="password" placeholder="Password" name="password"/><br><br>
            <input type="password" id="password1" placeholder="Repeat password" name="confirm-password"><br><br>
            <button class="btn btn-elegant" type="submit">Sign up</button>
    </form>
</body>
</html>
