<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)request.getAttribute("idcheck");

	if(id == null) {
		// 사용가능
%>
	{
		"flag" : "사용 가능합니다."
	}
	
<%	} else {
		// 사용불가능
%>
	{
		"flag" : "사용 불가능합니다."
	}
<%
	}
%>