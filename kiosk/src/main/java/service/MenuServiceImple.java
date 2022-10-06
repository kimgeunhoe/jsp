package service;

import java.util.List;

import domain.MenuVO;
import repository.MenuDAO;
import repository.MenuDAOImple;

public class MenuServiceImple implements MenuService {
	private MenuDAO mdao;
	
	public MenuServiceImple() {
		mdao = new MenuDAOImple();
	}
	
	@Override
	public int register(MenuVO mvo) {
		return mdao.insert(mvo);
	}

	@Override
	public List<MenuVO> list() {
		return mdao.selectList();
	}
	
	@Override
	public List<MenuVO> list(String type) {
		return mdao.selectList(type);
	}

	@Override
	public MenuVO detail(String name) {
		return mdao.selectOne(name);
	}

	@Override
	public int modify(MenuVO mvo) {
		return mdao.update(mvo);
	}

	@Override
	public int remove(String name) {
		return mdao.delete(name);
	}

}
