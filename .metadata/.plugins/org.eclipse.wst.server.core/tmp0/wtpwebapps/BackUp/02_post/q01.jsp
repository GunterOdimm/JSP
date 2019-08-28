<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>간단 설문조사 1/3</h1>
	<h2>기본정보 입력</h2>

	<form name="myform" method="post" action="q02.jsp">
		<div>
			<label for="user_name">이름</label>
			<input type="text" name="user_name" id="user_name">
		</div>
		<div>
			<label for="user_email">이메일</label>
			<input type="email" name="user_email" id="user_email">
		</div>
		<div>
			<label for="user_tel">연락처</label>
			<input type="tel" name="user_tel" id="user_tel">
		</div>
		<button type="submit">다음단계</button>
	</form>
</body>
</html>