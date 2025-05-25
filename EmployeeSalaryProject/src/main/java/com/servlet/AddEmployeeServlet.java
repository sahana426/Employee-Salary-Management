package com.servlet;

import com.model.Employee;
import com.dao.EmployeeDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AddEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Employee emp = new Employee();
            emp.setEmpno(Integer.parseInt(request.getParameter("empno")));
            emp.setEmpname(request.getParameter("empname"));
            emp.setDoj(request.getParameter("doj"));
            emp.setGender(request.getParameter("gender"));
            emp.setBsalary(Double.parseDouble(request.getParameter("bsalary")));

            EmployeeDAO dao = new EmployeeDAO();
            dao.addEmployee(emp);

            request.setAttribute("message", "Employee added successfully!");
            request.getRequestDispatcher("empadd.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("empadd.jsp").forward(request, response);
        }
    }
}
