<%-- 
    Document   : PatientPersonalDetails
    Created on : 28-Nov-2023, 2:15:32 pm
    Author     : shubh
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Details</title>
    <link rel="stylesheet" href="../../css/style.css">
    <script src="../../js/script.js"></script>
</head>

<body class="personal-details-page">
<h1>Personal Details</h1>

<form id="personalDetailsForm">
    <label for="fname">First Name:</label>
    <input type="text" id="fname" name="fname" required>
    <br>

    <label for="lname">Last Name:</label>
    <input type="text" id="lname" name="lname" required>
    <br>

    <label for="phone">Phone Number:</label>
    <input type="tel" id="phone" name="phone" required>
    <br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
    <br>

    <label for="gender">Gender:</label>
    <input type="text" id="gender" name="gender" required>
    <br>

    <button class="input-button" type="button" onclick="submitPersonalDetails()">Submit</button>
</form>

</body>
</html>

