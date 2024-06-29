package com.iss.models;

import javax.persistence.*;

@Entity
public class BankAccounts {
	@Id
	private String accountnumber;
	private double amount;
	public BankAccounts()
	{
		
	}
	public BankAccounts(String accountnumber,double amount)
	{
		this.accountnumber=accountnumber;
		this.amount=amount;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public void setAccountNumber(String accountnumber)
	{
		this.accountnumber=accountnumber;
	}
	public String getAccountNumber()
	{
		return accountnumber;
	}
}

