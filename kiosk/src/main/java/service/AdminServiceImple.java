package service;

import domain.AdminVO;
import repository.AdminDAO;
import repository.AdminDAOImple;

public class AdminServiceImple implements AdminService {
	private AdminDAO adao;
	
	public AdminServiceImple() {
		adao = new AdminDAOImple();
	}
	
	@Override
	public AdminVO login(AdminVO avo) {
		return adao.login(avo);
	}

}
