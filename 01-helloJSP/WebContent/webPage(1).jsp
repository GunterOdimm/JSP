<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String color = "blue";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(color.equals("red")){
			out.println("<h1 style='color: red'> Hello JSP</h1>");
		}else{
			out.println("<h1 style='color: blue'> Hello JSP</h1>");
		}
	%>
		<%if(color.equals("red")){%>
			<h2 style='color: red'>안녕자바</h2>
		<%}else{%>
			<h2 style='color: blue'>안녕 JSP</h2>
		<%}%>
</body>
</html>