
<%@page import="study.jsp.myschool.model.Student"%>
<%@page import="study.jsp.myschool.service.impl.StudentServiceImpl"%>
<%@page import="study.jsp.myschool.service.StudentService"%>
<%@page import="study.jsp.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	//1) 데이터베이스 접속
	// --> import study.java.myschool.MyBatisConnectionFactory;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	StudentService studentService = new StudentServiceImpl(sqlSession);

	Student input = new Student();
	input.setName("서진원");
	input.setUserid("Gun");
	input.setGrade(3);
	input.setIdnum("9310071042110");
	input.setBirthdate("19931007");
	input.setTel("010)8576-6207");
	input.setHeight(177);
	input.setWeight(87);
	input.setDeptno(201);
	input.setProfno(9907);

	int output = 0;
	
	try {
		output = studentService.addStudent(input);	
	} catch (Exception e) {
		sqlSession.close();
		out.println(e.getLocalizedMessage());
		return;
	}
	
	out.println("<h1>저장된 데이터 수: " + output + "</h1>");
	out.println("<h1>신규로 저장된 학생 번호: " + input.getStudno() + "</h1>");

	// 5) DB 접속 해제
	sqlSession.close();
%>
