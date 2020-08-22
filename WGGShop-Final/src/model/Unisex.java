package model;

public class Unisex implements SubCategory {
	private int id;
	private String name;
	private String description;
	public Unisex() {
		this.id = 3;
		this.name = "Unisex";
		this.description = "For both men and women.";
	}
	@Override
	public int getId() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return name;
	}

	@Override
	public String getDescription() {
		// TODO Auto-generated method stub
		return description;
	}

}
