
<%@page import="study.jsp.myschool.model.Student"%>
<%@page import="study.jsp.myschool.service.impl.StudentServiceImpl"%>
<%@page import="study.jsp.myschool.service.StudentService"%>
<%@page import="study.jsp.myschool.MyBatisConnectionFactory"%>
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
	input.setStudno(100);
	
	int output = 0;
	
	try {
		output = studentService.deleteStudent(input);	
	} catch (Exception e) {
		sqlSession.close();
		out.println(e.getLocalizedMessage());
		return;
	}

	out.println("<h1>삭제된 데이터 수: " + output + "</h1>");

	sqlSession.close();
%>
