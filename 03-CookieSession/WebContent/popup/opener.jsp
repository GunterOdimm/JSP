<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.net.URLDecoder"%>
<%
    Cookie[] cookies = request.getCookies();
    String userpopup = null;

    if(cookies != null){
        for(int i = 0; i < cookies.length; i++){
            String name = cookies[i].getName();
            if(name.equals("is_popup")){
            String value = cookies[i].getValue();

            if(value.length() > 0){
            userpopup = URLDecoder.decode(value,"UTF-8");
            }
        }
    }
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
</head>
<body>
    <h1>팝업창 열기</h1>

    <%if (userpopup == null) { %>
    <script type="text/javascript">
        //javascript팝업창 열기
        var popup = window.open("child.jsp","child-win","width=350,height=300");
        if(!popup){
            alert("팝업창을 허용해 주세요.");
        }
    </script>
    <% } %>
</body>
</html>