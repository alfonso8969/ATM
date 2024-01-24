package com.atm.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.atm.model.Client;
import com.atm.model.User;

public interface UserService {

	public boolean getUser(HttpSession session, int idUser);
	public int getUser(int idAccount);
	public List<User> getUsers();
	public int saveClient(Client client);
	public int updateClient(Client client, int idClient);
	public User getClient(int idUser);
	public int deleteClient(int idClient);
}
