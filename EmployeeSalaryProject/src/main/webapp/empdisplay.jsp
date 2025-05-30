<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.model.Employee" %>
<%
    Employee emp = (Employee) request.getAttribute("employee");
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Display Employee</title>
    <style>
        /* Background and layout */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #dfe9f3 0%, #ffffff 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: start;
            padding-top: 50px;
        }

        h2, h3 {
            color: #333;
            margin-bottom: 20px;
        }

        /* Form styling */
        form {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            width: 100%;
            max-width: 400px;
        }

        label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        input[type=number] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 15px;
            font-size: 15px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(1.03);
        }

        /* Table styling */
        table {
            width: 100%;
            max-width: 600px;
            border-collapse: collapse;
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 14px 20px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        .error {
            color: #dc3545;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Display Employee Details</h2>

    <form action="DisplayEmployeeServlet" method="post">
        <label for="empno">Enter Employee Number:</label>
        <input type="number" name="empno" id="empno" required min="1">
        <button type="submit">Search</button>
    </form>

    <% if (message != null) { %>
        <p class="error"><%= message %></p>
    <% } else if (emp != null) { %>
        <h3>Employee Information:</h3>
        <table>
            <tr><th>Emp No</th><td><%= emp.getEmpno() %></td></tr>
            <tr><th>Name</th><td><%= emp.getEmpname() %></td></tr>
            <tr><th>Date of Joining</th><td><%= emp.getDoj() %></td></tr>
            <tr><th>Gender</th><td><%= emp.getGender() %></td></tr>
            <tr><th>Basic Salary</th><td><%= emp.getBsalary() %></td></tr>
        </table>
    <% } %>
</body>
</html>
