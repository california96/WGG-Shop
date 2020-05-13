package controller;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Income;
public class IncomeOperations {
	public boolean insert(Connection connection, int userID, int categoryID, double amount, String date, String comment) {
		String sql = "INSERT INTO incomes(userID, categoryID, amount, date, comment) VALUES (?, ?,?, ?, ?)";
		try {
			PreparedStatement prep = connection.prepareStatement(sql);
			prep.setInt(1, userID);
			prep.setInt(2, categoryID);
			prep.setDouble(3, amount);
			prep.setString(4, date);
			prep.setString(5, comment);
			prep.executeUpdate();
			return true;
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}catch(Exception e) {
			System.err.println(e.getMessage());
		}
		return false;
	}
	public ArrayList<Income> getAllIncome(Connection connection, int userID){
		ArrayList<Income> incomes = new ArrayList<Income>();
		String sql = "SELECT incomeID, userID, incomes.categoryID, categories.name, amount, date, comment\n" + 
				"				FROM incomes\n" + 
				"				INNER JOIN categories on categories.id = incomes.categoryID\n" + 
				"				WHERE incomes.userID = ?";
		try {
			PreparedStatement prep = connection.prepareStatement(sql);
			prep.setInt(1, userID);
			ResultSet rs = prep.executeQuery();
			while(rs.next()) {
				incomes.add(new Income(rs.getInt("incomeID"), rs.getInt("userID"), rs.getInt("categoryID"), rs.getString("name"), rs.getDouble("amount"), rs.getDate("date"), rs.getString("comment")));
			}
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}catch(Exception e) {
			System.err.println(e.getMessage());
		}
		return incomes;
	}
	public Income getIncome(Connection connection, int incomeID) {
		Income income = null;
		String sql = "SELECT incomeID, userID, incomes.categoryID, categories.name, amount, date, comment\n" + 
				"				FROM incomes\n" + 
				"				INNER JOIN categories on categories.id = incomes.categoryID\n" + 
				"				WHERE incomes.incomeID = ?";
		try {
			PreparedStatement prep = connection.prepareStatement(sql);
			prep.setInt(1, incomeID);
			ResultSet rs = prep.executeQuery();
			while(rs.next()) {
				income = new Income(rs.getInt("incomeID"), rs.getInt("userID"), rs.getInt("categoryID"), rs.getString("name"), rs.getDouble("amount"), rs.getDate("date"), rs.getString("comment"));
			}
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}catch(Exception e) {
			System.err.println(e.getMessage());
		}
		return income;
	}
	public void editIncome(Connection connection, int incomeID, int categoryID, double amount, String date, String comment) {
		String sql = "UPDATE incomes SET categoryID = ? , amount = ?, date = ?, comment = ? WHERE incomes.incomeID = ?";
		try {
			PreparedStatement prep = connection.prepareStatement(sql);
			prep.setInt(1, categoryID);
			prep.setDouble(2, amount);
			prep.setString(3, date);
			prep.setString(4, comment);
			prep.setInt(5, incomeID);
			prep.executeUpdate();
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}catch(Exception e) {
			System.err.println(e.getMessage());
		}
	}
	public void deleteIncome(Connection connection, int incomeID) {
		String sql = "DELETE FROM incomes WHERE incomes.incomeID = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, incomeID);
			ps.executeUpdate();
			
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}catch(Exception e) {
			System.err.println(e.getMessage());
		}

	}
	public double getMonthlyIncome(Connection connection, int userID) {
		double monthlyIncome = 0.0;
		String sql = "SELECT SUM(amount) as 'monthlyincome' FROM incomes WHERE incomes.userID = ? AND (MONTH(date) = MONTH(CURRENT_TIMESTAMP) AND YEAR(date) = YEAR(CURRENT_TIMESTAMP))";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, userID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				monthlyIncome = rs.getDouble("monthlyincome");
			}
			return monthlyIncome;
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
		return monthlyIncome;
	}
}
