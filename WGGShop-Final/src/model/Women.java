package model;

public class Women implements SubCategory {
	private int id;
	private String name;
	private String description;
	public Women() {
		this.id = 2;
		this.name = "Women";
		this.description = "For women.";
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
