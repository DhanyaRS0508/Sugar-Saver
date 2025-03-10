<%-- 
    Document   : PatientHomePage
    Created on : 28-Nov-2023, 11:30:22 am
    Author     : shubh
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Home Page</title>
    <link rel="stylesheet" href="../../css/style.css">
    <script src="home.js"></script>
</head>
<body class="home-page">
    <h1>Welcome to Your Home Page</h1>

    <div class="options-container">
        
        <button onclick="redirectToPage('PatientPersonalDetails.jsp')">Personal Details</button>
        <button class="input-button" onclick="redirectToPage('PatientMedicalRecords.jsp')">Medical Records</button>
        <button class="input-button" onclick="redirectToPage('dietHistory')">Diet History</button>
        <button class="input-button" onclick="redirectToPage('faq')">FAQ</button-->
        <!--button class="input-button" onclick="navigateTo('personalDetails')">Personal Details</button>
        <button class="input-button" onclick="navigateTo('medicalRecords')">Medical Records</button>
        <button class="input-button" onclick="navigateTo('dietHistory')">Diet History</button>
        <button class="input-button" onclick="navigateTo('faq')">FAQ</button-->
    </div>

    

    <!-- Add a JavaScript function to handle the redirection -->
    <script>
        function redirectToPage(targetPage) {
            // Use window.location to redirect to the specified page
            window.location.href = targetPage;
        }
    </script>
  
</body>
</html>
