<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Employee</title>
    <style>
        body { font-family: Arial, sans-serif; background: #fff5f5; padding: 20px; }
        form { background: white; padding: 20px; border-radius: 8px; max-width: 300px; }
        label, input, button { display: block; width: 100%; margin-bottom: 10px; }
        button { background: #dc3545; color: white; border: none; padding: 10px; cursor: pointer; }
        button:hover { background: #c82333; }
        .message { font-weight: bold; }
    </style>
</head>
<body>
    <h2>Delete Employee</h2>
    <form action="DeleteEmployeeServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this employee?');">
        <label for="empno">Employee Number:</label>
        <input type="number" id="empno" name="empno" required min="1">
        <button type="submit">Delete</button>
    </form>

    <%
        String msg = (String) request.getAttribute("message");
        if(msg != null) {
    %>
        <p class="message"><%= msg %></p>
    <%
        }
    %>
</body>
</html>
