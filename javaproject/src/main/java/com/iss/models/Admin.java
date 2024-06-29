package com.iss.models;
import javax.persistence.*;

@Entity
public class Admin {
	@Id
	@GeneratedValue
	private int adminno;
	@Column(unique=true)
	private String Username;
	private String Password;
	public Admin(int adminno, String username, String password) {
		super();
		this.adminno = adminno;
		Username = username;
		Password = password;
	}
	public Admin()
	{
		
	}
	public int getAdminno() {
		return adminno;
	}
	public void setAdminno(int adminno) {
		this.adminno = adminno;
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
	
}
