package domain;

public class AdminVO {
	private String id;
	private String pd;
	
	public AdminVO() {}

	public AdminVO(String id, String pd) {
		this.id = id;
		this.pd = pd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPd() {
		return pd;
	}

	public void setPd(String pd) {
		this.pd = pd;
	}
	
}
