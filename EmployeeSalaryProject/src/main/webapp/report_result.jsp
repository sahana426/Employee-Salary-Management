<%@ page import="java.util.List" %>
<%@ page import="com.model.Employee" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    List<Employee> employees = (List<Employee>) request.getAttribute("employees");
    String reportTitle = (String) request.getAttribute("reportTitle");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Report Results</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #f0f4f8, #e2eafc);
            margin: 0;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        thead th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: left;
        }

        tbody td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .no-data {
            color: #d9534f;
            font-size: 16px;
            text-align: center;
            margin: 20px 0;
        }

        a.back-link {
            display: inline-block;
            text-align: center;
            margin-top: 20px;
            padding: 10px 16px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        a.back-link:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            table, thead, tbody, th, td, tr {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><%= reportTitle != null ? reportTitle : "Report Results" %></h2>

        <%
            if (employees != null && !employees.isEmpty()) {
        %>
            <table>
                <thead>
                    <tr>
                        <th>Emp No</th>
                        <th>Name</th>
                        <th>Date of Joining</th>
                        <th>Gender</th>
                        <th>Basic Salary</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Employee emp : employees) { %>
                        <tr>
                            <td><%= emp.getEmpno() %></td>
                            <td><%= emp.getEmpname() %></td>
                            <td><%= emp.getDoj() %></td>
                            <td><%= emp.getGender() %></td>
                            <td><%= emp.getBsalary() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <%
            } else {
        %>
            <p class="no-data">No employees found matching the criteria.</p>
        <%
            }
        %>

        <div style="text-align: center;">
            <a href="report_form.jsp" class="back-link">⬅ Back to Report Criteria</a>
        </div>
    </div>
</body>
</html>
