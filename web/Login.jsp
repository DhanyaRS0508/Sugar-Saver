<%-- 
    Document   : Login
    Created on : 28-Nov-2023, 12:11:43 am
    Author     : shubh
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>

<%
    String user = request.getParameter("Puser");
    String pwd = request.getParameter("Ppwd");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr1");

        // Use PreparedStatement to prevent SQL injection
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM TUTOR WHERE TUTORID = ? AND TNAME = ?");
        ps.setString(1, user);
        ps.setString(2, pwd);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // Valid user, redirect to a new page
            response.sendRedirect("PatientHomePage.jsp");
        } else {
            // Invalid user, display an error message
            response.sendRedirect("login.jsp"); // You might want to include an error parameter
        }

        // Close resources
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>