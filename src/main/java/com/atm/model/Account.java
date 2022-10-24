package com.atm.model;

import java.io.Serializable;
import java.util.List;

public class Account implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	
	private int idAccount;
	private int idClient;
	private double balance;
	private String accountType;
	private List<Movement> movements;

	public Account(int idAccount, double accountBalance, String accountType) {
		super();
		this.idAccount = idAccount;
		this.balance = accountBalance;
		this.accountType = accountType;
	}
	
	public Account(int idAccount, int idClient, double balance, String accountType, List<Movement> movements) {
		super();
		this.idAccount = idAccount;
		this.setIdClient(idClient);
		this.balance = balance;
		this.accountType = accountType;
		this.movements = movements;
	}

	public Account() {
		// Auto-generated constructor stub
	}

	public List<Movement> getMovements() {
		return movements;
	}

	public void setMovements(List<Movement> movements) {
		this.movements = movements;
	}

	public final int getIdAccount() {
		return idAccount;
	}

	public final void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
	}

	public int getIdClient() {
		return idClient;
	}

	public void setIdClient(int idClient) {
		this.idClient = idClient;
	}



	public final double getBalance() {
		return balance;
	}

	public final void setBalance(double balance) {
		this.balance = balance;
	}

	public final String getAccountType() {
		return accountType;
	}

	public final void setAccountType(String accountType) {
		this.accountType = accountType;
	}

}
