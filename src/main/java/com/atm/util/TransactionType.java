package com.atm.util;

/**
 * Enumeración que recoge los tipos de movimientos
 */
public enum TransactionType {

	WITHDRAWL(Constants.WITHDRAWL),
	DEPOSIT(Constants.DEPOSIT),
	WITHDRAWL_TRANSACTION(Constants.TRANSACTION_SENDED),
	DEPOSIT_TRANSACTION(Constants.TRANSACTION_RECIVED);
	
	private String transactType;
	TransactionType(String type) {
		this.transactType = type;
	}
	
	public String getTransactionType() { 
		return transactType;
	}
}