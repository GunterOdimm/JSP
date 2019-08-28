<%@page import="study.model1.helper.WebHelper"%>
<%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// webhelper 객체 생성
	WebHelper web = WebHelper.getInstance(request, response);
	
	// post 파라미터 수신, 값이 없을 경우 기본값 null로 리턴됨 설정 getString으로 받는 내용은 name값
	String userName = web.getString("user_name");
	String userEmail = web.getString("user_email");
	String userTel = web.getString("user_tel");
	
	if(userName == null || userEmail == null || userTel == null) {
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
	<h1>간단 설문조사 2/3</h1>
	<h2>성별선택</h2>

	<form name="myform" method="post" action="q03.jsp">
		<input type="hidden" name="user_name" value="<%=userName%>">
		<input type="hidden" name="user_email" value="<%=userEmail%>">
		<input type="hidden" name="user_tel" value="<%=userTel%>">

		<!-- 설문항목 -->
		<div>
			<label>
				<input type="radio" name="gender" name="gender" value="남자" checked>남자
			</label>
			<label>
				<input type="radio" name="gender" name="gender" value="여자">여자
			</label>
		</div>
		<button type="submit">다음단계</button>
	</form>

</body>
</html>