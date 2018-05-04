<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
        <title>LANDS</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/resources/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="/resources/css/matrix-login.css" />
        <link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
    </head>

    <body>
        <div id="loginbox">
            <form id="loginform" class="form-vertical" action="index.html">
				<div class="control-group normal_text"> <h3><img src="/resources/img/lands_logo_03.png" alt="Logo" style="height:25px; width:180px;"/></h3></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"> </i></span><input id="userId" type="text" placeholder="Username" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span><input id="userPw" type="password" placeholder="Password" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <!-- <span class="pull-left"><a href="#" class="flip-link btn btn-info" id="to-recover">Lost password?</a></span> -->
                    <span style="margin-left:45%;"><a type="button" href="javascript:signIn();" class="btn btn-success" /> Sign In</a></span>
                </div>
            </form>
            <!-- <form id="recoverform" action="#" class="form-vertical">
				<p class="normal_text">Enter your e-mail address below and we will send you instructions how to recover a password.</p>
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
                        </div>
                    </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn-success" id="to-login">&laquo; Back to login</a></span>
                    <span class="pull-right"><a class="btn btn-info"/>Reecover</a></span>
                </div>
            </form> -->
        </div>
        
        <script src="/resources/js/jquery.min.js"></script>
        <script src="/resources/js/matrix.login.js"></script>
        <script>
	    	function signIn() {
	    		var objData = {};
	    		var strUserId = $("#userId").val();
	    		var strUserPw = $("#userPw").val();
	    		
	    		if(checkNull(strUserId)) {
	    			alert("Check your ID, please.");
	    			return;
	    		}
	    		else if(checkNull(strUserPw)) {
	    			alert("Check your Password, please.");
	    			return;
	    		}
	    		
	    		objData["userId"] = strUserId;
	    		objData["userPw"] = strUserPw;
	    		
	    		$.ajax({
	    			type: "POST",
	    			url: "/auth/signIn.do",
	    			contentType: "application/json; charset=UTF-8",
	    			data: JSON.stringify(objData),
	    			dataType: "json",
	    			success: function(intReturnVal) {
	    				if(intReturnVal == 0) {
	    					alert("Check your password or id, please.");
	    					
	    					$("#userPw").val("");
	    				}
	    				else {
	    					location.href = "/main.do";
	    				}
	    			}
	    		});
	    	}
	    	
	    	function checkNull(strValue) {
	    		if(strValue != null && strValue != "" && strValue != "undefined")	return false;
	    		return true;
	    	}
	    	
	    	$(document).ready(function(){
	    		$("#userId").keyup(function(e){
	    			if(e.keyCode == 13) {
	    				signIn();
	    			}
	    		});
	    		$("#userPw").keyup(function(e){
	    			if(e.keyCode == 13) {
	    				signIn();
	    			}
	    		});
	    		$("#userId").focus();
	    	});
    	</script>
    
    </body>

</html>
