<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Criteria</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #f0f4f8, #e2eafc);
            margin: 0;
            padding: 50px 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        form {
            background: white;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
            margin-top: 20px;
            color: #555;
            display: block;
        }

        input, select {
            width: 100%;
            padding: 10px 12px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            box-sizing: border-box;
        }

        button {
            margin-top: 30px;
            padding: 12px;
            width: 100%;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(1.03);
        }

        .hidden {
            display: none;
        }

        /* Responsive touch */
        @media (max-width: 600px) {
            form {
                padding: 30px 20px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <form action="ReportCriteriaServlet" method="post">
        <h2>Select Report Criteria</h2>

        <label for="reportType">Report Type:</label>
        <select id="reportType" name="reportType" required>
            <option value="">-- Select Report --</option>
            <option value="byDate">Employees Joined Between Dates</option>
            <option value="bySalary">Employees by Salary Range</option>
            <option value="byGender">Employees by Gender</option>
            <option value="namePrefix">Employees Whose Names Start With</option>
            <option value="yearsOfService">Employees With N or More Years of Service</option>
            <option value="salaryAbove">Employees Earning More Than a Salary</option>
        </select>

        <div id="dateRangeFields" class="hidden">
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" max="<%=java.time.LocalDate.now()%>">

            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" max="<%=java.time.LocalDate.now()%>">
        </div>

        <div id="salaryRangeFields" class="hidden">
            <label for="minSalary">Minimum Salary:</label>
            <input type="number" id="minSalary" name="minSalary" min="0" step="0.01">

            <label for="maxSalary">Maximum Salary:</label>
            <input type="number" id="maxSalary" name="maxSalary" min="0" step="0.01">
        </div>

        <div id="genderField" class="hidden">
            <label for="gender">Select Gender:</label>
            <select id="gender" name="gender">
                <option value="">--Select--</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div id="namePrefixField" class="hidden">
            <label for="prefix">Name Starts With:</label>
            <input type="text" id="prefix" name="prefix" maxlength="1" pattern="[A-Za-z]" title="Enter a single letter" placeholder="Enter a letter (e.g., A)">
        </div>

        <div id="yearsOfServiceField" class="hidden">
            <label for="years">Minimum Years of Service:</label>
            <input type="number" id="years" name="years" min="0" step="1" placeholder="Enter number of years">
        </div>

        <div id="salaryAboveField" class="hidden">
            <label for="salary">Salary Greater Than:</label>
            <input type="number" id="salary" name="salary" min="0" step="0.01" placeholder="Enter salary amount">
        </div>

        <button type="submit">Generate Report</button>
    </form>

    <script>
        const reportType = document.getElementById("reportType");
        const dateRangeFields = document.getElementById("dateRangeFields");
        const salaryRangeFields = document.getElementById("salaryRangeFields");
        const genderField = document.getElementById("genderField");
        const namePrefixField = document.getElementById("namePrefixField");
        const yearsOfServiceField = document.getElementById("yearsOfServiceField");
        const salaryAboveField = document.getElementById("salaryAboveField");

        function hideAllFields() {
            dateRangeFields.classList.add("hidden");
            salaryRangeFields.classList.add("hidden");
            genderField.classList.add("hidden");
            namePrefixField.classList.add("hidden");
            yearsOfServiceField.classList.add("hidden");
            salaryAboveField.classList.add("hidden");
        }

        reportType.addEventListener("change", function () {
            hideAllFields();
            switch (this.value) {
                case "byDate":
                    dateRangeFields.classList.remove("hidden");
                    break;
                case "bySalary":
                    salaryRangeFields.classList.remove("hidden");
                    break;
                case "byGender":
                    genderField.classList.remove("hidden");
                    break;
                case "namePrefix":
                    namePrefixField.classList.remove("hidden");
                    break;
                case "yearsOfService":
                    yearsOfServiceField.classList.remove("hidden");
                    break;
                case "salaryAbove":
                    salaryAboveField.classList.remove("hidden");
                    break;
            }
        });

        // Initial hide
        hideAllFields();
    </script>
</body>
</html>
