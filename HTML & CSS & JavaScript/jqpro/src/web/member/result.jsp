<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String res = (String)request.getAttribute("insert");
	//String input = (String)request.getAttribute("id");

	if(res != null) {
%>	
	{
		"flag" : "<%= res %>님 가입 성공!!!"
	}
<% 	} else {  %>
		{
			"flag" : "가입 실패!!!"
		}
<% 	}
%>	