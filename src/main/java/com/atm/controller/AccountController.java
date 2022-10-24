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
		String operation = request.getParameter("opType"); // Tipo de transacción para guardar en BBDD
		TransactionType typeOfTransaction = TransactionType.valueOf(operation);// Tipo de transacción para mostrar en mensaje
		
		// Comprobamos si la operación es retirar dinero , para comprobar el saldo
		if(typeOfTransaction.getTransactionType().equals(Constants.WITHDRAWL)
			&& accser.checkBalance(idAccount, amount) == 0) {
			request.setAttribute(Constants.ERROR, "Tu saldo es inferior a " + amount);
			return request.getParameter("page");
		}
		// Enviamos los datos para actualizar las cuentas
		if(accser.updateAccount(idAccount, amount, operation) != 0) {
			// Actualizamos la cuenta de sesión con nuevo saldo
			if(accser.setAccount(session, idAccount)) {
				// Configurar mensaje de éxito en la operación
				request.setAttribute(Constants.SUCCESS, String.format("Operación %s realizada con éxito", typeOfTransaction.getTransactionType()));
			} else {
				// Configurar mensaje de error en la operación
				request.setAttribute(Constants.ERROR, Constants.ERROR_OP);
			}			
		} else {
			// Configurar mensaje de error en operaciones
			request.setAttribute(Constants.ERROR, "La operación no se pudo realizar");			
		}
		// retornamos ala página, ya sea ingreso n efectivo o ingreso en cheque
		return request.getParameter("page");
				
	}
}
