<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.dao.EmployeeDAO, com.model.Employee" %>
<%
    String empnoParam = request.getParameter("empno");
    Employee emp = null;
    String message = null;
    if(empnoParam != null) {
        try {
            int empno = Integer.parseInt(empnoParam);
            EmployeeDAO dao = new EmployeeDAO();
            emp = dao.getEmployee(empno);
            if(emp == null) {
                message = "Employee with Empno " + empno + " not found.";
            }
        } catch(Exception e) {
            message = "Invalid Empno or error: " + e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Employee</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 40px;
            background: linear-gradient(to right, #f0f4f8, #e2eafc);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            margin-bottom: 30px;
            color: #333;
        }

        form {
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            max-width: 450px;
            width: 100%;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            color: #555;
            display: block;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button[name="fetch"] {
            background-color: #17a2b8;
            color: white;
        }

        button[name="fetch"]:hover {
            background-color: #138496;
            transform: scale(1.03);
        }

        button[name="update"] {
            background-color: #28a745;
            color: white;
        }

        button[name="update"]:hover {
            background-color: #218838;
            transform: scale(1.03);
        }

        .error {
            color: #dc3545;
            font-weight: bold;
            margin-top: 20px;
            text-align: center;
        }

        hr {
            margin: 30px 0;
            border: none;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <h2>Update Employee</h2>

    <form action="UpdateEmployeeServlet" method="post" onsubmit="return validateForm()">
        <label for="empno">Enter Employee Number to Update:</label>
        <input type="number" name="empno" id="empno" value="<%=empnoParam != null ? empnoParam : ""%>" required min="1">
        <button type="submit" name="fetch">Fetch Employee Details</button>
    </form>

    <%
        if(emp != null) {
    %>
        <hr>
        <form action="UpdateEmployeeServlet" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="empno" value="<%=emp.getEmpno()%>">

            <label for="empname">Employee Name:</label>
            <input type="text" id="empname" name="empname" value="<%=emp.getEmpname()%>" required pattern="[A-Za-z\s]+" title="Only alphabets and spaces">

            <label for="doj">Date of Joining:</label>
            <input type="date" id="doj" name="doj" value="<%=emp.getDoj()%>" required max="<%=java.time.LocalDate.now()%>">

            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="">--Select--</option>
                <option <%=emp.getGender().equalsIgnoreCase("Male") ? "selected" : ""%>>Male</option>
                <option <%=emp.getGender().equalsIgnoreCase("Female") ? "selected" : ""%>>Female</option>
                <option <%=emp.getGender().equalsIgnoreCase("Other") ? "selected" : ""%>>Other</option>
            </select>

            <label for="bsalary">Basic Salary:</label>
            <input type="number" id="bsalary" name="bsalary" value="<%=emp.getBsalary()%>" required min="0" step="0.01">

            <button type="submit" name="update">Update Employee</button>
        </form>
    <%
        } else if(message != null) {
    %>
        <p class="error"><%=message%></p>
    <%
        }
    %>

    <script>
        function validateForm() {
            const empname = document.getElementById("empname")?.value;
            if (empname && !/^[A-Za-z\s]+$/.test(empname)) {
                alert("Employee Name must contain only alphabets and spaces");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
