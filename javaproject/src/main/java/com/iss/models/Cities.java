package com.iss.models;


import javax.persistence.*;

@Entity
public class Cities {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int CityNo;
	@ManyToOne
	@JoinColumn(name="StateNo",nullable=false,referencedColumnName="StateNo")
	private States	state;
	@Column(nullable=false)
	private String CityName;
	public Cities( States state, String cityName) {
		super();
		this.state = state;
		CityName = cityName;
	}
	public Cities() {
		super();
	}
	public int getCityNo() {
		return CityNo;
	}
	public void setCityNo(int cityNo) {
		CityNo = cityNo;
	}
	public States getState() {
		return state;
	}
	public void setState(States state) {
		this.state = state;
	}
	public String getCityName() {
		return CityName;
	}
	public void setCityName(String cityName) {
		CityName = cityName;
	}
	
	
	
}
