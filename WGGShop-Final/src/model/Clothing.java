package model;

public class Clothing implements Category {

	private int id;
	private String name;
	private String description;
	
	public Clothing() {
		this.id = 1;
		this.name = "Clothing";
		this.description = "For your fashion sense";
		
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
