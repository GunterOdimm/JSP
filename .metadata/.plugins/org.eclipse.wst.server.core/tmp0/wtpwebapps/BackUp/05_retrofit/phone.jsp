<%@page import="study.model1.retrofit.model.phone"%>
<%@page import="retrofit2.Call"%>
<%@page import="study.model1.retrofit.service.SimpleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//
	SimpleService simpleService = SimpleService.retrofit.create(SimpleService.class);

	// 메서드 호출해서 call 객체를 리턴받는다.
	Call<phone> call = simpleService.getPhone();
	
	//call객체를 통해 JSON 파이싱이 완료된 Beans 객체를 리턴 받는다.
	phone phone = call.execute().body();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>http://itpaper.co.kr/demo/java/phone.json</h1>
	<img src="<%=phone.item.img%>" height="200"/>
	<table border="1">
		<tr>
			<th width="100">기기명</th>
			<td width="120"><%=phone.item.name%></td>
		</tr>
		<tr>
			<th width="100">제조사</th>
			<td width="120"><%=phone.item.type%></td>
		</tr>
		<tr>
			<th width="100">정가</th>
			<td width="120"><%=phone.item.price.fixed%></td>
		</tr>
		<tr>
			<th width="100">판매가</th>
			<td width="120"><%=phone.item.price.sale%></td>
		</tr>
	</table>
	<p>
		통신결과 :<%=phone.rt%>(<%=phone.rtmsg%>)
	</p>
</body>
</html>