package com.atm.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.atm.model.Account;
import com.atm.util.TransactionType;

 /**
  * 
  * Interfaz que define las operaciones de la BBDD
  * para la tabla Account
  * 
  * @version 1.0
  * @since 2021-02-07
  *
  */
@Service
public interface AccountDao {
	/**
	 * 
	 * Funci�n que retorna todas cuentas
	 * 
	 * @return {@code List<Account>} Lista de cuentas
	 */
	List<Account> findAll();
	
	/**
	 * 
	 * Funci�n que retorna una cuenta por su Id
	 * 
	 * @param idAccount {@code int} Id de la cuenta
	 * @return {@code Account} Cuenta
	 */
	Account findById(int idAccount);
	/**
	 * 
	 * Funci�n que actualiza el saldo de una cuenta
	 * 
	 * @param idAccount {@code int} Id de la cuenta
	 * @param amount {@code double} cantidad a actualizar
	 * @param typeOfTransaction {@code String} Tipo de operaci�n 
	 * @return {@code int} n�mero de filas aceptadas en la sentencia SQL
	 */
	int updateAccountBalance(int idAccount, double amount, TransactionType typeOfTransaction);
	
	/**
	 * Funci�n que obtiene si el saldo es menor a la
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
	 * Funci�n que recoge la cuenta de la BBDD, 
	 * se realiza despu�s de una operaci�n para refrescar
	 * los datos guardados en la sesi�n
	 * 
	 * @param session {@code HttpSession} sesi�n de la aplicaci�n
	 * @param idAccount {@code int} Id de la cuenta
	 * @return {@code boolean} 
	 * true si la operaci�n se realizo correctamente, de otra manera false
	 */
	public boolean setSessionAccount(HttpSession session, int idAccount);
}
