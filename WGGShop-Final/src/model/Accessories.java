package model;

public class Accessories implements Category {

	private int id;
	private String name;
	private String description;
	
	public Accessories() {
		this.id = 2;
		this.name = "Accessories";
		this.description = "Secondary fashion.";
		
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
