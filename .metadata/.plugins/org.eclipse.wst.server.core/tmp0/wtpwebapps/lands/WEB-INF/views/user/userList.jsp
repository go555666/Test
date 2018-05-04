<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="/resources/js/wysihtml5-0.3.0.js"></script> 
<script src="/resources/js/jquery.peity.min.js"></script> 
<script src="/resources/js/bootstrap-wysihtml5.js"></script> 

<script>
	var mIntDifference = 30;
	var mIntOffset = 0;
	var mIntTotalTdCount = 0;	//전체 테이블 개수 더보기 기능
	var mArrTbData = [];		//테이블 데이터 저장
	var mStrBeforeBG = "";		//td 클릭시 전에 클릭했던 백그라운드 저장
	var mStrBeforeId = "";		//td 클릭시 전에 클릭했던 ID 저장
	var mIntUpdtDataNo = "";	//클릭 된 td의 PK NO
	var mStrClickable = "Y";	//클릭 가능한지 상태를 보여주는 변수
	var mStrInsStatus = "";	//Save 버튼을 업데이트와 같이 쓰기 때문에 새로 추가 할때 저장은 다른 status를 주기 위해 사용하는 변수
	<%
		String mStrUserId = (String)session.getAttribute("userId");
	%>
	
	function doCodeDetail(strCommName, strCommCode){
		var strReturnVal = "";
		<c:forEach var="idx" items="${commCodeList}" varStatus="status">
			if("${idx.MAST_NAME}" == strCommName && "${idx.CODE}" == strCommCode) {
				strReturnVal = "${idx.NAME}";
			}
		</c:forEach>
		return strReturnVal
	}
	
	function doSelectData(strValue){
		$("#btnMore").show();
		$("#ftLoading").show();
		$(".inpData").val("");
		$("#"+mStrBeforeId).css("background-color",mStrBeforeBG);
		$("#btnPw").attr("disabled",true);
		mStrClickable = "Y";
		doCancel();
		
		if(strValue == "M") {
			mIntOffset += mIntDifference;
		}
		if(strValue != "M") {
			mIntOffset = 0;
			$("#tblUserList tr").remove();
		}
	
		var objData = {};
			
		/* objData["strUserName"] = $("#inpUserName").val();
		objData["strSDate"] = strSDate;
		objData["strEDate"] = strEDate;*/
		
		objData["intOffset"] = mIntOffset;
		objData["intDifference"] = mIntDifference;
		
		$.ajax({
			type: "POST",
			url: "/user/admin/getUserList.do",
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
			var strUmNo = "";
			var strUserId = "";
			var strUserPw = "";
			var strUserName = "";
			var strUserEmail = "";
			var strUserBDay = "";
			var strAuth = "";
			var strUserLvl = "";
			var strDmNoSq = "";
			var strUseYn = "";
			var strRegId = "";
			var strRegIp = "";
			var strRegDate = "";
			var strUpdtId = "";
			var strUpdtIp = "";
			var strUpdtDate = "";
			
			//arrReturnVal.length -1 하는 이유는 마지막 밸류는 항상 TOTAL_ROW_COUNT 이기 때문이다.
			for(var intIndex = 0; intIndex < intArrSizeM1; intIndex++) {
				//더보기 기능
				mIntTotalTdCount++;
				
				strUmNo			= arrReturnVal[intIndex].UM_NO_SQ_PK;
				strUserId		= arrReturnVal[intIndex].USER_ID;
				strUserPw		= arrReturnVal[intIndex].USER_PW;
				strUserName		= arrReturnVal[intIndex].USER_NAME;
				strUserEmail	= arrReturnVal[intIndex].USER_EMAIL== null ? "" : arrReturnVal[intIndex].USER_EMAIL;
				strUserBDay		= arrReturnVal[intIndex].USER_BDAY== null ? "" : arrReturnVal[intIndex].USER_BDAY;
				strAuth			= doCodeDetail("USER_AUTH",arrReturnVal[intIndex].USER_AUTH);
				strLvl			= doCodeDetail("USER_LVL",arrReturnVal[intIndex].USER_LVL);
				strDmNoSq		= arrReturnVal[intIndex].DM_NO_SQ== null ? "" : arrReturnVal[intIndex].DM_NO_SQ;
				strUseYn		= arrReturnVal[intIndex].USE_YN;
				strRegId		= arrReturnVal[intIndex].REG_ID;
				strRegIp		= arrReturnVal[intIndex].REG_IP;
				strRegDate		= arrReturnVal[intIndex].REG_DATE;
				strUpdtId		= arrReturnVal[intIndex].UPDT_ID == null ? "" : arrReturnVal[intIndex].UPDT_ID;
				strUpdtIp		= arrReturnVal[intIndex].UPDT_IP == null ? "" : arrReturnVal[intIndex].UPDT_IP;
				strUpdtDate		= arrReturnVal[intIndex].UPDT_DATE == null ? "" : arrReturnVal[intIndex].UPDT_DATE;
				
				if(intIndex % 2 == 0){
						arrHtml.push("<tr id='trData"+strUmNo+"' class='trData' style='background-color:#f9f9f9;");
						if(strUseYn == "N")	arrHtml.push("color:red;");
						arrHtml.push("' onclick='trOnClick(\"trData"+strUmNo+"\","+strUmNo+");'>");
				}
				
				else{
					arrHtml.push("<tr id='trData"+strUmNo+"' class='trData' style='background-color:white;");
					if(strUseYn =="N") arrHtml.push("color:red;");
					arrHtml.push("' onclick='trOnClick(\"trData"+strUmNo+"\","+strUmNo+");'>");
				}
					/* arrHtml.push("<td class='tdTextCenter'>"+ strUmNo +"</td>"); */
					arrHtml.push("<td class='tdTextCenter'>"+ strUserId +"</td>");
					arrHtml.push("<td class='tdTextCenter' style='display:none;'>"+ strUserPw +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strUserName +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strUserEmail +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strUserBDay +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strAuth +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strLvl +"</td>");
					arrHtml.push("<td class='tdTextCenter' id='tdTypeNo"+strUmNo+"'	>");
					if(!checkNullHd(strDmNoSq)){
						arrHtml.push("<button type='button' class='btn btn-secondary' onclick='doSelectDealerData("+strDmNoSq+");' style='font-size:11px;'>show</button>");
					}
					arrHtml.push("</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strUseYn +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strRegId +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strRegIp +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strRegDate +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strUpdtId +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strUpdtIp +"</td>");
					arrHtml.push("<td class='tdTextCenter'>"+ strUpdtDate +"</td>");
				arrHtml.push("</tr>");
				
			}
			
			//더보기 기능(무한스크롤) remove
			if(intArrSizeM1 != mIntDifference || mIntTotalTdCount == intTotalRowCount) {
				$("#btnMore").hide();
				arrHtml.push('<tr class="odd"><td valign="top" colspan="14" class="dataTables_empty" style="text-align:center;">END</td></tr>');
			}
		}
		
		$("#tblUserList").append(arrHtml.join(""));
		$("#ftLoading").hide();
	}
	
	function doSelectDealerData(strDmNoSq) {
		$("#ftLoading").show();
		
		var objData = {};
		
		objData["dmNoSq"] = strDmNoSq;
		
		$.ajax({
			type: "POST",
			url: "/user/admin/getDealerInfo.do",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(objData),
			dataType: "JSON",
			success: function(arrReturnVal) {
				doSelectDealerDataHandler(arrReturnVal);
			}
		});
	}
	
	function doSelectDealerDataHandler(arrReturnVal){
		$(".trDealerInfo").remove();

		var arrHtml = [];
		
		var strDmNoSqPk		= arrReturnVal[0].DM_NO_SQ_PK;
		var strScores		= arrReturnVal[0].DEALER_SCORES;
		var strCancelCnt	= arrReturnVal[0].DEALER_CANCEL_CNT;
		var strPoint		= arrReturnVal[0].DEALER_POINT;
		var strFeedbackYn	= arrReturnVal[0].DEALER_FEEDBACK_YN;
		var strRemark1		= checkNullHd(arrReturnVal[0].REMARK1)? "": arrReturnVal[0].REMARK1;
		var strRemark2		= checkNullHd(arrReturnVal[0].REMARK2)? "": arrReturnVal[0].REMARK2;
		
		arrHtml.push("<div id='trData"+strDmNoSqPk+"' class='trData trDealerInfo' style='background-color:white;' onclick='trOnClick(\"trData"+strDmNoSqPk+"\","+strDmNoSqPk+");'>");
			arrHtml.push("<div class='tdTextCenter marginTop10px'>SCORES : "+ strScores +"</div>");
			arrHtml.push("<div class='tdTextCenter marginTop10px'>CANCEL CNT : "+ strCancelCnt +"</div>");
			arrHtml.push("<div class='tdTextCenter marginTop10px'>POINTS : "+ strPoint +"</div>");
			arrHtml.push("<div class='tdTextCenter marginTop10px'>FEEDBACK YN : "+ strFeedbackYn +"</div>");
			arrHtml.push("<div class='tdTextCenter marginTop10px'>"+ strRemark1 +"</div>");
			arrHtml.push("<div class='tdTextCenter marginTop10px'>"+ strRemark2 +"</div>");
		arrHtml.push("</div>");
		
		console.log(JSON.stringify(arrHtml));
		
		$("#modalBody").append(arrHtml.join(""));
		$("#ftLoading").hide();
		$("#btnDealerInfo").click();
	}
	
	function doUpdateData(strType){
		$("#ftLoading").show();
		var objData = {};
		var strUrl = "";
		objData["umNoSqPk"] = mIntUpdtDataNo;
		
		if(strType == "I") {
			if(!doCheckValidation()) {
				//alert("Check your data. (Save failed!)");
				$("#ftLoading").hide();
				return;
			}
			if(mStrInsStatus == "I"){
				strUrl = "/user/admin/insUserData.do";
				$("#inpPw").val($("#inpPw2").val());
			}
			else{
				strUrl = "/user/admin/updateUserData.do";
			}
			
			var arrKeyValue = ["userId","userPw","userName","userEmail","userBDay","userAuth","userLvl"];
			for(var intIndex = 0; intIndex<$(".inpData").length; intIndex++) {
				objData[arrKeyValue[intIndex]] = $(".inpData"+intIndex).val();
			}
		
		}
		else if(strType == "P") {
			var strUserPw = $("#inpPw").val();
			var strUserId = $("#inpId").val();
			
			if(checkNullHd(strUserPw)) {
				$("#inpPw").css("border","solid 1px red;");
				$("#ftLoading").hide();
				return;
			}
			objData["userId"] = strUserId;
			objData["userPw"] = strUserPw;
			
			strUrl = "/user/admin/updateUserPw.do";
		}
		else if(strType == "D") {
			strUrl = "/user/admin/deleteUserData.do";
		}
		
		$.ajax({
			type:"POST",
			url: strUrl,
			contentType:"application/json; charset=UTF-8",
			data: JSON.stringify(objData),
			dataType: "JSON",
			success: function(intReturnVal) {
				if(intReturnVal == 1) {
					alert("UPDATE COMPLETED!");
					
					if(strType == "P")	$(".modal").modal("hide");
					
					doSelectData();
				}
				else if(intReturnVal == 0) {
					alert("ERROR - USERLIST01");
				}
				$("#ftLoading").hide();
			}
		});
	}
	
	function trOnClick(strId, intDataNo) {
		if(mStrClickable == "Y") {
			$(".inpData").val("");
			mIntUpdtDataNo = intDataNo;
			$(".inpData").attr("readonly",false);
			$("#btnPw").attr("disabled",false);
			$("#inpId").attr("disabled",true);
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
		}
		else {
			alert("Save your data first.");
			return;
		}
		
	}
	
	function doInsertRow() {
		mStrClickable = "N";
		mStrInsStatus = "I";
		
		$("#"+mStrBeforeId).css("background-color",mStrBeforeBG);
		$(".inpData").attr("readonly",false);
		$("#inpId").attr("disabled",false);
		$(".inpData").val("");
		$("#inpAdd").hide();
		$("#btnPw").hide();
		$("#inpCancel").show();
		$("#inpSave").show();
		$("#inpPw2").show();
		
		$("#inpId").keyup(function(){
			$(".tdId").text($("#inpId").val());
		});
		$("#inpName").keyup(function(){
			$(".tdName").text($("#inpName").val());
		});
		$("#inpEmail").keyup(function(){
			$(".tdEmail").text($("#inpEmail").val());
		});
		$("#inpBDay").keyup(function(){
			$(".tdBDay").text($("#inpBDay").val());
		});
		$("#inpAuth").change(function(){
			$(".tdAuth").text($("#inpAuth option:checked").text());
		});
		$("#inpLvl").change(function(){
			$(".tdLvl").text($("#inpLvl option:checked").text());
		});
		$("#btnPw").attr("disabled",false);
		
		doInsertRowTr();
	}
	
	function doInsertRowTr() {
		var arrHtml = [];
		var strUserId = '<%=mStrUserId%>';
		arrHtml.push("<tr class='trData trAddData' style='background-color:#ffe7e7;'>");
			arrHtml.push("<td class='tdTextCenter tdId'></td>");
			arrHtml.push("<td class='tdTextCenter tdName'></td>");
			arrHtml.push("<td class='tdTextCenter tdEmail'></td>");
			arrHtml.push("<td class='tdTextCenter tdBDay'></td>");
			arrHtml.push("<td class='tdTextCenter tdAuth'></td>");
			arrHtml.push("<td class='tdTextCenter tdLvl'></td>");
			arrHtml.push("<td class='tdTextCenter tdUseYn'>Y</td>");
			arrHtml.push("<td class='tdTextCenter'>"+ strUserId +"</td>");
			arrHtml.push("<td class='tdTextCenter'></td>");
			arrHtml.push("<td class='tdTextCenter'></td>");
			arrHtml.push("<td class='tdTextCenter'></td>");
			arrHtml.push("<td class='tdTextCenter'></td>");
			arrHtml.push("<td class='tdTextCenter'></td>");
		arrHtml.push("</tr>");
	
		$("#tblUserList").prepend(arrHtml.join(""));
	}
	
	function doCancel(){
		mStrInsStatus = "";
		
		$(".trAddData").remove();
		$("#inpCancel").hide();
		$("#inpSave").hide();
		$("#inpPw2").hide();
		$("#inpAdd").show();
		$("#btnPw").show();
		
		$(".inpData").val("");
		$(".inpData").attr("readonly",true);
		
		mStrClickable = "Y";
	}

	function doCheckValidation(){
		var boolReturnVal = true;
		
		$(".required").each(function(){
			console.log($(this).val());
			if(checkNullHd($(this).val())) {
				alert("Check your required field(s).");
				boolReturnVal = false;
				return false;
			}
		});

		//update status not insert
		//password input is diffrent from update and insert
		if(mStrClickable == "N") {
			if(checkNullHd($(".requiredPw").val())) {
				alert("Check your required field(s).");
				boolReturnVal = false;
			}
		}

		return boolReturnVal;
	}
	
	$(document).ready(function(){
		//doCodeDetail("USER_RANK");
		doSelectData();
	});
</script>

<div id="content">
<div id="content-header">
  <div id="breadcrumb"> <a href="/main.do" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Manage Users</a> </div>
  <h1></h1>
</div>
<div class="container-fluid">
  <hr>
  <div class="row-fluid">
  	<div class="span12">
     	
		<form id="frmAdminArea" class="form-horizontal" method="post" action="#" name="basic_validate" id="basic_validate" novalidate="novalidate">
			<div id="divUserName" class="span4 control-group" style="border-top:1px solid #eeeeee !important;">
				<!-- <label class="control-label">Name</label>
				<div class="controls">
					<input type="text" name="required" id="inpUserName">
				</div> -->
			</div>
			<div class="control-group span4" style="border-top:1px solid #eeeeee !important;">
	             <!-- <label class="control-label">Date</label>
	             <div class="controls">
	               <input type="text" id="inpSDate" data-date="2013-01-02" data-date-format="yyyy-mm-dd" value="" class="datepicker span6">
	               <input type="text" id="inpEDate" data-date="2013-01-02" data-date-format="yyyy-mm-dd" value="" class="datepicker span6">
	             </div> -->
           </div>
			<div class="span3 control-group" style="border-top:1px solid #eeeeee !important; padding-left:20px; margin-top:10px;" align="right">
				<!-- <input type="button" class="btn" onclick="doSelectData();" value="Search"> -->
				<input id="inpAdd" type="button" class="btn" onclick="doInsertRow();" value="Add">
				<input id="inpCancel" type="button" class="btn btn-danger" onclick="doCancel();" value="Cancel" style="display:none;">
				<input type="button" class="btn" onclick="doUpdateData('I');" value="Save">
				<input type="button" class="btn" onclick="doUpdateData('D');" value="Delete">
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
          <h5>USER LIST</h5>
        </div>
        <div class="widget-content nopadding" style="overflow-x: auto;">
          <table class="table table-bordered">
	        <thead>
	            <tr>
	              <!-- <th>USER NO</th> -->
	              <th>ID</th>
	              <th style="display:none;">PW</th>
	              <th>NAME</th>
	              <th>EMAIL</th>
	              <th>B-DAY</th>
	              <th>AUTH</th>
     	          <th>LVL</th>
     	          <th>DEALER INFO</th>
	              <th>USE Y/N</th>
	              <th>REG ID</th>
	              <th>REG IP</th>
	              <th style="min-width:90px;">REG DATE</th>
	              <th style="min-width:">UPDT ID</th>
	              <th style="min-width:">UPDT IP</th>
	              <th style="min-width:90px;">UPDT DATE</th>
	            </tr>
	        </thead>
			<tbody id="tblUserList">
			
			</tbody>
          </table>
        </div>
      </div>
      <input id="btnMore" type="button" class="btn btn-large span12" onclick="doSelectData('M');" value="More">
    </div>
    <div class="span4">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>USER INFORMATION</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="#" method="get" class="form-horizontal">
            <div class="control-group">
              <label class="control-label"><span class="requiredFieldM9">*</span>ID :</label>
              <div class="controls">
                <input id="inpId" type="text" class="span11 required inpData inpData0" placeholder="ID" disabled maxlength="20"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"><span class="requiredFieldM9">*</span>PASSWORD :</label>
              <div class="controls">
              	<input id="inpPw2" type="password" class="span11 requiredPw inpData" placeholder="PASSWORD" maxlength="12" style="display:none;"/>
                <button id="btnPw" data-toggle="modal" data-target="#mdEditPassword"  class="span11 inpData" value="EDIT PASSWORD" style="margin-left:0px;" disabled>EDIT PASSWORD</button>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"><span class="requiredFieldM9">*</span>NAME :</label>
              <div class="controls">
                <input id="inpName" type="text" class="span11 required inpData inpData2" placeholder="NAME" maxlength="20"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">EMAIL :</label>
              <div class="controls">
                <input id="inpEmail" type="text"  class="span11 inpData inpData3" placeholder="EMAIL" maxlength="50"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">B-DAY :</label>
              <div class="controls">
                <input id="inpBDay" type="text"  class="span11 inpData inpData4" placeholder="B-DAY" maxlength="10"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"><span class="requiredFieldM9">*</span>AUTH :</label>
              <div class="controls">
              	<select id="inpAuth" class="span11 required inpData inpData5">
              		<option value="">AUTH</option>
					<c:forEach var = "idx" items="${commCodeList}">
						<c:set var="userAuth" value="${idx.MAST_NAME}" />
						<c:if test="${userAuth eq 'USER_AUTH'}">
							<option id="optAuth${idx.CODE}" value="${idx.CODE}"> ${idx.NAME}</option>
						</c:if>
					</c:forEach>
				</select>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"><span class="requiredFieldM9">*</span>LEVEL :</label>
              <div class="controls">
              	<select id="inpLvl" class="span11 required inpData inpData6">
              		<option value="">LEVEL</option>
					<c:forEach var = "idx" items="${commCodeList}">
						<c:set var="userLvl" value="${idx.MAST_NAME}" />
						<c:if test="${userLvl eq 'USER_LVL'}">
							<option id="optLvl${idx.CODE}" value="${idx.CODE}"> ${idx.NAME}</option>
						</c:if>
					</c:forEach>
				</select>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    
</div></div>
</div>

<!-- Modal -->
<div class="modal fade" id="mdEditPassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">EDIT PASSWORD</h5>
      </div>
      <div class="modal-body">
        <div class="control-group">
            <label class="control-label"><span class="requiredFieldM9">*</span>PASSWORD :</label>
            <div class="controls">
              <input id="inpPw" type="password"  class="span3 inpData inpData1" placeholder="PASSWORD" maxlength="12"/>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="doUpdateData('P')">Save</button>
      </div>
    </div>
  </div>
</div>

<button id="btnDealerInfo" data-toggle="modal" data-target="#mdDealerInfo"  class="span11 inpData" value="DEALER INFO" style="margin-left:0px; display:none;"></button>

<!-- Modal -->
<div class="modal fade" id="mdDealerInfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">DEALER INFO</h5>
      </div>
      <div id="modalBody" class="modal-body">
      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>