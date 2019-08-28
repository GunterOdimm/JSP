<%@page import="study.model1.helper.WebHelper"%>
<%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	WebHelper web = WebHelper.getInstance(request, response);

	// post 파라미터 수신, 값이 없을 경우 null로 리턴됨 설정  getString으로 받는 내용은 name값
	// -> form태그로 보낼 땐 한글값을 가진 밸류도 그대로 넘어가기 때문에 인코딩을 하지 않아도 됨.
	String userName = web.getString("user_name");
	String userEmail = web.getString("user_email");
	String userTel = web.getString("user_tel");
	String gender = web.getString("gender");
	
	if(userName == null || userEmail == null || userTel == null || gender == null) {
		web.redirect(null, "입력항목이 잘못되었습니다.");
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
	<h1>간단 설문조사 3/3</h1>
	<h2>취미를 선택해 주세요.</h2>
	
	<form name="myform" method="post" action="result.jsp">
		<input type="hidden" name="user_name" value="<%=userName%>">
		<input type="hidden" name="user_email" value="<%=userEmail%>">
		<input type="hidden" name="user_tel" value="<%=userTel%>">
		<input type="hidden" name="gender" value="<%=gender%>">

		<!-- 설문항목 -->
		<div>
			<label>
				<input type="checkbox" name="hobby" value="음악감상" checked>음악감상
			</label>
			<label>
				<input type="checkbox" name="hobby" value="영화감상">영화감상
			</label>
			<label>
				<input type="checkbox" name="hobby" value="게임">게임
			</label>
		</div>
		<button type="submit">결과보기</button>
	</form>
</body>
</html>