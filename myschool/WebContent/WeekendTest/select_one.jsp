
<%@page import="study.jsp.myschool.model.Student"%>
<%@page import="study.jsp.myschool.service.impl.StudentServiceImpl"%>
<%@page import="study.jsp.myschool.service.StudentService"%>
<%@page import="study.jsp.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	//1) 데이터베이스 접속
	// --> import study.java.myschool.MyBatisConnectionFactory;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	StudentService studentService = new StudentServiceImpl(sqlSession);

	Student input = new Student();
	input.setStudno(10101);
	
	Student output = null;

	try {
		output = studentService.getStudentItem(input);
	} catch (Exception e) {
		sqlSession.close();
		out.println(e.getLocalizedMessage());
		return;
	}
	
	out.println("<h1>" + output.toString() + "</h1>");

	// 5) DB 접속 해제
	sqlSession.close();
%>
