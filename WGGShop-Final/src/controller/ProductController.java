package controller;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.Part;

import model.Category;
import model.CategoryFactory;
import model.Product;
import model.SubCategory;
import model.SubCategoryFactory;
public class ProductController {
	private Product product;
	public ProductController() {
		
	}
	public ProductController(Product product) {
		this.product = product;
		
	}
	public Product getProduct() {
		return product;
	}
	public String uploadImage(String uploadPath, Part filePart) {
		String fileName;
		try {
			fileName = getFileName(filePart);
			//String path = "fileStorage" + File.separator + fileName;
			InputStream is = filePart.getInputStream();
			Files.copy(is, Paths.get(uploadPath  + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
			System.out.println("Filename: " + fileName);
			return fileName;
//		}catch(DirectoryNotEmptyException dnee) {
//			return dnee.getMessage();
//		}catch(IOException ioe) {
//			return ioe.getMessage();
		}catch(Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		
	}
	public String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
	public boolean insert(Connection connection) {
		
		boolean isSuccessful = false;
		String sql = "INSERT into products (categoryID, subcategoryID, name, description, price, quantity, image) VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, product.getCategory().getId());
			ps.setInt(2, product.getSubcategory().getId());
			ps.setString(3, product.getName());
			ps.setString(4, product.getDescription());
			ps.setDouble(5, product.getPrice());
			ps.setInt(6, product.getQuantity());
			ps.setString(7, product.getImage());
			ps.executeUpdate();
			isSuccessful = true;
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
		return isSuccessful;
	}
	public void edit(Connection connection, Product product) {
		String sql = "UPDATE products SET categoryID = ?, subcategoryID = ?, name = ?, description = ?, price = ?, quantity = ?, image = ? WHERE productID = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, product.getCategory().getId());
			ps.setInt(2, product.getSubcategory().getId());
			ps.setString(3, product.getName());
			ps.setString(4, product.getDescription());
			ps.setDouble(5, product.getPrice());
			ps.setInt(6, product.getQuantity());
			ps.setString(7, product.getImage());
			ps.setInt(8, product.getProductID());
			ps.executeUpdate();
			
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
	}
	public void delete(Connection connection, int productID) {
		String sql = "DELETE FROM products where productID = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, productID);
			ps.executeUpdate();
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
	}
	public ArrayList<Product> getAllProducts(Connection connection){
		ArrayList<Product> products = new ArrayList<Product>();
		//public Expense(int expenseID, int categoryID, String category, int userID, double cost, Date date, String comment)
		String sql = "SELECT productID, products.name, products.description, products.categoryID, categories.name as 'category', subcategories.subcategoryID, subcategories.name as 'subcategory', price, quantity, image\n" + 
				"FROM products\n" + 
				"INNER JOIN categories on categories.categoryID = products.categoryID\n" + 
				"INNER JOIN subcategories on subcategories.subcategoryID = products.subcategoryID";
		
		CategoryFactory cFactory = new CategoryFactory();
		SubCategoryFactory sFactory = new SubCategoryFactory();
		Category category;
		SubCategory subcategory;
		try {
			PreparedStatement prep = connection.prepareStatement(sql);
			ResultSet rs = prep.executeQuery();
			while(rs.next()) {
				category = cFactory.getCategory(rs.getString("category"));
				subcategory = sFactory.getSubCategory(rs.getString("subcategory"));
				products.add(new Product(rs.getInt("productID"), rs.getString("name"), rs.getString("description"), category, subcategory, rs.getDouble("price"), rs.getInt("quantity"), rs.getString("image")));
			}
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}catch(Exception e) {
			System.err.println(e.getMessage());
		}
		return products;
	}
	public Product getProductByID(int productID, Connection connection) {
		Product product = null;
		String sql = "SELECT productID, products.name, products.description, products.categoryID, categories.name as 'category', subcategories.subcategoryID, subcategories.name as 'subcategory', price, quantity, image\n" + 
				"FROM products\n" + 
				"INNER JOIN categories on categories.categoryID = products.categoryID\n" + 
				"INNER JOIN subcategories on subcategories.subcategoryID = products.subcategoryID\n" + 
				"WHERE products.productID = ?";
		CategoryFactory cFactory = new CategoryFactory();
		SubCategoryFactory sFactory = new SubCategoryFactory();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, productID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Category category = cFactory.getCategory(rs.getString("category"));
				SubCategory subcategory = sFactory.getSubCategory(rs.getString("subcategory"));
				product = new Product(productID, rs.getString("name"), rs.getString("description"), category, subcategory, rs.getDouble("price"), rs.getInt("quantity"), rs.getString("image"));
				
			}
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
		return product;
	}
	public Iterator<Product> getProductIterator(Connection connection) {
		Iterator<Product> iterator = null;
		ArrayList <Product> products = new ArrayList<Product>();
		String sql = "SELECT productID, products.name, products.description, products.categoryID, categories.name as 'category', subcategories.subcategoryID, subcategories.name as 'subcategory', price, quantity, image\n" + 
				"FROM products\n" + 
				"INNER JOIN categories on categories.categoryID = products.categoryID\n" + 
				"INNER JOIN subcategories on subcategories.subcategoryID = products.subcategoryID";
		CategoryFactory cFactory = new CategoryFactory();
		SubCategoryFactory sFactory = new SubCategoryFactory();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Category category = cFactory.getCategory(rs.getString("category"));
				SubCategory subcategory = sFactory.getSubCategory(rs.getString("subcategory"));
				products.add(new Product(rs.getInt("productID"), rs.getString("name"), rs.getString("description"), category, subcategory, rs.getDouble("price"), rs.getInt("quantity"), rs.getString("image")));
			}
			iterator = products.iterator();
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
		return iterator;
	}
	public Iterator<Product> getProductByCategoryIterator(Connection connection, int categoryID){
		Iterator<Product> iterator = null;
		ArrayList <Product> products = new ArrayList<Product>();
		String sql = "SELECT productID, products.name, products.description, products.categoryID, categories.name as 'category', subcategories.subcategoryID, subcategories.name as 'subcategory', price, quantity, image\n" + 
				"FROM products\n" + 
				"INNER JOIN categories on categories.categoryID = products.categoryID\n" + 
				"INNER JOIN subcategories on subcategories.subcategoryID = products.subcategoryID\n" + 
				"WHERE products.categoryID = ?";
		CategoryFactory cFactory = new CategoryFactory();
		SubCategoryFactory sFactory = new SubCategoryFactory();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, categoryID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Category cat = cFactory.getCategory(rs.getString("category"));
				SubCategory subcat = sFactory.getSubCategory(rs.getString("subcategory"));
				products.add(new Product(rs.getInt("productID"), rs.getString("name"), rs.getString("description"), cat, subcat, rs.getDouble("price"), rs.getInt("quantity"), rs.getString("image")));
			}
			iterator = products.iterator();
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
		return iterator;
	}
	public int getProductQuantity(Connection connection, int productID) {
		String sql = "SELECT quantity FROM products WHERE productID = ?";
		int quantity = 0;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, productID);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				quantity = rs.getInt("quantity");
			}
			
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
	
		}
		return quantity;
	}
	public void updateProductQuantity(Connection connection, int productID, int origQuantity, int numberBought) {
		String sql = "UPDATE products SET quantity = ? WHERE productID = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, (origQuantity - numberBought));
			ps.setInt(2, productID);
			ps.executeUpdate();
		}catch(SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
	}
}
