<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="study.model1.mybatis.model.Department"%>
<%@page import="study.model1.mybatis.service.DepartmentService"%>
<%@page import="study.model1.mybatis.service.impl.DepartmentServiceImpl"%>
<%@page import="study.model1.mybatis.MybatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);
	String dname = webHelper.getString("dname");
	String loc = webHelper.getString("loc");
	//학과 이름은 필수 항목이르모 입력 여부를 검사.
	// 위치는 미필수이므로 입력 여부를 검사하지 않는다.
	if (dname == null) {
		/* webHelper.redirect(null, "학과이름을 입력하세요."); */
		webHelper.printJson("학과이름을 입력하세요.");
		return;
	}
	Department input = new Department();
	Department output = null;
	try {
		departmentService.addDepartment(input);
		output = departmentService.getDepartmentItem(input);
		
	} catch (Exception e) {
		sqlSession.close();
		/* webHelper.redirect(null, e.getLocalizedMessage()); */
		webHelper.printJson(e.getLocalizedMessage());
		return;
	}
	
	sqlSession.close();
	// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("item",output);
	webHelper.printJson(map);
%>