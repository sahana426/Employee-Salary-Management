<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Employee</title>
    <style>
        /* Background */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background: linear-gradient(135deg, #fce4ec 0%, #f8bbd0 100%);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Form Container */
        form {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 350px;
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            color: #c2185b;
            font-size: 24px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            margin-bottom: 20px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input:focus {
            border-color: #c2185b;
            outline: none;
        }

        button {
            background: #e53935;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            font-size: 16px;
            font-weight: bold;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #c62828;
            transform: scale(1.03);
        }

        .message {
            margin-top: 20px;
            font-weight: bold;
            color: #d32f2f;
        }
    </style>
</head>
<body>
    <form action="DeleteEmployeeServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this employee?');">
        <h2>Delete Employee</h2>
        <label for="empno">Employee Number:</label>
        <input type="number" id="empno" name="empno" required min="1">
        <button type="submit">Delete</button>

        <%
            String msg = (String) request.getAttribute("message");
            if(msg != null) {
        %>
            <p class="message"><%= msg %></p>
        <%
            }
        %>
    </form>
</body>
</html>
