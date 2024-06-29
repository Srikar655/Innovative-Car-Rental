package com.iss.models;

import javax.persistence.*;

@Entity
public class VehicleModels {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int ModelNo;
	@ManyToOne
	@JoinColumn(name="MakeNo",nullable=false,referencedColumnName="MakeNo")
	private VehicleMakes	vehiclemakes;
	@Column(nullable=false)
	private String	Name;
	public VehicleModels( VehicleMakes vehiclemakes, String name) {
		super();
		
		this.vehiclemakes = vehiclemakes;
		Name = name;
	}
	public VehicleModels() {
		super();
	}
	public int getModelNo() {
		return ModelNo;
	}
	public void setModelNo(int modelNo) {
		ModelNo = modelNo;
	}
	public VehicleMakes getVehiclemakes() {
		return vehiclemakes;
	}
	public void setVehiclemakes(VehicleMakes vehiclemakes) {
		this.vehiclemakes = vehiclemakes;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	
	
}
