<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="/resources/css/matrix-style.css" />
<link rel="stylesheet" href="/resources/css/matrix-media.css" />
<link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#">Sample pages</a> <a href="#" class="current">Error</a> </div>
    <h1>Error 404</h1>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Error 404</h5>
          </div>
          <div class="widget-content">
            <div class="error_ex">
              <h1>404</h1>
              <h3>Opps, You're lost.</h3>
              <p>We can not find the page you're looking for.</p>
              <a class="btn btn-warning btn-big"  href="/main.do">Back to Home</a> </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="/resources/js/jquery.min.js"></script> 
<script src="/resources/js/jquery.ui.custom.js"></script> 
<script src="/resources/js/bootstrap.min.js"></script> 
<script src="/resources/js/maruti.js"></script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
