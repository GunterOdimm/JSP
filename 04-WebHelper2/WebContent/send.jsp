<%@page import="javax.mail.MessagingException"%>
<%@page import="study.jsp.helper.MailHelper"%>
<%@page import="study.jsp.helper.RegexHelper"%>
<%@page import="study.jsp.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/** 헬퍼 객체 생성 */
	WebHelper web = WebHelper.getInstance(request, response);
	RegexHelper regex = RegexHelper.getInstance();
	
	/** 사용자의 입력값 받기*/
	String to = web.getString("to");
	String subject = web.getString("subject");
	String content = web.getString("content");
	
	/** 입력여부 검사후, 입력되지 않은 경우 이전 페이지로 보내기 **/
	//받는 메일 주소 검사하기
	if(!regex.isValue(to)) {
		web.redirect(null, "받는 사람의 이메일 주소를 입력하세요.");
		return;
	}
	if(!regex.isEmail(to)) {
		web.redirect(null, "받는 사람의 이메일 주소가 잘못되었습니다.");
		return;
	}
	//메일제목 --> null체크도 입력 여부를 확인할 수 있다.
	if(subject == null) {
		web.redirect(null, "메일제목을 입력하세요.");
		return;
	}
	//메일내용 --> null체크도 입력 여부를 확인할 수 있다.
	if(content == null) {
		web.redirect(null, "메일의 내용을 입력하세요.");
		return;
	}
	
	/** 메일 발송처리 **/
	try {
		MailHelper.getInstance().sendMail(to, subject, content);
	} catch(MessagingException e) {
		e.printStackTrace();
		web.redirect(null, "메일 발송에 실패헸습니다.");
		return;
	}
	
	/** 결과처리 **/
	web.redirect("write.jsp", "메일 발송에 성공했습니다.");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>