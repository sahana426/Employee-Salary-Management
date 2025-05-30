package com.servlet;

import com.model.Employee;
import com.dao.EmployeeDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("reportType");
        List<Employee> employees = null;
        String reportTitle = "";

        try {
            EmployeeDAO dao = new EmployeeDAO();

            switch (type) {
                case "namePrefix":
                    // parameter is "prefix" in form
                    String prefix = request.getParameter("prefix");
                    if (prefix == null || prefix.isEmpty()) {
                        throw new IllegalArgumentException("Name prefix is required");
                    }
                    employees = dao.getEmployeesByNameStart(prefix);
                    reportTitle = "Employees whose names start with '" + prefix + "'";
                    break;

                case "yearsOfService":
                    // parameter is "years" in form
                    String yearsStr = request.getParameter("years");
                    if (yearsStr == null || yearsStr.isEmpty()) {
                        throw new IllegalArgumentException("Years of service is required");
                    }
                    int years = Integer.parseInt(yearsStr);
                    employees = dao.getEmployeesByYearsOfService(years);
                    reportTitle = "Employees with at least " + years + " years of service";
                    break;

                case "salaryAbove":
                    // parameter is "salary" in form
                    String salaryStr = request.getParameter("salary");
                    if (salaryStr == null || salaryStr.isEmpty()) {
                        throw new IllegalArgumentException("Salary is required");
                    }
                    double salary = Double.parseDouble(salaryStr);
                    employees = dao.getEmployeesBySalaryGreaterThan(salary);
                    reportTitle = "Employees with salary greater than " + salary;
                    break;

                default:
                    request.setAttribute("message", "Invalid report type");
                    request.getRequestDispatcher("report_form.jsp").forward(request, response);
                    return;
            }

        } catch (Exception e) {
            request.setAttribute("message", "Error generating report: " + e.getMessage());
            request.getRequestDispatcher("report_form.jsp").forward(request, response);
            return;
        }

        request.setAttribute("employees", employees);
        request.setAttribute("reportTitle", reportTitle);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}
