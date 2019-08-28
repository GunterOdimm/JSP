<%@page import="study.model1.helper.WebHelper"%>
<%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	WebHelper web = WebHelper.getInstance(request, response);

	// get 파라미터 수신, 값이 없을 경우 null로 리턴됨 설정
	// -> URLEncode가 적용된 파라미터는 수신과정에서 자동으로 디코딩됨.
	String ans1 = web.getString("ans1");
	String ans2 = web.getString("ans2");
	
	if(ans1 == null) {
		web.redirect(null, "첫번째 문항에 대한 응답값이 없습니다.");
		return;
	}
	
	if(ans2 == null) {
		web.redirect(null, "두번째 문항에 대한 응답값이 없습니다.");
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
	
	<ul>
		<!-- 디코딩된 ans2 값을 재전송하기 위해서는 다시 한번 인코딩이 필요함. -->
		<li><a href="result.jsp?ans1=<%=ans1%>&ans2=<%=URLEncoder.encode(ans2,"UTF-8")%>&ans3=M">남자</a></li>
		<li><a href="result.jsp?ans1=<%=ans1%>&ans2=<%=URLEncoder.encode(ans2,"UTF-8")%>&ans3=F">여자</a></li>
	</ul>
</body>
</html>