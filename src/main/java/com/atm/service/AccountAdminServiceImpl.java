package com.atm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.dao.AccountAdminDao;
import com.atm.dao.AccountDao;
import com.atm.model.Account;
import com.atm.model.Client;

@Service
public class AccountAdminServiceImpl implements  AccountAdminService {

	@Autowired
	private AccountAdminDao adRepository;
	
	@Autowired
	private AccountDao accRepository;
	
	@Override
	public List<Account> getAll() {
		return accRepository.findAll();
	}

	@Override
	public int saveNewAccount(Account account) {
		return adRepository.saveNewAccount(account);
	}

	@Override
	public int deleteAccount(int idAccount, int idClient) {
		return adRepository.deleteAccount(idAccount, idClient);
	}

	@Override
	public List<Client> getClientsAccount(int idAccount) {
		return adRepository.getClientsOfAccount(idAccount);
	}

	@Override
	public List<Account> getAccountsClient(int idClient) {
		return adRepository.getAccountsOfClient(idClient);
	}

}
