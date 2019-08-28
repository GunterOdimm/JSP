<%@page import="study.model1.mybatis.MybatisConnectionFactory"%>
<%@page import="study.model1.mybatis.service.impl.DepartmentServiceImpl"%>
<%@page import="study.model1.mybatis.service.DepartmentService"%>
<%@page import="study.model1.mybatis.model.Department"%>
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
	input.setDeptno(248);
	
	int output = 0;
	
	try {
		output = departmentService.deleteDepartment(input);	
	} catch (Exception e) {
		sqlSession.close();
		out.println(e.getLocalizedMessage());
		return;
	}

	out.println("<h1>삭제된 데이터 수: " + output + "</h1>");

	sqlSession.close();
%>
