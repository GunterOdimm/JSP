<%@page import="study.jsp.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%
	//WebHelper 객체생성 
	WebHelper web = WebHelper.getInstance(request, response);
	//GET 파라미터 수신. 값이 없을 경우 기본값 null로 리턴됨 설정
	String ans1 = web.getString("ans1");
	
	if(ans1==null) {
		web.redirect(null, "첫 번째 문항에 대한 응답값이 없습니다.");
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
	<h1>Q2) 당신의 직업은 무엇입니까?</h1>
	<%=ans1 %>
	<ul class="list-group">
		<!-- 이전 페이지에서 전달된 파라미터를 누적한 상태로 새로운 변수값 추가 -->
		<!--  한글이나 공백이 포함된 값을 GET으로 전송할 경우 반드시 URLEncode 적용해야 함 -->
		<li><a href="q03.jsp?ans1=<%=ans1 %>&ans2=<%=URLEncoder.encode("음악감상", "UTF-8") %>">음악감상</a></li>
		<li><a href="q03.jsp?ans2=<%=ans1 %>&ans2=<%=URLEncoder.encode("스포츠", "UTF-8") %>">스포츠</a></li>
		<li><a href="q03.jsp?ans1=<%=ans1 %>&ans2=<%=URLEncoder.encode("사진촬영", "UTF-8") %>">사진촬영</a></li>
		<li><a href="q03.jsp?ans1=<%=ans1 %>&ans2=<%=URLEncoder.encode("운동", "UTF-8") %>">운동</a></li>
	</ul>
</body>
</html>