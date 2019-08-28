<%@ page import="study.model1.mybatis.MybatisConnectionFactory"%>
<%@ page import="study.model1.helper.WebHelper"%>
<%@ page import="study.model1.mybatis.model.Department"%>
<%@ page import="study.model1.mybatis.service.impl.DepartmentServiceImpl"%>
<%@ page import="study.model1.mybatis.service.DepartmentService"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
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
	<h1>학과삭제</h1>
	<form method="post" action="dept_delete_ok.jsp">
		<input type="hidden" name="deptno" value="<%=output.getDeptno()%>" />
		<div>
			<label for="dname">학과명: </label> <input type="text" name="dname"
				id="dname" value="<%=output.getDname()%>" />
		</div>
		<div>
			<label for="loc">위치: </label> <input type="text" name="loc" id="loc"
				value="<%=output.getLoc()%>" />
		</div>
		<hr />
		<button type="submit">삭제하기</button>
		<button type="reset">다시작성</button>
	</form>
</body>
</html>