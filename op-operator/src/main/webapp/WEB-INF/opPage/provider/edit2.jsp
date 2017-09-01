<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<form
					action="provider/${provider.id == null?'addProvider':'editProvider' }"
					method="post" id="providerForm" class="form-horizontal" role="form">
					<input type="hidden" name="id" id="providerId"
						value="${provider.id }" />
					<div class="titleWrapper clearfix">
						<div class="title">供应商信息</div>
						<button class="btn btn-mini btn-primary" onclick="back();">返回</button>
					</div>
					<div class="formWrapper form-horizontal">
						<div class="formLeft" style="flex: 1;">
							<div class="form-group">
								<label for="airline"
									class="control-label lableWidth100 marginRight10"><i
									class="colorRed">*</i>供应商名称</label> <input type="text"
									class="form-control" id="" name="name" required placeholder="">
							</div>
							<div class="form-group">
								<label for="provider"
									class="control-label lableWidth100 marginRight10"><i
									class="colorRed">*</i>工作时区</label>
								<%@ include file="template/timeZoneTemplate.jspf"%>
							</div>
						</div>
						<div class="formMiddle" style="flex: 1;">
							<div class="form-group">
								<label for="fitAirline"
									class="control-label lableWidth100 marginRight10">供应商销售区域</label>
								<select id="" name="sellArea" class="form-control">
									<option value="CHINA">中国大陆</option>
									<option value="HONGKONG">中国香港</option>
									<option value="MACAU">中国澳门</option>
									<option value="TAIWAN">台湾</option>
									<option value="SINGAPORE">新加坡</option>
								</select>
							</div>
						</div>
						<div class="formRight" style="flex: 1;">
							<div class="form-group">
								<label for="airline"
									class="control-label lableWidth100 marginRight10"><i
									class="colorRed">*</i>出票效率</label> <input
									class="form-control text-danger span1 workStartTime" id=""
									readonly="readonly" type="text" name="efficiency" value="">
							</div>
						</div>
					</div>

					<div class="titleWrapper clearfix">
						<div class="title">联系人</div>
					</div>
					<div class="formWrapper form-horizontal"
						v-for="(contact, index) in contacts">
						<div class="formLeft" style="flex: 1;">
							<!-- <div class="form-group">
								<label class="control-label lableWidth100 marginRight10"><i
									class="colorRed">*</i>对接业务</label> <select id=""
									:name="_initName('contacts', index, 'dockingBusiness')"
									class="form-control">
									<option value="AIRLINE_BACK_UPDATE">航司后返更新</option>
									<option value="PRICE_UPDATE">价单更新</option>
									<option value="FINANCE_ISSUE">财务问题</option>
									<option value="TECH_SUPPORT">技术支持</option>
									<option value="OTHER">其他事项</option>
								</select>
							</div> 
							<div class="form-group">
								<label class="control-label lableWidth100 marginRight10"><i
									class="colorRed">*</i>邮箱</label> <input type="text"
									class="form-control" id=""
									:name="_initName('contacts', index, 'email')" required
									placeholder="">
							</div>
						</div>-->
						<div class="formMiddle" style="flex: 1;">
							<div class="form-group">
								<label for="fitAirline"
									class="control-label lableWidth100 marginRight10">中文名</label> <input
									type="text" class="form-control" ref="chineseName" id=""
									:name="_initName('contacts', index, 'chineseName',contact)" required
									placeholder="">
							</div>
							<div class="form-group">
								<label for="fitAirline"
									class="control-label lableWidth100 marginRight10">QQ</label> <input
									type="text" class="form-control" id=""
									:name="_initName('contacts', index, 'qq')" required
									placeholder="">
							</div>
						</div>
						<div class="formRight" style="flex: 1;">
							<div class="form-group">
								<label class="control-label lableWidth100 marginRight10">英文名</label>
								<input type="text" class="form-control" id=""
									:name="_initName('contacts', index, 'englishName')" required
									placeholder="">
							</div>
							<div class="form-group">
								<label class="control-label lableWidth100 marginRight10">电话</label>
								<input type="text" class="form-control" id=""
									:name="_initName('contacts', index, 'telephone')" required
									placeholder="">
							</div>
						</div>
						<div class="addPCCBtn" style="flex: 0 0 50px;">
							<button type="button"
								class="btn btn-mini btn-primary timeGroupBtn"
								@click="index === 0?_addContact():_delete(contact, 'contact', index)">{{index === 0?'新增':'删除'}}</button>
						</div>
					</div>

					<div class="titleWrapper clearfix">
						<div class="title">供应商PCC信息</div>
					</div>
					<div class="pccInfoWrapper">
						<div class="pccInfo" style="flex: 1;">
							<div class="formWrapper form-horizontal">
								<div class="formLeft" style="flex: 1;">
									<div class="form-group">
										<label class="control-label lableWidth100 marginRight10"><i
											class="colorRed">*</i>查询及预订PCC</label> <input type="text"
											class="form-control" id="" name="" required placeholder="">
									</div>
									<div class="form-group">
										<label class="control-label lableWidth100 marginRight10"><i
											class="colorRed">*</i>AccountCode</label> <input type="text"
											class="form-control" id="" name="" required placeholder="">
									</div>
								</div>
								<div class="formMiddle" style="flex: 1;">
									<div class="form-group">
										<label for="fitAirline"
											class="control-label lableWidth100 marginRight10">GDS</label>
										<select id="" name="" class="form-control">
											<option value="0">1A(Amadues)</option>
											<option value="1">1E(Travelsky)</option>
											<option value="1">1G(Galileo)</option>
										</select>
									</div>
								</div>
								<div class="formRight" style="flex: 1;">
									<div class="form-group">
										<label class="control-label lableWidth100 marginRight10">结算货币</label>
										<select id="" name="" class="form-control">
											<option value="0">HKD</option>
											<option value="1">CNY</option>
											<option value="1">USD</option>
										</select>
									</div>
								</div>
							</div>
							<!-- 出票PCC -->
							<div class="formWrapper form-horizontal">
								<div class="formLeft" style="flex: 1;">
									<div class="form-group">
										<label class="control-label lableWidth100 marginRight10"><i
											class="colorRed">*</i>出票PCC</label> <input type="text"
											class="form-control" id="" name="" required placeholder="">
									</div>
									<div class="form-group">
										<label
											class="control-label lableWidth100 marginRight10 paddingTop0">
											<select id="" name="" class="form-control span12">
												<option value="0">Q信箱地址</option>
												<option value="1">电子邮件地址</option>
										</select>
										</label> <input type="text" class="form-control" id="" name=""
											required placeholder="">
									</div>
								</div>
								<div class="formMiddle" style="flex: 1;">
									<div class="form-group">
										<label for="fitAirline"
											class="control-label lableWidth100 marginRight10">GDS</label>
										<select id="" name="" class="form-control">
											<option value="0">1A(Amadues)</option>
											<option value="1">1E(Travelsky)</option>
											<option value="1">1G(Galileo)</option>
										</select>
									</div>
									<div class="form-group">
										<label for="fitAirline"
											class="control-label lableWidth100 marginRight10">电子邮件模板</label>
										<select id="" name="" class="form-control">
											<option value="0">南华Amadues出票邮件模板</option>
											<option value="1">南华Galileo出票邮件模板</option>
										</select>
									</div>
								</div>
								<div class="formRight" style="flex: 1;">
									<div class="form-group">
										<label class="control-label lableWidth100 marginRight10">结算货币</label>
										<select id="" name="" class="form-control">
											<option value="0">HKD</option>
											<option value="1">CNY</option>
											<option value="1">USD</option>
										</select>
									</div>
									<div class="addPCCBtn">
										<button class="btn btn-mini btn-primary">新增出票PCC</button>
									</div>
								</div>
							</div>
						</div>
						<div class="addGDSBtn">
							<button class="btn btn-mini btn-primary">新增GDS</button>
						</div>
					</div>

					<div class="titleWrapper clearfix">
						<div class="title">供应商工作时间</div>
					</div>
					<div class="formWrapper form-horizontal">
						<div class="formItem marginLeft20">
							<div class="form-group">
								<h4 class="" style="float: none;">出票</h4>
								<%@ include file="template/workTimeTemplate.jspf"%>
							</div>
							<div class="form-group">
								<h4 class="" style="float: none;">退票</h4>
								<%@ include file="template/workTimeTemplate.jspf"%>
							</div>
							<div class="form-group">
								<h4 class="" style="float: none;">改签</h4>
								<%@ include file="template/workTimeTemplate.jspf"%>
							</div>
						</div>
					</div>

					<div class="titleWrapper clearfix">
						<div class="title">节假日模板选择</div>
					</div>
					<div class="formWrapper form-horizontal">
						<div class="formItem" style="flex: 1;">
							<div class="form-group">
								<label class="control-label lableWidth100 marginRight10"><i
									class="colorRed">*</i>模板名称</label> <select id="" name=""
									class="form-control">
									<c:forEach var="value" items="${holidayTemplateList}">
										<option value="${value.id}">${value.name}</option>
									</c:forEach>
									<!-- <option value="0">香港节假日模板</option>
									<option value="1">新加坡节假日模板</option> -->
								</select>
							</div>
						</div>
					</div>

					<div class="form-group btnGroup">
						<div class="col-sm-offset-4 col-sm-8">
							<input class="btn btn-danger marginRight20 submit" type="submit"
								value="提交"> <a class="btn btn-primary" onclick="back();">返回</a>
						</div>
					</div>

					<div id="zhongxin2" class="center" style="display: none">
						<br />
						<br />
						<br />
						<br />
						<img src="static/images/jiazai.gif" /><br />
						<h4 class="lighter block green"></h4>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/timepicker/jquery-ui.js"></script>
	<script type="text/javascript"
		src="static/js/timepicker/jquery-ui-slide.min.js"></script>
	<script type="text/javascript"
		src="static/js/timepicker/jquery-ui-timepicker-addon.js"></script>

</body>
<script type="text/javascript">
	$(top.hangge());
	
	var vm = new Vue({
		el: '#page-content',
		data: {
			contacts: [{"cont":1}],
    		dateConfigs: []
	  	},
	  	methods: {
	  		_initName(preName, index, name) {
	  			//return preName + "["+ index + "]." + name;
	  			return preName + "["+ index + "]." + name;
	  		},
	  		_addContact() {
	  			let obj = {"cont": this.contacts.length +1};
	  			this.contacts.push(obj);
	  			console.log(this.contacts);
	  		},
	  		_delete(obj, type, index) {
	  			if("contact" === type){
	  				let chineseNameTmp = this.$refs.chineseName[index].value; 
	  				console.log("chineseNameTmp ==> " + chineseNameTmp);
	  				console.log(obj);
	  				console.log(this.contacts.remove(obj));
	  				console.log(this.contacts);
	  			}
	  		}
	  	}
	});
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
		DateTimePicker(".workStartTime",".workEndTime");
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