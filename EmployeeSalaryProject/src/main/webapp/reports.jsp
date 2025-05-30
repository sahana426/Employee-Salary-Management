<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Reports</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #f9f9f9);
            margin: 0;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #333;
            margin-bottom: 30px;
        }

        a.button {
            display: inline-block;
            padding: 12px 20px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        a.button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        @media (max-width: 500px) {
            .card {
                padding: 30px 20px;
            }

            a.button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Employee Reports</h2>
        <a href="report_form.jsp" class="button">📄 Generate Reports</a>
    </div>
</body>
</html>
