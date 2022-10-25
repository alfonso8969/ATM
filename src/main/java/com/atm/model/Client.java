package com.atm.model;

import java.util.List;

public class Client extends User {
	private static final long serialVersionUID = 1L;

	private List<Account> accounts;

	public Client(int dni, String name, String lastName, String email, String address, int phone, String info, String rol) {
		super(dni, name, lastName, email, address, phone, info, rol);
	}

	public Client() {
	}

	public List<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}
}
