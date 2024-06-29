package com.iss.models;

import java.sql.Date;

import javax.persistence.*;

@Entity
public class Customers {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int CustomerNo;
	@Column(nullable=false)
	private String Name;
	@Column(nullable=false)
	private String EmailAddress;
	private String AddressLine1;
	private String AddressLine2;
	@ManyToOne
	@JoinColumn(name="CityNo",referencedColumnName="CityNo")
	private Cities	city;
	@ManyToOne
	@JoinColumn(name="StateNo",referencedColumnName="StateNo")
	private States	state;
	private String Pincode;
	@ManyToOne
	@JoinColumn(name="CountryNo",referencedColumnName="CountryNo")
	private Countries	country;
	private String PhoneNumber;
	private String MobileNumber;
	private Date	RegistrationDate;
	@Column(unique=true)
	private String Username;
	private String Password;
	private Date LastLogin;
	private String DeleteStatus;
	public Customers(int customerNo, String name, String emailAddress, String addressLine1, String addressLine2,
			Cities city, States state, String pincode, Countries country, String phoneNumber, String mobileNumber,
			Date registrationDate, String username, String password, Date lastLogin, String deleteStatus) {
		super();
		CustomerNo = customerNo;
		Name = name;
		EmailAddress = emailAddress;
		AddressLine1 = addressLine1;
		AddressLine2 = addressLine2;
		this.city = city;
		this.state = state;
		Pincode = pincode;
		this.country = country;
		PhoneNumber = phoneNumber;
		MobileNumber = mobileNumber;
		RegistrationDate = registrationDate;
		Username = username;
		Password = password;
		LastLogin = lastLogin;
		DeleteStatus = deleteStatus;
	}
	public Customers() {
		super();
	}
	public int getCustomerNo() {
		return CustomerNo;
	}
	public void setCustomerNo(int customerNo) {
		CustomerNo = customerNo;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmailAddress() {
		return EmailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		EmailAddress = emailAddress;
	}
	public String getAddressLine1() {
		return AddressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		AddressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return AddressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		AddressLine2 = addressLine2;
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
	public Date getRegistrationDate() {
		return RegistrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		RegistrationDate = registrationDate;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public Date getLastLogin() {
		return LastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		LastLogin = lastLogin;
	}
	public String getDeleteStatus() {
		return DeleteStatus;
	}
	public void setDeleteStatus(String deleteStatus) {
		DeleteStatus = deleteStatus;
	}
	
}
