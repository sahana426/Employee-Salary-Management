package com.servlet;

import com.dao.EmployeeDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class DeleteEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            new EmployeeDAO().deleteEmployee(empno);
            request.setAttribute("message", "Employee deleted successfully.");
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }
        request.getRequestDispatcher("empdelete.jsp").forward(request, response);
    }
}
