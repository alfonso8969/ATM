/**
 * 
 */
package com.atm.dao;

import java.util.List;

import com.atm.model.Account;
import com.atm.model.Client;

/**
 * 
 * Class to administration accounts
 * @author Alfonso
 *
 */
public interface AccountAdminDao {
	/**
	 * Función que registra una nueva cuenta
	 * @param account {@code Account} Cuenta
	 * @return {@code int} número de filas aceptadas en la sentencia SQL
	 */
	int saveNewAccount(Account account);
	
	/**
	 * Función que elimina una nueva Cuenta
	 * @param idAccount {@code int} Id de la Cuenta
	 * @return {@code int} número de filas aceptadas en la sentencia SQL
	 */
	int deleteAccount(int idAccount, int idClient);
	
	/**
	 * Función que actualiza una nueva Cuenta
	 * @param account {@code Account} Cuenta
	 * @param idAccount {@code int} Id de la cuenta
	 * @return {@code int} número de filas aceptadas en la sentencia SQL
	 */
	 int updateAccount(Account account, int idAccount);
	
	/**
	 * Función que registra la relación 
	 * entre Cliente y Cuenta
	 * @param idAccount {@code int} Id de la Cuenta
	 * @param idClient {@code int} Id del Cliente
	 * @return {@code int} número de filas aceptadas en la sentencia SQL
	 */
	 int referenceAccountClient(int idAccount, int idClient);
	
	/**
	 * Función que elimina la relación 
	 * entre Cliente y Cuenta
	 * @param idAccount {@code int} Id de la Cuenta
	 * @param idClient {@code int} Id del Cliente
	 * @return {@code int} número de filas aceptadas en la sentencia SQL
	 */
	 int deleteReferenceAccountClient(int idAccount, int idClient);
	
	public List<Client> getClientsOfAccount(int idAccount);

	List<Account> getAccountsOfClient(int idClient);
}
