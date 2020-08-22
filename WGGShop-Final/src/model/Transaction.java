package model;

import java.util.ArrayList;
import java.util.Iterator;

public class Transaction{
	private int transactionID;
	private String customerName;
	private String email;
	private String contactNo;
	private String shippingAddress;
	private double totalBill;
	private double amountPaid;
	private ArrayList<Product> products;
	
	public Transaction() {
		
	}
	
	
	public Transaction(int transactionID, String customerName, String email, String contactNo, String shippingAddress,
			double totalBill, double amountPaid, ArrayList<Product> products) {
		this.transactionID = transactionID;
		this.customerName = customerName;
		this.email = email;
		this.contactNo = contactNo;
		this.shippingAddress = shippingAddress;
		this.totalBill = totalBill;
		this.amountPaid = amountPaid;
		this.products = products;
	}


	public int getTransactionID() {
		return transactionID;
	}


	public void setTransactionID(int transactionID) {
		this.transactionID = transactionID;
	}


	public String getCustomerName() {
		return customerName;
	}


	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getContactNo() {
		return contactNo;
	}


	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}


	public String getShippingAddress() {
		return shippingAddress;
	}


	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}


	public double getTotalBill() {
		return totalBill;
	}


	public void setTotalBill(double totalBill) {
		this.totalBill = totalBill;
	}


	public double getAmountPaid() {
		return amountPaid;
	}


	public void setAmountPaid(double amountPaid) {
		this.amountPaid = amountPaid;
	}


	public ArrayList<Product> getProducts() {
		return products;
	}


	public void setProducts(ArrayList<Product> products) {
		this.products = products;
	}
	public Iterator<Product> getIterator(){
		return this.products.iterator();
	}


}
