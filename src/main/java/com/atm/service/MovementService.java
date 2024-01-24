package com.atm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.atm.model.DateRange;
import com.atm.model.Movement;


@Service
public interface MovementService {
	
	public List<Movement> getAllMovementsBetweenDates(DateRange daterange);
	public int deleteMovements(int idAccount);
	
}
