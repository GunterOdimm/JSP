<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    //세션에 유효시간을 준다 (분단위, 기본값 5분) 모든페이지마다 개별 설정해야한다.
    session.setMaxInactiveInterval(60);

    String input = request.getParameter("userInput");

    if(input != null && !input.equals("")){

    //세션저장 (key, value)형식으로
    //모든 타입의 객체를 저장할수 있다.
    session.setAttribute("mysession",input);
    }else {
        //개별 세션 삭제
        session.removeAttribute("mysession");
    }
    //페이지 강제 이동.
    response.sendRedirect("session.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>