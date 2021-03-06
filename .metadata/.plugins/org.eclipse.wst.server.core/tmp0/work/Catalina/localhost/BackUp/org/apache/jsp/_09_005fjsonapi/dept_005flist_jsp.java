/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.43
 * Generated at: 2019-08-13 02:57:23 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp._09_005fjsonapi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import java.net.URLEncoder;
import study.model1.helper.PageData;
import java.util.List;
import study.model1.mybatis.service.impl.DepartmentServiceImpl;
import study.model1.mybatis.service.DepartmentService;
import study.model1.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;
import study.model1.helper.WebHelper;
import study.model1.mybatis.model.Department;

public final class dept_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("study.model1.helper.PageData");
    _jspx_imports_classes.add("study.model1.helper.WebHelper");
    _jspx_imports_classes.add("study.model1.mybatis.service.impl.DepartmentServiceImpl");
    _jspx_imports_classes.add("java.util.HashMap");
    _jspx_imports_classes.add("study.model1.mybatis.service.DepartmentService");
    _jspx_imports_classes.add("java.net.URLEncoder");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("java.util.Calendar");
    _jspx_imports_classes.add("study.model1.mybatis.MybatisConnectionFactory");
    _jspx_imports_classes.add("com.google.gson.Gson");
    _jspx_imports_classes.add("java.util.Map");
    _jspx_imports_classes.add("org.apache.ibatis.session.SqlSession");
    _jspx_imports_classes.add("study.model1.mybatis.model.Department");
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
      response.setContentType("application/json; charset=UTF-8");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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
	//결과 출력시 rt와 pubDate는 제외함 helper에서 알아서 출력한다

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
