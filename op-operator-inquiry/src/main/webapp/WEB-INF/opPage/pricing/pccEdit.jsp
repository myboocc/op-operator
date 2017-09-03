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
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<style type="text/css">
			.colorRed{color: #f60;font-size: 14px;}
	</style>
	</head>
<body>
<div class="container-fluid" id="main-container">
	<div id="page-content" class="clearfix">
	  <div class="row-fluid">
	     <form action="pricing/${pcc.id == null?'addPcc':'editPcc' }" method="post" id="pccForm" class="form-horizontal" role="form">
	     	<input type="hidden" name="id" id="pricingId" value="${pricing.id }"/>
			<div class="formWrapper form-horizontal">
				<div class="formItem">
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>PCC</label>
					    <input type="text" name="office" class="form-control" id="officeNum" placeholder="请输入PCC">
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>供应商</label>
					    <input type="text" name="provider" class="form-control" id="provider" placeholder="请输入供应商">
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">备注</label>
					    <textarea class="form-control" name="remark" rows="3" cols="25" style="width: 300px;"></textarea>
					</div>
				</div>
			</div>
			
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
			
			</form>
		</div>
	</div>
</div>

	
</body>
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		
	});
	
	//返回
	function back() {
		window.history.go(-1);
	}
	//保存
	function save(){
		console.log('进入了。。。');
		if(checkPccFrom()){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>'+$("#pccForm").attr("action"),
		    	data: $("#pccForm").serialize(),
				cache: false,
				success: function(data){
					 if(0 == data.status){
						window.location.href = "<%=basePath%>pricing/pccList";
					 }else{
						alert(data.msg);
					 }
				}
			});
		}
	}
	
	function checkPccFrom(){
		var officeNum = $("#officeNum");
		var provider = $("#provider");
		if(officeNum.val() == "" || officeNum.val().trim() == ""){
			officeNum.tips({
				side:3,
	            msg:'请输入office号',
	            bg:'#AE81FF',
	            time:3
	        });
			officeNum.focus();
			return false;
		}
		if(provider.val() == "" || provider.val().trim() == ""){
			provider.tips({
				side:3,
	            msg:'请输入供应商',
	            bg:'#AE81FF',
	            time:3
	        });
			provider.focus();
			return false;
		}
		return true;
	}
	
	
</script>
</html>