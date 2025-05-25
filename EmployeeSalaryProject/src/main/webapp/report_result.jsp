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
        body { font-family: Arial, sans-serif; padding: 20px; background: #fafafa; }
        h2 { color: #333; }
        table { border-collapse: collapse; width: 100%; background: white; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #007bff; color: white; }
        .no-data { color: red; margin-top: 20px; }
        a { display: inline-block; margin-top: 15px; text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
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

    <a href="report_form.jsp">Back to Report Criteria</a>
</body>
</html>
