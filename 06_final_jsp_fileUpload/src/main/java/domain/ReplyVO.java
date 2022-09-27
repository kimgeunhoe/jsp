package domain;

public class ReplyVO {
	private long rno;
	private int pno;
	private String replier;
	private String reply;
	private String reg_at;
	private String mod_at;
	
	public ReplyVO() {}

	public ReplyVO(int pno, String replier, String reply) {
		this.pno = pno;
		this.replier = replier;
		this.reply = reply;
	}

	public ReplyVO(long rno, int pno, String replier, String reply) {
		this.rno = rno;
		this.pno = pno;
		this.replier = replier;
		this.reply = reply;
	}

	public ReplyVO(long rno, String reply) {
		this.rno = rno;
		this.reply = reply;
	}

	public long getRno() {
		return rno;
	}

	public void setRno(long rno) {
		this.rno = rno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getReplier() {
		return replier;
	}

	public void setReplier(String replier) {
		this.replier = replier;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
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
