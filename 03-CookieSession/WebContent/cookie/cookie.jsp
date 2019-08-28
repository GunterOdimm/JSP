<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.net.URLDecoder"%>
<%
    //쿠키값을 저장할 문자열
    String myCookie = null;

    //저장된 모든 쿠키 목혹을 배열로 가져온다.
    Cookie[] cookies = request.getCookies();

    //쿠키 목록이 있다면?
    if(cookies != null){
        for(int i = 0; i < cookies.length; i++){
        String cookieName = cookies[i].getName(); //쿠키의 이름을 취득한다.
            //이름이 내가 원하는 값일 경우 값을 복사한다.
            if(cookieName.equals("mycookie")){
                //쿠키값을 취득한다.
                String value = cookies[i].getValue();
                //저장된 값의 문자열 길이가 0 보다 크다면?
                if(value.length() > 0){
                    //인코딩된 값이여서 디코딩 처리하여 원래값으로 복원해야한다.
                    myCookie = URLDecoder.decode(value,"UTF-8");
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>cookie</title>
</head>
<body>
	<h1>쿠키 예제</h1>
    <%
        if(myCookie == null){
            out.println("<h2>myCookie값 없음</h2>");
        }else{
            out.println("<h2>myCookie="+myCookie+"</h2>");
        }
    %>
    <form method="post" action="cookie_ok.jsp">
        <label for="userInput">저장할 내용 입력</label>
        <input type="text" name="userInput" id="userInput"/>
        <button type="submit">쿠키저장</button>
    </form>
</body>
</html>