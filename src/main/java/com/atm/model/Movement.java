package com.atm.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Movement implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int idMovement;
	private int idAccount;
	private LocalDateTime transactionDate;
	private double amount;
	private String transactionType;
	
	public Movement() {}

	public Movement(int idMovement, int idAccount, LocalDateTime date, double ammount, String transaction) {
		super();
		this.idMovement = idMovement;
		this.idAccount = idAccount;
		this.setTransactionDate(date);
		this.amount = ammount;
		this.setTransactionType(transaction);
	}


	public Movement(int idAccount, LocalDateTime now, double amount, String transaction) {
		this.idAccount = idAccount;
		this.setTransactionDate(now);
		this.amount = amount;
		this.setTransactionType(transaction);
	}


	public final int getIdMovement() {
		return idMovement;
	}

	public final void setIdMovement(int idMovement) {
		this.idMovement = idMovement;
	}

	public final int getIdAccount() {
		return idAccount;
	}

	public final void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
	}

	public LocalDateTime getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(LocalDateTime transactionDate) {
		this.transactionDate = transactionDate;
	}


	public final double getAmount() {
		return amount;
	}

	public final void setAmount(double ammount) {
		this.amount = ammount;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

}
