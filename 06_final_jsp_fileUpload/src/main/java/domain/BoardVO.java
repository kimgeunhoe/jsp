package domain;

public class BoardVO {
	private long bno;
	private String title;
	private int price;
	private String made_by;
	private String reg_at;
	private String writer;
	private String category;
	private String description;
	private String mod_at;
	private int read_count;
	private String image_file;
	
	public BoardVO() {}

	//register: title, price, made_by, writer(로그인한 사용자의 이메일), category, description
	public BoardVO(String title, int price, String made_by, String writer, String category, String description) {
		this.title = title;
		this.price = price;
		this.made_by = made_by;
		this.writer = writer;
		this.category = category;
		this.description = description;
	}

	//list: bno, title, price, mod_at, read_count
	public BoardVO(long bno, String title, int price, String mod_at, int read_count) {
		this.bno = bno;
		this.title = title;
		this.price = price;
		this.mod_at = mod_at;
		this.read_count = read_count;
	}

	//modify: bno, title, price, made_by, category, description -> mod_at수정시간으로 변경
	public BoardVO(long bno, String title, int price, String made_by, String category, String description) {
		this.bno = bno;
		this.title = title;
		this.price = price;
		this.made_by = made_by;
		this.category = category;
		this.description = description;
	}
	
	//detail: all
	public BoardVO(long bno, String title, int price, String made_by, String reg_at, String writer, String category,
			String description, String mod_at, int read_count, String image_file) {
		this(bno, title, price, made_by, category, description);
		this.reg_at = reg_at;
		this.writer = writer;
		this.mod_at = mod_at;
		this.read_count = read_count;
		this.image_file = image_file;
	}

	public long getBno() {
		return bno;
	}

	public void setBno(long bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMade_by() {
		return made_by;
	}

	public void setMade_by(String made_by) {
		this.made_by = made_by;
	}

	public String getReg_at() {
		return reg_at;
	}

	public void setReg_at(String reg_at) {
		this.reg_at = reg_at;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMod_at() {
		return mod_at;
	}

	public void setMod_at(String mod_at) {
		this.mod_at = mod_at;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public String getImage_file() {
		return image_file;
	}

	public void setImage_file(String image_file) {
		this.image_file = image_file;
	}
	
}
