<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
</head>
<body>
    <h1>팝업창</h1>
    <p>opener.jsp에 의해서 열려진 팝업창 입니다.</p>

    <form method="post" action="child_close.jsp">
        <label>
            <input type="checkbox" name="is_popup" value="Y">
            1분간 창 열지 않음
        </label>
        <button type="submit">닫기</button>
    </form>
</body>
</html>