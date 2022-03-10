<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Info</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("id");
	String userPass = request.getParameter("password");
	String userPass2 = request.getParameter("password2");
	String userName = request.getParameter("name");
	String userTel = request.getParameter("tel");
	String userMail = request.getParameter("mail");
	String userBirth = request.getParameter("birth");
	String userPage = request.getParameter("homepage");
	String userGen = request.getParameter("gender");

	out.print("<p>아이디 : " + userId + "</p>");
	out.print("<p>패스워드 : " + userPass + "</p>");
	out.print("<p>패스워드 확인 : " + userPass2 + "</p>");
	out.print("<p>이름 : " + userName + "</p>");
	out.print("<p>휴대폰번호 : " + userTel + "</p>");
	out.print("<p>이메일 : " + userMail + "</p>");
	out.print("<p>생일 : " + userBirth + "</p>");
	out.print("<p>홈페이지 : " + userPage + "</p>");
	out.print("<p>성별 : " + userGen + "</p>");
	
%>
</body>
</html>