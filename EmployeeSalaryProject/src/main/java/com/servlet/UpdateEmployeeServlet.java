package com.servlet;

import com.model.Employee;
import com.dao.EmployeeDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class UpdateEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (request.getParameter("fetch") != null) {
                int empno = Integer.parseInt(request.getParameter("empno"));
                Employee emp = new EmployeeDAO().getEmployee(empno);
                request.setAttribute("emp", emp);
                request.setAttribute("empno", empno);
                request.getRequestDispatcher("empupdate.jsp").forward(request, response);
                return;
            }

            int empno = Integer.parseInt(request.getParameter("empno"));
            String name = request.getParameter("empname");
            String doj = request.getParameter("doj");
            String gender = request.getParameter("gender");
            double salary = Double.parseDouble(request.getParameter("bsalary"));

            Employee emp = new Employee();
            emp.setEmpno(empno);
            emp.setEmpname(name);
            emp.setDoj(doj);
            emp.setGender(gender);
            emp.setBsalary(salary);

            new EmployeeDAO().updateEmployee(emp);
            request.setAttribute("message", "Employee updated successfully.");
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }
        request.getRequestDispatcher("empupdate.jsp").forward(request, response);
    }
}
