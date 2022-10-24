package com.atm.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.dao.UserDao;
import com.atm.model.Client;
import com.atm.model.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao uRepository;

	@Override
	public boolean getUser(HttpSession session, int idUser) {
		return uRepository.setSessionUser(session, idUser);
	}

	@Override
	public List<User> getUsers() {
		return uRepository.findAll();
	}

	@Override
	public int saveClient(Client client) {		
		return uRepository.saveClient(client);
	}

	@Override
	public User getClient(int idUser) {
		return uRepository.findById(idUser);
	}

	@Override
	public int updateClient(Client client, int idClient) {
		return uRepository.updateClient(client, idClient);
	}

	@Override
	public int deleteClient(int idClient) {
		return uRepository.deleteClient(idClient);
	}
}
