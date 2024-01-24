package com.atm.util;

/**
 * Enumeración que recoge los tipos de movimientos
 */
public enum TransactionType {

	WITHDRAWAL(Constants.WITHDRAWAL),
	DEPOSIT(Constants.DEPOSIT),
	WITHDRAWAL_TRANSACTION(Constants.TRANSACTION_SENDED),
	DEPOSIT_TRANSACTION(Constants.TRANSACTION_RECEIVED);
	
	private String transactType;
	TransactionType(String type) {
		this.transactType = type;
	}
	
	public String getTransactionType() { 
		return transactType;
	}
}