
<%@page import="study.jsp.myschool.model.StudentAVG"%>
<%@page import="study.jsp.myschool.model.Student"%>
<%@page import="study.jsp.myschool.service.impl.StudentServiceImpl"%>
<%@page import="study.jsp.myschool.service.StudentService"%>
<%@page import="study.jsp.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	//1) 데이터베이스 접속
	// --> import study.java.myschool.MyBatisConnectionFactory;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	StudentService studentService = new StudentServiceImpl(sqlSession);

	List<Student> output = null;

	Student dept;
	Student intput = new Student();
	try {
		output = studentService.getStudentAVGList1(intput);
	} catch (Exception e) {
		sqlSession.close();
		out.println(e.getLocalizedMessage());
		return;
	}
	
	// 5) DB 접속 해제
	sqlSession.close();
	
	int test = output.size();
	String[] grade = new String[test];
	String[] avg_height = new String[test];
	String[] avg_weight = new String[test];
	
	for(int i=0; i<test; i++){
		dept = output.get(i);
		grade[i] = "'" + dept.getGrade() + "학년'";
		avg_height[i] =  String.valueOf(dept.getAvg_height());
		avg_weight[i] =String.valueOf(dept.getAvg_weight());
		
	}
	String gradeStr = String.join(",", grade);
	String avg_heightStr = String.join(",", avg_height);
	String avg_weightStr = String.join(",", avg_weight);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/assets/billboard.min.css">
</head>
<body>
	<h1>학년별 평균 몸무게 키</h1>

		<hr/>

	<div id="barChart" style="width: 1024px; height:600px;"></div>
	<script src="//d3js.org/d3.v5.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath()%>/assets/billboard.min.js"></script>
	<script>
		var chart = bb.generate({
		  	bindto:"#barChart",
		  	data:{
		  		columns:[
		  			['학년', <%=gradeStr%>],
		  			['평균키', <%=avg_heightStr%>],
		  			['평균몸무게', <%=avg_weightStr%>]
		  		],
		  		x: '학년',
		  		type:"radar"
		  	},
		  	axis:{
				x:{
					type:"category",
					height: 150,
					tick:{
						rotate:0,
						multiline: false,
						tooltip:true
					}
				}
		  	}
		});
	</script>
</body>
</html>