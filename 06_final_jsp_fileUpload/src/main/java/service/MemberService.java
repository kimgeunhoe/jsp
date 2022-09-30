package service;

import java.util.List;

import domain.MemberVO;

public interface MemberService {
	public int register(MemberVO mvo);
	public List<MemberVO> getList();
	public MemberVO getDetail(String email);
	public int modify(MemberVO memberVO);
	public int remove(String parameter);
	public MemberVO login(MemberVO memberVO);
}
