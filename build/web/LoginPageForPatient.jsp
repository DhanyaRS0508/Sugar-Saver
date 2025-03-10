<%-- 
    Document   : LoginPageForPatient
    Created on : 28-Nov-2023, 12:25:46 pm
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="patientLogin" class="login-container">
            <h2>Patient Login</h2>
            <form id="patientLoginForm" action="Login.jsp" method="post">
                <input name="Puser" type="text" placeholder="Username" required />
                <br />
                <input name="Ppwd" type="password" placeholder="Password" required />
                <br />
                <button type="submit">Login</button>
                <!-- Include other form elements as needed -->
            </form>
        </div>
    </body>
</html>
