<%@page import="study.model1.retrofit.model.Book"%>
<%@page import="retrofit2.Call"%>
<%@page import="study.model1.retrofit.service.KakaoSearchService"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	WebHelper webHelper = WebHelper.getInstance(request,response);
	String query = webHelper.getString("query","");
	
	Book book  = null;
	
	if(!query.equals("")){
		KakaoSearchService kakaoSerachService = KakaoSearchService.retrofit.create(KakaoSearchService.class);
		Call<Book> call = kakaoSerachService.getBook(query,1,50);
		book = call.execute().body();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>카카오 책 검색</h1>
	<form name="form1" method="get" action="Kakao_book_search.jsp">
	<!-- 자기자신한테 자신을 반환한다. -->
		<label for="query">검색어</label>
		<input type="serach" id="query" name="query" value="<%=query %>"/>
		<input type="submit" value="검색"/>
	</form>
	<%if (book !=null) {%>
	<table border="1">
		<% for(Book.Doucments item : book.documents) {%>
		<tr>
			<td>
				<a href="<%=item.url%>"><img src="<%=item.thumbnail %>"height="150"/></a>
			</td>
			<td>
				<h3>
					<a href="<%=item.url %>"target="_blank"><%=item.title%></a>
				</h3>
				<ul>
					<li>정가 : <%=item.price %></li>
					<li>판매가 : <%=item.sale_price %></li>
					<li>저자 : <%=String.join(",",item.authors) %></li>
					<li>출판사 : <%=item.publisher %></li>
				</ul>
			</td>
		</tr>
		<%} %>
	</table>
	<%} %>
</body>
</html>