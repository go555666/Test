/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.30
 * Generated at: 2018-04-28 09:46:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.main;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/views/include/header.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/resources/css/bootstrap.min.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/resources/css/bootstrap-responsive.min.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/resources/css/fullcalendar.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/resources/css/matrix-style.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/resources/css/matrix-media.css\" />\r\n");
      out.write("<link href=\"/resources/font-awesome/css/font-awesome.css\" rel=\"stylesheet\" />\r\n");
      out.write("<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>\r\n");
      out.write("\r\n");
      out.write("<script src=\"/resources/js/excanvas.min.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/jquery.min.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/jquery.ui.custom.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/bootstrap.min.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/jquery.flot.min.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/jquery.flot.resize.min.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/jquery.peity.min.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/matrix.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/fullcalendar.min.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/matrix.calendar.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/matrix.chat.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/jquery.validate.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/matrix.form_validation.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/jquery.wizard.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/jquery.uniform.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/select2.min.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/matrix.popover.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/jquery.dataTables.min.js\"></script> \r\n");
      out.write("<script src=\"/resources/js/matrix.tables.js\"></script> \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\t$(document).ready(function(){\r\n");
      out.write("\t\tif(!checkAdminAuthHd()) {\r\n");
      out.write("\t\t\t$(\".adminMenu\").remove();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<div id=\"content\">\r\n");
      out.write("  <div id=\"content-header\">\r\n");
      out.write("    <div id=\"breadcrumb\"> <a href=\"/main.do\" title=\"Go to Home\" class=\"tip-bottom\"><i class=\"icon-home\"></i> Home</a></div>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"container-fluid\">\r\n");
      out.write("  <div  class=\"quick-actions_homepage\">\r\n");
      out.write("    <ul class=\"quick-actions\">\r\n");
      out.write("<!--       <li class=\"bg_lb\"> <a href=\"/user/getAttendance.do\"> <i class=\"icon-th-list\"></i> Attendance </a> </li> -->\r\n");
      out.write("      <li class=\"bg_lo adminMenu\"> <a href=\"/user/admin/getManageUsers.do\"> <i class=\"icon-group\"></i> Manage Users </a> </li>\r\n");
      out.write("      <li class=\"bg_lg adminMenu\"> <a href=\"/core/admin/getCommCode.do\"> <i class=\"icon-key\"></i> Common Code </a> </li>\r\n");
      out.write("      <!-- <li class=\"bg_lg\"> <a href=\"#\"> <i class=\"icon-shopping-cart\"></i> Shopping Cart</a> </li>\r\n");
      out.write("      <li class=\"bg_ly\"> <a href=\"#\"> <i class=\" icon-globe\"></i> Web Marketing </a> </li>\r\n");
      out.write("      <li class=\"bg_ls\"> <a href=\"#\"> <i class=\"icon-signal\"></i> Check Statistics</a> </li> -->\r\n");
      out.write("    </ul>\r\n");
      out.write("  </div>\r\n");
      out.write("    <!-- <div class=\"row-fluid\">\r\n");
      out.write("      <div class=\"span6\">\r\n");
      out.write("        <div class=\"widget-box\">\r\n");
      out.write("          <div class=\"widget-title bg_ly\" data-toggle=\"collapse\" href=\"#collapseG2\"><span class=\"icon\"><i class=\"icon-chevron-down\"></i></span>\r\n");
      out.write("            <h5>Latest Posts</h5>\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"widget-content nopadding collapse in\" id=\"collapseG2\">\r\n");
      out.write("            <ul class=\"recent-posts\">\r\n");
      out.write("              <li>\r\n");
      out.write("                <div class=\"user-thumb\"> <img width=\"40\" height=\"40\" alt=\"User\" src=\"/resources/img/demo/av1.jpg\"> </div>\r\n");
      out.write("                <div class=\"article-post\"> <span class=\"user-info\"> By: john Deo / Date: 2 Aug 2012 / Time:09:27 AM </span>\r\n");
      out.write("                  <p><a href=\"#\">This is a much longer one that will go on for a few lines.It has multiple paragraphs and is full of waffle to pad out the comment.</a> </p>\r\n");
      out.write("                </div>\r\n");
      out.write("              </li>\r\n");
      out.write("              <li>\r\n");
      out.write("                <div class=\"user-thumb\"> <img width=\"40\" height=\"40\" alt=\"User\" src=\"/resources/img/demo/av2.jpg\"> </div>\r\n");
      out.write("                <div class=\"article-post\"> <span class=\"user-info\"> By: john Deo / Date: 2 Aug 2012 / Time:09:27 AM </span>\r\n");
      out.write("                  <p><a href=\"#\">This is a much longer one that will go on for a few lines.It has multiple paragraphs and is full of waffle to pad out the comment.</a> </p>\r\n");
      out.write("                </div>\r\n");
      out.write("              </li>\r\n");
      out.write("              <li>\r\n");
      out.write("                <div class=\"user-thumb\"> <img width=\"40\" height=\"40\" alt=\"User\" src=\"/resources/img/demo/av4.jpg\"> </div>\r\n");
      out.write("                <div class=\"article-post\"> <span class=\"user-info\"> By: john Deo / Date: 2 Aug 2012 / Time:09:27 AM </span>\r\n");
      out.write("                  <p><a href=\"#\">This is a much longer one that will go on for a few lines.Itaffle to pad out the comment.</a> </p>\r\n");
      out.write("                </div>\r\n");
      out.write("              <li>\r\n");
      out.write("                <button class=\"btn btn-warning btn-mini\">View All</button>\r\n");
      out.write("              </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"widget-box\">\r\n");
      out.write("          <div class=\"widget-title\"> <span class=\"icon\"><i class=\"icon-ok\"></i></span>\r\n");
      out.write("            <h5>To Do list</h5>\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"widget-content\">\r\n");
      out.write("            <div class=\"todo\">\r\n");
      out.write("              <ul>\r\n");
      out.write("                <li class=\"clearfix\">\r\n");
      out.write("                  <div class=\"txt\"> Luanch This theme on Themeforest <span class=\"by label\">Nirav</span> <span class=\"date badge badge-important\">Today</span> </div>\r\n");
      out.write("                  <div class=\"pull-right\"> <a class=\"tip\" href=\"#\" title=\"Edit Task\"><i class=\"icon-pencil\"></i></a> <a class=\"tip\" href=\"#\" title=\"Delete\"><i class=\"icon-remove\"></i></a> </div>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"clearfix\">\r\n");
      out.write("                  <div class=\"txt\"> Manage Pending Orders <span class=\"by label\">Alex</span> <span class=\"date badge badge-warning\">Today</span> </div>\r\n");
      out.write("                  <div class=\"pull-right\"> <a class=\"tip\" href=\"#\" title=\"Edit Task\"><i class=\"icon-pencil\"></i></a> <a class=\"tip\" href=\"#\" title=\"Delete\"><i class=\"icon-remove\"></i></a> </div>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"clearfix\">\r\n");
      out.write("                  <div class=\"txt\"> MAke your desk clean <span class=\"by label\">Admin</span> <span class=\"date badge badge-success\">Tomorrow</span> </div>\r\n");
      out.write("                  <div class=\"pull-right\"> <a class=\"tip\" href=\"#\" title=\"Edit Task\"><i class=\"icon-pencil\"></i></a> <a class=\"tip\" href=\"#\" title=\"Delete\"><i class=\"icon-remove\"></i></a> </div>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"clearfix\">\r\n");
      out.write("                  <div class=\"txt\"> Today we celebrate the great looking theme <span class=\"by label\">Admin</span> <span class=\"date badge badge-info\">08.03.2013</span> </div>\r\n");
      out.write("                  <div class=\"pull-right\"> <a class=\"tip\" href=\"#\" title=\"Edit Task\"><i class=\"icon-pencil\"></i></a> <a class=\"tip\" href=\"#\" title=\"Delete\"><i class=\"icon-remove\"></i></a> </div>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"clearfix\">\r\n");
      out.write("                  <div class=\"txt\"> Manage all the orders <span class=\"by label\">Mark</span> <span class=\"date badge badge-info\">12.03.2013</span> </div>\r\n");
      out.write("                  <div class=\"pull-right\"> <a class=\"tip\" href=\"#\" title=\"Edit Task\"><i class=\"icon-pencil\"></i></a> <a class=\"tip\" href=\"#\" title=\"Delete\"><i class=\"icon-remove\"></i></a> </div>\r\n");
      out.write("                </li>\r\n");
      out.write("              </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"span6\">\r\n");
      out.write("        <div class=\"widget-box\">\r\n");
      out.write("          <div class=\"widget-title\"> <span class=\"icon\"><i class=\"icon-ok\"></i></span>\r\n");
      out.write("            <h5>Progress Box</h5>\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"widget-content\">\r\n");
      out.write("            <ul class=\"unstyled\">\r\n");
      out.write("              <li> <span class=\"icon24 icomoon-icon-arrow-up-2 green\"></span> 81% Clicks <span class=\"pull-right strong\">567</span>\r\n");
      out.write("                <div class=\"progress progress-striped \">\r\n");
      out.write("                  <div style=\"width: 81%;\" class=\"bar\"></div>\r\n");
      out.write("                </div>\r\n");
      out.write("              </li>\r\n");
      out.write("              <li> <span class=\"icon24 icomoon-icon-arrow-up-2 green\"></span> 72% Uniquie Clicks <span class=\"pull-right strong\">507</span>\r\n");
      out.write("                <div class=\"progress progress-success progress-striped \">\r\n");
      out.write("                  <div style=\"width: 72%;\" class=\"bar\"></div>\r\n");
      out.write("                </div>\r\n");
      out.write("              </li>\r\n");
      out.write("              <li> <span class=\"icon24 icomoon-icon-arrow-down-2 red\"></span> 53% Impressions <span class=\"pull-right strong\">457</span>\r\n");
      out.write("                <div class=\"progress progress-warning progress-striped \">\r\n");
      out.write("                  <div style=\"width: 53%;\" class=\"bar\"></div>\r\n");
      out.write("                </div>\r\n");
      out.write("              </li>\r\n");
      out.write("              <li> <span class=\"icon24 icomoon-icon-arrow-up-2 green\"></span> 3% Online Users <span class=\"pull-right strong\">8</span>\r\n");
      out.write("                <div class=\"progress progress-danger progress-striped \">\r\n");
      out.write("                  <div style=\"width: 3%;\" class=\"bar\"></div>\r\n");
      out.write("                </div>\r\n");
      out.write("              </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"widget-box\">\r\n");
      out.write("          <div class=\"widget-title bg_lo\"  data-toggle=\"collapse\" href=\"#collapseG3\" > <span class=\"icon\"> <i class=\"icon-chevron-down\"></i> </span>\r\n");
      out.write("            <h5>News updates</h5>\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"widget-content nopadding updates collapse in\" id=\"collapseG3\">\r\n");
      out.write("            <div class=\"new-update clearfix\"><i class=\"icon-ok-sign\"></i>\r\n");
      out.write("              <div class=\"update-done\"><a title=\"\" href=\"#\"><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</strong></a> <span>dolor sit amet, consectetur adipiscing eli</span> </div>\r\n");
      out.write("              <div class=\"update-date\"><span class=\"update-day\">20</span>jan</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"new-update clearfix\"> <i class=\"icon-gift\"></i> <span class=\"update-notice\"> <a title=\"\" href=\"#\"><strong>Congratulation Maruti, Happy Birthday </strong></a> <span>many many happy returns of the day</span> </span> <span class=\"update-date\"><span class=\"update-day\">11</span>jan</span> </div>\r\n");
      out.write("            <div class=\"new-update clearfix\"> <i class=\"icon-move\"></i> <span class=\"update-alert\"> <a title=\"\" href=\"#\"><strong>Maruti is a Responsive Admin theme</strong></a> <span>But already everything was solved. It will ...</span> </span> <span class=\"update-date\"><span class=\"update-day\">07</span>Jan</span> </div>\r\n");
      out.write("            <div class=\"new-update clearfix\"> <i class=\"icon-leaf\"></i> <span class=\"update-done\"> <a title=\"\" href=\"#\"><strong>Envato approved Maruti Admin template</strong></a> <span>i am very happy to approved by TF</span> </span> <span class=\"update-date\"><span class=\"update-day\">05</span>jan</span> </div>\r\n");
      out.write("            <div class=\"new-update clearfix\"> <i class=\"icon-question-sign\"></i> <span class=\"update-notice\"> <a title=\"\" href=\"#\"><strong>I am alwayse here if you have any question</strong></a> <span>we glad that you choose our template</span> </span> <span class=\"update-date\"><span class=\"update-day\">01</span>jan</span> </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <hr>\r\n");
      out.write("    <div class=\"row-fluid\">\r\n");
      out.write("      <div class=\"span12\">\r\n");
      out.write("        <div class=\"widget-box widget-calendar\">\r\n");
      out.write("          <div class=\"widget-title\"> <span class=\"icon\"><i class=\"icon-calendar\"></i></span>\r\n");
      out.write("            <h5>Calendar</h5>\r\n");
      out.write("            <div class=\"buttons\"> <a id=\"add-event\" data-toggle=\"modal\" href=\"#modal-add-event\" class=\"btn btn-inverse btn-mini\"><i class=\"icon-plus icon-white\"></i> Add new event</a>\r\n");
      out.write("              <div class=\"modal hide\" id=\"modal-add-event\">\r\n");
      out.write("                <div class=\"modal-header\">\r\n");
      out.write("                  <button type=\"button\" class=\"close\" data-dismiss=\"modal\">Ã</button>\r\n");
      out.write("                  <h3>Add a new event</h3>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-body\">\r\n");
      out.write("                  <p>Enter event name:</p>\r\n");
      out.write("                  <p>\r\n");
      out.write("                    <input id=\"event-name\" type=\"text\" />\r\n");
      out.write("                  </p>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-footer\"> <a href=\"#\" class=\"btn\" data-dismiss=\"modal\">Cancel</a> <a href=\"#\" id=\"add-event-submit\" class=\"btn btn-primary\">Add event</a> </div>\r\n");
      out.write("              </div>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"widget-content\">\r\n");
      out.write("            <div class=\"panel-left\">\r\n");
      out.write("              <div id=\"fullcalendar\"></div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div id=\"external-events\" class=\"panel-right\">\r\n");
      out.write("              <div class=\"panel-title\">\r\n");
      out.write("                <h5>Drag Events to the calander</h5>\r\n");
      out.write("              </div>\r\n");
      out.write("              <div class=\"panel-content\">\r\n");
      out.write("                <div class=\"external-event ui-draggable label label-inverse\">My Event 1</div>\r\n");
      out.write("                <div class=\"external-event ui-draggable label label-inverse\">My Event 2</div>\r\n");
      out.write("                <div class=\"external-event ui-draggable label label-inverse\">My Event 3</div>\r\n");
      out.write("                <div class=\"external-event ui-draggable label label-inverse\">My Event 4</div>\r\n");
      out.write("                <div class=\"external-event ui-draggable label label-inverse\">My Event 5</div>\r\n");
      out.write("              </div>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div> -->\r\n");
      out.write("  </div> \r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/views/include/footer.jsp", out, false);
      out.write("\r\n");
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
