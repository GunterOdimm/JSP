<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>Hello JSP</title>
</head>
<body>
	<!-- 학과 번호를 보내줘야 하는데 어디서 그 학과 번호가 오는가? -->
	<!-- 데이터 저장에 성공하면 파리미터로 전달하는 input객체에 PK값이 저장된다. -->
	<h1>학과추가</h1>
	<form method="post" action="dept_add_ok.jsp">
		<div>
			<label for="dname">학과명: </label> <input type="text" name="dname"
				id="dname" />
		</div>
		<div>
			<label for="loc">위치: </label> <input type="text" name="loc" id="loc" />
		</div>
		<hr />
		<button type="submit">저장하기</button>
		<button type="reset">다시작성</button>
	</form>
</body>
</html>

