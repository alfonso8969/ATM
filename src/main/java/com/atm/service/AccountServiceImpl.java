package com.atm.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.dao.AccountDao;
import com.atm.model.Account;
import com.atm.util.TransactionType;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountDao aRepository;
	
	@Override
	public List<Account> getAccounts() {
		return aRepository.findAll();
	}
	
	@Override
	public Account getAccount(int idAccount) {
		return aRepository.findById(idAccount);
	}

	@Override
	public int updateAccount(int idAccount, double amount, String operation) {
		return aRepository.updateAccountBalance(idAccount, amount, TransactionType.valueOf(operation));
	}

	@Override
	public int checkBalance(int idAccount, double amount) {		
		return aRepository.findBalanceByIdAccount(idAccount, amount);
	}

	@Override
	public boolean setAccount(HttpSession session, int idAccount) {
		return aRepository.setSessionAccount(session, idAccount);
	}
}
