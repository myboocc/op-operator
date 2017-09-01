<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<%@ include file="../system/admin/top.jsp"%>
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- 下拉框 -->
		<!--提示框-->
		<link rel="stylesheet" href="static/css/timepicker/main.css" />
		<link rel="stylesheet" href="static/css/timepicker/jquery-ui.css" />
		<link rel="stylesheet" href="static/css/provider/provider.css" />
	</head>
<body>
	<form action="provider/${provider.id == null?'addProvider':'editProvider' }" method="post" id="providerForm" class="form-horizontal" role="form">
     	<input type="hidden" name="id" id="providerId" value="${provider.id }"/>
		<div class="form-group">
			<label class="col-sm-1 text-left control-label">供应商名称</label>
			<div class="col-sm-11">
				<input class="form-control text-danger" id="name" name="name" type="text" value="${provider.name }">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label text-left">供应商地址</label>
			<div class="col-sm-11">
				<input class="form-control text-danger" type="text" id="address" name="address" value="${provider.address }">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label text-left">紧急联系人</label>
			<div class="col-sm-11">
				<input class="form-control text-danger" type="text" id="urgentContact" name="urgentContact" value="${provider.urgentContact }">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label text-left">固定电话</label>
			<div class="col-sm-11">
				<input class="form-control text-danger" onblur="checkPhone(this.value,this.id)" id="telephone" type="text" name="telephone" value="${provider.telephone }">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label text-left">紧急联系号码</label>
			<div class="col-sm-11">
				<input class="form-control text-danger" onblur="checkPhone(this.value,this.id)" id="augentPhone" type="text" name="augentPhone" value="${provider.augentPhone }">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label text-left">货币结算类型</label>
			<div class="col-sm-11">
				<input class="form-control text-danger" id="moneySettlementType" type="text" name="moneySettlementType" value="${provider.moneySettlementType }">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label text-left">供应商时区</label>
			<div class="col-sm-11">
				<select name="providerTimeZone" id="providerTimeZone" class="form-control">
					<option <c:if test="${'UTC' eq provider.providerTimeZone}">selected</c:if> value="UTC">UTC 7.5°W~7.5°E</option>
					<option <c:if test="${'UTC+1' eq provider.providerTimeZone}">selected</c:if> value="UTC+1">UTC 7.5°E~22.5°E</option>
					<option <c:if test="${'UTC+2' eq provider.providerTimeZone}">selected</c:if> value="UTC+2">UTC 22.5°E~37.5°E</option>
					<option <c:if test="${'UTC+3' eq provider.providerTimeZone}">selected</c:if> value="UTC+3">UTC 37.5°E~52.5°E</option>
					<option <c:if test="${'UTC+4' eq provider.providerTimeZone}">selected</c:if> value="UTC+4">UTC 52.5°E~67.5°E</option>
					<option <c:if test="${'UTC+5' eq provider.providerTimeZone}">selected</c:if> value="UTC+5">UTC 67.5°E~82.5°E</option>
					<option <c:if test="${'UTC+6' eq provider.providerTimeZone}">selected</c:if> value="UTC+6">UTC 82.5°E~97.5°E</option>
					<option <c:if test="${'UTC+7' eq provider.providerTimeZone}">selected</c:if> value="UTC+7">UTC 97.5°E~112.5°E</option>
					<option <c:if test="${'UTC+8' eq provider.providerTimeZone}">selected</c:if> value="UTC+8">UTC 112.5°E~127.5°E</option>
					<option <c:if test="${'UTC+9' eq provider.providerTimeZone}">selected</c:if> value="UTC+9">UTC 127.5°E~142.5°E</option>
					<option <c:if test="${'UTC+10' eq provider.providerTimeZone}">selected</c:if> value="UTC+10">UTC 142.5°E~157.5°E</option>
					<option <c:if test="${'UTC+11' eq provider.providerTimeZone}">selected</c:if> value="UTC+11">UTC 157.5°E~172.5°E</option>
					
					<option <c:if test="${'UTC-11' eq provider.providerTimeZone}">selected</c:if> value="UTC-11">UTC 172.5°W~157.5°W</option>
					<option <c:if test="${'UTC-10' eq provider.providerTimeZone}">selected</c:if> value="UTC+10" value="UTC-10">UTC 157.5°W~142.5°W</option>
					<option <c:if test="${'UTC-9' eq provider.providerTimeZone}">selected</c:if> value="UTC-9">UTC 142.5°W~127.5°W</option>
					<option <c:if test="${'UTC-8' eq provider.providerTimeZone}">selected</c:if> value="UTC-8">UTC 127.5°W~112.5°W</option>
					<option <c:if test="${'UTC-7' eq provider.providerTimeZone}">selected</c:if> value="UTC-7">UTC 112.5°W~97.5°W</option>
					<option <c:if test="${'UTC-6' eq provider.providerTimeZone}">selected</c:if> value="UTC-6">UTC 97.5°W~82.5°W</option>
					<option <c:if test="${'UTC-5' eq provider.providerTimeZone}">selected</c:if> value="UTC-5">UTC 82.5°W~67.5°W</option>
					<option <c:if test="${'UTC-4' eq provider.providerTimeZone}">selected</c:if> value="UTC-4">UTC 67.5°W~52.5°W</option>
					<option <c:if test="${'UTC-3' eq provider.providerTimeZone}">selected</c:if> value="UTC-3">UTC 52.5°W~37.5°W</option>
					<option <c:if test="${'UTC-2' eq provider.providerTimeZone}">selected</c:if> value="UTC-2">UTC 37.5°W~22.5°W</option>
					<option <c:if test="${'UTC-1' eq provider.providerTimeZone}">selected</c:if> value="UTC-1">UTC 22.5°W~7.5°W</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label text-left">office号</label>
			<div class="col-sm-11">
				<input class="form-control text-danger" onblur="checkOfficeNum()" id="officeNumber" type="text" name="officeNumber" value="${provider.officeNumber }" <c:if test="${provider.officeNumber != null}">readonly='readonly'</c:if> >
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label text-left">出票联系人</label>
			<div class="col-sm-11">
				<input class="form-control text-danger" id="ticketContact" type="text" name="ticketContact" value="${provider.ticketContact }">
			</div>
		</div><div class="form-group">
			<label class="col-sm-1 control-label text-left">结算联系人</label>
			<div class="col-sm-11">
				<input class="form-control text-danger" id="settlementContact" type="text" name="settlementContact" value="${provider.settlementContact }">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label text-left">工作开始时间</label>
			<div class="col-sm-11">
				<input class="form-control text-danger " id="workStartTime" readonly="readonly" type="text" name="workStartTime" value="${provider.workStartTime }">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label text-left">工作结束时间</label>
			<div class="col-sm-11">
				<input class="form-control text-danger "  id="workEndTime" readonly="readonly" type="text" name="workEndTime" value="${provider.workEndTime }">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label text-left">是否授权自动出票</label>
			<div class="col-sm-11">
				<select name="isAuthorize" class="form-control">
					<option <c:if test="${true eq provider.isAuthorizePrintTicket}">selected</c:if> value="true">是</option>
					<option <c:if test="${false eq provider.isAuthorizePrintTicket}">selected</c:if> value="false">否</option>
				</select>
			</div>
		</div>
		<!-- <div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
				<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
			</div>
		</div> -->

		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	</form>

	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/timepicker/jquery-ui.js"></script>
	<script type="text/javascript" src="static/js/timepicker/jquery-ui-slide.min.js"></script>
	<script type="text/javascript" src="static/js/timepicker/jquery-ui-timepicker-addon.js"></script>
	
