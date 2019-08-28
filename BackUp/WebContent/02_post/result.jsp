
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	WebHelper web = WebHelper.getInstance(request, response);

	// post 파라미터 수신, 값이 없을 경우 null로 리턴됨 설정  getString으로 받는 내용은 name값
	String userName = web.getString("user_name");
	String userEmail = web.getString("user_email");
	String userTel = web.getString("user_tel");
	String gender = web.getString("gender");
	/* String hobby = web.getString("hobby"); */
	
	// 체크박스는 배열 형태로 처리된다.
	String[] hobby = web.getStringArray("hobby");
	
	if(userName == null || userEmail == null || userTel == null || gender == null || hobby == null) {
		web.redirect(null, "입력항목이 잘못되었습니다.");
		return;
	}
	
	// 배열의 항목을 문자열로 병합하기
	String hobbystr = String.join(",", hobby);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>응답결과</h1>
	<p>이름 : <%=userName%></p>
	<p>이메일 : <%=userEmail%></p>
	<p>전화번호 : <%=userTel%></p>
	<p>성별 : <%=gender%></p>
	<p>취미 : <%=hobbystr%></p>
</body>
</html>