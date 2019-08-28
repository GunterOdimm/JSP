<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post방식의 이메일 보내기</title>
</head>
<body>
	<h1>간단 설문조사 1/3</h1>
	
	<form name="myform" method="post" action="q02.jsp">
	<!--  위의 폼테그 정리 name = 폼의 명칭 method = 전송방식을 get으로 할지 post로 할지 정함 action = 폼이 전송될 스크립트 파일을 지정한다
		   정리하면 myform 을 가진 post전송박식의 form 이 q02.jsp스크립트로 폼을 보내겠다는 설정.  -->
		<div>
			<label for="userName">이름</label>
			<input type="text" name="userNmae" id="userName"/>
			<!-- 여기서 name은 폼을 의미한다. id값은 getElementByld에 사용된다. -->
		</div>
		<div>
			<label for="userEmail">이메일</label>
			<input type="text" name="userEmail" id="userEmail"/>
		</div>
		<div>
			<label for="userName">연락처</label>
			<input type="text" name="userTel" id="userTel"/>
		</div>
		<button type="submit">다음단계</button>
	</form>
</body>
</html>