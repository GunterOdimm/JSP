<%@page import="study.model1.retrofit.model.Grade"%>
<%@page import="retrofit2.Call"%>
<%@page import="study.model1.retrofit.service.SimpleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//
	SimpleService simpleService = SimpleService.retrofit.create(SimpleService.class);

	// 메서드 호출해서 call 객체를 리턴받는다.
	Call<Grade> call = simpleService.getGrade();
	
	//call객체를 통해 JSON 파이싱이 완료된 Beans 객체를 리턴 받는다.
	Grade grade = call.execute().body();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=grade.student.name%></h1>
	<h1><%=grade.student.kor%></h1>
	<h1><%=grade.student.eng%></h1>
	<h1><%=grade.student.math%></h1>
</body>
</html>