package model;

import java.sql.Connection;

public interface TransactionFacade {
	public void registerTransaction(Connection connection, double shippingFee);
	public void computeBill(double shippingFee);
}
