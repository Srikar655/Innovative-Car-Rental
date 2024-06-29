package com.iss.models;


import javax.persistence.*;

@Entity
public class Countries {
	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int CountryNo;
	@Column(nullable=false)
	private String	Country;
	public Countries( String country) {
		super();
		Country = country;
	}
	public Countries() {
		super();
	}
	public int getCountryNo() {
		return CountryNo;
	}
	public void setCountryNo(int countryNo) {
		CountryNo = countryNo;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
}
