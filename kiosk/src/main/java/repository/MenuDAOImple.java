package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.MenuVO;
import orn.DataBaseBuilder;

public class MenuDAOImple implements MenuDAO {
	private SqlSession sql;
	private final String NS = "MenuMapper.";
	
	public MenuDAOImple() {
		new DataBaseBuilder();
		sql = DataBaseBuilder.getFactory().openSession();
	}
	
	@Override
	public int insert(MenuVO mvo) {
		int isUp = sql.insert(NS+"add", mvo);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public List<MenuVO> selectList() {
		return sql.selectList(NS+"list");
	}
	
	@Override
	public List<MenuVO> selectList(String type) {
		return sql.selectList(NS+"typelist", type);
	}

	@Override
	public MenuVO selectOne(String name) {
		return sql.selectOne(NS+"detail", name);
	}

	@Override
	public int update(MenuVO mvo) {
		int isUp = sql.update(NS+"mod", mvo);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public int delete(String name) {
		int isUp = sql.delete(NS+"del", name);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

}
