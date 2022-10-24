package com.atm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atm.model.Client;
import com.atm.model.User;
import com.atm.service.UserService;
import com.atm.util.Constants;
import com.atm.util.Rol;

@Controller
public class AdminComtroller {

	@Autowired
	private UserService adminser;
	
	@RequestMapping("doGetAll")
	public String getAllClients(HttpServletRequest request) {
		request.setAttribute("clients", adminser.getUsers());		
		return request.getParameter("page");
	}
	
	@GetMapping(value = "getClient", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody User getClient(@RequestParam("idClient") int idClient, HttpSession session) {
		User user = adminser.getClient(idClient);
		session.setAttribute("userSelected", user);
		return user;
	}
	
	@PostMapping("doNewClient")
	public String saveNewClient(@ModelAttribute("client") Client client, HttpServletRequest request) {
		client.setRol(Rol.CLIENT.getRolType());
		if (adminser.saveClient(client) == -1) {
			request.setAttribute(Constants.ERROR, String.format("El dni %s ya está registrado", client.getDni()));
		} else if (adminser.saveClient(client) != 0) {
			request.setAttribute(Constants.SUCCESS, String.format("El cliente %s se creó con éxito", client.getName()));
		} else {
			request.setAttribute(Constants.ERROR, Constants.ERROR_OP);
		}
		return "account_admin_new_client";
	}
	
	@PostMapping("doUpdateClient")
	public String updateClient(@ModelAttribute("client") Client client, HttpServletRequest request) {
		if (adminser.updateClient(client, ((User) request.getSession().getAttribute("userSelected")).getDni()) != 0) {
			request.setAttribute(Constants.SUCCESS, String.format("El cliente %s se actualizó con éxito", client.getName()));
		} else {
			request.setAttribute(Constants.ERROR, Constants.ERROR_OP);
		}
		return "account_admin_edit_client";
	}
	
	@PostMapping("doDeleteClient")
	public String deleteClient(HttpServletRequest request) {
		int idClient = Integer.parseInt(request.getParameter("idClient"));
		if(adminser.deleteClient(idClient) != 0) {
			request.setAttribute(Constants.SUCCESS, String.format("El cliente con DNI %s se borró con éxito", idClient));
		} else {
			request.setAttribute(Constants.ERROR, Constants.ERROR_OP);
		}		
		return "forward:/doGetAll?page=account_admin_delete_client";
	}
}
