package com.atm.model;

import java.util.List;

import com.atm.util.Rol;

public class Administrator extends User {
	private static final long serialVersionUID = 1L;
	
	private List<Client> clients;


	public Administrator() {
		super();
	}

	public Administrator(int dni, String name, String lastName, String email, String address, int phone, String info, String rol) {
		super(dni, name, lastName, email, address, phone, info, rol);
		this.setRol(Rol.ADMIN.getRolType());
	}
	
	public final List<Client> getClients() {
		return clients;
	}
	
	public final void setClients(List<Client> clients) {
		this.clients = clients;
	}
}
