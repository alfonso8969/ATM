package com.atm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import com.atm.model.DateRange;
import com.atm.model.Movement;
import com.atm.service.MovementService;

@RestController
public class MovementController {
	
	@Autowired
	private MovementService ms;

	// Función que recoge los movimientos de una cuenta en un rango de fechas
	@GetMapping(value = "doGetMovements", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Movement> getMovements(@ModelAttribute("dateRange") DateRange daterange) {
		return ms.getAllMovementsBetweenDates(daterange);
	}	
}
