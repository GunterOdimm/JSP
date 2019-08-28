<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    session.setMaxInactiveInterval(60);
    //mysession을 받지만 이는 오브젝트다 형이 다르기 때문에
    //형변환을 해주어야 한다 그래서 스트링을 명시해줘야한다.
    String mySession = (String) session.getAttribute("mysession");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>cookie</title>
</head>
<body>
	<h1>세션 예제</h1>
    <%
        if(mySession == null || mySession.equals("")){
        out.println("<h2>mySession 값 없음</h2>");
        } else{
            out.println("<h2>mySession = " + mySession + "</h2>");
        }
    %>
    <form method="post" action="session_ok.jsp">
        <label for="userInput">저장할 내용 입력</label>
        <input type="text" name="userInput" id="userInput"/>
        <button type="submit">세션저장</button>
    </form>
</body>
</html>