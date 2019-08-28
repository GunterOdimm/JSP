<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="study.jsp.helper.WebHelper"%>

<%
	WebHelper web = WebHelper.getInstance(request, response);
	
	String userName = web.getString("userName");
	String userEmail = web.getString("userEmail");
	String userTel = web.getString("userTel");
	String userGender = web.getString("userGender");
	
	String[] userHobby = web.getStringArray("userHobby");
	
	if(userName == null || userEmail == null || userTel == null || userGender == null || userHobby == null){
		web.redirect(null,"입력항목이 잘못되었습니다.");
		return;
	}
	
	String userHobbyStr = String.join(", ",userHobby);
	//다중 입력 박스의 경우 문자가 배열임으로 그것을 전부다 String 으로 변환 시켜주어야 한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>응답결과</h1>
	
	<p>이름: <%=userName %></p>
	<p>이메일: <%=userEmail %></p>
	<p>번호: <%=userTel %></p>
	<p>성별: <%=userGender %></p>
	<p>취미: <%=userHobbyStr %></p>

</body>
</html>