package service;

import java.util.List;

import domain.CommentVO;
import repository.CommentDAO;
import repository.CommentDAOImple;

public class CommentServiceImple implements CommentService {
	private CommentDAO cdao;
	
	public CommentServiceImple() {
		cdao = new CommentDAOImple();
	}
	
	@Override
	public int post(CommentVO cvo) {
		return cdao.insert(cvo);
	}

	@Override
	public List<CommentVO> getList(long bno) {
		return cdao.selectList(bno);
	}

	@Override
	public int modify(CommentVO cvo) {
		return cdao.update(cvo);
	}

	@Override
	public int remove(long cno) {
		return cdao.delete(cno);
	}

	@Override
	public int removeAll(long bno) {
		return cdao.deleteAll(bno);
	}

}
