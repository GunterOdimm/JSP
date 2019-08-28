<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="study.java.myschool.model.Department"%>
<%@page import="java.util.List"%>
<%@page import="study.java.myschool.service.impl.DepartmentServiceImpl"%>
<%@page import="study.java.myschool.service.DepartmentService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 	
		/** 처리 결과를 기록할 Log4J 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		// --> import org.apache.logging.log4j.Logger;
		Logger logger = LogManager.getFormatterLogger("test.jsp");
		
		/** 데이터베이스 접속 */
		// --> import org.apache.ibatis.session.SqlSession;
		SqlSession sess = MyBatisConnectionFactory.getSqlSession();
		
		/** 데이터 처리 수행 */
		// 비지니스 로직을 위한 Service 객체 생성
		// --> import study.java.myschool.service.DepartmentService;
		// --> import study.java.myschool.service.impl.DepartmentServiceImpl;
		DepartmentService departmentService = new DepartmentServiceImpl(sess);
		// 조회 결과가 저장될 객체 선언 --> import java.util.List;
		List<Department> list = null;
		
		try {
			// 학과 조회하기
			list = departmentService.getDepartmentList();
			// 조회결과를 반복문으로 스캔하면서 출력한다.
			/* for (int i=0; i<list.size(); i++) {
				Department temp = list.get(i);
				logger.debug(String.format("조회결과[%d] >> %s", i, temp.toString()));
			} */
		} catch (NullPointerException e) {
			logger.error("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			logger.error("데이터 조회에 실패했습니다." + e.getMessage());
		}
		
		/** 데이터베이스 접속 해제 */
		sess.close();
		
	

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<table border ="1">
		<thead>
			<tr>
				<th>학과번호</th>
				<th>학과이름</th>
				<th>위치</th>
			</tr>
		</thead>
		<tbody>
			<%
				if(list != null){
					for(int i =0;i<3;i++){
						Department item = list.get(i);
			%>
			<tr>
				<th><%=item.getDeptno() %></th>
				<th><%=item.getDname() %></th>
				<th><%=item.getLoc() %></th>
			</tr>
			<%
				}
			}
			%>
		</tbody>
	</table>
</body>
</html>