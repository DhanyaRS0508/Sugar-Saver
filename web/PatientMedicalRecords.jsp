<%-- 
    Document   : PatientMedicalRecords
    Created on : 28-Nov-2023, 2:32:15 pm
    Author     : shubh
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<%
    // JSP does not directly support asynchronous operations like JavaScript fetch API
    // If you need to fetch data from the server, you may consider using AJAX or similar client-side technologies.

    // You can use Java code here to fetch data from the server and populate the form.
    // Example:
    String name = "";
    String height = "";
    String weight = "";
    String age = "";
    String hba1cDate = "";
    String hba1cLevel = "";
    String exerciseFrequency = "";
    String exerciseType = "";
    String sugarIntake = "";
    String medication = "";
    String healthIssue = "";
    String preferredMeal = "";

        try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr1");

        // Assuming there's a table named "patient_data" with corresponding columns
        String sql = "SELECT * FROM MEDICALRECORDS WHERE patient_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1,1);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // Retrieve values from the result set
            name = rs.getString("name");
            height = rs.getString("height");
            weight = rs.getString("weight");
            age = rs.getString("age");
            hba1cDate = rs.getString("hba1c_date");
            hba1cLevel = rs.getString("hba1c_level");
            exerciseFrequency = rs.getString("exercise_frequency");
            exerciseType = rs.getString("exercise_type");
            sugarIntake = rs.getString("sugar_intake");
            medication = rs.getString("medication");
            healthIssue = rs.getString("health_issue");
            preferredMeal = rs.getString("preferred_meal");
        }

        // Close resources
        rs.close();
        ps.close();
        conn.close();
       } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
    
    
    
    // Set the values in the session for demonstration purposes
    HttpSession session1 = request.getSession();
    session.setAttribute("name", name);
    session.setAttribute("height", height);
    session.setAttribute("weight", weight);
    session.setAttribute("age", age);
    session.setAttribute("hba1cDate", hba1cDate);
    session.setAttribute("hba1cLevel", hba1cLevel);
    session.setAttribute("exerciseFrequency", exerciseFrequency);
    session.setAttribute("exerciseType", exerciseType);
    session.setAttribute("sugarIntake", sugarIntake);
    session.setAttribute("medication", medication);
    session.setAttribute("healthIssue", healthIssue);
    session.setAttribute("preferredMeal", preferredMeal);

    // This is just a placeholder; replace it with actual backend API endpoint for data retrieval.
    String backendAPIEndpoint = "YOUR_BACKEND_API_ENDPOINT";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Routine Diabetes Encounter</title>
    <link rel="stylesheet" href="style.css">
    <script>

    document.addEventListener('DOMContentLoaded', function() {
        checkUserRole();
        populateFormWithData();
    });

    // Function to make a GET request and populate the form
    async function populateFormWithData() {
        try {
            // Use session values set by the JSP to populate the form
            document.getElementById('name').value = '<%= session.getAttribute("name") %>';
            document.getElementById('height').value = '<%= session.getAttribute("height") %>';
            document.getElementById('weight').value = '<%= session.getAttribute("weight") %>';
            document.getElementById('age').value = '<%= session.getAttribute("age") %>';
            document.getElementById('HBAIC').value = '<%= session.getAttribute("hba1cDate") %>';
            document.getElementById('HBAIClevel').value = '<%= session.getAttribute("hba1cLevel") %>';
            document.getElementById('exercise').value = '<%= session.getAttribute("exerciseFrequency") %>';
            document.getElementById('exerciseType').value = '<%= session.getAttribute("exerciseType") %>';
            document.getElementById('sugarIntake').value = '<%= session.getAttribute("sugarIntake") %>';
            // ... (populate other fields)

        } catch (error) {
            console.error('Error:', error);
        }
    }

    function disableButtonsAndInputs(role) {

        console.log('calling disable buttons and inputs');

        const buttons = document.querySelectorAll('button');
        const inputs = document.querySelectorAll('input');
        const textareas = document.querySelectorAll('textarea');

        // Loop through buttons and disable them
        buttons.forEach(button => {
            button.disabled = role === 'doctor';
        });

        // Loop through inputs and disable them
        inputs.forEach(input => {
            input.disabled = role === 'doctor';
        });

        textareas.forEach(textarea => {
            textarea.disabled = role === 'doctor';
        });
    }

    // Function to check the user's role and disable buttons and input fields accordingly
    function checkUserRole() {
        console.log('Checking user role');
        const urlParams = new URLSearchParams(window.location.search);
        const role = urlParams.get('role');

        console.log('role - ' + role);

        disableButtonsAndInputs(role);
    }
    </script>
</head>
<body class="medical-details-page">
    <h1>Routine Diabetes Encounter</h1>

    <form id="diabetesEncounterForm">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>

        <label for="height">Height:</label>
        <input type="text" id="height" name="height" required>
        <br>

        <label for="weight">Weight:</label>
        <input type="text" id="weight" name="weight" required>
        <br>

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required>
        <br>

        <label for="HBAIC">When was the last HBAIC test done?</label>
        <input type="date" id="HBAIC" name="HBAIC" required>
        <br>

        <label for="HBAIClevel">HBAIC level:</label>
        <input type="number" id="HBAIClevel" name="HBAIClevel" required>
        <br>

        <label for="exercise">How frequently do you exercise? </label>
        <input type="number" id="exercise" name="exercise" required>
        <br>

        <label for="exerciseType">What type of exercise exercise? </label>
        <textarea type="text" id="exerciseType" name="exerciseType" rows="4"></textarea>
        <br>

        <label for="sugarIntake">How frequent is sugar intake? </label>
        <input type="number" id="sugarIntake" name="sugarIntake" required>
        <br>

        <!-- Patient Status -->
        <label>Any on-going medication?:</label>
        <input type="radio" id="medicationYes" name="medication" value="yes">
        <label for="medicationYes">Yes</label>
        <input type="radio" id="medicationNo" name="medication" value="no">
        <label for="medicationNo">No</label>
        <br>

        <label for="healthIssue">Any health issue? :</label>
        <textarea id="healthIssue" name="healthIssue" rows="4"></textarea>
        <br>

        <label for="preferredMeal">What is your preferred meal? </label>
        <textarea type="text" id="preferredMeal" name="preferredMeal"></textarea>
        <br>

        <button class="input-button" type="button" onclick="submitMedicalDetails();">Submit</button>
    </form>
</body>
</html>
