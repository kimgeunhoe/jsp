package domain;

public class MenuVO {
	private String name;
	private int price;
	private String type;
	private String image;
	
	public MenuVO() {}

	public MenuVO(String name, int price, String type, String image) {
		this.name = name;
		this.price = price;
		this.type = type;
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
}
