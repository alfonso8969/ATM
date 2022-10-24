package com.atm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.atm.model.Account;
import com.atm.service.AccountService;
import com.atm.util.Constants;
import com.atm.util.TransactionType;
import com.atm.util.Util;

@Controller
public class AccountController {
	
	@Autowired
	private AccountService accser;

	@PostMapping("doOperation")
	public String operation(HttpSession session, HttpServletRequest request) {
		int idAccount = ((Account) session.getAttribute("account")).getIdAccount();// Id de la cuenta
		Double amount = Util.covertAmount(request.getParameter("amount"));// Cantidad
		String operation = request.getParameter("opType"); // Tipo de transacci�n para guardar en BBDD
		TransactionType typeOfTransaction = TransactionType.valueOf(operation);// Tipo de transacci�n para mostrar en mensaje
		
		// Comprobamos si la operaci�n es retirar dinero , para comprobar el saldo
		if(typeOfTransaction.getTransactionType().equals(Constants.WITHDRAWL)
			&& accser.checkBalance(idAccount, amount) == 0) {
			request.setAttribute(Constants.ERROR, "Tu saldo es inferior a " + amount);
			return request.getParameter("page");
		}
		// Enviamos los datos para actualizar las cuentas
		if(accser.updateAccount(idAccount, amount, operation) != 0) {
			// Actualizamos la cuenta de sesi�n con nuevo saldo
			if(accser.setAccount(session, idAccount)) {
				// Configurar mensaje de �xito en la operaci�n
				request.setAttribute(Constants.SUCCESS, String.format("Operaci�n %s realizada con �xito", typeOfTransaction.getTransactionType()));
			} else {
				// Configurar mensaje de error en la operaci�n
				request.setAttribute(Constants.ERROR, Constants.ERROR_OP);
			}			
		} else {
			// Configurar mensaje de error en operaciones
			request.setAttribute(Constants.ERROR, "La operaci�n no se pudo realizar");			
		}
		// retornamos ala p�gina, ya sea ingreso n efectivo o ingreso en cheque
		return request.getParameter("page");
				
	}
}
