<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="study.jsp.helper.WebHelper" %>
<%
	WebHelper web = WebHelper.getInstance(request, response);
	
	String userName = web.getString("userName");
	String userEmail = web.getString("userEmail");
	String userTel = web.getString("userTel");
	String userGender = web.getString("userGender");
	
	if(userName == null || userEmail == null || userTel == null || userGender == null){
		web.redirect(null,"입력항목이 잘못되었습니다.");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post방식의 이메일 보내기</title>
</head>
<body>
	<h1>간단 설문조사 3/3</h1>
	
	<form name="myform" method="post" action="result.jsp">
	
		<input type="hidden" name="userName" value="<%=userName%>"/>
		<input type="hidden" name="userEmail" value="<%=userEmail%>"/>
		<input type="hidden" name="userTel" value="<%=userTel%>"/>
		<input type="hidden" name="userGender" value="<%=userGender%>"/>
		
		<div>
			<label>
			<input type="radio" name="userHobby" value="음악감상">음악감상
			</label>
			<label>
			<input type="radio" name="userHobby" value="영화감상">영화감상
			</label>
			<label>
			<input type="radio" name="userHobby" value="게임">게임
			</label>
			<label>
			<input type="radio" name="userHobby" value="운동">운동
			</label>
			<label>
			<input type="radio" name="userHobby" value="도박">도박
			</label>
		</div>
		
		<button type="submit">결과보기</button>
	</form>
</body>
</html>