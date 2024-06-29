package com.iss.models;


import javax.persistence.*;

@Entity
public class VehicleFuel {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int FuelNo;
	private String Fuel;
	
	
	public VehicleFuel() {
		super();
	}
	public VehicleFuel( String fuel) {
		super();
	
		Fuel = fuel;
	}
	public int getFuelNo() {
		return FuelNo;
	}
	public void setFuelNo(int fuelNo) {
		FuelNo = fuelNo;
	}
	public String getFuel() {
		return Fuel;
	}
	public void setFuel(String fuel) {
		Fuel = fuel;
	}
	
}
