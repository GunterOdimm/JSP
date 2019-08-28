<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
    request.setCharacterEncoding("UTF-8");

    String userpopup = request.getParameter("is_popup");

    if(userpopup != null){
    //입력값이 존재할 경우 쿠킥 저장(혹은 덮어쓰기)
    String enc = URLEncoder.encode(userpopup,"utf-8");           //저장할때 한글을 인코딩해줌
    Cookie info = new Cookie("is_popup", enc);        //쿠키 생성(이름, 값 설정)
    info.setMaxAge(60);            //쿠키의 유효시간(초) - 지정하지 않을 경우 브라우저를 닫으면 즉시 삭제
    info.setPath("/");             //쿠키가 유효한 경로 설정 - 사이트 최상단 디렉토리 지정(사이트 전역에서 유효)
    info.setDomain("localhost");   //쿠키가 유효한 도메인 설정 --> 상용시에 사이트에 맞게 수정해야 함
    response.addCookie(info);      //쿠키 저장하기
    }
%>
    <script type="text/javascript">
        window.close();
    </script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
</head>
<body>

</body>
</html>