package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.ProductVO;
import orn.DataBaseBuilder;

public class ProductDAOImple implements ProductDAO {
	private SqlSession sql;
	private final String NS = "ProductMapper.";
	
	public ProductDAOImple() {
		new DataBaseBuilder();
		sql = DataBaseBuilder.getFactory().openSession();
	}
	
	@Override
	public int insert(ProductVO pvo) {
		int isUp = sql.insert(NS+"reg", pvo);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public List<ProductVO> selectList() {
		return sql.selectList(NS+"list");
	}

	@Override
	public ProductVO selectOne(int pno) {
		return sql.selectOne(NS+"detail", pno);
	}

	@Override
	public int update(ProductVO pvo) {
		int isUp = sql.update(NS+"mod", pvo);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

	@Override
	public int delete(int pno) {
		int isUp = sql.delete(NS+"del", pno);
		if(isUp>0) {
			sql.commit();
		}
		return isUp;
	}

}
