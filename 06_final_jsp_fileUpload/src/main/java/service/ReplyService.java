package service;

import java.util.List;

import domain.ReplyVO;

public interface ReplyService {
	public int post(ReplyVO rvo);
	public List<ReplyVO> getList(int pno);
	public int modify(ReplyVO rvo);
	public int remove(long rno);
	public int removeAll(int pno);
}
