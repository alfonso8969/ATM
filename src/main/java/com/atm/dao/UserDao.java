package com.atm.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.atm.model.Client;
import com.atm.model.User;

public interface UserDao {
	
	/**
	 * Función que retorna un Usuario
	 * @param idUser
	 * @return {@code User} un usuario
	 * Tanto un Cliente como un Administrador
	 */
	User findById(int idUser);
	
	/**
	 * Función que retorna todos los Clientes
	 * @return {@code List<User>} Lista de usuarios
	 */
	List<User> findAll();
	/**
	 * Función que recoge el usuario de la BBDD, 
	 * se realiza después de una operación para refrescar
	 * los datos guardados en la sesión
	 * 
	 * @param session {@code HttpSession} sesión de la aplicación
	 * @param idUser {@code int} Id del usuario
	 * @return {@code boolean} 
	 * true si la operación se realizo correctamente, de otra manera false
	 */
	public boolean setSessionUser(HttpSession session, int idUser);
	int saveClient(Client client);
	int updateClient(Client client, int idClient);
	int deleteClient(int idClient);
}
