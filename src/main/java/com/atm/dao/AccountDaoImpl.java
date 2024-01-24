package com.atm.dao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.atm.model.Account;
import com.atm.model.Movement;
import com.atm.util.Constants;
import com.atm.util.TransactionType;

@Repository
public class AccountDaoImpl implements AccountDao {
	
	@Autowired
	private JdbcTemplate template;
	
	@Autowired
	private MovementDao mRepository;

	@Override
	public Account findById(int idAccount) {
		String query = "SELECT * FROM cuentas WHERE idAccount = ?";
		try {
			return template.queryForObject(query, new BeanPropertyRowMapper<Account>(Account.class), idAccount);			
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.info("Fallo en conseguir cuenta: " + sqle.getMessage());
			return null;
		}
	}

	@Override
	public int updateAccountBalance(int idAccount, double amount, TransactionType typeOfTransaction) {
		var transaction = typeOfTransaction.getTransactionType();
		
		try {// Enviamos los datos para guardar el movimiento en BBDD			
			if(mRepository.saveMovement(new Movement(idAccount, LocalDateTime.now(), amount, transaction)) != 0) {
				// Actualizar cuenta
				return saveBalance(transaction, idAccount, amount);
			} 
			return 0;
		} catch (DataAccessException sqle) {
			Constants.LOGGER.info("Fallo en ingresar movimiento: " + sqle.getMessage());
			return 0;
		}
	}
	
	/**
	 * Función que actualiza el saldo de la cuenta
	 * dependiendo si la operación es de retirada de
	 * o ingreso
	 * 
	 * @param transaction  {@code String} tipo de transacción
	 * @param idAcocunt {@code int} id de la cuenta
	 * @param amount {@code double} cantidad de la operación
	 * 
	 * @return {@code int} número de filas aceptadas
	 * */
	private int saveBalance(String transaction, int idAccount, double amount ) {
		String query = "UPDATE cuentas AS c1 INNER JOIN (SELECT balance FROM cuentas WHERE idAccount = ?) AS c2 SET c1.balance = (c2.balance + ?) WHERE idAccount = ?";
		try {			
			if (transaction.equals(Constants.WITHDRAWAL) || transaction.equals(Constants.TRANSACTION_SENDED)) {
				amount *= -1;
			}
			return template.update(query, idAccount, amount, idAccount);
		} catch (DataAccessException sqle) {
			Constants.LOGGER.info("Fallo en actualizar cuenta: " + sqle.getMessage());
			return 0;
		}
	}

	@Override
	public List<Account> findAll() {
		String query = "SELECT * FROM cuentas";
		try {
			return template.query(query, new BeanPropertyRowMapper<Account>(Account.class));			
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.info("Fallo en conseguir cuentas: " + sqle.getMessage());
			return new ArrayList<>();
		}
	}

	@Override
	public int findBalanceByIdAccount(int idAccount, double amount) {
		String query = "SELECT (CASE WHEN balance > ? THEN 1 WHEN balance < ? THEN 0 END) as balance FROM cuentas WHERE idAccount = ?";
		return template.query(query,(rs, row) -> 
							rs.getInt(Constants.ACCOUNT_BALANCE), 
							amount, amount, idAccount)
							.stream()
							.findFirst()
							.orElse(0);
	}

	@Override
	public boolean setSessionAccount(HttpSession session, int idAccount) {	
		Account account = findById(idAccount);
		if (account != null) {
			session.setAttribute("account", account);
			return true;
		}		
		return false;
	}

}
