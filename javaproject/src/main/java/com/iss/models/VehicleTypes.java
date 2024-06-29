package com.iss.models;

import javax.persistence.*;

@Entity
public class VehicleTypes {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int TypeNo;
	private	String Type;
	
	public VehicleTypes( String type) {
		super();
	
		Type = type;
	}
	public VehicleTypes() {
		super();
	}
	public int getTypeNo() {
		return TypeNo;
	}
	public void setTypeNo(int typeNo) {
		TypeNo = typeNo;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	
}
