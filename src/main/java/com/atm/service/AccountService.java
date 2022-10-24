package com.atm.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.atm.model.Account;

public interface AccountService {

	List<Account> getAccounts();
	Account getAccount(int idAccount);
	int updateAccount(int idAccount, double amount, String operation);
	int checkBalance(int idAccount, double amount);
	boolean setAccount(HttpSession session, int idAccount);
}
