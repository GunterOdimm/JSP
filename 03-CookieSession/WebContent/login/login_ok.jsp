<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="study.jsp.session.model.Member" %>
<%
  request.setCharacterEncoding("UTF-8");

  String userId = request.getParameter("user_id");
  String userPw = request.getParameter("user_pw");

  //필수값의 존재 여부 검사
  if(userId == null || userId.equals("")){
        //메시지 박스를 출력하고 이전 페이지로 이동하도록 자바 스크립트 출력
        out.print("<script>alert('아이디를 입력하세요'); history.back();</script>");
        //현재 페이지의 실행 중단.
        return;
    }

    if(userPw == null || userPw.equals("")){
        out.print("<script>alert('비밀번호를 입력하세요');history.back();</script>");
        return;
    }

    Member member = new Member();
    member.setUserId("sejew93");
    member.setUserPw("123qwe!@#");
    member.setUserName("스읍");
    member.setEmail("sejew93@gmail.com");

    if (!userId.equals(member.getUserId()) || !userPw.equals(member.getUserPw())){
        out.print("<script>alert('아이디나 비밀번호가 잘못되었습니다.'); history.back();</script>");
        return;
    }

    //모든 조건이 충족된 경우 로그인 처리 = 세션 생성
    session.setAttribute("login_info", member);

    //기존 페이지로 돌아가기
    response.sendRedirect("login.jsp");
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