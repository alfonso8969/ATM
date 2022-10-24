package com.atm.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.atm.model.Client;
import com.atm.model.User;
import com.atm.util.Constants;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	JdbcTemplate template;

	@Override
	public User findById(int idUser) {
		String query = "SELECT * FROM clientes WHERE dni = ?";
		try {
			return template.queryForObject(query, new BeanPropertyRowMapper<User>(User.class), idUser);			
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.info("Fallo en conseguir usuario: " + sqle.getMessage());
			return null;
		}
	}

	@Override
	public List<User> findAll() {
		String query = "SELECT * FROM clientes WHERE rol = 'Client' ";
		try {
			return template.query(query, new BeanPropertyRowMapper<User>(User.class));			
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.info("Fallo en conseguir usuarios: " + sqle.getMessage());
			return new ArrayList<>();
		}
	}

	@Override
	public boolean setSessionUser(HttpSession session, int idUser) {
		User user = findById(idUser);
		if (user != null) {
			session.setAttribute("user", user);
			return true;
		}		
		return false;
	}

	@Override
	public int saveClient(Client client) {
		try {
			if (findById(client.getDni()) != null) {
				return -1;
			}
			String query = "INSERT INTO clientes VALUES(?,?,?,?,?,?,?,?)";
			return template.update(query, 
					client.getDni(),
						   client.getName(),
						   client.getLastName(),
						   client.getEmail(),
						   client.getAddress(),
						   client.getPhone(),
						   client.getRol(),
						   client.getInfo());
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.info("Fallo en insertar usuario: " + sqle.getMessage());
			return 0;
		}
		
	}

	@Override
	public int updateClient(Client client, int idClient) {
		String query = "UPDATE clientes SET dni = ?, name = ?, lastName = ?, email = ?, address = ?, phone = ?, info = ? WHERE dni = ?";
		try {
			return template.update(query,  
				client.getDni(),
					   client.getName(),
					   client.getLastName(),
					   client.getEmail(),
					   client.getAddress(),
					   client.getPhone(),
					   client.getInfo(),
					   idClient);			
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.info("Fallo en actualizar usuario: " + sqle.getMessage());
			return 0;
		}
	}

	@Override
	public int deleteClient(int idClient) {
		String query = "DELETE FROM clientes WHERE dni = ?";
		try {
			return template.update(query, idClient);
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.info("Fallo en borrar usuario: " + sqle.getMessage());
			return 0;
		}
	}

}
