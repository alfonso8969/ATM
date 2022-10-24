package com.atm.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.atm.model.Account;
import com.atm.util.TransactionType;

public interface AccountDao {
	/**
	 * 
	 * Función que retorna todas cuentas
	 * 
	 * @return {@code List<Account>} Lista de cuentas
	 */
	List<Account> findAll();
	
	/**
	 * 
	 * Función que retorna una cuenta por su Id
	 * 
	 * @param idAccount {@code int} Id de la cuenta
	 * @return {@code Account} Cuenta
	 */
	Account findById(int idAccount);
	/**
	 * 
	 * Función que actualiza el saldo de una cuenta
	 * 
	 * @param idAccount {@code int} Id de la cuenta
	 * @param amount {@code double} cantidad a actualizar
	 * @param typeOfTransaction {@code String} Tipo de operación 
	 * @return {@code int} número de filas aceptadas en la sentencia SQL
	 */
	int updateAccountBalance(int idAccount, double amount, TransactionType typeOfTransaction);
	
	/**
	 * Función que obtiene si el saldo es menor a la
	 * cantidad a extraer o a transferir usando una 
	 * sentencia SQL que devuelve que devuelve 0 si es
	 * menor y 1 si es mayor 
	 * 
	 * @param idAccount {@code int} Id de la cuenta
	 * @param balance {@code double} cantidad a extraer o transferir
	 * @return {@code int} 0 si es menor, 1 si es mayor
	 */
	int findBalanceByIdAccount(int idAccount, double balance);
	
	/**
	 * Función que recoge la cuenta de la BBDD, 
	 * se realiza después de una operación para refrescar
	 * los datos guardados en la sesión
	 * 
	 * @param session {@code HttpSession} sesión de la aplicación
	 * @param idAccount {@code int} Id de la cuenta
	 * @return {@code boolean} 
	 * true si la operación se realizo correctamente, de otra manera false
	 */
	public boolean setSessionAccount(HttpSession session, int idAccount);
}
