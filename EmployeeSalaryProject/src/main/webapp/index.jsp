<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Salary Management</title>
    <style>
        /* Full-page gradient background */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #74ebd5 0%, #acb6e5 100%);
        }

        /* Glass-style box */
        .container {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            padding: 40px 60px;
            text-align: center;
            color: #fff;
            max-width: 400px;
            width: 100%;
        }

        h1 {
            font-size: 26px;
            margin-bottom: 30px;
            color: #ffffff;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.2);
        }

        a {
            display: block;
            margin: 15px 0;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background: rgba(52, 152, 219, 0.8);
            border-radius: 10px;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        a:hover {
            background: rgba(41, 128, 185, 0.9);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Employee Salary Management System</h1>
        <a href="empadd.jsp">Add Employee</a>
        <a href="empupdate.jsp">Update Employee</a>
        <a href="empdelete.jsp">Delete Employee</a>
        <a href="empdisplay.jsp">Display Employee</a>
        <a href="reports.jsp">Reports</a>
    </div>
</body>
</html>
