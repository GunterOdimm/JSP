<%@page import="study.jsp.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%
	WebHelper web = WebHelper.getInstance(request, response);
	
	String ans1 = web.getString("ans1");
	String ans2 = web.getString("ans2");
	
	if(ans1 == null) {
		web.redirect(null, "첫 번째 문항에 대한 응답값이 없습니다.");
		return;
	}
	
	if(ans2 == null) {
		web.redirect(null, "두 번째 문항에 대한 응답값이 없습니다.");
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
		<h1>Q3) 당신의 성별은 무엇입니까?</h1>
		<%=ans2 %>
		<ul>
			<li>
				<!-- 디코딩된 ans2 값을 재전송하기 위해서는 다시 한 번 인코딩이 필요함 -->
				<a href="result.jsp?ans1=<%=ans1 %>&ans2=<%=URLEncoder.encode(ans2, "utf-8") %>&ans3=M">남자</a>
			</li>
			<li>
				<!-- 디코딩된 ans2 값을 재전송하기 위해서는 다시 한 번 인코딩이 필요함 -->
				<a href="result.jsp?ans1=<%=ans1 %>&ans2=<%=URLEncoder.encode(ans2, "utf-8") %>&ans3=F">여자</a>
			</li>
		</ul>
</body>
</html>