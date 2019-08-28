<%@ page import="com.google.gson.Gson"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="study.model1.mybatis.model.Department"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Calendar c = Calendar.getInstance();
	String pubDate = String.format("%04d-%02d-%02d %02d:%02d:%02d",c.get(Calendar.YEAR),c.get(Calendar.MONTH) +1, c.get(Calendar.DAY_OF_MONTH),c.get(Calendar.HOUR_OF_DAY),c.get(Calendar.MINUTE),c.get(Calendar.SECOND));
	
	List<Department> itemList = new ArrayList<Department>();
	
	for(int i = 1; i <11; i++){
		Department item = new Department();
		item.setDeptno(100 + i);
		item.setDname("컴퓨터학과" + i);
		item.setLoc(i + "강의실");
		itemList.add(item);
	}
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("rt","OK");
	map.put("pubDate",pubDate);
	map.put("item",itemList);

	Gson gson = new Gson();
	String json = gson.toJson(map);
	out.print(json);
%>