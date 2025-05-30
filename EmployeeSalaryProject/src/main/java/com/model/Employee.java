package com.model;

import java.sql.Date;

public class Employee {
    private int empno;
    private String empname;
    private String doj;
    private String gender;
    private double bsalary;

    // Getters and setters
    public int getEmpno() { return empno; }
    public void setEmpno(int empno) { this.empno = empno; }

    public String getEmpname() { return empname; }
    public void setEmpname(String empname) { this.empname = empname; }

    public String getDoj() { return doj; }
    public void setDoj(String date) { this.doj = date; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public double getBsalary() { return bsalary; }
    public void setBsalary(double bsalary) { this.bsalary = bsalary; }
		
	}

