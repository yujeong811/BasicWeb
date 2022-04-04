package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class Insert
 */
@WebServlet("/Insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 1. 전송 데이터 받기
		MemberVO vo = new MemberVO();
		
		/* 라이브러리를 이용하지 않으면 이런식으로 9개 써야함
		 * vo.setMem_id(request.getParameter("mem_id"));
		 * vo.setMem_name(request.getParameter("mem_name"));
		 */
		try {
	         BeanUtils.populate(vo, request.getParameterMap());
	      } catch (IllegalAccessException | InvocationTargetException e) {
	         e.printStackTrace();
	      }

		IMemberService service = MemberServiceImpl.getInstance();

		String res = service.insertMember(vo);
		
		request.setAttribute("insert", res);
		request.setAttribute("id", vo.getMem_id());
		
		request.getRequestDispatcher("member/result.jsp").forward(request, response);
		
		
	}

}
