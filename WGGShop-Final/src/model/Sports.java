package model;

public class Sports implements Category {

	private int id;
	private String name;
	private String description;
	
	public Sports() {
		this.id = 3;
		this.name = "Sports & Lifestyle";
		this.description = "For all your active needs.";
		
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
