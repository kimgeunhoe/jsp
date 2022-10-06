package service;

import java.util.List;

import domain.MenuVO;

public interface MenuService {
	public int register(MenuVO mvo);
	public List<MenuVO> list();
	public List<MenuVO> list(String type);
	public MenuVO detail(String name);
	public int modify(MenuVO mvo);
	public int remove(String name);
}
