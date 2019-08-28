/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.43
 * Generated at: 2019-08-08 01:02:20 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp._02_005fpost;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import study.model1.helper.WebHelper;
import java.net.URLEncoder;

public final class q03_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.net.URLEncoder");
    _jspx_imports_classes.add("study.model1.helper.WebHelper");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	WebHelper web = WebHelper.getInstance(request, response);

	// post 파라미터 수신, 값이 없을 경우 null로 리턴됨 설정  getString으로 받는 내용은 name값
	// -> form태그로 보낼 땐 한글값을 가진 밸류도 그대로 넘어가기 때문에 인코딩을 하지 않아도 됨.
	String userName = web.getString("user_name");
	String userEmail = web.getString("user_email");
	String userTel = web.getString("user_tel");
	String gender = web.getString("gender");
	
	if(userName == null || userEmail == null || userTel == null || gender == null) {
		web.redirect(null, "입력항목이 잘못되었습니다.");
		return;
	}
	

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<h1>간단 설문조사 3/3</h1>\r\n");
      out.write("\t<h2>취미를 선택해 주세요.</h2>\r\n");
      out.write("\t\r\n");
      out.write("\t<form name=\"myform\" method=\"post\" action=\"result.jsp\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"user_name\" value=\"");
      out.print(userName);
      out.write("\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"user_email\" value=\"");
      out.print(userEmail);
      out.write("\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"user_tel\" value=\"");
      out.print(userTel);
      out.write("\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"gender\" value=\"");
      out.print(gender);
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- 설문항목 -->\r\n");
      out.write("\t\t<div>\r\n");
      out.write("\t\t\t<label>\r\n");
      out.write("\t\t\t\t<input type=\"checkbox\" name=\"hobby\" value=\"음악감상\" checked>음악감상\r\n");
      out.write("\t\t\t</label>\r\n");
      out.write("\t\t\t<label>\r\n");
      out.write("\t\t\t\t<input type=\"checkbox\" name=\"hobby\" value=\"영화감상\">영화감상\r\n");
      out.write("\t\t\t</label>\r\n");
      out.write("\t\t\t<label>\r\n");
      out.write("\t\t\t\t<input type=\"checkbox\" name=\"hobby\" value=\"게임\">게임\r\n");
      out.write("\t\t\t</label>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<button type=\"submit\">결과보기</button>\r\n");
      out.write("\t</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
