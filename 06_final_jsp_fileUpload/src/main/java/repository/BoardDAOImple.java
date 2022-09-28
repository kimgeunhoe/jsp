package repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import domain.BoardVO;
import orn.DataBaseBuilder;

public class BoardDAOImple implements BoardDAO {
	private SqlSession sql;
	private final String NS = "BoardMapper.";
	
	public BoardDAOImple() {
		new DataBaseBuilder();
		sql = DataBaseBuilder.getFactory().openSession();
	}
	
	@Override
	public int insert(BoardVO bvo) {
		int isUp = sql.insert(NS+"reg", bvo);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public List<BoardVO> selectList() {
		return sql.selectList(NS+"list");
	}

	@Override
	public BoardVO selectOne(long bno) {
		return sql.selectOne(NS+"detail", bno);
	}

	@Override
	public int update(BoardVO bvo) {
		int isUp = sql.update(NS+"mod", bvo);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public int delete(long bno) {
		int isUp = sql.delete(NS+"del", bno);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public int updateFile(long bno) {
		int isUp = sql.update(NS+"delFile", bno);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public int updateReadCount(long bno, int qty) {
		Map<String, Long> map = new HashMap<>();
		map.put("bno", bno);
		map.put("qty", (long) qty);
		int isUp = sql.update(NS+"rcUp", map);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

}
