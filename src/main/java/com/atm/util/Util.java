package com.atm.util;

import org.springframework.stereotype.Service;

@Service
public class Util {
	
	/**
	 * Constructor privado para evitar instanciación
	 */
	private Util() {}
	
	/**
	 * Función que convierte el contenido de los 
	 * inputs de cantidades formateados con puntos y comas
	 * en un double
	 * 
	 * @param amount {@code String} cadena a formatear 
	 * @return {@code Double} double
	 */
	public static double covertAmount(String amount) {
		StringBuilder aux = new StringBuilder(amount);
		int index;

		while (aux.toString().contains(".")) {
			index = aux.toString().indexOf('.');
			aux.delete(index, index + 1);
		}
		
		if (aux.toString().contains(",")) {
			index = aux.toString().indexOf(',');
			aux.replace(index, index + 1, ".");			
		}
		
		return Double.parseDouble(aux.toString());		
	}
}
