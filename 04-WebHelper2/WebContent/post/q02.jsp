<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="study.jsp.helper.WebHelper" %>
<%
	WebHelper web = WebHelper.getInstance(request, response);
	
	String userName = web.getString("userNmae");
	String userEmail = web.getString("userEmail");
	String userTel = web.getString("userTel");
	
	if(userName == null || userEmail == null || userTel == null){
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
	<h1>간단 설문조사 2/3</h1>
	<h2>성별 선택</h2>
	
	<form name="myform" method="post" action="q03.jsp">
		<input type="hidden" name="userName" value="<%=userName%>"/>
		<!-- 여기서 value가 받는 userName 은 위의 1페이지에서 받아온 userName 을 String으로 변환 시킨 값 -->
		<input type="hidden" name="userEmail" value="<%=userEmail%>"/>
		<input type="hidden" name="userTel" value="<%=userTel%>"/>
		
		<div>
			<label>
			<input type="radio" name="userGender" value="남자" checked>남자
			</label>
			<label>
			<input type="radio" name="userGender" value="여자" checked>여자
			</label>
		</div>
		<button type="submit">다음단계</button>
	</form>

</body>
</html>