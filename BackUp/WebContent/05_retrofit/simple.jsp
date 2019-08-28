
<%@page import="study.model1.retrofit.model.Simple"%>
<%@page import="retrofit2.Call"%>
<%@page import="study.model1.retrofit.service.SimpleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//service 객체를 생성
	// --> SimpleService 인터페이스에 대한 구현체는 Retrofit이 자동으로 생성해 준다.
	SimpleService simpleService = SimpleService.retrofit.create(SimpleService.class);
	
	// 메서드를 호출해서 call 객체를 리턴받는다.
	Call<Simple> call = simpleService.getSimple();
	
	// call 객체를 통해 JSON 파싱이 완료된 Beans 객체를 리턴받는다.
	Simple simple = call.execute().body();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=simple.name%></h1>
	<h2><%=simple.type %></h2>
	<img src="<%=simple.img%>" width="150" >
</body>
</html>