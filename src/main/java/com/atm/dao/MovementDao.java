package com.atm.dao;

import java.util.List;

import com.atm.model.DateRange;
import com.atm.model.Movement;

public interface MovementDao {
	/**
	 * 
	 * Función que retorna todos los movimientos 
	 * de una cuenta
	 * 
	 * @return {@code List<Movement>} Lista de movimientos
	 */
	List<Movement> findByIdAccount(int idAccount);
	/**
	 * 
	 * Función que graba un nuevo movimiento
	 * 
	 * @param movement {@code Movement} Movimiento
	 * @return {@code int} número de filas aceptadas en la sentencia SQL
	 */
	int saveMovement(Movement movement);
	/**
	 * 
	 * Función que retorna los movimientos
	 * de una cuenta comprendidos en un rango
	 * de fechas
	 * 
	 * @param daterange {@code DateRange} Object
	 *   - idAccount {@code int} Id de la cuenta
	 *   - dateFrom {@code Timestamp} Fecha de inicio
	 *   - dateTo {@code Timestamp} Fecha de fin
	 * @return {@code List<Movement>} Lista de movimientos
	 */
	List<Movement> findBetweenDates(DateRange daterange);
	
	/**
	 * Función que elimina los movimientos
	 * de una cuenta
	 * 
	 * @param idAccount {@code int} Id de la cuenta
	 * @return {@code List<Movement>} Lista de movimientos
	 */
	int deleteMovementByIdAccount(int idAccount);
}
