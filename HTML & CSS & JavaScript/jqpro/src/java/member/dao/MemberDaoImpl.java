package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

// mapper 접근 -> SqlMapClient 객체 필요
// dao클래스 객체 생성하고 리턴 -> service에서 사용

public class MemberDaoImpl implements IMemberDao{
	
	private SqlMapClient client;
	private static IMemberDao dao; // static이 붙은 이유? dao객체를 필요로 하는 여러개의 service에서 공통으로 사용하기위해
	// IMemberDao(인터페이스)로 오는 이유? 다형성(같은이름으로 다르게 호출)을 위해...
	
	// 생성자 변수를 초기화하는 역할
	private MemberDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getInstance() {
		/*
		if(dao == null) {
			dao = new MemberDaoImpl();
		}
		return dao;
		 */
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
	}

	@Override
	public List<MemberVO> selectAll() {
		List<MemberVO> list = null;
		
		try {
			list = client.queryForList("member.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String idCheck(String id) {
		String res = null;
		
		try {
			res = (String) client.queryForObject("member.idCheck", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ZipVO> zipList(String dong) {
		List<ZipVO> list = null;
		
		try {
			list = client.queryForList("zip.zipList", dong);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String insertMember(MemberVO vo) {
		String id = null;
		
		try {
			id = (String) client.insert("member.insertMember", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return id;
	}
	
}
