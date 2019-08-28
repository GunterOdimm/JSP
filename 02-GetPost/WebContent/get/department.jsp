<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="study.java.model.Department"%>
<%
    request.setCharacterEncoding("utf-8");
    String deptno = request.getParameter("deptno");
    Department department = null;

    if(deptno!= null){
        if(deptno.equals("101")){
            department = new Department(101, "컴퓨터공학과","1호관");
        }
        if(deptno.equals("102")){
            department = new Department(102, "멀티미디어공확과","2호관");
        }
        if(deptno.equals("201")){
            department = new Department(201, "전기공학과","3호관");
        }
        if(deptno.equals("202")){
            department = new Department(202, "기계공학과","4호관");
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
	<h1>학과정보</h1>

    <a href="department.jsp?deptno=101">컴퓨터공학과</a>
    <a href="department.jsp?deptno=102">멀티미디어공학과</a>
    <a href="department.jsp?deptno=201">전기공학과</a>
    <a href="department.jsp?deptno=202">기계공학과</a>
	<hr/>
    <%if(department == null) {%>
    <h2>메뉴를 선택하세요</h2>
    <% }else{ %>
    <table>
        <tr>
            <th>학과번호</th>
            <td><%=department.getDeptno()%></td>
        </tr>
        <tr>
            <th>학과이름</th>
            <td><%=department.getDname()%></td>
        </tr>
        <tr>
            <th>학과위치</th>
            <td><%=department.getLoc()%></td>
        </tr>
    </table>
    <%}%>
</body>
</html>