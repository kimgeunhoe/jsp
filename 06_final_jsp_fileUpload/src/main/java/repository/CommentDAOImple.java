package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.CommentVO;
import orn.DataBaseBuilder;

public class CommentDAOImple implements CommentDAO {
	private static Logger log = LoggerFactory.getLogger(CommentDAOImple.class);
	private SqlSession sql;
	private final String NS = "CommentMapper.";
	
	public CommentDAOImple() {
		new DataBaseBuilder();
		sql = DataBaseBuilder.getFactory().openSession();
	}

	@Override
	public int insert(CommentVO cvo) {
		int isUp = sql.insert(NS+"add", cvo);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public List<CommentVO> selectList(long bno) {
		return sql.selectList(NS+"list", bno);
	}

	@Override
	public int update(CommentVO cvo) {
		int isUp = sql.update(NS+"mod", cvo);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public int delete(long cno) {
		int isUp = sql.delete(NS+"del", cno);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public int deleteAll(long bno) {
		int isUp = sql.delete(NS+"delAll", bno);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

}
