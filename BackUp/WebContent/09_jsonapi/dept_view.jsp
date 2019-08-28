<%@page import="java.util.Calendar"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.mybatis.MybatisConnectionFactory"%>
<%@page import="study.model1.mybatis.service.impl.DepartmentServiceImpl"%>
<%@page import="study.model1.mybatis.service.DepartmentService"%>
<%@page import="study.model1.mybatis.model.Department"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);
	int deptno = webHelper.getInt("deptno");
	
	Department input = new Department();
	input.setDeptno(deptno);
	Department output = null;

	//주석처리 부분은 모두 헬퍼를 수정하기전 코드입니다.
	/* 
	Calendar c = Calendar.getInstance();
	String pubDate = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR),
			c.get(Calendar.MONTH) + 1, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY),
			c.get(Calendar.MINUTE), c.get(Calendar.SECOND));
	Gson gson = new Gson();
	Map<String, Object> map = new HashMap<String, Object>();
	 */
	 Map<String,Object> data = new HashMap<String,Object>();
	 
	try {
		output = departmentService.getDepartmentItem(input);
	} catch (Exception e) {
		webHelper.printJson(e.getLocalizedMessage());
		sqlSession.close();
		return;
		
		/* 
		map.put("rt", "학과번호가 없습니다");
		map.put("pubDate", pubDate);

		String json = gson.toJson(map);
		out.print(json);
		return; 
		*/
	}
	sqlSession.close();
	/*
	map.put("rt", "OK");
	map.put("item", output);
	map.put("pubDate", pubDate);
	String json = gson.toJson(map);
	out.print(json);
	*/
	data.put("item", output);
	
	webHelper.printJson(data);
%>
