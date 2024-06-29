package com.iss.models;

import javax.persistence.*;

@Entity
public class Owners {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int OwnerNo;
	@Column(nullable=false)
	private String Name;
	private String Address1;
	private String Address2;
	@ManyToOne
	@JoinColumn(name="CityNo",referencedColumnName="CityNo")
	private Cities	city;
	@ManyToOne
	@JoinColumn(name="StateNo",referencedColumnName="StateNo")
	private States	state;
	private String Pincode;
	@ManyToOne
	@JoinColumn(name="CountryNo",referencedColumnName="CountryNo")
	private Countries country;
	private String PhoneNumber;
	private String MobileNumber;
	@Column(nullable=false)
	private String BankName;
	@Column(nullable=false)
	private String BankAccount;
	@Column(nullable=false)
	private String PAN;
	private String DeleteStatus;
	
	
	public Owners( String name, String address1, String address2, Cities city, States state, String pincode,
			Countries country, String phoneNumber, String mobileNumber, String bankName, String bankAccount, String pAN) {
		super();
		Name = name;
		Address1 = address1;
		Address2 = address2;
		this.city = city;
		this.state = state;
		Pincode = pincode;
		this.country = country;
		PhoneNumber = phoneNumber;
		MobileNumber = mobileNumber;
		BankName = bankName;
		BankAccount = bankAccount;
		PAN = pAN;
	}
	
	public Owners() {
		super();
	}

	public int getOwnerNo() {
		return OwnerNo;
	}
	public void setOwnerNo(int ownerNo) {
		OwnerNo = ownerNo;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAddress1() {
		return Address1;
	}
	public void setAddress1(String address1) {
		Address1 = address1;
	}
	public String getAddress2() {
		return Address2;
	}
	public void setAddress2(String address2) {
		Address2 = address2;
	}
	public Cities getCity() {
		return city;
	}
	public void setCity(Cities city) {
		this.city = city;
	}
	public States getState() {
		return state;
	}
	public void setState(States state) {
		this.state = state;
	}
	public String getPincode() {
		return Pincode;
	}
	public void setPincode(String pincode) {
		Pincode = pincode;
	}
	public Countries getCountry() {
		return country;
	}
	public void setCountry(Countries country) {
		this.country = country;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public String getMobileNumber() {
		return MobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		MobileNumber = mobileNumber;
	}
	public String getBankName() {
		return BankName;
	}
	public void setBankName(String bankName) {
		BankName = bankName;
	}
	public String getBankAccount() {
		return BankAccount;
	}
	public void setBankAccount(String bankAccount) {
		BankAccount = bankAccount;
	}
	public String getPAN() {
		return PAN;
	}
	public void setPAN(String pAN) {
		PAN = pAN;
	}
	public String getDeleteStatus() {
		return DeleteStatus;
	}
	public void setDeleteStatus(String deleteStatus) {
		DeleteStatus = deleteStatus;
	}
	
	
}
