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
		<%@ include file="template/timeTemplate.jspf"%>
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
				<form action="holidayTemplate/${holidayTemplate.id == null?'addHolidayTemplate':'editHolidayTemplate' }" method="post" ref="holidayForm" id="" class="form-horizontal" role="form">
					<input type="hidden" name="id" id="holidayTemplate" value="${holidayTemplate.id }"/>
					<div class="titleWrapper clearfix">
						<div class="title">模板信息</div>
						<button class="btn btn-mini btn-primary" onclick="back();">返回</button>
					</div>
					<div class="formWrapper form-horizontal">
						<div class="formLeft" style="flex:1;">
							<div class="form-group">
								<label for="airline" class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>模板名称</label> 
								<input type="text" class="form-control" id="templateName" ref="templateName" name="name" placeholder="">
							</div>
						</div>
					</div>
					
					<div class="titleWrapper clearfix">
						<div class="title">星期配置</div>
					</div>
					<div class="formWrapper form-horizontal">
						<div class="formLeft" style="flex:0 0 400px;">
							<div class="form-group">
								<label class="control-label lableWidth100 marginRight10">节日名</label> 
								<input type="text" class="form-control" ref="weekName" id="weekName" name="" required placeholder="">
							</div>
						</div>
						<div class="formMiddle" style="flex:0 0 550px;">
							<div class="form-group">
								<label for="fitAirline" class="control-label lableWidth100 marginRight10">每年</label>
								<month ref="weekMonth"></month>
								<span>的第</span>
								<number-week ref="weekNumber"></number-week>
								<span>个</span>
								<week ref="week"></week>
								<span>及后续</span>
								<afterday ref="weekAfterDay"></afterday>
								<span>天</span>
							</div>
						</div>
						<div class="formRight" style="flex:0 0 80px;">
							<div class="addPCCBtn">
								<button type="button" class="btn btn-mini btn-primary" @click="_addWeekConfig">添加</button>
							</div>
						</div>
					</div>
					
					<table id="table_report" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>节日名</th>
								<th>月份</th>
								<th>星期序数</th>
								<th>星期天数</th>
								<th>后续持续天数</th>
								<th class="center">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(weekConfig,index) in weekConfigs" v-show="weekConfigs.length > 0">
								<td><a>{{weekConfig.name }}</a></td>
								<td>{{weekConfig.month}}</td>
								<td>{{weekConfig.number}}</td>
								<td>{{weekConfig.weekText}}</td>
								<td>{{weekConfig.weekAfterDay}}</td>
								<td style="width: 60px;">
									<div class='hidden-phone visible-desktop btn-group'>
										<a class='btn btn-mini btn-info' title="删除" @click="_delete(weekConfig, 'week')">删除</a>
									</div>
								</td>
								<input type="hidden" :name="_initName('weekends',index,'name')" v-bind:value="weekConfig.name" />
								<input type="hidden" :name="_initName('weekends',index,'month')" v-bind:value="weekConfig.month" />
								<input type="hidden" :name="_initName('weekends',index,'number')" v-bind:value="weekConfig.number" />
								<input type="hidden" :name="_initName('weekends',index,'week')" v-bind:value="weekConfig.week" />
								<input type="hidden" :name="_initName('weekends',index,'afterDay')" v-bind:value="weekConfig.weekAfterDay" />
							</tr>
							<tr class="main_info" v-show="weekConfigs.length === 0">
								<td colspan="10" class="center">没有相关数据</td>
							</tr>
						</tbody>
					</table>
					
					<div class="titleWrapper clearfix">
						<div class="title">日期配置</div>
					</div>
					<div class="formWrapper form-horizontal">
						<div class="formLeft" style="flex:0 0 400px;">
							<div class="form-group">
								<label class="control-label lableWidth100 marginRight10">节日名</label> 
								<input type="text" class="form-control" ref="dateName" id="dateName" name="" required placeholder="">
							</div>
						</div>
						<div class="formMiddle" style="flex:0 0 550px;">
							<div class="form-group">
								<label for="fitAirline" class="control-label lableWidth100 marginRight10">每年</label>
								<month ref="dateMonth"></month>
								<day ref="dateDay"></day>
								<span>日及后续</span>
								<afterday ref="dateAfterDay"></afterday>
								<span>天</span>
							</div>
						</div>
						<div class="formRight" style="flex:0 0 80px;">
							<div class="addPCCBtn">
								<button type="button" class="btn btn-mini btn-primary" @click="_addDateConfig">添加</button>
							</div>
						</div>
					</div>
					
					<table id="table_report" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>节日名</th>
								<th>月份</th>
								<th>日期</th>
								<th>后续持续天数</th>
								<th class="center">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(dateConfig,index) in dateConfigs" v-show="dateConfigs.length > 0">
								<td><a>{{dateConfig.name }}</a></td>
								<td>{{dateConfig.dateMonthText}}</td>
								<td>{{dateConfig.day}}</td>
								<td>{{dateConfig.afterDay}}</td>
								<td style="width: 60px;">
									<div class='hidden-phone visible-desktop btn-group'>
										<a class='btn btn-mini btn-info' title="删除" @click="_delete(dateConfig, 'date')">删除</a>
									</div>
								</td>
								<input type="hidden" :name="_initName('dates',index,'name')" v-bind:value="dateConfig.name" />
								<input type="hidden" :name="_initName('dates',index,'month')" v-bind:value="dateConfig.month" />
								<input type="hidden" :name="_initName('dates',index,'day')" v-bind:value="dateConfig.day" />
								<input type="hidden" :name="_initName('dates',index,'afterDay')" v-bind:value="dateConfig.afterDay" />
							</tr>
							<tr class="main_info" v-show="dateConfigs.length === 0">
								<td colspan="10" class="center">没有相关数据</td>
							</tr>
						</tbody>
					</table>
					
					<div class="form-group btnGroup">
						<div class="col-sm-offset-4 col-sm-8">
							<input class="btn btn-danger marginRight20 submit" type="button" @click="_submit" value="提交">
							<a class="btn btn-primary" onclick="back();">返回</a>
						</div>
					</div>
					
					<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
					
				</form>
			</div>
		</div>
	</div>

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
	});
	
	Vue.component('month', {
		props: ['name'],
		template: '#month-template'
	})
	Vue.component('numberWeek', {
		props: ['name'],
		template: '#number-week-template'
	})
	Vue.component('week', {
		props: ['name'],
		template: '#week-template'
	})
	Vue.component('afterday', {
		props: ['name'],
		template: '#afterday-template'
	})
	Vue.component('day', {
		props: ['name'],
		template: '#day-template'
	})
	
	var vm = new Vue({
		el: '#page-content',
		data: {
    		weekConfigs: [],
    		dateConfigs: []
	  	},
	  	methods: {
	  		_addWeekConfig() {
	  			let weekNameTmp = this.$refs.weekName.value;
	  			if(weekNameTmp.trim() === ""){
	  		        this.showTips('#weekName', '请输入节日名');
	  		        return ;
	  			}
	  			let weekConfig = {};
	  			weekConfig.name = weekNameTmp;
	  			weekConfig.month = this.$refs.weekMonth.$el.value;
	  			weekConfig.number = this.$refs.weekNumber.$el.value;
	  			weekConfig.week = this.$refs.week.$el.value;
	  			weekConfig.weekText = this.$refs.week.$el.options[this.$refs.week.$el.selectedIndex].text;
	  			weekConfig.weekAfterDay = this.$refs.weekAfterDay.$el.value;
	  			this.weekConfigs.push(weekConfig);
	  		},
	  		_addDateConfig() {
	  			let dateNameTmp = this.$refs.dateName.value;
	  			if(dateNameTmp.trim() === ""){
	  		        this.showTips('#dateName', '请输入节日名');
	  		        return ;
	  			}
	  			let dateConfig = {};
	  			dateConfig.name = dateNameTmp;
	  			dateConfig.month = this.$refs.dateMonth.$el.value;
	  			dateConfig.dateMonthText = this.$refs.dateMonth.$el.options[this.$refs.dateMonth.$el.selectedIndex].text;
	  			dateConfig.day = this.$refs.dateDay.$el.value;
	  			dateConfig.afterDay = this.$refs.dateAfterDay.$el.value;
	  			this.dateConfigs.push(dateConfig);
	  		},
	  		_delete(obj, type) {
	  			if("week" === type){
	  				console.log(obj);
	  				this.weekConfigs.remove(obj);
	  				console.log(this.weekConfigs);
	  			}else if("date" === type){
	  				this.dateConfigs.remove(obj);
	  			}
	  		},
	  		_initName(preName, index, name) {
	  			return preName + "["+ index + "]." + name;
	  		},
	  		_submit() {
	  			let nameTmp = this.$refs.templateName.value;
	  			if(nameTmp.trim() === ""){
	  		        this.showTips('#templateName', '请输入模板名称');
	  		        return ;
	  			}
	  			if(this.weekConfigs.length === 0 || this.dateConfigs.length === 0){
	  				window.alert('请设置星期配置 或 日期配置');
	  				return ;
	  			}
	  			this.$refs.holidayForm.submit();
	  		},
	  		showTips(el, msg) {
	  			$(el).tips({
  					side:3,
  		            msg: msg,
  		            bg:'#AE81FF',
  		            time:2
  		        });
	  		}
	  	}
	});
	
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