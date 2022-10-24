package com.atm.model;

import java.io.Serializable;

public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int dni;
	private String name;
	private String lastName;
	private String email;
	private String address;
	private String info;
	private int phone;
	private String rol;
	
	public User() {
		super();
	}

	public User(int doc, String name, String lastName, String email, String address, int phone, String info, String rol) {
		super();
		dni = doc;
		this.name = name;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.info = info;
		this.rol = rol;
	}

	public int getDni() {
		return dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}

	public final String getName() {
		return name;
	}

	public final void setName(String name) {
		this.name = name;
	}

	public final String getAddress() {
		return address;
	}

	public final void setAddress(String address) {
		this.address = address;
	}

	public final int getPhone() {
		return phone;
	}

	public final void setPhone(int phone) {
		this.phone = phone;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
}
