
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ibatis.config.SqlMapClientFactory"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	//전송시(요청시) 데이터 받기

	// db를 통해서 crud처리
	// 그러려면 mapper-xml파일에 접근해서 db를 수행해야한다.
	// mapper-xml파일에 접근 할수 있는 객체가 필요 -> SqlMapClient 객체 필요
	SqlMapClient client = SqlMapClientFactory.getSqlMapClient();
	
	// mapper를 실행 							("namespace이름.id이름");
	List<LprodVO> list = client.queryForList("lprod.selectAll");
	
	// db처리 후 결과를 얻는다.
	
	// 결과를 가지고 응답데이터(text/json/xml)를 생성한다. 

%>

[

	<%

	for(int i = 0; i < list.size(); i++){
		LprodVO vo = list.get(i);
		if(i > 0) out.print(",");
		
	%>
	
		{
			"id" : "<%= vo.getLprod_id() %>",
			"gu" : "<%= vo.getLprod_gu() %>", 
			"nm" : "<%= vo.getLprod_nm() %>"
		
		}
	
	<%
	}
	%>
]

