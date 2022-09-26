package domain;

public class CommentVO {
	private long cno;
	private long bno;
	private String writer;
	private String content;
	private String reg_at;
	private String mod_at;
	
	public CommentVO() {}

	//post
	public CommentVO(long bno, String writer, String content) {
		this.bno = bno;
		this.writer = writer;
		this.content = content;
	}

	//list
	public CommentVO(long cno, long bno, String writer, String content, String mod_at) {
		this.cno = cno;
		this.bno = bno;
		this.writer = writer;
		this.content = content;
		this.mod_at = mod_at;
	}

	//modify
	public CommentVO(long cno, String content) {
		this.cno = cno;
		this.content = content;
	}

	public long getCno() {
		return cno;
	}

	public void setCno(long cno) {
		this.cno = cno;
	}

	public long getBno() {
		return bno;
	}

	public void setBno(long bno) {
		this.bno = bno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_at() {
		return reg_at;
	}

	public void setReg_at(String reg_at) {
		this.reg_at = reg_at;
	}

	public String getMod_at() {
		return mod_at;
	}

	public void setMod_at(String mod_at) {
		this.mod_at = mod_at;
	}

}
