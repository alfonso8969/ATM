package com.atm.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.atm.model.Client;
import com.atm.model.User;

public interface UserDao {
	
	/**
	 * Funci�n que retorna un Usuario
	 * @param idUser
	 * @return {@code User} un usuario
	 * Tanto un Cliente como un Administrador
	 */
	User findById(int idUser);
	
	/**
	 * Funci�n que retorna todos los Clientes
	 * @return {@code List<User>} Lista de usuarios
	 */
	List<User> findAll();
	/**
	 * Funci�n que recoge el usuario de la BBDD, 
	 * se realiza despu�s de una operaci�n para refrescar
	 * los datos guardados en la sesi�n
	 * 
	 * @param session {@code HttpSession} sesi�n de la aplicaci�n
	 * @param idUser {@code int} Id del usuario
	 * @return {@code boolean} 
	 * true si la operaci�n se realizo correctamente, de otra manera false
	 */
	public boolean setSessionUser(HttpSession session, int idUser);
	int saveClient(Client client);
	int updateClient(Client client, int idClient);
	int deleteClient(int idClient);
}
