package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class DisplayEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String empnoParam = request.getParameter("empno");
        try {
            int empno = Integer.parseInt(empnoParam);
            EmployeeDAO dao = new EmployeeDAO();
            Employee emp = dao.getEmployee(empno);

            if (emp != null) {
                request.setAttribute("employee", emp);
            } else {
                request.setAttribute("message", "Employee not found for EmpNo: " + empno);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid EmpNo entered.");
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }

        RequestDispatcher rd = request.getRequestDispatcher("empdisplay.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response); // optional support for GET
    }
}
