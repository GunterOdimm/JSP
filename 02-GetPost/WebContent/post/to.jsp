<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    request.setCharacterEncoding("utf-8");

    String userName = request.getParameter("userName");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
	//체크박스오 ㅏ같이 name속성이 동일한 요소가 여러 개인 경우 파라미터를 배열로 리턴받는다.
	// 반드시 체크박스일 필요는 없다.text필드도 name속성이 동일한 항목들이 여러개라면 배열로 처리되어야 한다.
    String[] favor = request.getParameterValues("favor");
	
	//체크박스의 선택값이 저장될 문자열
	//favor배열의 각 원소를 첫 번째 파라미터로 설정한 구분값을 적용하여 하나의 문자열로 연결함.
    String colors =String.join(", ",favor);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
    <h1>이름 : <%=userName%></h1>
    <h1>나이 : <%=age%></h1>
    <h1>성별 : <%=gender%></h1>
    <h1>취향 : <%=colors%></h1>
</body>
</html>