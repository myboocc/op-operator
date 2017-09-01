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
		<!-- 下拉框 -->
		<!--提示框-->
		<style type="text/css">
			.colorRed{color: #f60;font-size: 14px;}
	</style>
	</head>
<body>
<div class="container-fluid" id="main-container">
	<div id="page-content" class="clearfix">
	  <div class="row-fluid">
	     <form action="pricing/${pricingLabel.id == null?'addPricingLabel':'editPricingLabel' }" method="post" id="pricingLabelForm" class="form-horizontal" role="form">
	     	<input type="hidden" name="id" id="pricingLabelId" value="${pricingLabel.id }"/>
			<div class="formWrapper form-horizontal">
				<div class="formItem">
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>标签名称</label>
					    <input type="text" name="title" class="form-control" id="title" placeholder="">
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
		console.log('comming in');
		if($("#title").val()=="" || $("#title").val().trim() == ""){
			$("#title").tips({
				side:3,
	            msg:'请输入标签名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#title").focus();
			return false;
		}
		$.ajax({
			type: "POST",
			url: '<%=basePath%>'+$("#pricingLabelForm").attr("action"),
	    	data: $("#pricingLabelForm").serialize(),
			cache: false,
			success: function(data){
			 if(0 == data.status){
				window.location.href = "<%=basePath%>pricing/labelList";
			 }else{
				alert(data.msg);
			 }
			}
		
		});
	}
	
	
</script>
</html>