package repository;

import java.util.List;

import domain.BoardVO;

public interface BoardDAO {
	public int insert(BoardVO bvo);
	public List<BoardVO> selectList();
	public BoardVO selectOne(long bno);
	public int update(BoardVO bvo);
	public int delete(long bno);
	public int updateFile(long bno);
	public int updateReadCount(long bno, int i);
}
