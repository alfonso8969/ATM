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
	 * Funci�n que registra una nueva cuenta
	 * @param account {@code Account} Cuenta
	 * @return {@code int} n�mero de filas aceptadas en la sentencia SQL
	 */
	int saveNewAccount(Account account);
	
	/**
	 * Funci�n que elimina una nueva Cuenta
	 * @param idAccount {@code int} Id de la Cuenta
	 * @return {@code int} n�mero de filas aceptadas en la sentencia SQL
	 */
	int deleteAccount(int idAccount, int idClient);
	
	/**
	 * Funci�n que actualiza una nueva Cuenta
	 * @param account {@code Account} Cuenta
	 * @param idAccount {@code int} Id de la cuenta
	 * @return {@code int} n�mero de filas aceptadas en la sentencia SQL
	 */
	 int updateAccount(Account account, int idAccount);
	
	/**
	 * Funci�n que registra la relaci�n 
	 * entre Cliente y Cuenta
	 * @param idAccount {@code int} Id de la Cuenta
	 * @param idClient {@code int} Id del Cliente
	 * @return {@code int} n�mero de filas aceptadas en la sentencia SQL
	 */
	 int referenceAccountClient(int idAccount, int idClient);
	
	/**
	 * Funci�n que elimina la relaci�n 
	 * entre Cliente y Cuenta
	 * @param idAccount {@code int} Id de la Cuenta
	 * @param idClient {@code int} Id del Cliente
	 * @return {@code int} n�mero de filas aceptadas en la sentencia SQL
	 */
	 int deleteReferenceAccountClient(int idAccount, int idClient);
	
	public List<Client> getClientsOfAccount(int idAccount);

	List<Account> getAccountsOfClient(int idClient);
}
