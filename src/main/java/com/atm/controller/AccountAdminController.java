package com.atm.controller;

import java.util.List;

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

import com.atm.model.Account;
import com.atm.model.Client;
import com.atm.model.User;
import com.atm.service.AccountAdminService;
import com.atm.service.AccountService;
import com.atm.service.UserService;
import com.atm.util.Constants;
import com.atm.util.Rol;

@Controller
public class AccountAdminController {
	
	@Autowired
	private UserService userser;
	
	@Autowired
	private AccountService accser;
	
	@Autowired
	private AccountAdminService adminser;
	
	@PostMapping("doLogin")
	public String login(HttpSession session, HttpServletRequest request) {
		User user =  null;
		int id = Integer.parseInt(request.getParameter("idAccount"));
		if(userser.getUser(session, id)) {	
			user = (User) session.getAttribute("user");
			if(user.getRol().equalsIgnoreCase(Rol.ADMIN.getRolType()))
				return "account_admin-main";
//			else
//				return "account_avalilable_acounts";
		}
		// Comprobamos si la cuenta existe y se guarda en sesión
		if(accser.setAccount(session, id)) {
			// si existe nos dirigimos a la página de opciones
			return "account_options";
		}
		// Si no existe configuramos mensaje de error
		request.setAttribute(Constants.ERROR, user == null ? "Cuenta no existente" : "Admin no exite");
		return "login_input_pin";
	}
	
	@GetMapping(value = "getAccount", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Account getAccount(@RequestParam("idAccount") int idAccount, HttpSession session) {
		Account account = accser.getAccount(idAccount);
		session.setAttribute("accountSelected", account);		
		return account;
	}
	
	@GetMapping("getClientsAccount")
	public @ResponseBody List<Client> getClientsAccounts(@RequestParam("idAccount") int idAccount) {
		return adminser.getClientsAccount(idAccount);
	}
	
	@GetMapping("getAccountsClient")
	public @ResponseBody List<Account> getAccountsClient(@RequestParam("idClient") int idClient) {
		return adminser.getAccountsClient(idClient);
	}
	
	@RequestMapping("doGetAllAccounts")
	public String getAllClients(HttpServletRequest request) {
		request.setAttribute("accounts", adminser.getAll());		
		return request.getParameter("page");
	}
	
	@PostMapping("doNewAccount")
	public String saveNewClient(@ModelAttribute("account") Account account, HttpServletRequest request) {
		if (accser.getAccount(account.getIdAccount()) != null) {
			request.setAttribute(Constants.ERROR, String.format("La cuenta %s ya está registrada", account.getIdAccount()));
		} else if (adminser.saveNewAccount(account) != 0) {
			request.setAttribute(Constants.SUCCESS, String.format("La cuenta %s se creó con éxito", account.getIdAccount()));
		} else {
			request.setAttribute(Constants.ERROR, Constants.ERROR_OP);
		}
		return "account_admin_new_account";
	}
	
	@PostMapping("doDeleteAccount")
	public String deleteAccount(HttpServletRequest request) {
		int idClient = Integer.parseInt(request.getParameter("idClient"));
		int idAccount = Integer.parseInt(request.getParameter("idAccount"));
		if(adminser.deleteAccount(idAccount, idClient) != 0) {
			request.setAttribute(Constants.SUCCESS, String.format("La cuenta %s se borró con éxito", idAccount));
		} else {
			request.setAttribute(Constants.ERROR, Constants.ERROR_OP);
		}		
		return "forward:/doGetAllAccounts?page=account_admin_delete_account";
	}
}
