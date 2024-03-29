<%@page import="study.model1.mybatis.service.impl.DepartmentServiceImpl"%>
<%@page import="study.model1.mybatis.service.DepartmentService"%>
<%@page import="study.model1.mybatis.MybatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.mybatis.model.Department"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);
	int deptno = webHelper.getInt("deptno");
	if (deptno == 0) {
		webHelper.redirect(null, "학과번호가 없습니다.");
		return;
	}
	Department input = new Department();
	input.setDeptno(deptno);
	try {
		departmentService.deleteDepartment(input);
	} catch (Exception e) {
		sqlSession.close();
		webHelper.redirect(null, e.getLocalizedMessage());
		return;
	}
	sqlSession.close();
	webHelper.redirect("dept_list.jsp", "삭제되었습니다.");
%>