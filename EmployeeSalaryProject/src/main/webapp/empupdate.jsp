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
        body { font-family: Arial, sans-serif; padding: 20px; background: #f9fafb; }
        form { background: white; padding: 20px; border-radius: 8px; max-width: 400px; }
        label { display: block; margin: 10px 0 5px; }
        input, select { width: 100%; padding: 8px; margin-bottom: 10px; }
        button { background: #007bff; color: white; border: none; padding: 10px; width: 100%; cursor: pointer; }
        button:hover { background: #0056b3; }
        .error { color: red; }
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
            var empname = document.getElementById("empname")?.value;
            if(empname && !/^[A-Za-z\s]+$/.test(empname)) {
                alert("Employee Name must contain only alphabets and spaces");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
