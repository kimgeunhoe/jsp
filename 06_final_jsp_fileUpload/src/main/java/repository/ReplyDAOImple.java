package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.ReplyVO;
import orn.DataBaseBuilder;

public class ReplyDAOImple implements ReplyDAO {
	private SqlSession sql;
	private final String NS = "ReplyMapper.";

	public ReplyDAOImple() {
		new DataBaseBuilder();
		sql = DataBaseBuilder.getFactory().openSession();
	}
	
	@Override
	public int insert(ReplyVO rvo) {
		int isUp = sql.insert(NS+"add", rvo);
		if (isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public List<ReplyVO> selectList(int pno) {
		return sql.selectList(NS+"list", pno);
	}

	@Override
	public int update(ReplyVO rvo) {
		int isUp = sql.update(NS+"mod", rvo);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public int delete(long rno) {
		int isUp = sql.delete(NS+"del", rno);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public int deleteAll(int pno) {
		int isUp = sql.update(NS+"delAll", pno);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

}
