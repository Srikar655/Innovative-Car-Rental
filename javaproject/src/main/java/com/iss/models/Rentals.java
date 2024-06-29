package com.iss.models;


import java.util.Date;

import javax.persistence.*;

@Entity
public class Rentals {

	@Id
	@Column(nullable=false)
	@GeneratedValue
	private int RenatalNo;
	@ManyToOne
	@JoinColumn(name="CustomerNo",nullable=false,referencedColumnName="CustomerNo")
	private Customers	customer;
	@ManyToOne
	@JoinColumn(name="VehicleNo",nullable=false,referencedColumnName="VehicleNo")
	private Vehicles	vehicle;
	@ManyToOne
	@JoinColumn(name="DriverNo",referencedColumnName="DriverNo")
	private Drivers	driver;
	@ManyToOne
	@JoinColumn(name="EmployeeNo",referencedColumnName="EmployeeNo")
	private Employees	employee;
	@Column(nullable=false)
	private Date	ReservationDate;
	@Column(nullable=false)
	private int VehicleRate;
	private int NoofDays;
	@Column(nullable=false)
	private Date StartDate;
	@Column(nullable=false)
	private Date EndDate;
	private int NoOfKMS;
	private int StartKMS;
	private int EndKMS;
	@ManyToOne
	@JoinColumn(name="SourceLocation",nullable=false,referencedColumnName="CityNo")
	private Cities SourceLocation;
	@ManyToOne
	@JoinColumn(name="DestinationLocation",nullable=false,referencedColumnName="CityNo")
	private Cities DestinationLocation;
	private String TravelPurpose;
	private String Status;
	public Rentals(int renatalNo, Customers customer, Vehicles vehicle, Drivers driver, Employees employee,
			Date reservationDate, int vehicleRate, int noofDays, Date startDate, Date endDate, int noOfKMS,
			int startKMS, int endKMS, Cities sourceLocation, Cities destinationLocation, String travelPurpose,
			String status) {
		super();
		RenatalNo = renatalNo;
		this.customer = customer;
		this.vehicle = vehicle;
		this.driver = driver;
		this.employee = employee;
		ReservationDate = reservationDate;
		VehicleRate = vehicleRate;
		NoofDays = noofDays;
		StartDate = startDate;
		EndDate = endDate;
		NoOfKMS = noOfKMS;
		StartKMS = startKMS;
		EndKMS = endKMS;
		SourceLocation = sourceLocation;
		DestinationLocation = destinationLocation;
		TravelPurpose = travelPurpose;
		Status = status;
	}
	public Rentals() {
		super();
	}
	public int getRenatalNo() {
		return RenatalNo;
	}
	public void setRenatalNo(int renatalNo) {
		RenatalNo = renatalNo;
	}
	public Customers getCustomer() {
		return customer;
	}
	public void setCustomer(Customers customer) {
		this.customer = customer;
	}
	public Vehicles getVehicle() {
		return vehicle;
	}
	public void setVehicle(Vehicles vehicle) {
		this.vehicle = vehicle;
	}
	public Drivers getDriver() {
		return driver;
	}
	public void setDriver(Drivers driver) {
		this.driver = driver;
	}
	public Employees getEmployee() {
		return employee;
	}
	public void setEmployee(Employees employee) {
		this.employee = employee;
	}
	public Date getReservationDate() {
		return ReservationDate;
	}
	public void setReservationDate(Date reservationDate) {
		ReservationDate = reservationDate;
	}
	public int getVehicleRate() {
		return VehicleRate;
	}
	public void setVehicleRate(int vehicleRate) {
		VehicleRate = vehicleRate;
	}
	public int getNoofDays() {
		return NoofDays;
	}
	public void setNoofDays(int noofDays) {
		NoofDays = noofDays;
	}
	public Date getStartDate() {
		return StartDate;
	}
	public void setStartDate(Date startDate) {
		StartDate = startDate;
	}
	public Date getEndDate() {
		return EndDate;
	}
	public void setEndDate(Date endDate) {
		EndDate = endDate;
	}
	public int getNoOfKMS() {
		return NoOfKMS;
	}
	public void setNoOfKMS(int noOfKMS) {
		NoOfKMS = noOfKMS;
	}
	public int getStartKMS() {
		return StartKMS;
	}
	public void setStartKMS(int startKMS) {
		StartKMS = startKMS;
	}
	public int getEndKMS() {
		return EndKMS;
	}
	public void setEndKMS(int endKMS) {
		EndKMS = endKMS;
	}
	public Cities getSourceLocation() {
		return SourceLocation;
	}
	public void setSourceLocation(Cities sourceLocation) {
		SourceLocation = sourceLocation;
	}
	public Cities getDestinationLocation() {
		return DestinationLocation;
	}
	public void setDestinationLocation(Cities destinationLocation) {
		DestinationLocation = destinationLocation;
	}
	public String getTravelPurpose() {
		return TravelPurpose;
	}
	public void setTravelPurpose(String travelPurpose) {
		TravelPurpose = travelPurpose;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	
}
