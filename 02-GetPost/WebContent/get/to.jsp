<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- 다른페이지에서 변수값을 받아서 연결하는 코드 -->
<%
    /*파라미터 수신에 사용할 문자셋 설정(각 페이지당 최 상단에서 1회 설정)*/
    request.setCharacterEncoding("utf-8");
    /*파라미터 받기*/
    String ans = request.getParameter("ans");

    String result = null;
	
    if(ans == null || ans.equals("")){
    	String script = "<script>";
    	script += "alert('값이 없습니다.');";
    	script += "history.back();";
    	script += "</script>";
    	
    	out.print(script);
    	
    	return;
    }
    
    int userSelect = Integer.parseInt(ans);
    if(userSelect == 300){
    result = "정답입니다!!!";
    }else{
        result = "정답이 아닙니다!! 빡대가리~";
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
    <h1>응답결과</h1>
    <h2>선택한 값: <%=ans%></h2>
    <h3><%=result%></h3>
</body>
</html>