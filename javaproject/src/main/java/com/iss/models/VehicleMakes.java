package com.iss.models;

import javax.persistence.*;

@Entity
public class VehicleMakes {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int	MakeNo;
	@Column(nullable=false)
	private String	Name;
	public VehicleMakes( String name) {
		super();
		
		Name = name;
	}
	public VehicleMakes() {
		super();
	}
	public int getMakeNo() {
		return MakeNo;
	}
	public void setMakeNo(int makeNo) {
		MakeNo = makeNo;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	
}
