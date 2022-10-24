package com.atm.dao;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.atm.model.DateRange;
import com.atm.model.Movement;
import com.atm.util.Constants;

@Repository
public class MovementDaoImpl implements MovementDao {

	@Autowired
	private JdbcTemplate template;
	
	@Override
	public List<Movement> findByIdAccount(int idAccount) {
		String query = "Select * FROM movimientos WHERE idAccount = ?";		
		return template.query(query, new BeanPropertyRowMapper<Movement>(Movement.class), idAccount);
	}

	@Override
	public int saveMovement(Movement movement) {
		String query = "INSERT INTO movimientos (idAccount, transactionDate, amount, transactionType) VALUES (?,?,?,?)";
		return template.update(query, 
				movement.getIdAccount(), 
				Timestamp.valueOf(movement.getTransactionDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))), 
				movement.getAmount(), 
				movement.getTransactionType());
	}

	@Override
	public List<Movement> findBetweenDates(DateRange daterange) {
		String query = "SELECT * FROM movimientos WHERE transactionDate BETWEEN ? AND ? AND idAccount = ?";
		return template.query(query, new BeanPropertyRowMapper<Movement>(Movement.class), 
				daterange.getDateFrom(), daterange.getDateTo(), daterange.getIdAccount());
	}

	@Override
	public int deleteMovementByIdAccount(int idAccount) {
		String query = "DELETE FROM movimientos WHERE idAccount = ?";
		try {
			return template.update(query, idAccount);
		} catch (DataAccessException  sqle) {
			Constants.LOGGER.info("Fallo en eliminar movimientos: " + sqle.getMessage());
			return 0;
		}	
	}
}
