package com.atm.service;

import java.util.List;

import com.atm.model.Account;
import com.atm.model.Client;

public interface AccountAdminService {

	public List<Account> getAll();
	int saveNewAccount(Account account);
	public int deleteAccount(int idAccount, int idClient);
	public List<Client> getClientsAccount(int idAccount);
	public List<Account> getAccountsClient(int idClient);
}
