<%@page import="java.util.Calendar"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="study.model1.helper.PageData"%>
<%@page import="java.util.List"%>
<%@page import="study.model1.mybatis.service.impl.DepartmentServiceImpl"%>
<%@page import="study.model1.mybatis.service.DepartmentService"%>
<%@page import="study.model1.mybatis.MybatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@page import="study.model1.mybatis.model.Department"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);

	String keyword = webHelper.getString("keyword", "");
	int nowPage = webHelper.getInt("page", 1);
	int totalCount = 0;
	int listCount = 10;
	int pageCount = 5;
	
	Department input = new Department();
	input.setDname(keyword);
	input.setLoc(keyword);
	
	//주석처리 부분은 모두 헬퍼를 수정하기전 코드입니다.
	//만들어지는 결과가 output에 저장된다 이를 map에 다가 할당에 출력만 하면 된다.
	List<Department> output = null;
	/* 
	Calendar c = Calendar.getInstance();
	String pubDate = String.format("%04d-%02d-%02d %02d:%02d:%02d",
			 c.get(Calendar.YEAR),c.get(Calendar.MONTH) +1, 
			 c.get(Calendar.DAY_OF_MONTH),c.get(Calendar.HOUR_OF_DAY),
			 c.get(Calendar.MINUTE),c.get(Calendar.SECOND));
	 */
	PageData pageData = null;

	try {
		totalCount = departmentService.getDepartmentCount(input);
		pageData = new PageData(nowPage, totalCount, listCount, pageCount);
		
		Department.setOffset(pageData.getOffset());
		Department.setListCount(pageData.getListCount());
		
		output = departmentService.getDepartmentList(input);
	} catch (Exception e) {
		/* webHelper.redirect(null, e.getLocalizedMessage()); */
		webHelper.printJson(e.getLocalizedMessage()); /* HTML 을 가져갈때 사용하던 모든 web.redirect 를 수정해야함. */
		sqlSession.close();
		return;
	}
	
	 sqlSession.close();
	 if(output.size() == 0){
		 webHelper.printJson("조회된 데이터 결과가 없습니다.");
		 return;
		 
		 /*
		 위의 코드는 list에서 output은 list로 받아진다
		 그래서 실제로는 없는 key값이 들어가도 배열은 할당이 되기에 exception으로 넘어가지 못한다.
		 그래서 직접 if문으로 output사이즈가 0일때를 지정해줘야한다.
		 */
	 }
	 
	/* Map<String,Object> map = new HashMap<String,Object>(); */
	Map<String, Object> data = new HashMap<String, Object>();
	
	/* 
	map.put("rt", "OK"); 
	map.put("item", output);
	map.put("meta", pageData);
	map.put("pubDate",pubDate); */
    
    data.put("item", output);
	data.put("meta", pageData);

	/* 
	Gson gson = new Gson();
	String json = gson.toJson(map);
	out.print(json); 
	*/
	webHelper.printJson(data);
	//결과 출력시 rt와 pubDate는 제외한다.helper에서 알아서 출력
	
	/* 
	RESTful 위에서한 모든 결과(CRUD를 모두 하나의jsp에 담는 방법이다.)
	이는 실무에서 사용되는 기술이며 이거 사용할때쯤 되면 json을 사용하지 않는다.
	
	 */
%>