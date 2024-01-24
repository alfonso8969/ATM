package com.atm.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.atm.model.Account;
import com.atm.model.Client;
import com.atm.service.MovementService;
import com.atm.util.Constants;

@Repository
public class AccountAdminDaoImpl implements AccountAdminDao {

	@Autowired
	private MovementService movser;
	
	@Autowired
	private JdbcTemplate template;
	
	@Override
	public int saveNewAccount(Account account) {
		String query = "INSERT INTO cuentas (idAccount, balance, accountType) VALUES (?,?,?)";
		try {
			if (referenceAccountClient(account.getIdAccount(), account.getIdClient()) != 0) {
				return template.update(query, account.getIdAccount(), account.getBalance(), account.getAccountType());
			}
			return 0;
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.severe("Fallo en crear cuenta: " + sqle.getMessage());
			return 0;
		}				
	}

	@Override
	public int deleteAccount(int idAccount, int idClient) {
		String query = "DELETE FROM cuentas WHERE idAccount = ?";
		try {
			if(deleteReferenceAccountClient(idAccount, idClient) != 0 && template.update(query, idAccount) != 0) {
				return movser.deleteMovements(idAccount);
			}			
			return 0;
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.severe("Fallo en borrar cuenta: " + sqle.getMessage());
			return 0;
		}
	}

	@Override
	public int updateAccount(Account account, int idAccount) {
		String query = "UPDATE cuentas SET balance = ?, accountType = ? WHERE idAccount = ?";
		try {
			return template.update(query,  
				account.getBalance(),
					  account.getAccountType(),
					  idAccount);			
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.severe("Fallo en actualizar cuenta: " + sqle.getMessage());
			return 0;
		}
	}

	@Override
	public int referenceAccountClient(int idAccount, int idClient) {
		String query = "INSERT INTO titulares (idAccount, idCliente) VALUES (?,?)";
		try {
			return template.update(query, idAccount, idClient);
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.severe("Fallo en crear relación cliente/cuenta usuarios: " + sqle.getMessage());
			return 0;
		}	
	}

	@Override
	public int deleteReferenceAccountClient(int idAccount, int idClient) {
		String query = "DELETE FROM titulares WHERE idClient = ? AND idAccount = ?";
		try {
			return template.update(query, idAccount, idClient);
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.severe("Fallo en borrar relación cliente/cuenta usuarios: " + sqle.getMessage());
			return 0;
		}	
	}

	@Override
	public List<Client> getClientsOfAccount(int idAccount) {
		String query = "SELECT * FROM clientes WHERE dni IN (SELECT idClient FROM titulares WHERE idAccount = ?)";
		try {
			return template.query(query, new BeanPropertyRowMapper<Client>(Client.class), idAccount );
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.severe("Fallo en conseguir clientes cuenta: " + sqle.getMessage());
			return new ArrayList<>();
		}	
	}

	@Override
	public List<Account> getAccountsOfClient(int idClient) {
		String query = "SELECT * FROM cuentas WHERE idAccount IN (SELECT idAccount FROM titulares WHERE idCliente = ?)";
		try {
			return template.query(query, new BeanPropertyRowMapper<Account>(Account.class), idClient );
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.severe("Fallo en conseguir cuentas cliente: " + sqle.getMessage());
			return new ArrayList<>();
		}	
	}

}
