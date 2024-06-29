package com.iss.models;

import javax.persistence.*;

@Entity
public class VehicleCapacity {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int CapacityNo;
	private int Capacity;
	
	
	public VehicleCapacity() {
		super();
	}
	public VehicleCapacity( int capacity) {
		super();
		
		Capacity = capacity;
	}
	public int getCapacityNo() {
		return CapacityNo;
	}
	public void setCapacityNo(int capacityNo) {
		CapacityNo = capacityNo;
	}
	public int getCapacity() {
		return Capacity;
	}
	public void setCapacity(int capacity) {
		Capacity = capacity;
	}
	
}
