<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
    <style>
        body { font-family: Arial, sans-serif; background: #eef2f7; padding: 20px; }
        form { background: white; padding: 20px; border-radius: 8px; max-width: 400px; }
        label { display: block; margin: 10px 0 5px; }
        input, select { width: 100%; padding: 8px; margin-bottom: 10px; }
        button { background: #28a745; color: white; border: none; padding: 10px; width: 100%; cursor: pointer; }
        button:hover { background: #218838; }
        .error { color: red; }
    </style>
</head>
<body>
    <h2>Add New Employee</h2>
    <form action="AddEmployeeServlet" method="post" onsubmit="return validateForm()">
        <label for="empno">Employee Number:</label>
        <input type="number" id="empno" name="empno" required min="1">

        <label for="empname">Employee Name:</label>
        <input type="text" id="empname" name="empname" required pattern="[A-Za-z\s]+" title="Only alphabets and spaces">

        <label for="doj">Date of Joining:</label>
        <input type="date" id="doj" name="doj" required max="<%=java.time.LocalDate.now()%>">

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="">--Select--</option>
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
        </select>

        <label for="bsalary">Basic Salary:</label>
        <input type="number" id="bsalary" name="bsalary" required min="0" step="0.01">

        <button type="submit">Add Employee</button>
    </form>

    <script>
        function validateForm() {
            var empname = document.getElementById("empname").value;
            if (!/^[A-Za-z\s]+$/.test(empname)) {
                alert("Employee Name must contain only alphabets and spaces");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
