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
        body { font-family: Arial; background-color: #f4f4f4; padding: 20px; }
        form, table { background: #fff; padding: 20px; border-radius: 5px; }
        input[type=number], button { padding: 8px; width: 100%; margin: 5px 0; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background-color: #007bff; color: white; }
        .error { color: red; }
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
