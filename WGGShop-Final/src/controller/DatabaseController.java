package controller;

import model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
public class DatabaseController implements DatabaseFacade {
	private Connection connection;
	private ServletContext context;
	public DatabaseController(Connection connection, ServletContext context) {
		this.connection = connection;
		this.context = context;
	}
	public void createTables() {
		String categoryTableCreate = "CREATE TABLE IF NOT EXISTS`wggdb`.`categories` (\n" + 
				"  `categoryID` INT NOT NULL AUTO_INCREMENT,\n" + 
				"  `name` VARCHAR(255) NOT NULL,\n" + 
				"  `description` VARCHAR(255) NULL,\n" + 
				"  PRIMARY KEY (`categoryID`));";
		String subCategoryTableCreate = "CREATE TABLE IF NOT EXISTS `wggdb`.`subcategories` (\n" + 
				"  `subCategoryID` INT NOT NULL AUTO_INCREMENT,\n" + 
				"  `name` VARCHAR(255) NOT NULL,\n" + 
				"  PRIMARY KEY (`subCategoryID`));\n" + 
				"";
		String productTableCreate = "CREATE TABLE IF NOT EXISTS `wggdb`.`products` (\n" + 
				"  `productID` INT NOT NULL AUTO_INCREMENT,\n" + 
				"  `categoryID` INT NOT NULL,\n" + 
				"  `subCategoryID` INT NOT NULL,\n" + 
				"  `name` VARCHAR(255) NOT NULL,\n" + 
				"  `description` VARCHAR(255) NOT NULL,\n" + 
				"  `price` DOUBLE NOT NULL,\n" + 
				"  `quantity` INT NOT NULL,\n" + 
				"  `image` VARCHAR(255) NULL DEFAULT 'default.png',\n" + 
				"  PRIMARY KEY (`productID`));\n" + 
				"";
		String transactionTableCreate = "CREATE TABLE IF NOT EXISTS `wggdb`.`transactions` (\n" + 
				"  `transactionID` INT NOT NULL AUTO_INCREMENT,\n" + 
				"  `customerName` VARCHAR(255) NOT NULL,\n" + 
				"  `email` VARCHAR(255) NOT NULL,\n" + 
				"  `contactNo` VARCHAR(255) NOT NULL,\n" + 
				"  `shippingAddress` VARCHAR(255) NOT NULL,\n" + 
				"  `totalBill` DOUBLE NOT NULL,\n" + 
				"  `amountPaid` DOUBLE NOT NULL,\n" + 
				"  PRIMARY KEY (`transactionID`));\n" + 
				"";
		String transactionPivotCreate = "CREATE TABLE IF NOT EXISTS `wggdb`.`transactionPivot` (\n" + 
				"  `transactionID` INT NOT NULL,\n" + 
				"  `productID` INT NOT NULL,\n" +
				" `quantity` INT NOT NULL);\n";
		
		try {
			Statement stmt = connection.createStatement();
		//	connection.setAutoCommit(false);

			stmt.addBatch(categoryTableCreate);
			stmt.addBatch(subCategoryTableCreate);
			stmt.addBatch(productTableCreate);
			stmt.addBatch(transactionTableCreate);
			stmt.addBatch(transactionPivotCreate);
		//	connection.commit();
			stmt.executeBatch();
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
	}
	public void createForeignKeys() {
		 String categoryToProduct = "ALTER TABLE products\n"
		 		+ "ADD CONSTRAINT products_categoryid_foreign\n"
		 		+ "FOREIGN KEY (categoryID) REFERENCES categories(categoryID) ON DELETE CASCADE ON UPDATE RESTRICT";
		 
		 String subCategoryToProduct =  "ALTER TABLE products\n"
			 		+ "ADD CONSTRAINT products_subcategoryid_foreign\n"
			 		+ "FOREIGN KEY (subCategoryID) REFERENCES subcategories(subCategoryID) ON DELETE CASCADE ON UPDATE RESTRICT";
		 try {
			 Statement stmt = connection.createStatement();
			 stmt.addBatch(categoryToProduct);
			 stmt.addBatch(subCategoryToProduct);
			 stmt.executeBatch();
		 }catch(SQLException sqle) {
			 System.err.println(sqle.getMessage());
		 }
	}
	public void initializeValues() {
		//Step 1 Prepare Initial Categories
		CategoryFactory cFactory = new CategoryFactory();
		Category clothing = cFactory.getCategory("clothing");
		Category accessories = cFactory.getCategory("accessories");
		Category sports = cFactory.getCategory("sports");
		//Step 2 Prepare Intial Subcategories
		SubCategoryFactory sFactory = new SubCategoryFactory();
		SubCategory men = sFactory.getSubCategory("men");
		SubCategory women = sFactory.getSubCategory("women");
		SubCategory unisex = sFactory.getSubCategory("unisex");
		
		//Step 3 Prepare Insert Categories Batch
		String categoryBatch = "INSERT INTO `wggdb`.`categories` (`categoryID`, `name`, `description`) VALUES (?, ?, ?)";
		
		//Step 4 Prepare Insert Subcategories Batch
		String subCategoryBatch = "INSERT INTO `wggdb`.`subcategories` (`subCategoryID`, `name`) VALUES (?, ?)";
		//Step 5 Add All Queries to Batch
		try {
			PreparedStatement psC = connection.prepareStatement(categoryBatch);
			psC.setInt(1, clothing.getId());
			psC.setString(2, clothing.getName());
			psC.setString(3, clothing.getDescription());
			
			psC.addBatch();
			
			psC.setInt(1, accessories.getId());
			psC.setString(2, accessories.getName());
			psC.setString(3, accessories.getDescription());
			
			psC.addBatch();
			
			psC.setInt(1, sports.getId());
			psC.setString(2, sports.getName());
			psC.setString(3, sports.getDescription());
			
			psC.addBatch();
			
			psC.executeBatch();
			
			PreparedStatement psS = connection.prepareStatement(subCategoryBatch);
			psS.setInt(1, men.getId());
			psS.setString(2, men.getName());
			
			psS.addBatch();
			
			psS.setInt(1, women.getId());
			psS.setString(2, women.getName());
			
			psS.addBatch();
			
			psS.setInt(1, unisex.getId());
			psS.setString(2, unisex.getName());
			
			psS.addBatch();
			
			psS.executeBatch();
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
	}
	@Override
	public void initializeDatabase() {
		// TODO Auto-generated method stub
		createTables();
		createForeignKeys();
		initializeValues();
	}
	

}
