package repository;

import java.util.List;

import domain.ReplyVO;

public interface ReplyDAO {
	public int insert(ReplyVO rvo);
	public List<ReplyVO> selectList(int pno);
	public int update(ReplyVO rvo);
	public int delete(long rno);
	public int deleteAll(int pno);
}
