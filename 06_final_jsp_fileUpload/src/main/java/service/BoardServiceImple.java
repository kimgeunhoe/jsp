package service;

import java.util.List;

import domain.BoardVO;
import repository.BoardDAO;
import repository.BoardDAOImple;

public class BoardServiceImple implements BoardService {
	private BoardDAO bdao;
	
	public BoardServiceImple() {
		bdao = new BoardDAOImple();
	}
	
	@Override
	public int register(BoardVO bvo) {
		return bdao.insert(bvo);
	}
	
	@Override
	public List<BoardVO> getList() {
		return bdao.selectList();
	}
	
	@Override
	public BoardVO getDetail(long bno) {
		int isUp = bdao.updateReadCount(bno, 1);
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return isUp > 0 ? bdao.selectOne(bno) : null;
	}
	
	@Override
	public int modify(BoardVO bvo) {
		int isUp = bdao.updateReadCount(bvo.getBno(), -2);
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return isUp > 0 ? bdao.update(bvo) : null;
	}
	
	@Override
	public int remove(long bno) {
		return bdao.delete(bno);
	}

	@Override
	public int removeFile(long bno) {
		return bdao.updateFile(bno);
	}

}
