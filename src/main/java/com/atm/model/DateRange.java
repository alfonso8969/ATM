package com.atm.model;

import java.sql.Timestamp;

public class DateRange {

	private int idAccount;
	private Timestamp dateFrom;
	private Timestamp dateTo;

	public int getIdAccount() {
		return idAccount;
	}

	public void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
	}

	public final Timestamp getDateFrom() {
		return dateFrom;
	}

	public final void setDateFrom(Timestamp dateFrom) {
		this.dateFrom = dateFrom;
	}

	public final Timestamp getDateTo() {
		return dateTo;
	}

	public final void setDateTo(Timestamp dateTo) {
		this.dateTo = dateTo;
	}
}
