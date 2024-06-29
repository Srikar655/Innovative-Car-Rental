package com.iss.models;

import java.sql.Date;

import javax.persistence.*;

@Entity
public class Employees {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int EmployeeNo;
	@Column(nullable=false)
	private String Name;
	@Column(nullable=false)
	private String EmployeeType;
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
	@Column(nullable=false)
	private String EmailAddress;
	@Column(nullable=false)
	private String BankName;
	@Column(nullable=false)
	private String BankAccount;
	@Column(nullable=false)
	private String PAN;
	@Column(nullable=false,unique=true)
	private String Username;
	@Column(nullable=false)
	private String Password;
	private String Cities;
	private String States;
	private String Countries;
	private String Vehicles;
	private String VehicleMakes;
	private String VehicleModels;
	private String Employees;
	private String Customers;
	private String Owners;
	private String Drivers;
	private String Rentals;
	private Date	LastLogin;
	private String Status;
	private String DeleteStatus;
	public Employees(int employeeNo, String name, String employeeType, String addressLine1, String addressLine2,
			com.iss.models.Cities city, com.iss.models.States state, String pincode, com.iss.models.Countries country,
			String phoneNumber, String mobileNumber, String emailAddress, String bankName, String bankAccount,
			String pAN, String username, String password, String cities, String states, String countries,
			String vehicles, String vehicleMakes, String vehicleModels, String employees, String customers,
			String owners, String drivers, String rentals, Date lastLogin, String status, String deleteStatus) {
		super();
		EmployeeNo = employeeNo;
		Name = name;
		EmployeeType = employeeType;
		AddressLine1 = addressLine1;
		AddressLine2 = addressLine2;
		this.city = city;
		this.state = state;
		Pincode = pincode;
		this.country = country;
		PhoneNumber = phoneNumber;
		MobileNumber = mobileNumber;
		EmailAddress = emailAddress;
		BankName = bankName;
		BankAccount = bankAccount;
		PAN = pAN;
		Username = username;
		Password = password;
		Cities = cities;
		States = states;
		Countries = countries;
		Vehicles = vehicles;
		VehicleMakes = vehicleMakes;
		VehicleModels = vehicleModels;
		Employees = employees;
		Customers = customers;
		Owners = owners;
		Drivers = drivers;
		Rentals = rentals;
		LastLogin = lastLogin;
		Status = status;
		DeleteStatus = deleteStatus;
	}
	public Employees() {
		super();
	}
	public int getEmployeeNo() {
		return EmployeeNo;
	}
	public void setEmployeeNo(int employeeNo) {
		EmployeeNo = employeeNo;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmployeeType() {
		return EmployeeType;
	}
	public void setEmployeeType(String employeeType) {
		EmployeeType = employeeType;
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
	public String getEmailAddress() {
		return EmailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		EmailAddress = emailAddress;
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
	public String getCities() {
		return Cities;
	}
	public void setCities(String cities) {
		Cities = cities;
	}
	public String getStates() {
		return States;
	}
	public void setStates(String states) {
		States = states;
	}
	public String getCountries() {
		return Countries;
	}
	public void setCountries(String countries) {
		Countries = countries;
	}
	public String getVehicles() {
		return Vehicles;
	}
	public void setVehicles(String vehicles) {
		Vehicles = vehicles;
	}
	public String getVehicleMakes() {
		return VehicleMakes;
	}
	public void setVehicleMakes(String vehicleMakes) {
		VehicleMakes = vehicleMakes;
	}
	public String getVehicleModels() {
		return VehicleModels;
	}
	public void setVehicleModels(String vehicleModels) {
		VehicleModels = vehicleModels;
	}
	public String getEmployees() {
		return Employees;
	}
	public void setEmployees(String employees) {
		Employees = employees;
	}
	public String getCustomers() {
		return Customers;
	}
	public void setCustomers(String customers) {
		Customers = customers;
	}
	public String getOwners() {
		return Owners;
	}
	public void setOwners(String owners) {
		Owners = owners;
	}
	public String getDrivers() {
		return Drivers;
	}
	public void setDrivers(String drivers) {
		Drivers = drivers;
	}
	public String getRentals() {
		return Rentals;
	}
	public void setRentals(String rentals) {
		Rentals = rentals;
	}
	public Date getLastLogin() {
		return LastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		LastLogin = lastLogin;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getDeleteStatus() {
		return DeleteStatus;
	}
	public void setDeleteStatus(String deleteStatus) {
		DeleteStatus = deleteStatus;
	}
	
}
