
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	WebHelper web = WebHelper.getInstance(request, response);
	String ans1 = web.getString("ans1");
	String ans2 = web.getString("ans2");
	String ans3 = web.getString("ans3");
	
	if(ans1 == null) {
		web.redirect(null, "첫번째 문항의 답이 없습니다.");
		return;
	}
	
	if(ans2 == null) {
		web.redirect(null, "두번째 문항의 답이 없습니다.");
		return;
	}
	
	if(ans3 == null) {
		web.redirect(null, "세번째 문항의 답이 없습니다.");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>응답결과</h1>
	<p>직업:<%=ans1%></p>
	<p>취미:<%=ans2%></p>
	<p>성별:<%=ans3%></p>
</body>
</html>