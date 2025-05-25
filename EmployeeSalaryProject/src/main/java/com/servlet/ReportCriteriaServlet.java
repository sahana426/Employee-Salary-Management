package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ReportCriteriaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");

        EmployeeDAO dao = new EmployeeDAO();
        List<Employee> employees = null;
        String reportTitle = null;

        try {
            switch (reportType) {
                case "byDate":
                    String startDate = request.getParameter("startDate");
                    String endDate = request.getParameter("endDate");
                    employees = dao.getEmployeesByJoiningDateRange(startDate, endDate);
                    reportTitle = "Employees Joined Between " + startDate + " and " + endDate;
                    break;

                case "bySalary":
                    String minSalaryStr = request.getParameter("minSalary");
                    String maxSalaryStr = request.getParameter("maxSalary");
                    double minSalary = minSalaryStr != null && !minSalaryStr.isEmpty() ? Double.parseDouble(minSalaryStr) : 0;
                    double maxSalary = maxSalaryStr != null && !maxSalaryStr.isEmpty() ? Double.parseDouble(maxSalaryStr) : Double.MAX_VALUE;
                    employees = dao.getEmployeesBySalaryRange(minSalary, maxSalary);
                    reportTitle = "Employees with Salary between " + minSalary + " and " + maxSalary;
                    break;

                case "byGender":
                    String gender = request.getParameter("gender");
                    employees = dao.getEmployeesByGender(gender);
                    reportTitle = "Employees with Gender: " + gender;
                    break;

                // New additional reports

                case "namePrefix":
                    String prefix = request.getParameter("prefix");
                    employees = dao.getEmployeesByNamePrefix(prefix);
                    reportTitle = "Employees whose names start with '" + prefix + "'";
                    break;

                case "yearsOfService":
                    String yearsStr = request.getParameter("years");
                    int years = 0;
                    if (yearsStr != null && !yearsStr.isEmpty()) {
                        years = Integer.parseInt(yearsStr);
                    }
                    employees = dao.getEmployeesWithMinYears(years);
                    reportTitle = "Employees with " + years + " or more years of service";
                    break;

                case "salaryAbove":
                    String salaryStr = request.getParameter("salary");
                    double salary = 0;
                    if (salaryStr != null && !salaryStr.isEmpty()) {
                        salary = Double.parseDouble(salaryStr);
                    }
                    employees = dao.getEmployeesWithSalaryAbove(salary);
                    reportTitle = "Employees earning more than " + salary;
                    break;

                default:
                    request.setAttribute("message", "Invalid report type selected.");
                    request.getRequestDispatcher("report_form.jsp").forward(request, response);
                    return;
            }
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("report_form.jsp").forward(request, response);
            return;
        }

        request.setAttribute("employees", employees);
        request.setAttribute("reportTitle", reportTitle);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}
