<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Java 메일 발송 연습</h1>
	<form method="post" action="send.jsp">
		<!--  
		<div>
			<label for="from">발신주소: </label>
			<input type="email" name="from" id="from" />
		</div>
		-->
		<div>
			<label for="to">수신주소: </label>
			<input type="email" name="to" id="to" />
		</div>
		<div>
			<label for="subject">메일제목: </label>
			<input type="text" name="subject" id="subject" />
		</div>
		<hr />
		<textarea name="content" class="ckeditor" ></textarea>
		<hr />
		<input type="submit" value="메일보내기" />		
	</form>
	
	<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
</body>
</html>