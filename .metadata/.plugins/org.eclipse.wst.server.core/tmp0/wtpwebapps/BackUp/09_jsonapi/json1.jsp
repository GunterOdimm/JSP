<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	Map<String, Object> map = new HashMap<String, Object>();

	map.put("deptno", 101);
	map.put("dname", "컴퓨터학과");
	map.put("loc","공학관");
	
	Gson gson = new Gson();
	String json = gson.toJson(map);
	out.print(json);
%>