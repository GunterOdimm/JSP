<%@page import="study.model1.retrofit.model.Image"%>
<%@page import="study.model1.retrofit.service.KakaoSearchService"%>
<%@page import="retrofit2.Call"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	WebHelper webHelper = WebHelper.getInstance(request,response);
	String query = webHelper.getString("query","");
	
	Image image = null;
	
	if(!query.equals("")){
		KakaoSearchService kakaoSerachService = KakaoSearchService.retrofit.create(KakaoSearchService.class);
		Call<Image> call = kakaoSerachService.getImage(query,1,50);
		image = call.execute().body();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>카카오 이미지 검색</h1>
	<form name="form1" method="get" action="Kakao_image_search.jsp">
	<!-- 자기자신한테 자신을 반환한다. -->
		<label for="query">검색어</label>
		<input type="serach" id="query" name="query" value="<%=query %>"/>
		<input type="submit" value="검색"/>
	</form>
	<%if (image !=null) {%>
	<table border="1">
		<% for(Image.Doucments item : image.documents) {%>
		<tr>
			<td>
				<a href="<%=item.image_url%>"><img src="<%=item.thumbnail_url %>"width="150" height="150"/></a>
			</td>
		</tr>
		<%} %>
	</table>
	<%} %>
</body>
</html>