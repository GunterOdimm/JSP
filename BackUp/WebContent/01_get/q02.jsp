<%@page import="study.model1.helper.WebHelper"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// webhelper 객체 생성
	WebHelper web = WebHelper.getInstance(request, response);
	// get 파라미터 수신, 값이 없을 경우 기본값 null로 리턴됨 설정
	String ans1 = web.getString("ans1");
	
	if(ans1 == null) {
		web.redirect(null, "첫번째 문항에 대한 응답값이 없습니다.");
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
	<h1>Q2) 당신의 취미는 무엇입니까?</h1>
	
	<ul>
		<!-- 숫자값이나 영문은 별다른 처리 없이 파라미터 전달 가능함. -->
		<li><a href="q03.jsp?ans1=<%=ans1%>&ans2=<%=URLEncoder.encode("음악감상", "utf-8")%>">음악감상</a></li>
		<li><a href="q03.jsp?ans1=<%=ans1%>&ans2=<%=URLEncoder.encode("스포츠", "utf-8")%>">스포츠</a></li>
		<li><a href="q03.jsp?ans1=<%=ans1%>&ans2=<%=URLEncoder.encode("사진촬영", "utf-8")%>">사진촬영</a></li>
		<li><a href="q03.jsp?ans1=<%=ans1%>&ans2=<%=URLEncoder.encode("등산", "utf-8")%>">등산</a></li>
	</ul>
</body>
</html>