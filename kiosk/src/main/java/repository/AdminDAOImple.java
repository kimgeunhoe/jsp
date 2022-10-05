package repository;

import org.apache.ibatis.session.SqlSession;

import domain.AdminVO;
import orn.DataBaseBuilder;

public class AdminDAOImple implements AdminDAO{
	private SqlSession sql;
	private final String NS = "AdminMapper.";
	
	public AdminDAOImple() {
		new DataBaseBuilder();
		sql = DataBaseBuilder.getFactory().openSession();
	}

	@Override
	public AdminVO login(AdminVO avo) {
		return sql.selectOne(NS+"login", avo);
	}
}
