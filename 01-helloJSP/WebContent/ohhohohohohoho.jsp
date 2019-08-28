<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String message_eng = "hello JSP";
	String message_kor = "안녕하냐 제이에스피 이 망할 놈아";
	System.out.println(message_eng+"/"+message_kor);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1><%out.println(message_eng); %></h1>
	<h2><%=message_kor %></h2>
</body>
</html>