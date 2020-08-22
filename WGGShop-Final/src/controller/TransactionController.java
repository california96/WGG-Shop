package controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.DatabaseFacade;
import model.Product;
import model.Transaction;
import model.TransactionFacade;

public class TransactionController implements TransactionFacade {
	private Transaction transaction;
	public TransactionController() {
		
		
	}
	
	public TransactionController(Transaction transaction) {
		this.transaction = transaction;
	}
	

	@Override
	public void computeBill(double shippingFee) {
		// TODO Auto-generated method stub
		double totalBill = 0.0;
		for(Product p : transaction.getProducts()) {
			totalBill += (p.getPrice() * p.getQuantity());
		}
		transaction.setTotalBill(totalBill + shippingFee);
	
	}
	@Override
	public void registerTransaction(Connection connection, double shippingFee) {
		computeBill(shippingFee);
		insert(connection);
		addToPivot(connection);
		
	}
	public void insert(Connection connection) {
		String sql = "INSERT into transactions (customerName, email, contactNo, shippingAddress, totalBill, amountPaid) VALUES (?,?,?,?,?,?)";
		
		int lastID = 0;
		try {
			PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, this.transaction.getCustomerName());
			ps.setString(2, this.transaction.getEmail());
			ps.setString(3, this.transaction.getContactNo());
			ps.setString(4, this.transaction.getShippingAddress());
			ps.setDouble(5, this.transaction.getTotalBill());
			ps.setDouble(6, this.transaction.getAmountPaid());
			ps.executeUpdate();
			
			ResultSet rs = ps.getGeneratedKeys();
			if(rs.next()) {
				lastID = rs.getInt(1);
				this.transaction.setTransactionID(lastID);
			}
			
			
		
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
	}
	public void addToPivot(Connection connection) {
		String sql = "INSERT into transactionPivot (transactionID, productID, quantity) VALUES (?, ?, ?)";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			for(Product p : this.transaction.getProducts()) {
				ProductController pc = new ProductController(p);
				ps.setInt(1, this.transaction.getTransactionID());
				ps.setInt(2,p.getProductID());
				ps.setInt(3, p.getQuantity());
				ps.addBatch();
				pc.updateProductQuantity(connection, p.getProductID(), pc.getProductQuantity(connection, p.getProductID()), p.getQuantity());
			}
			ps.executeBatch();
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
	}
	public Transaction getTransaction() {
		return transaction;
	}
	
	
}
