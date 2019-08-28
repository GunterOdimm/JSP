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

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		date = sdf.format(cal.getTime());


	}
	//date값에 -를 빼서 사용하자.
	String targetDt = date.replace("-", "");

	KobisService kobisService = KobisService.retrofit.create(KobisService.class);

	Call<SearchDailyboxOfficeList> call = kobisService.getSearchDailyboxOfficeList(targetDt);
	searchDailyboxOfficeList = call.execute().body();

	List<DailyBoxOfficeList> list = null;

	if (searchDailyboxOfficeList != null) {
		list = searchDailyboxOfficeList.boxOfficeResult.dailyBoxOfficeList;
	}

	int size = list.size();
	String[] audiCnt = new String[size];
	String[] movieNm = new String[size];
	String[] salesAcc = new String[size];
	String[] audiAcc = new String[size];

	for(int i=0; i<size; i++){
		SearchDailyboxOfficeList.BoxOfficeResult.DailyBoxOfficeList item = list.get(i);
		movieNm[i] = "'" + item.movieNm + "'";
		audiCnt[i] = String.valueOf(item.audiCnt);
		salesAcc[i] = String.valueOf(item.salesAcc);
		audiAcc[i] = String.valueOf(item.audiAcc);
	}
	String movieNmStr = String.join(",", movieNm);
	String audiCntStr = String.join(",", audiCnt);
	String salesAccStr = String.join(",", salesAcc);
	String audiAccStr = String.join(",", audiAcc);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/assets/billboard.min.css">
</head>
<body>
	<h1><%=targetDt%>박스오피스</h1>
	<form name="form1" method="get" action="daily_box_office_graph.jsp">
		<!-- 자기자신한테 자신을 반환한다. -->
		<label for="date">검색일</label>
		<input type="date" id="date"name="date" value="<%=date%>" />
		<input type="submit" value="검색" />
		<hr/>
	</form>
	<div id="barChart" style="width: 1024px; height:600px;"></div>

	<script src="//d3js.org/d3.v5.min.js"></script>

	<script type="text/javascript" src="<%= request.getContextPath()%>/assets/billboard.min.js"></script>
	<script>
		var chart = bb.generate({
		  	bindto:"#barChart",
		  	data:{
		  		colors: {
			  	    '관객수': "#000000",
			  	    '누적관객수' : "#ff0000"
		  		},
		  		columns:[
		  			['영화제목', <%=movieNmStr%>],
		  			['관객수', <%=audiCntStr%>],
		  			['누적관객수', <%=audiAccStr%>]
		  		],
		  		x: '영화제목',
		  		type:"area-spline"
		  	},
		  	axis:{
				x:{
					type:"category",
					height: 150,
					tick:{
						rotate:-45,
						multiline: false,
						tooltip:true
					}
				}
		  	}
		});
	</script>
</body>
</html>