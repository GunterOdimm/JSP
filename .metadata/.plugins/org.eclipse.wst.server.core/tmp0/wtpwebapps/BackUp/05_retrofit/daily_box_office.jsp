<%@page import="study.model1.retrofit.model.SearchDailyboxOfficeList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="study.model1.retrofit.model.SearchDailyboxOfficeList.BoxOfficeResult.DailyBoxOfficeList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="retrofit2.Call"%>
<%@page import="study.model1.retrofit.service.KobisService"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	WebHelper webHelper = WebHelper.getInstance(request, response);

	String date = webHelper.getString("date");

	SearchDailyboxOfficeList searchDailyboxOfficeList = null;

	if (date == null) {
		/* 
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -1);
		자바 28번에 확인하면 캘린더 나온다.
		*/
		 
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		date = sdf.format(cal.getTime());
		
		/* 
		Calendar reg_dt = Calendar.getInstance();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd : hh:mm:ss");
		String reg_date = sf.format(reg_dt.getTime()); 
		*/
	}
	//date값에 -를 빼서 사용하자.
	String targetDt = date.replace("-", "");
	System.out.println(targetDt);
	//targetDt가 실제로 데이터가 들어가는지 확인해보자
	
	KobisService kobisService = KobisService.retrofit.create(KobisService.class);

	Call<SearchDailyboxOfficeList> call = kobisService.getSearchDailyboxOfficeList(targetDt);
	searchDailyboxOfficeList = call.execute().body();

	List<DailyBoxOfficeList> list = null;

	if (searchDailyboxOfficeList != null) {
		list = searchDailyboxOfficeList.boxOfficeResult.dailyBoxOfficeList;
	}

	DecimalFormat formatter = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=targetDt%>박스오피스</h1>
	<form name="form1" method="post" action="daily_box_office.jsp">
		<!-- 자기자신한테 자신을 반환한다. -->
		<label for="date">검색일</label> 
		<input type="search" id="date"name="date" value="<%=date%>" />
		<input type="submit" value="검색" />
		<%System.out.println(date); %>
			<%
			if (list != null && list.size() > 0) {
		%>
	<hr />
	<table border="1">
		<thead>
			<tr>
				<th>순위</th>
				<th>제목</th>
				<th>개봉일</th>
				<th>누적매출액</th>
				<th>오늘관객수</th>
				<th>누적관객수</th>
			</tr>
		</thead>
		<tbody>
			<% for (SearchDailyboxOfficeList.BoxOfficeResult.DailyBoxOfficeList item : list) { %>
			<tr>
				<td><%=item.rank%></td>
				<td><%=item.movieNm%></td>
				<td><%=item.openDt%></td>
				<td><%=formatter.format(item.salesAcc)%>원</td>
				<td><%=formatter.format(item.audiCnt)%>명</td>
				<td><%=formatter.format(item.audiAcc)%>명</td>
			</tr>
			<% } %>
		</tbody>
	</table>
		<% } %>
	</form>
</body>
</html>