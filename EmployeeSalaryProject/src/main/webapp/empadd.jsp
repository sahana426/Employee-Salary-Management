<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
    <style>
        /* Full-page gradient background */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        /* Form container */
        form {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin: 12px 0 6px;
            font-weight: bold;
            color: #444;
        }

        input, select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            margin-bottom: 15px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input:focus, select:focus {
            border-color: #007BFF;
            outline: none;
        }

        button {
            background: #28a745;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            font-size: 16px;
            font-weight: bold;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: #218838;
            transform: scale(1.03);
        }

        .error {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form action="AddEmployeeServlet" method="post" onsubmit="return validateForm()">
        <h2>Add New Employee</h2>

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
