package model;

public class SubCategoryFactory extends AbstractFactory {
	@Override
	public Category getCategory(String category) {
		return null;
	}
	@Override
	public SubCategory getSubCategory(String subcategory) {
		SubCategory sc = null;
		switch(subcategory.toUpperCase()) {
		case "MEN":
			sc = new Men();
			break;
			
		case "WOMEN":
			sc = new Women();
			break;
		case "UNISEX":
			sc = new Unisex();
			break;
		}
		return sc;
	}
}
