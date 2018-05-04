<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="en">
<head>
<title>LANDS</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/may9th.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
</head>
<%
	String mStrUserId = (String)session.getAttribute("userId");
	String mStrUserName = (String)session.getAttribute("userName");
	String mStrAuth = (String)session.getAttribute("auth");
	String mStrLvl = (String)session.getAttribute("lvl");
%>
<style>
#ftLoading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; } 
  
#loading-image {  
 position: absolute;  
 top: 50%;  
 left: 50%; 
 z-index: 100; }
</style>

<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
      
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

	// resets the menu selection upon entry to this page:
	function resetMenu() {
	   document.gomenu.selector.selectedIndex = 2;
	}
	
</script>

<body>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Matrix Admin</a></h1>
</div>
<!--close-Header-part--> 

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text"><span id="spanUserNameHd"></span></span></a></li>
    <!-- <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> new message</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> inbox</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> outbox</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> trash</a></li>
      </ul>
    </li> -->
    <li class="adminMenu"><a title="" href="/core/admin/getCommCode.do"><i class="icon icon-th-list"></i> <span class="text">Common Code</span></a></li>
    <li class="adminMenu"><a title="" href="/user/admin/getManageUsers.do"><i class="icon icon-cog"></i> <span class="text">Manage Users</span></a></li>
    <li class=""><a title="" href="/user/signout.do"><i class="icon icon-share-alt"></i> <span class="text">Signout</span></a></li>
  </ul>
</div>

<!--start-top-serch-->
<!-- <div id="search">
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div> -->
<!--close-top-serch--> 

<!--sidebar-menu-->

<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard2</a>
  <ul>
<!--     <li><a href="/user/getAttendance.do"><i class="icon icon-th-list"></i> <span>Attendance</span></a> </li> -->
    <li><a href="/article/getArticleList.do"><i class="icon icon-list-alt"></i> <span>Article</span></a> </li>
    <li><a href="widgets.html"><i class="icon icon-dashboard"></i> <span>Car</span></a> </li>
<!--     <li><a href="tables.html"><i class="icon icon-th"></i> <span>Tables</span></a></li> -->
   <!--  <li><a href="grid.html"><i class="icon icon-fullscreen"></i> <span>Full width</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>Forms</span> <span class="label label-important">3</span></a>
      <ul>
        <li><a href="form-common.html">Basic Form</a></li>
        <li><a href="form-validation.html">Form with Validation</a></li>
        <li><a href="form-wizard.html">Form with Wizard</a></li>
      </ul>
    </li>
    <li><a href="buttons.html"><i class="icon icon-tint"></i> <span>Buttons &amp; icons</span></a></li>
    <li class="submenu active"><a href="interface.html"><i class="icon icon-pencil"></i> <span>Eelements</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-file"></i> <span>Addons</span> <span class="label label-important">5</span></a>
      <ul>
        <li><a href="index2.html">Dashboard2</a></li>
        <li><a href="gallery.html">Gallery</a></li>
        <li><a href="calendar.html">Calendar</a></li>
        <li><a href="invoice.html">Invoice</a></li>
        <li><a href="chat.html">Chat option</a></li>
      </ul>
    </li>
    <li class="submenu"> <a href="#"><i class="icon icon-info-sign"></i> <span>Error</span> <span class="label label-important">4</span></a>
      <ul>
        <li><a href="error403.html">Error 403</a></li>
        <li><a href="error404.html">Error 404</a></li>
        <li><a href="error405.html">Error 405</a></li>
        <li><a href="error500.html">Error 500</a></li>
      </ul>
    </li> -->
    <!-- <li class="content"> <span>Monthly Bandwidth Transfer</span>
      <div class="progress progress-mini progress-danger active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
      <span class="percent">77%</span>
      <div class="stat">21419.94 / 14000 MB</div>
    </li>
    <li class="content"> <span>Disk Space Usage</span>
      <div class="progress progress-mini active progress-striped">
        <div style="width: 87%;" class="bar"></div>
      </div>
      <span class="percent">87%</span>
      <div class="stat">604.44 / 4000 MB</div>
    </li> -->
  </ul>
</div>

<script>
	//NULL 체크
	function checkNullHd(strValue) {
		if(strValue != null && strValue != "" && strValue != "undefined")	return false;
		return true;
	}
	
	//권한 체크
	function checkAdminAuthHd(){
		var strAuth = "<%= mStrAuth %>";
		var strLvl = "<%= mStrLvl %>";
		//Auth = "00" 관리자, "59" 개발자
		//Lvl = "00" 어드민
		//관리자 + 어드민 권한이여야만 한다.
		//관리자 + 일반 직원(EMPLOYEE)는 접근 하면 안된다.
		if((strAuth == "00" && strLvl == "00") || strAuth == "59")	return true;
		else														return false;
	}
	
	//개발자만 접근 관리 한 메뉴
	function checkDevAuthHd(){
		var strAuth = "<%= mStrAuth %>";
		if(strAuth == "59")	return true;
		else				return false;
	}
	
	function doCodeDetailHd(strFieldValue, strCommCode){
		
	}
	
	(function(){
		var strUserName = "<%= mStrUserName %>";
		$("#spanUserNameHd").text(strUserName);
		
		//admin 관련된 메뉴는 다 지운다.
		var strAuth = "<%= mStrAuth %>";
		if(!checkAdminAuthHd()) {
			$(".adminMenu").remove();
		}
	})();
</script>

