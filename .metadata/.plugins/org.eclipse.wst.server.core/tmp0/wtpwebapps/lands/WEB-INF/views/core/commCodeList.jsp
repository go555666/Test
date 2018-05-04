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

<script src="/resources/js/jquery.ui.custom.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/bootstrap-colorpicker.js"></script>
<script src="/resources/js/bootstrap-datepicker.js"></script>
<script src="/resources/js/jquery.sparkline.min.js"></script>
<script src="/resources/js/jquery.toggle.buttons.js"></script>
<script src="/resources/js/masked.js"></script>
<script src="/resources/js/jquery.uniform.js"></script>
<script src="/resources/js/select2.min.js"></script>
<script src="/resources/js/matrix.js"></script>
<!-- <script src="/resources/js/matrix.form_common.js"></script> -->
<script src="/resources/js/wysihtml5-0.3.0.js"></script>
<script src="/resources/js/jquery.peity.min.js"></script>
<script src="/resources/js/bootstrap-wysihtml5.js"></script>


<style>
	.trData:hover{
		cursor:pointer;
	}
</style>
<script>
	var mIntDifference = 10;
	var mIntOffset = 0;
	var mIntTotalTdCount = 0;	//전체 테이블 개수 더보기 기능
	var mArrTbData = [];		//테이블 데이터 저장
	var mStrBeforeBG = "";		//td 클릭시 전에 클릭했던 백그라운드 저장
	var mStrBeforeId = "";		//td 클릭시 전에 클릭했던 ID 저장
	var mIntUpdtDataNo = "";	//클릭 된 td의 PK NO
	var mStrClickable = "Y";		//클릭 가능한지 상태를 보여주는 변수
	
	var mIntDifferenceDtl = 10;	// (하위 테이블)
	var mIntOffsetDtl = 0;		// (하위 테이블)
	var mIntTotalTdCount = 0;	//전체 테이블 개수 더보기 기능 (하위 테이블)
	var mStrBeforeBGDtl = "";	//td 클릭시 전에 클릭했던 백그라운드 저장 (하위 테이블)
	var mStrBeforeIdDtl = "";	//td 클릭시 전에 클릭했던 ID 저장 (하위 테이블)
	var mIntTotalTdCountDtl = 0;//전체 테이블 개수 더보기 기능 (하위 테이블)
	var mIntUpdtDataNoDtl = "";	//클릭 된 td의 PK NO (하위 테이블)
	var mStrClickableDtl = "Y";		//클릭 가능한지 상태를 보여주는 변수 (하위 테이블)
	
	function doSelectData(strValue){
//		$("#btnMore").show();
		$("#ftLoading").show();
		$(".inpData").val("");
		$(".inpDataDetail").val("");
		$("#"+mStrBeforeId).css("background-color",mStrBeforeBG);
		$("#inpAddDtl").attr("disabled",true);
		
		if(strValue == "M") {
			mIntOffset += mIntDifference;
		}
		if(strValue != "M") {
			mIntOffset = 0;
			$("#tblCommCodeList tr").remove();
		}
	
		var objData = {};
			
		/* objData["strUserName"] = $("#inpUserName").val();
		objData["strSDate"] = strSDate;
		objData["strEDate"] = strEDate;*/
		
		objData["intOffset"] = mIntOffset;
		objData["intDifference"] = mIntDifference;
		
		$.ajax({
			type: "POST",
			url: "/core/admin/getCommCodeList.do",
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
		
		var arrHtml = [];
		if(intArrSizeM1 <= 0) {
			$("#btnMore").remove();
			arrHtml.push('<tr class="odd"><td valign="top" colspan="4" class="dataTables_empty">No data available in table</td></tr>');
		}
		else {
			var intTotalRowCount = arrReturnVal[intArrSizeM1].TOTAL_ROW_COUNT;
			
			var strCcmNo = "";
			var strName = "";
			var strDetail = "";
			var strUseYn = "";
			var strRegId = "";
			var strRegIp = "";
			var strRegDate = "";
			
			//arrReturnVal.length -1 하는 이유는 마지막 밸류는 항상 TOTAL_ROW_COUNT 이기 때문이다.
			for(var intIndex = 0; intIndex < intArrSizeM1; intIndex++) {
				//더보기 기능
				mIntTotalTdCount++;
				
				strCcmNo		= arrReturnVal[intIndex].CCM_NO_SQ_PK;
				strName			= arrReturnVal[intIndex].NAME;
				strDetail		= arrReturnVal[intIndex].DETAIL;
				strUseYn		= arrReturnVal[intIndex].USE_YN;
				strRegId		= arrReturnVal[intIndex].REG_ID;
				strRegIp		= arrReturnVal[intIndex].REG_IP;
				strRegDate		= arrReturnVal[intIndex].REG_DATE;
				
				if(intIndex % 2 == 0)	arrHtml.push("<tr id='trData"+strCcmNo+"' class='trData' style='background-color:#f9f9f9;' onclick='trOnClick(\"trData"+strCcmNo+"\","+strCcmNo+");'>");
				else					arrHtml.push("<tr id='trData"+strCcmNo+"' class='trData' style='background-color:white;' onclick='trOnClick(\"trData"+strCcmNo+"\","+strCcmNo+");'>");
					/* arrHtml.push("<td class='tdTextCenter'>"+ strUmNo +"</td>"); */
					arrHtml.push("<td class='tdTextCenter'>"+ strName +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strDetail +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strUseYn +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strRegId +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strRegIp +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strRegDate +"</td>");
				arrHtml.push("</tr>");
				
				var objData = {};
				
				mArrTbData.push(objData);
			}
			
			//더보기 기능(무한스크롤) remove
			if(intArrSizeM1 != mIntDifference || mIntTotalTdCount == intTotalRowCount) {
				$("#btnMore").remove();
				arrHtml.push('<tr class="odd"><td valign="top" colspan="6" class="dataTables_empty" style="text-align:center;">END</td></tr>');
			}
			//그리드가 2개 이상일때는 표 안에 more 버튼을 둔다.
			else {
				$("#btnMore").remove();
				arrHtml.push('<tr class="odd" id="btnMore"><td valign="top" colspan="6" onclick="doSelectData(\'M\');" class="dataTables_empty btn btn-info span12" style="text-align:center;">More</td></tr>');
			}
		}
		
		$("#tblCommCodeList").append(arrHtml.join(""));
		$("#ftLoading").hide();
		//doSelectDataDtl();
	}
	
	function doSelectDataDtl(strValue){
//		$("#btnMore").show();
		$("#ftLoading").show();
		$(".inpDataDetail").val("");
		$("#"+mStrBeforeIdDtl).css("background-color",mStrBeforeBGDtl);
		
		if(strValue == "M") {
			mIntOffsetDtl += mIntDifferenceDtl;
		}
		if(strValue != "M") {
			mIntOffsetDtl = 0;
			$("#tblCommCodeDetailList tr").remove();
		}
	
		var objData = {};
		
		/* objData["strUserName"] = $("#inpUserName").val();
		objData["strSDate"] = strSDate;*/
		objData["intCcmNoSq"] = mIntUpdtDataNo;
		
		objData["intOffset"] = mIntOffsetDtl;
		objData["intDifference"] = mIntDifferenceDtl;
		
		$.ajax({
			type: "POST",
			url: "/core/admin/getCommCodeDetailList.do",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(objData),
			dataType: "JSON",
			success: function(arrReturnVal) {
				doSelectDetailDataHandler(arrReturnVal);
			}
		});
	}
	
	function doSelectDetailDataHandler(arrReturnVal) {
		
		//M1 -> Minus 1
		//1을 빼는 이유는 마지막 배열에 TOTAL_ROW_COUNT가 같이 오기 때문
		var intArrSizeM1 = arrReturnVal.length-1;
		
		var arrHtml = [];
		if(intArrSizeM1 <= 0) {
			$("#btnMoreDtl").remove();
			arrHtml.push('<tr class="odd"><td valign="top" colspan="4" class="dataTables_empty">No data available in table</td></tr>');
		}
		else {
			var intTotalRowCount = arrReturnVal[intArrSizeM1].TOTAL_ROW_COUNT;
			
			var strCcdNoSqPk = "";
			var strCcmNoSq = "";
			var strCode = "";
			var strName = "";
			var strInfo1 = "";
			var strInfo2 = "";
			
			//arrReturnVal.length -1 하는 이유는 마지막 밸류는 항상 TOTAL_ROW_COUNT 이기 때문이다.
			for(var intIndex = 0; intIndex < intArrSizeM1; intIndex++) {
				//더보기 기능
				mIntTotalTdCountDtl++;
				
				strCcdNoSqPk	= arrReturnVal[intIndex].CCD_NO_SQ_PK;
				strCcmNoSq		= arrReturnVal[intIndex].CCM_NO_SQ;
				strCode			= arrReturnVal[intIndex].CODE;
				strName			= arrReturnVal[intIndex].NAME;
				strInfo1		= !checkNullHd(arrReturnVal[intIndex].INFO1)? arrReturnVal[intIndex].INFO1:"";
				strInfo2		= !checkNullHd(arrReturnVal[intIndex].INFO2)? arrReturnVal[intIndex].INFO2:"";
				
				if(intIndex % 2 == 0)	arrHtml.push("<tr id='trData"+strCcdNoSqPk+"' class='trData' style='background-color:#f9f9f9;' onclick='trOnClickDtl(\"trData"+strCcdNoSqPk+"\","+strCcdNoSqPk+");'>");
				else					arrHtml.push("<tr id='trData"+strCcdNoSqPk+"' class='trData' style='background-color:white;' onclick='trOnClickDtl(\"trData"+strCcdNoSqPk+"\","+strCcdNoSqPk+");'>");
					arrHtml.push("<td class='tdTextCenter'>"+ strCode +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strName +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strInfo1 +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strInfo2 +"</td>");
				arrHtml.push("</tr>");
				
				var objData = {};
				
				mArrTbData.push(objData);
			}
			
			//더보기 기능(무한스크롤) remove
			if(intArrSizeM1 != mIntDifferenceDtl || mIntTotalTdCountDtl == intTotalRowCount) {
				$("#btnMoreDtl").remove();
				arrHtml.push('<tr class="odd"><td valign="top" colspan="4" class="dataTables_empty" style="text-align:center;">END</td></tr>');
			}
			//그리드가 2개 이상일때는 표 안에 more 버튼을 둔다.
			else {
				$("#btnMoreDtl").remove();
				arrHtml.push('<tr class="odd" id="btnMoreDtl"><td valign="top" colspan="4" onclick="doSelectDataDtl(\'M\');" class="dataTables_empty btn btn-info span12" style="text-align:center;">More</td></tr>');
			}
		}
		
		$("#tblCommCodeDetailList").append(arrHtml.join(""));
		$("#ftLoading").hide();
	}
	
	function doUpdateDataDtl(strType){
		if(confirm("Delete the selected data")) {
			$("#ftLoading").show();
			var objData = {};
			var strUrl = "";
			objData["intCcdNoSq"] = mIntUpdtDataNoDtl;
			
			if(strType == "D") {
				strUrl = "/core/admin/delCommCodeDtl.do";
			}
			
			$.ajax({
				type:"POST",
				url: strUrl,
				contentType:"application/json; charset=UTF-8",
				data: JSON.stringify(objData),
				dataType: "JSON",
				success: function(intReturnVal) {
					if(intReturnVal == 1) {
						alert("DELETE COMPLETED!");
						doSelectDataDtl();
						doCancelDtl();
					}
					else if(intReturnVal == 0) {
						alert("ERROR - CommCode01");
					}
					$("#ftLoading").hide();
				}
			});
		}
	}
	
	function trOnClick(strId, intDataNo) {
		if(mStrClickable == "Y") {
			$(".inpData").val("");
			$("#inpAddDtl").attr("disabled",false);
			mIntUpdtDataNo = intDataNo;
			
			//$(".inpData").attr("readonly",false);
			//Background-color 설정 시작
			$("#"+mStrBeforeId).css("background-color",mStrBeforeBG);
			
			mStrBeforeId = strId;
			mStrBeforeBG = $("#"+strId).css("background-color");
			
			$("#"+strId).css("background-color","#ffe7e7");
			//Background-color 설정 끝
			
			var arrData = $("#" + strId + " td");
			
			for(var intIndex = 0; intIndex < $(".inpData").length; intIndex++) {
				$(".inpData"+intIndex).val(arrData[intIndex].textContent);
			}
			
			doSelectDataDtl();
		}
		else{
			alert("Save your data first.");
			return;
		}
	}
	
	function trOnClickDtl(strId, intDataNo) {
		if(mStrClickable == "Y") {
			$(".inpDataDtl").val("");
			mIntUpdtDataNoDtl = intDataNo;
			$(".inpDataDtl").attr("readonly",false);
			//Background-color 설정 시작
			$("#"+mStrBeforeIdDtl).css("background-color",mStrBeforeBGDtl);
			
			mStrBeforeIdDtl = strId;
			mStrBeforeBGDtl = $("#"+strId).css("background-color");
			
			$("#"+strId).css("background-color","#ffe7e7");
			//Background-color 설정 끝
			
			var arrData = $("#" + strId + " td");
			
			for(var intIndex = 0; intIndex < $(".inpDataDtl").length; intIndex++) {
				$(".inpDataDtl"+intIndex).val(arrData[intIndex].textContent);
			}
		}
		else{
			alert("Save your data first.");
			return;
		}
	}
	
	function doCheckValidation(strValue){
		//strValue == 'D' -> 디테일 발리데이션 체크
		if(strValue == "D") {
			var strNameDtl = $("#inpNameDtl").val();
			
			if(checkNullHd(strNameDtl)) {
				alert("Check 'NAME' field");
				return false;
			}
			return true;
		}
		else {
			var strName = $("#inpName").val();
			var strDetail = $("#inpDetail").val();
			
			if(checkNullHd(strName)){
				alert("Check 'NAME' field");
				return false;
			}
			else if(checkNullHd(strDetail)) {
				alert("check 'DETAIL field");
				return false;
			}
			return true;
		}
	}
	
	function doInsertData() {
		if(!doCheckValidation())	return;
		
		var strName = $("#inpName").val();
		var strDetail = $("#inpDetail").val();
		var objData = new Object();
		
		objData["strName"] = strName;
		objData["strDetail"] = strDetail;
		
		$.ajax({
			type: "POST",
			url: "/core/admin/insCommCode.do",
			contentType:"application/json; charset=UTF-8",
			data: JSON.stringify(objData),
			dataType: "JSON",
			success: function(intReturnVal) {
				if(intReturnVal == 1) {
					alert("Save Complete!");
					doSelectData();
					doCancel();
				}
			}
		});
	}
	
	function doInsertDataDtl() {
		if(!doCheckValidation('D'))	return;
		
		var strCode = $("#inpCodeDtl").val();
		var strName = $("#inpNameDtl").val();
		var strInfo1 = $("#inpInfo1").val();
		var strInfo2 = $("#inpInfo2").val();
		
		var objData = new Object();
		
		objData["intCcmNoSq"] = mIntUpdtDataNo;
		objData["strCode"] = strCode;
		objData["strName"] = strName;
		objData["strInfo1"] = strInfo1;
		objData["strInfo2"] = strInfo2;
		
		$.ajax({
			type: "POST",
			url: "/core/admin/insCommCodeDetail.do",
			contentType:"application/json; charset=UTF-8",
			data: JSON.stringify(objData),
			dataType: "JSON",
			success: function(intReturnVal) {
				if(intReturnVal == 1) {
					alert("Save Complete!");
					doSelectDataDtl();
					doCancelDtl();
				}
			}
		});
	}
	
	function doInsertRow() {
		mStrClickable = "N";
		$("#"+mStrBeforeId).css("background-color",mStrBeforeBG);
		$(".inpData").attr("readonly",false);
		$(".inpData").val("");
		$("#inpAdd").hide();
		$("#inpCancel").show();
		$("#inpSave").show();
		
		$("#inpName").keyup(function(){
			$(".tdName").text($("#inpName").val());
		});
		$("#inpDetail").keyup(function(){
			$(".tdDetail").text($("#inpDetail").val());
		});
		
		doInsertRowTr();
	}
	
	function doInsertRowTr() {
		var arrHtml = [];
		
		arrHtml.push("<tr class='trData trAddData' style='background-color:#ffe7e7;'>");
			arrHtml.push("<td class='tdTextCenter tdName'></td>");
			arrHtml.push("<td class='tdTextCenter tdDetail'></td>");
			arrHtml.push("<td class='tdTextCenter'>Y</td>");
			arrHtml.push("<td class='tdTextCenter'></td>");
			arrHtml.push("<td class='tdTextCenter'></td>");
			arrHtml.push("<td class='tdTextCenter'></td>");
		arrHtml.push("</tr>");
	
		$("#tblCommCodeList").prepend(arrHtml.join(""));
	}
	
	function doCancel(){
		$(".trAddData").remove();
		$("#inpCancel").hide();
		$("#inpSave").hide();
		$("#inpAdd").show();
		
		$(".inpData").val("");
		$(".inpData").attr("readonly",true);
		
		mStrClickable = "Y";
	}
	
	function doInsertRowDtl() {
		mStrClickableDtl = "N";
		$("#"+mStrBeforeIdDtl).css("background-color",mStrBeforeBGDtl);
		$(".inpDataDtl").attr("readonly",false);
		$(".inpDataDtl").val("");
		$("#inpAddDtl").hide();
		$("#inpDelDtl").hide();
		$("#inpCancelDtl").show();
		$("#inpSaveDtl").show();
		
		$("#inpCodeDtl").keyup(function(){
			$(".tdCodeDtl").text($("#inpCodeDtl").val());
		});
		$("#inpNameDtl").keyup(function(){
			$(".tdNameDtl").text($("#inpNameDtl").val());
		});
		$("#inpInfo1").keyup(function(){
			$(".tdInfo1").text($("#inpInfo1").val());
		});
		$("#inpInfo2").keyup(function(){
			$(".tdInfo2").text($("#inpInfo2").val());
		});
		
		doInsertRowTrDtl();
	}
	
	function doInsertRowTrDtl() {
		var arrHtml = [];
		
		arrHtml.push("<tr class='trData trAddData' style='background-color:#ffe7e7;'>");
			arrHtml.push("<td class='tdTextCenter tdCodeDtl'></td>");	
			arrHtml.push("<td class='tdTextCenter tdNameDtl'></td>");
			arrHtml.push("<td class='tdTextCenter tdInfo1'></td>");
			arrHtml.push("<td class='tdTextCenter tdInfo2'></td>");
		arrHtml.push("</tr>");
	
		$("#tblCommCodeDetailList").prepend(arrHtml.join(""));
	}
	
	function doCancelDtl(){
		$(".trAddData").remove();
		$("#inpCancelDtl").hide();
		$("#inpSaveDtl").hide();
		$("#inpAddDtl").show();
		$("#inpDelDtl").show();
		
		$(".inpDataDtl").val("");
		$(".inpDataDtl").attr("readonly",true);
		
		mStrClickable = "Y";
	}
	
	function initDocument() {
		if(!checkDevAuthHd())	$("#inpAdd").remove();
		
		$(".inpData").attr("readonly",true);
		$(".inpDataDtl").attr("readonly",true);
	}

	$(document).ready(function(){
		initDocument();
		doSelectData();
	});
</script>

<div id="content">
<div id="content-header">
  <div id="breadcrumb"> <a href="/main.do" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Common Code</a> </div>
  <h1></h1>
</div>
<div class="container-fluid">
  <hr>
  <div class="row-fluid">
  	<div class="span12">
     	
		<form id="frmAdminArea" class="form-horizontal" method="post" action="#" name="basic_validate" id="basic_validate" novalidate="novalidate">
			<div id="divUserName" class="span8 control-group" style="border-top:1px solid #eeeeee !important;">
				<!-- <label class="control-label">Name</label>
				<div class="controls">
					<input type="text" name="required" id="inpUserName">
				</div> -->
			</div>
			<div class="span3 control-group" style="border-top:1px solid #eeeeee !important; padding-left:20px; margin-top:10px;" align="right">
				<!-- <input type="button" class="btn" onclick="doSelectData();" value="Search"> -->
				<input id="inpAdd" type="button" class="btn" onclick="doInsertRow();" value="Add">
				<input id="inpCancel" type="button" class="btn btn-danger" onclick="doCancel();" value="Cancel" style="display:none;">
				<input id="inpSave" type="button" class="btn" onclick="doInsertData();" value="Save" style="display:none;">
				<!-- <input type="button" class="btn" onclick="doSelectData();" value="Search">
				<input type="button" class="btn" onclick="doSelectData();" value="Search"> -->
			</div>
			<div class="span1"></div>
		</form>
  	</div>
  </div>
  <div class="row-fluid">
  	
 	<div class="span8">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
          <h5>COMMON CODE LIST</h5>
        </div>
        <div class="widget-content nopadding" style="overflow-x: auto; height:300px;">
          <table class="table table-bordered">
	        <thead>
	            <tr>
	              <th>NAME</th>
	              <th>DETAIL</th>
	              <th>USE Y/N</th>
	              <th>REG ID</th>
	              <th>REG IP</th>
	              <th>REG DATE</th>
	            </tr>
	        </thead>
			<tbody id="tblCommCodeList">
			
			</tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="span4">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>COMMON CODE</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="#" method="get" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">NAME :</label>
              <div class="controls">
                <input id="inpName" type="text" class="span11 inpData inpData0" placeholder="NAME" maxlength="20"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">DETAIL :</label>
              <div class="controls">
              	<textarea id="inpDetail" class="span11 inpData inpData1" placeholder="DETAIL" maxlength="200" rows="3" style="resize:vertical;"></textarea>
              </div>
            </div>
            
            
          </form>
        </div>
      </div>
    </div>
    
</div>
  <div class="row-fluid">
  	<div class="span12">
     	
		<form id="frmAdminAreaDtl" class="form-horizontal" method="post" action="#" name="basic_validate" id="basic_validate" novalidate="novalidate">
			<div class="span8 control-group" style="border-top:1px solid #eeeeee !important;">
			</div>
			<div class="span3 control-group" style="border-top:1px solid #eeeeee !important; padding-left:20px; margin-top:10px;" align="right">
				<input id="inpAddDtl" type="button" class="btn" onclick="doInsertRowDtl();" value="Add">
				<input id="inpDelDtl" type="button" class="btn" onclick="doUpdateDataDtl('D');" value="Delete">
				<input id="inpCancelDtl" type="button" class="btn btn-danger" onclick="doCancelDtl();" value="Cancel" style="display:none;">
				<input id="inpSaveDtl" type="button" class="btn" onclick="doInsertDataDtl();" value="Save" style="display:none;">
				<!-- <input type="button" class="btn" onclick="doSelectData();" value="Search">
				<input type="button" class="btn" onclick="doSelectData();" value="Search"> -->
			</div>
			<div class="span1"></div>
		</form>
  	</div>
  </div>
<div class="row-fluid">
  	
 	<div class="span8">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
          <h5>COMMON CODE DETAIL LIST</h5>
        </div>
        <div class="widget-content nopadding" style="overflow-x: auto;">
          <table class="table table-bordered">
	        <thead>
	            <tr>
	              <th>CODE</th>
	              <th>NAME</th>
	              <th>INFO 1</th>
	              <th>INFO 2</th>
	            </tr>
	        </thead>
			<tbody id="tblCommCodeDetailList">
	
			</tbody>
          </table>
        </div>
      </div>
      <input id="btnMore" type="button" class="btn btn-large span12" onclick="doSelectData('M');" value="More">
    </div>
    <div class="span4">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>COMMON CODE DETAIL</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="#" method="get" class="form-horizontal">
          	<div class="control-group">
              <label class="control-label">CODE :</label>
              <div class="controls">
                <input id="inpCodeDtl" type="text" class="span8 inpDataDtl inpDataDtl0" placeholder="CODE"/>
                <input id="btnCodeDtl" type="button" class="span3" value="DUP">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">NAME :</label>
              <div class="controls">
                <input id="inpNameDtl" type="text" class="span11 inpDataDtl inpDataDtl1" placeholder="NAME"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">INFO 1 :</label>
              <div class="controls">
                <input id="inpInfo1" type="text"  class="span11 inpDataDtl inpDataDtl2" placeholder="INFO 1"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">INFO 2 :</label>
              <div class="controls">
                <input id="inpInfo2" type="text"  class="span11 inpDataDtl inpDataDtl3" placeholder="INFO 2"/>
              </div>
            </div>
            
          </form>
        </div>
      </div>
    </div>
    
</div>

</div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>