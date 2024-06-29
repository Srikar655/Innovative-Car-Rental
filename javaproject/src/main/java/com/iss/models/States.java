package com.iss.models;

import javax.persistence.*;

@Entity
public class States {
	
	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int StateNo;
	@ManyToOne
	@JoinColumn(name="CountryNo",nullable=false,referencedColumnName="CountryNo")
	private Countries country;
	@Column(nullable=false)
	private String StateName;
	public States( Countries country, String stateName) {
		super();
	
		this.country = country;
		StateName = stateName;
	}
	public States() {
		super();
	}
	public int getStateNo() {
		return StateNo;
	}
	public void setStateNo(int stateNo) {
		StateNo = stateNo;
	}
	public Countries getCountry() {
		return country;
	}
	public void setCountry(Countries country) {
		this.country = country;
	}
	public String getStateName() {
		return StateName;
	}
	public void setStateName(String stateName) {
		StateName = stateName;
	}
	
}
