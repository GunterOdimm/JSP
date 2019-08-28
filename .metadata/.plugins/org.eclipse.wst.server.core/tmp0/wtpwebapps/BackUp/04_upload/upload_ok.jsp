<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page import="study.model1.helper.UploadItem"%>
<%@page import="java.util.List"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
// 헬퍼 객체 생성
WebHelper web = WebHelper.getInstance(request, response);
 
// 업로드를 수행
try {
	web.upload();
} catch (Exception e) {
	e.printStackTrace();
	web.redirect(null, "업로드에 실패했습니다.");
	return;
}

// 업로드 된 정보 추출하기
// 파일 정보 추출
List<UploadItem> fileList = web.getFileList();
// 그 밖의 일반 데이터를 저장하기 위한 컬렉션
Map<String, String> paramMap = web.getParamMap();
 
/*  web.upload()   -> 전송된 데이터를 모두 반복 처리/ 텍스트 형식인 경우 map에 분류 / 파일 형식인 경우 List<UploadItem> 객체에 분류 */
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello JSP</title>
</head>
<body>
	<h1><%=paramMap.get("subject")%></h1>
	<%
		for(int i=0 ; i<fileList.size() ; i++) {
			UploadItem item = fileList.get(i);
			
			String filePath = item.getFilePath();
			filePath = URLEncoder.encode(filePath, "UTF-8");
			
			String orginName = item.getOrginName();
			orginName = URLEncoder.encode(orginName, "UTF-8"); 
	%>
	<div>
		<img src="download.jsp?file=<%=filePath%>&orgin=<%=orginName%>">
		<img src="download.jsp?file=<%=filePath%>&orgin=<%=orginName%>&size=500x500&crop=true">
		<!-- crop은 사진을 크기에 맞게 자를지 여부를 확인하는 속성으로 true 놓을 시  사진의 가운데부분부터 500사이즈만큼 자르고 나머지 좌우의 크기는 잘라낸다. -->
		
		<ul>
			<li><%=item.getOrginName()%></li>
			<li><%=item.getFieldName()%></li>
			<li><%=item.getFilePath()%></li>
			<li><%=item.getContentType()%></li>
			<li><%=item.getFileSize()%></li>
			<li><a href="download.jsp?file=<%=filePath%>&orgin=<%=orginName%>">[다운로드]</a></li>
		</ul>
	</div>
	<%} %>
</body>
</html>