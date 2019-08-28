<%@page import="study.model1.mybatis.service.impl.DepartmentServiceImpl"%>
<%@page import="study.model1.mybatis.service.DepartmentService"%>
<%@page import="study.model1.mybatis.model.Department"%>
<%@page import="study.model1.mybatis.MybatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	//1) 데이터베이스 접속
	// --> import study.java.myschool.MyBatisConnectionFactory;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);

	Department input = new Department();
	input.setDname("미래융합디자인학과");
	input.setLoc("7호관");

	int output = 0;
	
	try {
		output = departmentService.addDepartment(input);	
	} catch (Exception e) {
		sqlSession.close();
		out.println(e.getLocalizedMessage());
		return;
	}
	
	out.println("<h1>저장된 데이터 수: " + output + "</h1>");
	out.println("<h1>신규로 저장된 학과 번호: " + input.getDeptno() + "</h1>");

	// 5) DB 접속 해제
	sqlSession.close();
%>
