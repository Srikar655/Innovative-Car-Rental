package com.iss.models;


import javax.persistence.*;

@Entity
public class Drivers {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int DriverNo;
	@Column(nullable=false)
	private String Name;
	@Column(nullable=false,unique=true)
	private String LicenseNumber;
	private String AddressLine1;
	private String AddressLine2;
	@ManyToOne
	@JoinColumn(name="CityNo",referencedColumnName="CityNo")
	private Cities city;
	@ManyToOne
	@JoinColumn(name="StateNo",referencedColumnName="StateNo")
	private States state;
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
	public Drivers( String name, String licenseNumber, String addressLine1, String addressLine2,
			Cities city, States state, String pincode, Countries country, String phoneNumber, String mobileNumber,
			String bankName, String bankAccount, String pAN) {
		super();
		
		Name = name;
		LicenseNumber = licenseNumber;
		AddressLine1 = addressLine1;
		AddressLine2 = addressLine2;
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
	public Drivers() {
		super();
	}
	public int getDriverNo() {
		return DriverNo;
	}
	public void setDriverNo(int driverNo) {
		DriverNo = driverNo;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getLicenseNumber() {
		return LicenseNumber;
	}
	public void setLicenseNumber(String licenseNumber) {
		LicenseNumber = licenseNumber;
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

