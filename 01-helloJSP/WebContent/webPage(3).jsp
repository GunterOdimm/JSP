<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
	public String getMessage() {
		String msg="Hello JSP";
		return msg;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		String msg1 = getMessage();
		out.println("<h1>" +msg1+"</h1>");
	%>
	<%out.print("<h1>"+getMessage()+"</h1>"); %>
	
	<h1><%=getMessage()%></h1>
</body>
</html>