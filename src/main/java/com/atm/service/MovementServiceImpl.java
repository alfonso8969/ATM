package com.atm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.dao.MovementDao;
import com.atm.model.DateRange;
import com.atm.model.Movement;

@Service
public class MovementServiceImpl implements MovementService {
	
	@Autowired
	MovementDao mReposytory;

	@Override
	public List<Movement> getAllMovementsBetweenDates(DateRange daterange) {
		return mReposytory.findBetweenDates(daterange);
	}

	@Override
	public int deleteMovements(int idAccount) {
		return mReposytory.deleteMovementByIdAccount(idAccount);			
	}
}
