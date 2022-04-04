<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("name2");
	String userAddr = request.getParameter("addr");
	String userMail = request.getParameter("mail2");
	String userGen = request.getParameter("gender");
	
	out.print("<p>이름 : " + userName + "</p>");
	out.print("<p>주소 : " + userAddr + "</p>");
	out.print("<p>이메일 : " + userMail + "</p>");
	out.print("<p>성별 : " + userGen + "</p>");
%>

</body>
</html>