<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="/resources/css/colorpicker.css" />
<link rel="stylesheet" href="/resources/css/datepicker.css" />
<link rel="stylesheet" href="/resources/css/uniform.css" />
<link rel="stylesheet" href="/resources/css/select2.css" />
<link rel="stylesheet" href="/resources/css/matrix-style.css" />
<link rel="stylesheet" href="/resources/css/matrix-media.css" />
<link rel="stylesheet" href="/resources/css/bootstrap-wysihtml5.css" />
<link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

<script src="/resources/js/jquery.min.js"></script> 
<script src="/resources/js/jquery.ui.custom.js"></script> 
<script src="/resources/js/bootstrap.min.js"></script> 
<script src="/resources/js/jquery.uniform.js"></script> 
<script src="/resources/js/select2.min.js"></script> 
<script src="/resources/js/jquery.dataTables.min.js"></script> 
<script src="/resources/js/matrix.js"></script> 
<script src="/resources/js/matrix.tables.js"></script>
<script src="/resources/js/bootstrap-datepicker.js"></script>

<style>
	.tdTextCenter{
		text-align:center !important;
	}
</style>
<script>
	var mIntDifference = 31;
	var mIntOffset = 0;
	var mArrExcelData = [];
	var mIntTotalTdCount = 0;	//전체 테이블 개수 더보기 기능

	function doInsertAtdLog(strValue){
		$('.modal').modal('hide');
		objData = {};
		
		objData["strAtdType"] = strValue;
		
		$.ajax({
			type: "POST",
			url: "/user/putAtdCheck.do",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(objData),
			dataType: "json",
			success: function(intReturnVal) {
				if(intReturnVal == 0) {
					alert("ERROR - Attendance01");
				}
				else {
					if(strValue == "IN")			alert("Checked IN successfully");
					else if(strValue == "OUT")		alert("Checked OUT successfully");
					else							alert("ERROR - Attendance02");
				}
				//doSelectData();
				location.reload();
			}
		});
	}
	
	//strValue == 'M' -> 더보기
	function doSelectData(strValue){
		$("#btnMore").show();
		
		if(strValue == "M") {
			mIntOffset += mIntDifference;
		}
		if(strValue != "M") {
			mIntOffset = 0;
			$("#tblAtcLog tr").remove();
			mArrExcelData = []; //엑셀 데이터 초기화
		}

		$("#ftLoading").show();
		var objData = {};
		
		var strSDate = $("#inpSDate").val();
		var strEDate = $("#inpEDate").val();
		
		if(!checkNullHd(strSDate)) {
			if(!checkNullHd(strEDate)) {
				strSDate += " 00:00:00";
				strEDate += " 23:59:59";
			} else {
				
			}
		}
		
		objData["strUserName"] = $("#inpUserName").val();
		objData["strSDate"] = strSDate;
		objData["strEDate"] = strEDate;
		objData["intOffset"] = mIntOffset;
		objData["intDifference"] = mIntDifference;
		
		$.ajax({
			type: "POST",
			url: "/user/getAtdLog.do",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(objData),
			dataType: "JSON",
			success: function(arrReturnVal) {
				doSelectDataHandler(arrReturnVal);
			}
		});
	}
	
	function doSelectDataHandler(arrReturnVal) {
		
		//M1 -> Minus 1
		//1을 빼는 이유는 마지막 배열에 TOTAL_ROW_COUNT가 같이 오기 때문
		var intArrSizeM1 = arrReturnVal.length-1;
		var intTotalRowCount = arrReturnVal[intArrSizeM1].TOTAL_ROW_COUNT;
		var arrHtml = [];
		if(intArrSizeM1 == 0) {
			$("#btnMore").hide();
			arrHtml.push('<tr class="odd"><td valign="top" colspan="4" class="dataTables_empty">No data available in table</td></tr>');
		}
		else {
			var strAlmType = "";
			var strUserName = "";
			var strRegDate = "";
			var strRegIp = "";
			
			
			
			//arrReturnVal.length -1 하는 이유는 마지막 밸류는 항상 TOTAL_ROW_COUNT 이기 때문이다.
			for(var intIndex = 0; intIndex < intArrSizeM1; intIndex++) {
				//더보기 기능
				mIntTotalTdCount++;
				
				strUserName = arrReturnVal[intIndex].USER_NAME;
				strRegDate = arrReturnVal[intIndex].REG_DATE;
				strRegIp = arrReturnVal[intIndex].REG_IP;
				strAlmType = arrReturnVal[intIndex].ALM_TYPE;
				
				if(intIndex % 2 == 0)	arrHtml.push("<tr class='even'>");
				else					arrHtml.push("<tr class='odd' style='background-color:white;'>");
					arrHtml.push("<td class='tdTextCenter'>"+ strUserName +"</td>");
				if(strAlmType == "OUT")	arrHtml.push("<td class='tdTextCenter' style='color:red;'>"+ strAlmType +"</td>");
				else					arrHtml.push("<td class='tdTextCenter' style='color:green;'>"+ strAlmType +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strRegIp +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strRegDate +"</td>");
				arrHtml.push("</tr>");
				
				//EXCEL 데이터 - 시작
				var objData = {};
				
				objData["USER_NAME"] = strUserName;
				objData["REG_DATE"] = strRegDate;
				objData["REG_IP"] = strRegIp;
				objData["ALM_TYPE"] = strAlmType;
				
				mArrExcelData.push(objData);
				//EXCEL 데이터 - 끝 
			}
			
			
			//더보기 기능(무한스크롤) remove
			if(intArrSizeM1 != mIntDifference || mIntTotalTdCount == intTotalRowCount) {
				$("#btnMore").hide();
				arrHtml.push('<tr class="odd"><td valign="top" colspan="4" class="dataTables_empty" style="text-align:center;">END</td></tr>');
			}
			
		}
		
		$("#tblAtcLog").append(arrHtml.join(""));
		$("#ftLoading").hide();
	}
	
	function downloadExcel(){
		var strUserName = "";
		$("#ftLoading").show();
		
		if(!(checkNullHd(mArrExcelData))) {
			
			strUserName = $("#inpUserName").val();
			$.ajax({
				type:"POST",
				url: "/user/exel/attendance.do?userName="+strUserName,
				contentType: "application/json; charset=UTF-8",
				data: JSON.stringify(mArrExcelData),
				dataType: "JSON",
				success: function(intResult) {
					if(intResult == 1)	alert("Download completed");
					else				alert("ERROR - Attendance03");
					$("#ftLoading").hide();
				}
			});
		}
	}
	
	function getCurrDateTime(){
		var dtNow = new Date();
		var year = dtNow.getFullYear();
		var month = dtNow.getMonth()+1;
		var date = dtNow.getDate();
		var hours = dtNow.getHours();
		var mins = dtNow.getMinutes();
		var secs = dtNow.getSeconds();
		
		if(month < 10)	month = "0" + month;
		if(date < 10)	date = "0" + date;
		if(hours < 10)	hours = "0" + hours;
		if(mins < 10)	mins = "0" + mins;
		if(secs < 10)	secs = "0" + secs;
		
		$(".spCurrDateTime").html(date + "/" + month + "/" + year + " " + hours + ":" + mins + ":" + secs);
	}
	
	$(document).ready(function(){
		$('.datepicker').datepicker();
		
		$("#inpUserName").keyup(function(e){
			if(e.keyCode == 13) {
				doSelectData();
			}
		});
		
		//권한이 없으면 다른유저 조회 불가능
		if(!(checkAdminAuthHd()))	$("#frmAdminArea").remove();
		
		doSelectData();
	});
	
	setInterval("getCurrDateTime()", 1000);
	