</body>
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		//日期框
		function DateTimePicker(beginSelector,endSelector){
			$(beginSelector).timepicker({
			   hourGrid: 4,
			   minuteGrid: 10
		    });
			$(endSelector).timepicker({
			   hourGrid: 4,
			   minuteGrid: 10
		    }).on('changeTime.timepicker', function(e) {
		        console.log('The time is ' + e.time.value);
		        console.log('The hour is ' + e.time.hour);
		        console.log('The minute is ' + e.time.minute);
		        console.log('The meridian is ' + e.time.meridian);
		      });
		}
		DateTimePicker("#workStartTime","#workEndTime");
	});
	
	function checkEndTime(){
	    var startTime=$("#workStartTime").val();  
	    var endTime=$("#workEndTime").val();  
	    var start = startTime.split(":");
	    var end = endTime.split(":");
	    /* console.log(start);
	    console.log(end);
	    console.log(end - start); */
	    if(end <= start){
	    	$("#workEndTime").tips({
				side:3,
	            msg:'结束时间必须晚于开始时间！',
	            bg:'#AE81FF',
	            time:2
	        });
	        return false;
	    } 
	    return true;
	}  
	
	//检查office号是否存在
	function checkOfficeNum(){
		var officeNum = $("#officeNumber");
		if(officeNum.val() == "" || officeNum.val().trim() == ""){
			$(officeNum).tips({
				side:3,
	            msg:'请输入office号',
	            bg:'#AE81FF',
	            time:2
	        });
			$(officeNum).focus();
			return false;
		}
		//异步校验
		$.ajax({
			type: "POST",
			url: '<%=basePath%>provider/checkOfficeNum',
	    	data: {"officeNum":officeNum.val()},
			cache: false,
			success: function(data){
				if(0 == data.status){
					$(officeNum).tips({
						side:3,
			            msg: data.msg,
			            bg:'#AE81FF',
			            time:2
			        });
				}else if(1 == data.status){
					$(officeNum).tips({
						side:3,
			            msg: data.msg,
			            bg:'#AE81FF',
			            time:2
			        });
				}
			}
		});
	}
	//校验电话
	function checkPhone(phone,text){
		console.log(phone);
		console.log(text);
		if(isNaN(phone)){
			console.log("格式不正确");	
			$("#"+text).tips({
				side:3,
	            msg:'格式不正确',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#"+text).focus();
			return false;
		}
		return true;
	}
	//保存
	function save(){
		if($("#name").val()=="" || $("#name").val().trim() == ""){
			$("#name").tips({
				side:3,
	            msg:'输入供应商名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#name").focus();
			$("#name").val('');
			$("#name").css("background-color","white");
			return false;
		}else{
			$("#name").val(jQuery.trim($('#name').val()));
		}
		if($("#address").val()=="" || $("#address").val().trim() == ""){
			$("#address").tips({
				side:3,
	            msg:'输入供应商地址',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#address").focus();
			return false;
		}
		if($("#urgentContact").val()=="" || $("#urgentContact").val().trim() == ""){
			$("#urgentContact").tips({
				side:3,
	            msg:'请输入紧急联系人',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#urgentContact").focus();
			return false;
		}
		if($("#telephone").val()=="" || $("#telephone").val().trim() == ""){
			$("#telephone").tips({
				side:3,
	            msg:'输入固定电话',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#telephone").focus();
			return false;
		}
		if($("#augentPhone").val()=="" || $("#augentPhone").val().trim() == ""){
			$("#augentPhone").tips({
				side:3,
	            msg:'输入紧急联系号码',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#augentPhone").focus();
			return false;
		}
		if($("#moneySettlementType").val()=="" || $("#moneySettlementType").val().trim() == ""){
			$("#moneySettlementType").tips({
				side:3,
	            msg:'输入货币结算类型',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#moneySettlementType").focus();
			return false;
		}
		if($("#providerTimeZone").val()=="" || $("#providerTimeZone").val().trim() == ""){
			$("#providerTimeZone").tips({
				side:3,
	            msg:'输入供应商时区',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#providerTimeZone").focus();
			return false;
		}
		if($("#officeNumber").val()=="" || $("#officeNumber").val().trim() == ""){
			$("#officeNumber").tips({
				side:3,
	            msg:'输入office号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#officeNumber").focus();
			return false;
		}
		if($("#ticketContact").val()=="" || $("#ticketContact").val().trim() == ""){
			$("#ticketContact").tips({
				side:3,
	            msg:'输入出票联系人',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ticketContact").focus();
			return false;
		}
		if($("#settlementContact").val()=="" || $("#settlementContact").val().trim() == ""){
			$("#settlementContact").tips({
				side:3,
	            msg:'输入结算联系人',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#settlementContact").focus();
			return false;
		}
		if($("#workStartTime").val()=="" || $("#workStartTime").val().trim() == ""){
			$("#workStartTime").tips({
				side:3,
	            msg:'输入工作开始时间',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#workStartTime").focus();
			return false;
		}
		if($("#workEndTime").val()=="" || $("#workEndTime").val().trim() == ""){
			$("#workEndTime").tips({
				side:3,
	            msg:'输入工作结束时间',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#workEndTime").focus();
			return false;
		}
		if(checkEndTime()){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>'+$("#providerForm").attr("action"),
		    	data: $("#providerForm").serialize(),
				cache: false,
				success: function(data){
					 if(0 == data.status){
						window.location.href = "<%=basePath%>provider/list";
					 }else{
						alert(data.msg);
					 }
				}
			});
		}else{return false;}
		
	}
	
	
</script>
</html>