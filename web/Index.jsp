<%-- 
    Document   : newjsp
    Created on : 28-Nov-2023, 11:16:54 am
    Author     : shubh
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sugar Saver - Login</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body class="home">
    <div class="options-container">
        <form action="LoginPageForPatient.jsp" method="get">
            <button type="submit">Patient Login</button>
        </form>
    </div>

    <div id="patientLogin" class="login-container">
        <h2>Patient Login</h2>
        <form id="patientLoginForm" action="Login.jsp" method="post">
            <input name="user" id="PUsername" type="text" placeholder="Username" required />
            <br />
            <input name="pwd" id="Ppwd" type="password" placeholder="Password" required />
            <br />
            <button type="submit">Login</button>
            <!-- Include other form elements as needed -->
        </form>
    </div>

    <!-- Repeat similar sections for doctorLogin and adminLogin -->

    <div id="patientSignup" class="signup-container">
        <!-- Your existing HTML for patientSignup -->
    </div>

    <!-- Repeat similar sections for doctorSignup and other sign-up forms -->

    <div id="forgotPassword" class="f_password-container">
        <!-- Your existing HTML for forgotPassword -->
    </div>

    <script src="script.js"></script>
</body>
</html>

