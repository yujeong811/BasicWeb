package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

// dao에 접근 -> dao 객체 필요
// service 객체 생성, 리턴하는 메서드 필요 -> controller가 사용

public class MemberServiceImpl implements IMemberService{
	
	private IMemberDao dao;
	private static IMemberService service;

	// 생성자
	public MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	} 
	
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl(); // 클래스이름으로 생성
		
		return service;
	}
	
	@Override
	public List<MemberVO> selectAll() {
		/*
		 List<MemberVO> list = null;
		 
		 list = dao.selectAll();
		
		 return list;
		 */
		return dao.selectAll();
	}

	@Override
	public String idCheck(String id) {
		// TODO Auto-generated method stub
		return dao.idCheck(id);
	}

	@Override
	public List<ZipVO> zipList(String dong) {
		// TODO Auto-generated method stub
		return dao.zipList(dong);
	}

	@Override
	public String insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.insertMember(vo);
	}

}
