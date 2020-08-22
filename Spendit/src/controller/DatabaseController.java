package controller;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;


import model.DatabaseFacade;
public class DatabaseController implements DatabaseFacade{
	private Connection connection;
	public DatabaseController(Connection connection) {
		this.connection = connection;
	}
	public void createTables() {
		String categoryTable = "CREATE TABLE IF NOT EXISTS `categories` (\n" + 
				"  `id` int(11) NOT NULL AUTO_INCREMENT,\n" + 
				"  `name` varchar(100) NOT NULL,\n" + 
				"  `moduleID` int(11) NOT NULL,\n" + 
				"  `description` varchar(255) DEFAULT NULL,\n" + 
				"  `image` varchar(255) NOT NULL,\n" + 
				"  PRIMARY KEY (`id`));";
		String expenseTable = "CREATE TABLE IF NOT EXISTS `expenses` (\n" + 
				"  `expenseID` int(11) NOT NULL AUTO_INCREMENT,\n" + 
				"  `categoryID` int(11) NOT NULL,\n" + 
				"  `userID` int(11) NOT NULL,\n" + 
				"  `cost` double NOT NULL,\n" + 
				"  `date` timestamp NOT NULL,\n" + 
				"  `comment` varchar(255) DEFAULT NULL,\n" + 
				"  PRIMARY KEY (`expenseID`));";
		String incomeTable = "CREATE TABLE IF NOT EXISTS `incomes` (\n" + 
				"  `incomeID` int(11) NOT NULL AUTO_INCREMENT,\n" + 
				"  `userID` int(11) NOT NULL,\n" + 
				"  `categoryID` int(11) NOT NULL,\n" + 
				"  `amount` double NOT NULL,\n" + 
				"  `date` date NOT NULL,\n" + 
				"  `comment` varchar(255) DEFAULT NULL,\n" + 
				"  PRIMARY KEY (`incomeID`));";
		String moduleTable = "CREATE TABLE IF NOT EXISTS `modules` (\n" + 
				"  `moduleID` int(11) NOT NULL AUTO_INCREMENT,\n" + 
				"  `moduleName` varchar(45) NOT NULL,\n" + 
				"  PRIMARY KEY (`moduleID`));";
		String statusTable = "CREATE TABLE IF NOT EXISTS `status` (\n" + 
				"  `statusID` int(11) NOT NULL AUTO_INCREMENT,\n" + 
				"  `status` varchar(100) DEFAULT NULL,\n" + 
				"  PRIMARY KEY (`statusID`));";
		String userTable = "CREATE TABLE IF NOT EXISTS`users` (\n" + 
				"  `userID` int(11) NOT NULL AUTO_INCREMENT,\n" + 
				"  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,\n" + 
				"  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,\n" + 
				"  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,\n" + 
				"  `firstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,\n" + 
				"  `lastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,\n" + 
				"  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'default.png',\n" + 
				"  PRIMARY KEY (`userID`),\n" + 
				"  UNIQUE KEY `username_UNIQUE` (`username`),\n" + 
				"  UNIQUE KEY `email_UNIQUE` (`email`)\n" + 
				");";
		String wishlistTable = "CREATE TABLE IF NOT EXISTS `wishlist` (\n" + 
				"  `wishID` int(11) NOT NULL AUTO_INCREMENT,\n" + 
				"  `userID` int(11) NOT NULL,\n" + 
				"  `categoryID` int(11) NOT NULL,\n" + 
				"  `incomeSourceID` int(11) NOT NULL,\n" + 
				"  `statusID` int(11) NOT NULL,\n" + 
				"  `amount` double NOT NULL,\n" + 
				"  `date` timestamp NOT NULL,\n" + 
				"  `comment` varchar(255) NOT NULL,\n" + 
				"  PRIMARY KEY (`wishID`));";
		try {
			Statement stmt = connection.createStatement();
			stmt.addBatch(categoryTable);
			stmt.addBatch(expenseTable);
			stmt.addBatch(incomeTable);
			stmt.addBatch(moduleTable);
			stmt.addBatch(statusTable);
			stmt.addBatch(userTable);
			stmt.addBatch(wishlistTable);
			
			stmt.executeBatch();
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
	}
	public void linkForeignKeys() {
		String categoryToModule = "ALTER TABLE categories\n"
				+ "ADD CONSTRAINT categories_moduleid_foreign_idx\n"
				+ "FOREIGN KEY (moduleID) REFERENCES modules(moduleID) ON DELETE CASCADE ON UPDATE RESTRICT";
		
		String expenseToCategory = "ALTER TABLE expenses\n"
				+ "ADD CONSTRAINT expense_categoryid_foreign\n"
				+ "FOREIGN KEY (categoryID) REFERENCES categories(id) ON DELETE CASCADE ON UPDATE RESTRICT";
		
		String expenseToUser = "ALTER TABLE expenses\n"
				+ "ADD CONSTRAINT expense_userid_foreign\n"
				+ "FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE ON UPDATE RESTRICT";
		
		String incomeToCategory = "ALTER TABLE incomes\n"
				+ "ADD CONSTRAINT income_categoryid_foreign\n"
				+ "FOREIGN KEY (categoryID) REFERENCES categories(id) ON DELETE CASCADE ON UPDATE RESTRICT";
		
		String incomeToUser = "ALTER TABLE incomes\n"
				+ "ADD CONSTRAINT income_userid_foreign\n"
				+ "FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE ON UPDATE RESTRICT";
		
		String wishToCategory = "ALTER TABLE wishlist\n"
				+ "ADD CONSTRAINT wishlist_categoryid_foreign\n"
				+ "FOREIGN KEY (categoryID) REFERENCES categories(id) ON DELETE CASCADE ON UPDATE RESTRICT";
		
		String wishToIncome = "ALTER TABLE wishlist\n"
				+ "ADD CONSTRAINT wishlist_incomeid_foreign\n"
				+ "FOREIGN KEY (incomeSourceID) REFERENCES categories(id) ON DELETE CASCADE ON UPDATE RESTRICT";
		
		String wishToStatus = "ALTER TABLE wishlist\n"
				+ "ADD CONSTRAINT wishlist_statusid_foreign\n"
				+ "FOREIGN KEY (statusID) REFERENCES status(statusID) ON DELETE CASCADE ON UPDATE RESTRICT";
		
		String wishToUser = "ALTER TABLE wishlist\n"
				+ "ADD CONSTRAINT wishlist_userid_foreign\n"
				+ "FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE ON UPDATE RESTRICT";
		try {
			Statement stmt = connection.createStatement();
			//Prepare Batch
			stmt.addBatch(categoryToModule);
			stmt.addBatch(expenseToCategory);
			stmt.addBatch(expenseToUser);
			stmt.addBatch(incomeToCategory);
			stmt.addBatch(incomeToUser);
			stmt.addBatch(wishToCategory);
			stmt.addBatch(wishToIncome);
			stmt.addBatch(wishToStatus);
			stmt.addBatch(wishToUser);
			//execute batch
			stmt.executeBatch();
			
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
	}
	public void createInitialValues() {
		String readyModules = "INSERT INTO `modules` VALUES (1,'Expenses'),(2,'Income'),(3,'Wishlist');";

		String readyCategories = "INSERT INTO `categories` VALUES (1,'Automobile',1,'Vehicles','transportation-category.png'),(2,'Food',1,'A basic necessity','food-category.png'),(3,'Mobile Phone',3,'Small companion','shopping-category.png'),(8,'Savings',2,'Keep saving.','default.png'),(9,'Salary',2,'Paycheck to paycheck','movie-category.png'),(10,'Allowance',1,'Handed to you','education-category.png');";
		String readyStatus = "INSERT INTO `status` VALUES (1,'On-going'),(2,'On-hold'),(3,'Ready for purchase'),(4,'Complete');";
		try {
			Statement stmt = connection.createStatement();
			stmt.addBatch(readyModules);
			stmt.addBatch(readyCategories);
			
			stmt.addBatch(readyStatus);
			stmt.executeBatch();
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
	}
	@Override
	public void initializeTables() {
		createTables();
		linkForeignKeys();
		createInitialValues();
	}
}
