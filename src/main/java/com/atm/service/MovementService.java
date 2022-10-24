package com.atm.service;

import java.util.List;

import com.atm.model.DateRange;
import com.atm.model.Movement;

public interface MovementService {
	
	public List<Movement> getAllMovementsBetweenDates(DateRange daterange);
	public int deleteMovements(int idAccount);
	
}
