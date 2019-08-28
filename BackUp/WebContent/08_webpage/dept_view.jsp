<%@page import="study.model1.helper.WebHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.mybatis.MybatisConnectionFactory"%>
<%@page import="study.model1.mybatis.service.impl.DepartmentServiceImpl"%>
<%@page import="study.model1.mybatis.service.DepartmentService"%>
<%@page import="study.model1.mybatis.model.Department"%>
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
	Department output = null;
	try {
		output = departmentService.getDepartmentItem(input);
	} catch (Exception e) {
		sqlSession.close();
		webHelper.redirect(null, e.getLocalizedMessage());
		return;
	}
	sqlSession.close();
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>Hello JSP</title>
</head>
<body>
	<h1>학과정보</h1>
	<p>
		학과번호:
		<%=output.getDeptno()%></p>
	<p>
		학과이름:
		<%=output.getDname()%></p>
	<p>
		학과위치:
		<%=output.getLoc()%></p>
	<hr />
	<a href="dept_list.jsp">[목록보기]</a>
	<a href="dept_add.jsp">[학과추가]</a>
	<a href="dept_edit.jsp?deptno=<%=output.getDeptno()%>">[학과수정]</a>
	<a href="dept_delete.jsp?deptno=<%=output.getDeptno()%>">[학과삭제]</a>
</body>
</html>