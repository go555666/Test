/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.30
 * Generated at: 2018-04-28 09:46:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.include;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1522375494000L));
    _jspx_dependants.put("jar:file:/Users/bob/Documents/Workplace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/lands/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153349082000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<title>LANDS</title>\r\n");
      out.write("<meta charset=\"UTF-8\" />\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/css/may9th.css\" />\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/js/jquery.min.js\"></script> \r\n");
      out.write("</head>\r\n");

	String mStrUserId = (String)session.getAttribute("userId");
	String mStrUserName = (String)session.getAttribute("userName");
	String mStrAuth = (String)session.getAttribute("auth");
	String mStrLvl = (String)session.getAttribute("lvl");

      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("#ftLoading {\r\n");
      out.write(" width: 100%;  \r\n");
      out.write(" height: 100%;  \r\n");
      out.write(" top: 0px;\r\n");
      out.write(" left: 0px;\r\n");
      out.write(" position: fixed;  \r\n");
      out.write(" display: block;  \r\n");
      out.write(" opacity: 0.7;  \r\n");
      out.write(" background-color: #fff;  \r\n");
      out.write(" z-index: 99;  \r\n");
      out.write(" text-align: center; } \r\n");
      out.write("  \r\n");
      out.write("#loading-image {  \r\n");
      out.write(" position: absolute;  \r\n");
      out.write(" top: 50%;  \r\n");
      out.write(" left: 50%; \r\n");
      out.write(" z-index: 100; }\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("  // This function is called from the pop-up menus to transfer to\r\n");
      out.write("  // a different page. Ignore if the value returned is a null string:\r\n");
      out.write("  function goPage (newURL) {\r\n");
      out.write("\r\n");
      out.write("      // if url is empty, skip the menu dividers and reset the menu selection to default\r\n");
      out.write("      if (newURL != \"\") {\r\n");
      out.write("      \r\n");
      out.write("          // if url is \"-\", it is this page -- reset the menu:\r\n");
      out.write("          if (newURL == \"-\" ) {\r\n");
      out.write("              resetMenu();            \r\n");
      out.write("          } \r\n");
      out.write("          // else, send page to designated URL            \r\n");
      out.write("          else {  \r\n");
      out.write("            document.location.href = newURL;\r\n");
      out.write("          }\r\n");
      out.write("      }\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("\t// resets the menu selection upon entry to this page:\r\n");
      out.write("\tfunction resetMenu() {\r\n");
      out.write("\t   document.gomenu.selector.selectedIndex = 2;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<!--Header-part-->\r\n");
      out.write("<div id=\"header\">\r\n");
      out.write("  <h1><a href=\"dashboard.html\">Matrix Admin</a></h1>\r\n");
      out.write("</div>\r\n");
      out.write("<!--close-Header-part--> \r\n");
      out.write("\r\n");
      out.write("<!--top-Header-menu-->\r\n");
      out.write("<div id=\"user-nav\" class=\"navbar navbar-inverse\">\r\n");
      out.write("  <ul class=\"nav\">\r\n");
      out.write("    <li  class=\"\" id=\"profile-messages\" ><a title=\"\" href=\"#\" data-toggle=\"dropdown\" data-target=\"#profile-messages\" class=\"dropdown-toggle\"><i class=\"icon icon-user\"></i>  <span class=\"text\"><span id=\"spanUserNameHd\"></span></span></a></li>\r\n");
      out.write("    <!-- <li class=\"dropdown\" id=\"menu-messages\"><a href=\"#\" data-toggle=\"dropdown\" data-target=\"#menu-messages\" class=\"dropdown-toggle\"><i class=\"icon icon-envelope\"></i> <span class=\"text\">Messages</span> <span class=\"label label-important\">5</span> <b class=\"caret\"></b></a>\r\n");
      out.write("      <ul class=\"dropdown-menu\">\r\n");
      out.write("        <li><a class=\"sAdd\" title=\"\" href=\"#\"><i class=\"icon-plus\"></i> new message</a></li>\r\n");
      out.write("        <li class=\"divider\"></li>\r\n");
      out.write("        <li><a class=\"sInbox\" title=\"\" href=\"#\"><i class=\"icon-envelope\"></i> inbox</a></li>\r\n");
      out.write("        <li class=\"divider\"></li>\r\n");
      out.write("        <li><a class=\"sOutbox\" title=\"\" href=\"#\"><i class=\"icon-arrow-up\"></i> outbox</a></li>\r\n");
      out.write("        <li class=\"divider\"></li>\r\n");
      out.write("        <li><a class=\"sTrash\" title=\"\" href=\"#\"><i class=\"icon-trash\"></i> trash</a></li>\r\n");
      out.write("      </ul>\r\n");
      out.write("    </li> -->\r\n");
      out.write("    <li class=\"adminMenu\"><a title=\"\" href=\"/core/admin/getCommCode.do\"><i class=\"icon icon-th-list\"></i> <span class=\"text\">Common Code</span></a></li>\r\n");
      out.write("    <li class=\"adminMenu\"><a title=\"\" href=\"/user/admin/getManageUsers.do\"><i class=\"icon icon-cog\"></i> <span class=\"text\">Manage Users</span></a></li>\r\n");
      out.write("    <li class=\"\"><a title=\"\" href=\"/user/signout.do\"><i class=\"icon icon-share-alt\"></i> <span class=\"text\">Signout</span></a></li>\r\n");
      out.write("  </ul>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<!--start-top-serch-->\r\n");
      out.write("<!-- <div id=\"search\">\r\n");
      out.write("  <input type=\"text\" placeholder=\"Search here...\"/>\r\n");
      out.write("  <button type=\"submit\" class=\"tip-bottom\" title=\"Search\"><i class=\"icon-search icon-white\"></i></button>\r\n");
      out.write("</div> -->\r\n");
      out.write("<!--close-top-serch--> \r\n");
      out.write("\r\n");
      out.write("<!--sidebar-menu-->\r\n");
      out.write("\r\n");
      out.write("<div id=\"sidebar\"><a href=\"#\" class=\"visible-phone\"><i class=\"icon icon-home\"></i> Dashboard2</a>\r\n");
      out.write("  <ul>\r\n");
      out.write("<!--     <li><a href=\"/user/getAttendance.do\"><i class=\"icon icon-th-list\"></i> <span>Attendance</span></a> </li> -->\r\n");
      out.write("    <li><a href=\"/article/getArticleList.do\"><i class=\"icon icon-list-alt\"></i> <span>Article</span></a> </li>\r\n");
      out.write("    <li><a href=\"widgets.html\"><i class=\"icon icon-dashboard\"></i> <span>Car</span></a> </li>\r\n");
      out.write("<!--     <li><a href=\"tables.html\"><i class=\"icon icon-th\"></i> <span>Tables</span></a></li> -->\r\n");
      out.write("   <!--  <li><a href=\"grid.html\"><i class=\"icon icon-fullscreen\"></i> <span>Full width</span></a></li>\r\n");
      out.write("    <li class=\"submenu\"> <a href=\"#\"><i class=\"icon icon-th-list\"></i> <span>Forms</span> <span class=\"label label-important\">3</span></a>\r\n");
      out.write("      <ul>\r\n");
      out.write("        <li><a href=\"form-common.html\">Basic Form</a></li>\r\n");
      out.write("        <li><a href=\"form-validation.html\">Form with Validation</a></li>\r\n");
      out.write("        <li><a href=\"form-wizard.html\">Form with Wizard</a></li>\r\n");
      out.write("      </ul>\r\n");
      out.write("    </li>\r\n");
      out.write("    <li><a href=\"buttons.html\"><i class=\"icon icon-tint\"></i> <span>Buttons &amp; icons</span></a></li>\r\n");
      out.write("    <li class=\"submenu active\"><a href=\"interface.html\"><i class=\"icon icon-pencil\"></i> <span>Eelements</span></a></li>\r\n");
      out.write("    <li class=\"submenu\"> <a href=\"#\"><i class=\"icon icon-file\"></i> <span>Addons</span> <span class=\"label label-important\">5</span></a>\r\n");
      out.write("      <ul>\r\n");
      out.write("        <li><a href=\"index2.html\">Dashboard2</a></li>\r\n");
      out.write("        <li><a href=\"gallery.html\">Gallery</a></li>\r\n");
      out.write("        <li><a href=\"calendar.html\">Calendar</a></li>\r\n");
      out.write("        <li><a href=\"invoice.html\">Invoice</a></li>\r\n");
      out.write("        <li><a href=\"chat.html\">Chat option</a></li>\r\n");
      out.write("      </ul>\r\n");
      out.write("    </li>\r\n");
      out.write("    <li class=\"submenu\"> <a href=\"#\"><i class=\"icon icon-info-sign\"></i> <span>Error</span> <span class=\"label label-important\">4</span></a>\r\n");
      out.write("      <ul>\r\n");
      out.write("        <li><a href=\"error403.html\">Error 403</a></li>\r\n");
      out.write("        <li><a href=\"error404.html\">Error 404</a></li>\r\n");
      out.write("        <li><a href=\"error405.html\">Error 405</a></li>\r\n");
      out.write("        <li><a href=\"error500.html\">Error 500</a></li>\r\n");
      out.write("      </ul>\r\n");
      out.write("    </li> -->\r\n");
      out.write("    <!-- <li class=\"content\"> <span>Monthly Bandwidth Transfer</span>\r\n");
      out.write("      <div class=\"progress progress-mini progress-danger active progress-striped\">\r\n");
      out.write("        <div style=\"width: 77%;\" class=\"bar\"></div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <span class=\"percent\">77%</span>\r\n");
      out.write("      <div class=\"stat\">21419.94 / 14000 MB</div>\r\n");
      out.write("    </li>\r\n");
      out.write("    <li class=\"content\"> <span>Disk Space Usage</span>\r\n");
      out.write("      <div class=\"progress progress-mini active progress-striped\">\r\n");
      out.write("        <div style=\"width: 87%;\" class=\"bar\"></div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <span class=\"percent\">87%</span>\r\n");
      out.write("      <div class=\"stat\">604.44 / 4000 MB</div>\r\n");
      out.write("    </li> -->\r\n");
      out.write("  </ul>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\t//NULL 체크\r\n");
      out.write("\tfunction checkNullHd(strValue) {\r\n");
      out.write("\t\tif(strValue != null && strValue != \"\" && strValue != \"undefined\")\treturn false;\r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//권한 체크\r\n");
      out.write("\tfunction checkAdminAuthHd(){\r\n");
      out.write("\t\tvar strAuth = \"");
      out.print( mStrAuth );
      out.write("\";\r\n");
      out.write("\t\tvar strLvl = \"");
      out.print( mStrLvl );
      out.write("\";\r\n");
      out.write("\t\t//Auth = \"00\" 관리자, \"59\" 개발자\r\n");
      out.write("\t\t//Lvl = \"00\" 어드민\r\n");
      out.write("\t\t//관리자 + 어드민 권한이여야만 한다.\r\n");
      out.write("\t\t//관리자 + 일반 직원(EMPLOYEE)는 접근 하면 안된다.\r\n");
      out.write("\t\tif((strAuth == \"00\" && strLvl == \"00\") || strAuth == \"59\")\treturn true;\r\n");
      out.write("\t\telse\t\t\t\t\t\t\t\t\t\t\t\t\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//개발자만 접근 관리 한 메뉴\r\n");
      out.write("\tfunction checkDevAuthHd(){\r\n");
      out.write("\t\tvar strAuth = \"");
      out.print( mStrAuth );
      out.write("\";\r\n");
      out.write("\t\tif(strAuth == \"59\")\treturn true;\r\n");
      out.write("\t\telse\t\t\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction doCodeDetailHd(strFieldValue, strCommCode){\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t(function(){\r\n");
      out.write("\t\tvar strUserName = \"");
      out.print( mStrUserName );
      out.write("\";\r\n");
      out.write("\t\t$(\"#spanUserNameHd\").text(strUserName);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t//admin 관련된 메뉴는 다 지운다.\r\n");
      out.write("\t\tvar strAuth = \"");
      out.print( mStrAuth );
      out.write("\";\r\n");
      out.write("\t\tif(!checkAdminAuthHd()) {\r\n");
      out.write("\t\t\t$(\".adminMenu\").remove();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t})();\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
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