package model;

public abstract class AbstractFactory {
	public abstract Category getCategory(String category);
	public abstract SubCategory getSubCategory(String subcategory);
}
