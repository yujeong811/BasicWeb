package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberService {
	
	public List<MemberVO> selectAll();
	
	// 중복검사 메소드
	public String idCheck(String id);
	
	// 우편번호 검색
	public List<ZipVO> zipList(String dong);
	
	// 저장하기
	public String insertMember(MemberVO vo);
}
