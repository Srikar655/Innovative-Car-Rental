package com.iss.models;

import javax.persistence.*;

@Entity
public class EmployeeTypes {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int EmployeeTypeNo;
	private String Type;
	public EmployeeTypes( String type) {
		super();
		Type = type;
	}
	public EmployeeTypes() {
		super();
	}
	public int getEmployeeTypeNo() {
		return EmployeeTypeNo;
	}
	public void setEmployeeTypeNo(int employeeTypeNo) {
		EmployeeTypeNo = employeeTypeNo;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	
}
