<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>POST 전송</h1>
	<form name ="myform" method="post" action="to.jsp">
        <div>
            이름: <input type="text" name="userName"/> <!-- request.getParameter("userName") -->
        </div><!-- HTML의 NAME속성값이 JSP에서 request.getparmeter에 전달한 파라미터 이름이 된다. -->
        <div>
            나이: <input type="number" name="age"/>
        </div>
        <div>
            성별:
            <label><input type="radio" name="gender" value="M" checked>남자</label>
            <label><input type="radio" name="gender" value="M">여자</label>
        </div>
        <div>
            취향
            <label><input type="checkbox" name="favor" value="red">빨강</label>
            <label><input type="checkbox" name="favor" value="green">초록</label>
            <label><input type="checkbox" name="favor" value="blue">파란</label>
        </div>
        <button type="submit">전송</button>
    </form>
</body>
</html>