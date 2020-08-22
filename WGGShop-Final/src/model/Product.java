package model;

public class Product {
	private int productID;
	private String name;
	private String description;
	private Category category;
	private SubCategory subcategory;
	private double price;
	private int quantity;
	private String image;
	public Product() {
		
	}
	public Product(int productID, String name, String description, Category category, SubCategory subcategory, double price, int quantity, String image) {
		this.productID = productID;
		this.name = name;
		this.description = description;
		this.category = category;
		this.subcategory = subcategory;
		this.price = price;
		this.quantity = quantity;
		this.image = image;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public SubCategory getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(SubCategory subcategory) {
		this.subcategory = subcategory;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
}
