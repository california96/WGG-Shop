package model;

public class Men implements SubCategory {
	private int id;
	private String name;
	private String description;
	public Men() {
		this.id = 1;
		this.name = "Men";
		this.description = "For men.";
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
