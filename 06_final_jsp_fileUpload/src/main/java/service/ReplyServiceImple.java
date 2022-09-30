package service;

import java.util.List;

import domain.ReplyVO;
import repository.ReplyDAO;
import repository.ReplyDAOImple;

public class ReplyServiceImple implements ReplyService {
	private ReplyDAO rdao;
	
	public ReplyServiceImple() {
		rdao = new ReplyDAOImple();
	}
	
	@Override
	public int post(ReplyVO rvo) {
		return rdao.insert(rvo);
	}

	@Override
	public List<ReplyVO> getList(int pno) {
		return rdao.selectList(pno);
	}

	@Override
	public int modify(ReplyVO rvo) {
		return rdao.update(rvo);
	}

	@Override
	public int remove(long rno) {
		return rdao.delete(rno);
	}

	@Override
	public int removeAll(int pno) {
		return rdao.deleteAll(pno);
	}

}
