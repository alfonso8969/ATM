package com.atm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atm.model.Account;
import com.atm.service.AccountService;
import com.atm.util.Constants;
import com.atm.util.TransactionType;
import com.atm.util.Util;

@Controller
public class TransferController {
	
	@Autowired
	private AccountService accser;
	
	@RequestMapping("doGetAccounts")
	public String getAccounts(HttpServletRequest request) {
		// Conseguimos todas las cuentas
		List<Account> accounts = accser.getAccounts();
		request.setAttribute("accounts", accounts);		
		return "forward:/doGetThisAccount";
	}
	
	@RequestMapping("doGetThisAccount")
	public String getThisAccount(HttpServletRequest request, HttpSession session) {
		// Función de prueba, para próximos desarrollos, e.j. recoger cuentas de un cliente, etc..
		Account account = accser.getAccount(((Account) session.getAttribute("account")).getIdAccount());
		request.setAttribute("account", account);		
		return "account_transfer_funds";
	}
	
	@PostMapping("doMakeTransfer")
	public String makeTransfer(HttpServletRequest request, HttpSession session) {
		int idAccountFrom = Integer.parseInt(request.getParameter("idAccountFrom"));// la cuenta que hace la transferencia
		int idAccountTo = Integer.parseInt(request.getParameter("idAccountTo"));// la cuenta que recibe la transferencia
		Double amount = Util.covertAmount(request.getParameter("amount"));// la cantidad transferida
		// tipos de operación, para grabar en BBDD
		String operationFrom = request.getParameter("opTypeFrom");// transferencia emitida
		TransactionType typeOfTransactionFrom = TransactionType.valueOf(operationFrom);
		String operationTo = request.getParameter("opTypeTo");// transferencia recibida
		
		// Comprobamos el saldo de la cuenta de donde parte la transferencia
		if(accser.checkBalance(idAccountFrom, amount) == 0) {
			request.setAttribute(Constants.ERROR, "Tu saldo es inferior a " + amount);
			return "forward:/doGetAccounts";
		}
		
		// Enviamos los datos para actualizar las cuentas
		if(accser.updateAccount(idAccountFrom, amount, operationFrom) != 0) { 
			if(accser.updateAccount(idAccountTo, amount, operationTo) != 0) {
				// Actualizamos la cuenta de sesión con nuevo saldo
				if(accser.setAccount(session, idAccountFrom)) {
					// Configurar mensaje de éxito en transferencia
					request.setAttribute(Constants.SUCCESS, String.format("Operación %s realizada con éxito", typeOfTransactionFrom.getTransactionType()));
				} else {
					// Configurar mensaje de error en transferencia
					request.setAttribute(Constants.ERROR, Constants.ERROR_OP);
				}	
			}
		} else {
			// Configurar mensaje de error en operaciones
			request.setAttribute(Constants.ERROR, "La operación no se pudo realizar");			
		}
		// retornamos para recargar la cuentas from y to
		return "forward:/doGetAccounts";
	}
	
}
