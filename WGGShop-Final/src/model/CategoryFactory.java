package model;

public class CategoryFactory extends AbstractFactory {
	@Override
	public Category getCategory(String category) {
		Category cat = null;
		switch(category.toUpperCase()) {
		
		case "CLOTHING":
			cat = new Clothing();
			break;
		case "ACCESSORIES":
			cat = new Accessories();
			break;
		case "SPORTS":
			cat = new Sports();
			break;
		case "SPORTS & LIFESTYLE":
			cat = new Sports();
			break;
		}
		return cat;
	}
	@Override
	public SubCategory getSubCategory(String subcategory) {
		return null;
	}
}
