package study.jsp.helper;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WebHelper {
    // ----------- 싱글톤 객체 생성 시작 ----------
	private static WebHelper current;

	//getInstanceSMS 오직 JSP에서만 생성가능하다
	public static WebHelper getInstance(HttpServletRequest request, HttpServletResponse response) {
		if (current == null) {
			current = new WebHelper();
		}
		
		// JSP 내장객체를 연결하기 위한 메서드를 호출한다.
		current.init(request, response);
		return current;
	}

	public static void freeInstance() {
		current = null;
	}

	private WebHelper() {
		super();
	}
    // ----------- 싱글톤 객체 생성 끝 ----------
	
	/** 기본 인코딩 타입 설정 */
	private static final String ENC_TYPE = "UTF-8";

    /** JSP의 request 내장 객체 */
    // --> import javax.servlet.http.HttpServletRequest;
    private HttpServletRequest request;
    // --> import javax.servlet.http.HttpServletResponse;
    private HttpServletResponse response;
	
	/**
	 * JSP의 주요 내장객체를 멤버변수에 연결한다. 
	 * 
	 * @param request
	 * @param response
	 */
	public void init(HttpServletRequest request, HttpServletResponse response) {
		// JSP 내장객체 참조하기 --> getInstance()에 전달된 객체를 받는다.
		this.request = request;
		this.response = response;

		/** 내장객체 초기화 -> utf-8 설정 */
		try {
			this.request.setCharacterEncoding(ENC_TYPE);
			this.response.setCharacterEncoding(ENC_TYPE);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 메시지 표시 후, 페이지를 지정된 곳으로 이동한다.
	 * 
	 * @param url - 이동할 페이지의 URL, Null일 경우 이전페이지로 이동
	 * @param msg - 화면에 표시할 메시지. Null일 경우 표시 안함
	 */
	public void redirect(String url, String msg) {
		// 가상의 View로 만들기 위한 HTML 태그 구성
		String html = "<!doctype html>";
		html += "<html>";
		html += "<head>";
		html += "<meta charset='utf-8'>";

		// 메시지 표시
		if (msg != null) {
			html += "<script type='text/javascript'>alert('" + msg + "');</script>";
		}

		// 페이지 이동
		if (url != null) {
			html += "<meta http-equiv='refresh' content='0; url=" + url + "' />";
		} else {
			html += "<script type='text/javascript'>history.back();</script>";
		}

		html += "</head>";
		html += "<body></body>";
		html += "</html>";

		// 구성된 HTML을 출력한다.
		try {
			PrintWriter out = this.response.getWriter(); 
			out.print(html);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 파라미터를 전달받아서 리턴한다.
	 * 
	 * @param fieldName    - 파라미터 이름
	 * @param defaultValue - 값이 없을 경우 사용될 기본값
	 * @return String
	 */
	//String name = web.getString("name", "a")일때 name은 fieldName이고 a는 defaultValue일때 
	//1. ~~.jsp?name=hello (모든게 갖춰져있을때)
	//2. ~~.jsp?           (값이 없을때 공백이거나 null일때 - 빈문자열일때, null일때 둘 다 생각해야하므로 2.3번 가정을 묶는다)
	//3. ~~ .jsp           (이어서... 기본값이 필요없을 경우가 있기 때문에)
	//
	public String getString(String fieldName, String defaultValue) {
		// 리턴을 위한 값을 두 번째 파라미터(기본값)로 설정해 둔다.
		String result = defaultValue;
		// GET,POST 파라미터를 받는다.
		String param = this.request.getParameter(fieldName);

		if (param != null) { 			// 값이 null이 아니라면?
			param = param.trim(); 		// 앞뒤 공백을 제거한다.
			if (!param.equals("")) { 	// 공백제거 결과가 빈 문자열이 아니라면?
				result = param; 		// 리턴을 위해서 준비한 변수에 수신한 값을 복사한다.
			}
		}

		// 값을 리턴. param값이 존재하지 않을 경우 미리 준비한 기본값이 그대로 리턴된다.
		return result;
	}

	/**
	 * 파라미터를 전달받아서 리턴한다. 값이 없을 경우 null을 리턴한다.
	 * 
	 * @param fieldName - 파라미터 이름
	 * @return String
	 */
	//위에 경우에서 2,3번을 묶은 getString이다
	public String getString(String fieldName) {
		return this.getString(fieldName, null);
	}

	/**
	 * 파라미터를 전달받아서 int로 형변환 하여 리턴한다.
	 * 
	 * @param fieldName    - 파라미터 이름
	 * @param defaultValue - 값이 없을 경우 사용될 기본값
	 * @return int
	 */
	//메일은 무조건 문자열로 받아오는데 숫자가 필요한 경우
	public int getInt(String fieldName, int defaultValue) {
		// 리턴을 위한 값을 두 번째 파라미터(기본값)로 설정해 둔다.
		int result = defaultValue;
		
		// getString()메서드를 통해서 파라미터를 문자열 형태로 받는다.
		// 파라미터가 존재하지 않는다면 두 번째로 전달한 값이 리턴된다.
		String param = this.getString(fieldName, null);

		// 숫자형인 경우 숫자값으로 변환한다.
		try {
			result = Integer.parseInt(param); //숫자로 변형해서
		} catch (Exception e) {}

		return result; //리턴함
	}

	/**
	 * 파라미터를 전달받아서 int로 형변환 하여 리턴한다. 값이 없을 경우 0을 리턴한다.
	 * 
	 * @param fieldName - 파라미터 이름
	 * @return int
	 */
	public int getInt(String fieldName) {
		return this.getInt(fieldName, 0);
	}

	/**
	 * 배열 형태의 파라미터를 리턴한다. 체크박스 전용 기능
	 * 
	 * @param fieldName    - 파라미터 이름
	 * @param defaultValue - 값이 없거나 배열의 길이가 0인 경우 사용될 기본값
	 * @return String[]
	 */
	public String[] getStringArray(String fieldName, String[] defaultValue) {
		// 리턴을 위한 값을 두 번째 파라미터(기본값)로 설정해 둔다.
		String[] result = defaultValue;
		// 배열 형태의 GET,POST 파라미터를 받는다.
		String[] param = this.request.getParameterValues(fieldName);

		if (param != null) { // 수신된 파라미터가 존재한다면?
			if (param.length > 0) { // 배열의 길이가 0보다 크다면?
				result = param; // 리턴을 위해서 준비한 변수에 수신한 값을 복사한다.
			}
		}

		// 값을 리턴. param값이 존재하지 않을 경우 미리 준비한 기본값이 그대로 리턴된다.
		return result;
	}

	/**
	 * 배열 형태의 파라미터를 리턴한다. 값이 없을 경우 null을 리턴한다.
	 * 
	 * @param fieldName - 파라미터 이름
	 * @return String[]
	 */
	public String[] getStringArray(String fieldName) {
		return this.getStringArray(fieldName, null);
	}	
}
