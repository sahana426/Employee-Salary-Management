<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Criteria</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: auto; padding: 20px; }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box; }
        button { margin-top: 20px; padding: 10px 20px; font-size: 16px; }
        .hidden { display: none; }
    </style>
</head>
<body>
    <h2>Select Report Criteria</h2>
    <form action="ReportCriteriaServlet" method="post">
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

        reportType.addEventListener("change", function() {
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

        // Initial hide on page load
        hideAllFields();
    </script>
</body>
</html>
