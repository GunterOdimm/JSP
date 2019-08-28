<%@page import="study.model1.retrofit.service.SimpleService"%>
<%@page import="retrofit2.Call"%>
<%@page import="study.model1.retrofit.model.GradeList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//
	SimpleService simpleService = SimpleService.retrofit.create(SimpleService.class);

	// 메서드 호출해서 call 객체를 리턴받는다.
	Call<GradeList> call = simpleService.getGradeList();
	
	//call객체를 통해 JSON 파이싱이 완료된 Beans 객체를 리턴 받는다.
	GradeList gradeList = call.execute().body();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% for (GradeList.Student student : gradeList.student) { %>
	<h1><%=student.name%></h1>
	<table border="1">
		<tr align="center">
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
		</tr>
		<tr align="center">
			<td width = "120"><%=student.kor %></td>
			<td width = "120"><%=student.eng %></td>
			<td width = "120"><%=student.math %></td>
		</tr>
	</table>
	<%} %>
</body>
</html>