<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="study.jsp.session.model.Member" %>
<%
	Member loginInfo= (Member) session.getAttribute("login_info");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>cookie</title>
</head>
<body>
	<h1>로그인 예제</h1>
    <%
        if(loginInfo == null){
        //세션에서 획득한 객체가 없는 경우는 고르인 상태 아님
        //아이디 비밀번호 입력폼을 표시
    %>
    <form method="post" action="login_ok.jsp">
    	<div>
    		<input type="text" name="user_id" placeholder="아이디"/>
    	</div>
    	<div>
    		<input type="text" name="user_pw" placeholder="비밀번호"/>
    	</div>
        <button type="submit">로그인</button>
    </form>
    <%
        }else{
        //그렇지 않은경우 는 로그인중
        //세션에서 획득한 member객체로 원하는 정보 표시
    %>
    <h2>안녕하세요 <%=loginInfo.getUserName()%>님</h2>
    <h3><%=loginInfo.getEmail()%></h3>
    <a href="logout.jsp" class="btn btn-warning">로그아웃</a>
    <%
        }
    %>
</body>
</html>