</script>

<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="/main.do" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Attendance</a> </div>
    <h1>Attendance</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      	<button class="btn btn-large btn-success" data-toggle="modal" data-target="#mdCheckIn">Check IN</button>
      	<button class="btn btn-large btn-danger" data-toggle="modal" data-target="#mdCheckOut" style="float:right;">Check OUT</button>
      	
		<form id="frmAdminArea" class="form-horizontal" method="post" action="#" name="basic_validate" id="basic_validate" novalidate="novalidate">
			<div id="divUserName" class="span4 control-group" style="border-top:1px solid #eeeeee !important;">
				<label class="control-label">Name</label>
				<div class="controls">
					<input type="text" name="required" id="inpUserName">
				</div>
			</div>
			<div class="control-group span4" style="border-top:1px solid #eeeeee !important;">
              <label class="control-label">Date</label>
              <div class="controls">
                <input type="text" id="inpSDate" data-date="2013-01-02" data-date-format="yyyy-mm-dd" value="" class="datepicker span6">
                <input type="text" id="inpEDate" data-date="2013-01-02" data-date-format="yyyy-mm-dd" value="" class="datepicker span6">
              </div>
            </div>
			<div class="span3 control-group" style="border-top:1px solid #eeeeee !important; padding-left:20px; margin-top:10px;" align="right">
				<input type="button" class="btn" onclick="doSelectData();" value="Search">
				<input type="button" class="btn" onclick="downloadExcel();" value="Excel">
				<!-- <input type="button" class="btn" onclick="doSelectData();" value="Search">
				<input type="button" class="btn" onclick="doSelectData();" value="Search"> -->
			</div>
			<div class="span1"></div>
		</form>
        
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Attendance</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
	            <thead>
	              <tr>
	                <th>NAME</th>
	                <th>IN/OUT</th>
	                <th>IP</th>
	                <th>DATE</th>
	              </tr>
	            </thead>
				<tbody id="tblAtcLog">
				
				</tbody>
            </table>
          </div>
        </div>
        <input id="btnMore" type="button" class="btn btn-large span12" onclick="doSelectData('M');" value="More">
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="mdCheckIn" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Check IN</h5>
      </div>
      <div class="modal-body">
        <span style="font-size:20px;">Good Morning!</span><br/><br/>
        <span class="spCurrDateTime" style="font-size:20px;"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="doInsertAtdLog('IN')">Check IN</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" id="mdCheckOut" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Check OUT</h5>
      </div>
      <div class="modal-body">
        <span style="font-size:20px;">Thank you for your hard work</span><br/><br/>
        <span class="spCurrDateTime" style="font-size:20px;"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="doInsertAtdLog('OUT')">Check OUT</button>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>