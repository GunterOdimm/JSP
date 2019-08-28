<%@page import="study.model1.helper.DownloadHelper"%><%@page import="study.model1.helper.WebHelper"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	// 파라미터로 전달된 파일 경로 받기
	WebHelper web = WebHelper.getInstance(request, response);
	
	// 서버상에 저장되어 있는 파일 경로(필수)
	String filePath = web.getString("file");
	
	// 원본 파일이름(미필수)
	String orginName = web.getString("origin");
	
	// 축소될 이미지 해상도 --> 320x320
	String size = web.getString("size");
	
	// 이미지 크롭 여부 --> 값이 없을 경우 기본값 false
	String crop = web.getString("crop", "false");
	
	// 다운로드 스트림 출력하기.
	if(filePath != null) {
		try {
			if(size != null) {
				// x를 기준으로 나눠서 숫자로 변환
				String[] temp = size.split("x");
				int width = Integer.parseInt(temp[0]);
				int height = Integer.parseInt(temp[1]);
				
				// 크롭 여부를 boolean으로 설정
				boolean is_crop = false;
				if(crop.equals("true")) {
					is_crop = true;
				}
			// 썸네일 생성 후 다운로드 처리
			DownloadHelper.getInstance().download(response, filePath, width, height, is_crop);
			} else {
				// 원본에 대한 다운로드 처리
				DownloadHelper.getInstance().download(response, filePath, orginName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

// 파일데이터는 이 스크립트 구문과 상단의 스크립트 타입을 설정하는 구분 이외에 공백 또는 띄어쓰기 또는 html 등의 내용이 적혀있을 시 파일이 깨지게 되므로
// 주의하여야 한다.
%>