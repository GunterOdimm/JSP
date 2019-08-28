<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="study.model1.mybatis.model.Department"%>
<%@ page import="study.model1.mybatis.service.impl.DepartmentServiceImpl"%>
<%@ page import="study.model1.mybatis.service.DepartmentService"%>
<%@ page import="study.model1.mybatis.MybatisConnectionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);
	int deptno = webHelper.getInt("deptno");
	String dname = webHelper.getString("dname");
	String loc = webHelper.getString("loc");
	if (deptno == 0) {
		/* webHelper.redirect(null, "학과번호가 없습니다."); */
		webHelper.printJson("학과번호가 없습니다.");
		return;
	}
	if (dname == null) {
		/* webHelper.redirect(null, "학과이름을 입력하세요."); */
		webHelper.printJson("학과이름을 입력하세요.");
		return;
	}
	Department input = new Department();
	Department output = null;
	input.setDeptno(deptno);
	input.setDname(dname);
	input.setLoc(loc);
	try {
		departmentService.editDepartment(input);
		output = departmentService.getDepartmentItem(input);

	} catch (Exception e) {
		sqlSession.close();
		/* webHelper.redirect(null, e.getLocalizedMessage()); */
		webHelper.printJson(e.getLocalizedMessage());
		return;
	}
	sqlSession.close();
	/* webHelper.redirect("dept_view.jsp?deptno=" + input.getDeptno(), "수정되었습니다."); */
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("item",output);
	webHelper.printJson(map);
%>