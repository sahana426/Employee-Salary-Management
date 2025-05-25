package com.dao;

import java.sql.*;
import java.util.*;
import com.model.Employee;

public class EmployeeDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedb", "root", "");
    }

    public boolean addEmployee(Employee emp) throws Exception {
        String sql = "INSERT INTO Employee (Empno, EmpName, DoJ, Gender, Bsalary) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, emp.getEmpno());
            ps.setString(2, emp.getEmpname());
            ps.setString(3, emp.getDoj());
            ps.setString(4, emp.getGender());
            ps.setDouble(5, emp.getBsalary());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateEmployee(Employee emp) throws Exception {
        String sql = "UPDATE Employee SET EmpName=?, DoJ=?, Gender=?, Bsalary=? WHERE Empno=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, emp.getEmpname());
            ps.setString(2, emp.getDoj());
            ps.setString(3, emp.getGender());
            ps.setDouble(4, emp.getBsalary());
            ps.setInt(5, emp.getEmpno());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteEmployee(int empno) throws Exception {
        String sql = "DELETE FROM Employee WHERE Empno=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, empno);
            return ps.executeUpdate() > 0;
        }
    }

    public Employee getEmployee(int empno) throws Exception {
        String sql = "SELECT * FROM Employee WHERE Empno=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, empno);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpname(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ").toString());
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                return emp;
            }
            return null;
        }
    }

    public List<Employee> getAllEmployees() throws Exception {
        String sql = "SELECT * FROM Employee";
        List<Employee> list = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpname(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ").toString());
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                list.add(emp);
            }
        }
        return list;
    }

    // ============================
    // Report Methods (Fully implemented)
    // ============================

    public List<Employee> getEmployeesByNamePrefix(String prefix) throws Exception {
        String sql = "SELECT * FROM Employee WHERE EmpName LIKE ?";
        List<Employee> list = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, prefix + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpname(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ").toString());
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                list.add(emp);
            }
        }
        return list;
    }

    public List<Employee> getEmployeesWithMinYears(int years) throws Exception {
        String sql = "SELECT * FROM Employee WHERE TIMESTAMPDIFF(YEAR, DoJ, CURDATE()) >= ?";
        List<Employee> list = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, years);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpname(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ").toString());
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                list.add(emp);
            }
        }
        return list;
    }

    public List<Employee> getEmployeesWithSalaryAbove(double salary) throws Exception {
        String sql = "SELECT * FROM Employee WHERE Bsalary > ?";
        List<Employee> list = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, salary);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpname(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ").toString());
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                list.add(emp);
            }
        }
        return list;
    }

    public List<Employee> getEmployeesByJoiningDateRange(String startDate, String endDate) throws Exception {
        String sql = "SELECT * FROM Employee WHERE DoJ BETWEEN ? AND ?";
        List<Employee> list = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpname(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ").toString());
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                list.add(emp);
            }
        }
        return list;
    }

    public List<Employee> getEmployeesBySalaryRange(double minSalary, double maxSalary) throws Exception {
        String sql = "SELECT * FROM Employee WHERE Bsalary BETWEEN ? AND ?";
        List<Employee> list = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, minSalary);
            ps.setDouble(2, maxSalary);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpname(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ").toString());
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                list.add(emp);
            }
        }
        return list;
    }

    public List<Employee> getEmployeesByGender(String gender) throws Exception {
        String sql = "SELECT * FROM Employee WHERE Gender = ?";
        List<Employee> list = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, gender);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpname(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ").toString());
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                list.add(emp);
            }
            
        }
        return list;
    }
    

    public List<Employee> getEmployeesByNameStart(String nameStart) throws Exception {
        return getEmployeesByNamePrefix(nameStart);
    }

    public List<Employee> getEmployeesByYearsOfService(int years) throws Exception {
        return getEmployeesWithMinYears(years);
    }

    public List<Employee> getEmployeesBySalaryGreaterThan(double salary) throws Exception {
        return getEmployeesWithSalaryAbove(salary);
    }
}
