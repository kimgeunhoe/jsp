package repository;

import java.util.List;

import domain.MenuVO;

public interface MenuDAO {
	public int insert(MenuVO mvo);
	public List<MenuVO> selectList();
	public List<MenuVO> selectList(String type);
	public MenuVO selectOne(String name);
	public int update(MenuVO mvo);
	public int delete(String name);
}
