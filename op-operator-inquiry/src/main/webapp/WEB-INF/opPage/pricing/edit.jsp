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
		
		<link rel="stylesheet" href="static/css/comboselect.css" type="text/css">
		
		<script type="text/javascript" src="static/js/comboselect.min.js"></script>
		<script type="text/javascript" src="static/js/b.comboselect.js"></script>
		<link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="static/css/pricing/pricing.css">
	</head>
<body>
<div class="container-fluid" id="main-container">
	<div id="page-content" class="clearfix">
	  <div class="row-fluid">
	     <form action="pricing/${pricing.id == null?'addPricing':'editPricing' }" method="post" ref="pricingForm" id="pricingForm" class="form-horizontal" role="form">
	     	<input type="hidden" name="id" id="pricingId" value="${pricing.id }"/>
	     	<input type="hidden" name="issueTktStr" id="issueTktStr" value=""/>
		    <input type="hidden" name="invalidTktStr" id="invalidTktStr" value=""/>
		    <input type="hidden" id="defaultIssueTime" value="00:00-13:50/00:00-13:50/00:00-13:50/00:00-13:50/00:00-13:50/08:00-23:59/08:00-23:59/08:00-23:59"/>
			<input type="hidden" id="defaultInvalidTime" value="06:59-17:59/06:59-17:59/06:59-17:59/06:59-17:59/06:59-17:59/01:00-23:00/01:00-23:00/08:00-23:59"/>
	     	<div class="titleWrapper clearfix">
				<div class="title">基本信息</div>
				<button class="btn btn-mini btn-primary" onclick="back();">返回</button>
			</div>
			<div class="formWrapper form-horizontal">
				<div class="formItem">
					<div class="form-group">
					    <label for="airline" class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>航空公司</label>
					    <input type="text" class="form-control" id="airline" name="airline" required minlength="2" maxlength="2" placeholder="航司二字代码，如：MU">
					</div>
					<div class="form-group">
					    <label for="provider" class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>供应商</label>
					    <input type="text" class="form-control" id="provider" name="providerId" required id="provider">
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">政策标签</label>
					    <input type="text" id="comboSelectLabel" name="pricingLabelKey" class="" placeholder="请输入查询关键字">
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">运价类型</label>
					    <select id="" name="fareType" class="form-control">
						  <option value="PUBLIC_FARE">公布运价</option>
						  <option value="PRIVATE_FARE">私有运价</option>
						</select>
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">AccountCode</label>
					    <input type="text" id="" name="accountCode" class="">
					</div>
				</div>
				<div class="formItem relative">
					<div class="form-group">
					    <label for="fitAirline" class="control-label lableWidth100 marginRight10">同时适用航司</label>
					    <input type="text" class="form-control" id="fitAirline" name="fitAirline" minlength="2" maxlength="2" placeholder="航司二字代码，如：MU">
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>GDS</label>
					    <input type="text" id="gds" name="gds" class="" placeholder="">
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>预定PCC</label>
					    <input type="text" id="comboSelectPcc" name="pcc" class="" placeholder="请输入查询关键字">
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>工作时间</label>
					    <select id="work" name="work" class="form-control" v-model="workTime">
						  <option value="0">默认工作时间</option>
						  <option value="1">自定义</option>
						</select>
						<span class="marginLeft20" href="javascript:void(0);" onclick="workTimeView();" v-show="workTime == '1'"><a>编辑</a></span>
						<span class="marginLeft20"><a href="javascript:void(0);" onclick="previewWorkTime();">预览</a></span>
					</div>
					<div class="viewTime clearfix" style="display: none;">
						<h4>预览工作时间 <span class="close">x</span></h4>
						 <div class="chooseTime clearfix" id="previewIssue">
						 	<div>出票工作时间：</div>
						 	<div id="viewIssue">
						 	</div>
						 	<div class="v-chooseAdd">
						 	</div>
						 </div>
						  <div class="chooseTime clearfix" id="previewInvalid">
						 	<div>废票工作时间：</div>
						 	<div id="viewInvalid"></div>
						 	<div class="v-chooseAdd"></div>
						 </div>
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">票证类型</label>
					    <div style="padding-top: 4px;">
						    <input type="radio" class="form-control" name="ticketType" value="BSP" checked="checked"> 
						    <span class="paddingLeft20 marginRight20">BSP</span>
						    <input type="checkbox" class="form-control" name="autoTicket" value="true">
						    <span class="paddingLeft20">需人工审核</span>
					    </div>
					</div>
					<div class="form-group">
						<label class="control-label lableWidth100 marginRight10">出票方式</label>
					    <input type="radio" class="form-control" name="printTicketType" value="AUTO_TICKET"> <span class="paddingLeft20 marginRight20">自动出票</span>
					    <input type="radio" class="form-control" name="printTicketType" value="QMAIL"> <span class="paddingLeft20 marginRight20">Q信箱</span>
					    <input type="radio" class="form-control" name="printTicketType" value="MANUAL_TICKET"> <span class="paddingLeft20">人工出票</span>
					</div>
				</div>
			</div>
			<div class="titleWrapper clearfix">
				<div class="title">航程信息</div>
			</div>
			<div class="formWrapper form-horizontal">
				<div class="formItem">
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>航程类型</label>
					    <div style="padding-top: 4px;">
						    <input type="checkbox" name="route.routeTypes" id="oneWay" value="OW" class="form-control" v-model="isOneWay"> <span class="paddingLeft20 marginRight20">单程</span>
						    <input type="checkbox" name="route.routeTypes" id="returnTrip" value="RT" class="form-control" v-model="isReturnTtip"> <span class="paddingLeft20 marginRight20">往返</span>
						    <input type="checkbox" name="route.routeTypes" id="gap" value="OJ" class="form-control" v-model="isGAP"> <span class="paddingLeft20 marginRight20">缺口</span>
						    <input type="checkbox" name="route.routeTypes" id="multiTrip" value="MT" class="form-control" ref="multiTrip" :disabled="toggleDisable"> <span class="paddingLeft20">多程</span>
					    </div>
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">是否直达</label>
					    <div style="padding-top: 4px;">
						    <input type="checkbox" name="route.flyTypes" class="form-control" value="DIRECT"> <span class="paddingLeft20 marginRight20">直飞</span>
						    <input type="checkbox" name="route.flyTypes" class="form-control" value="TRANSFER" v-model="isTransfer"> <span class="paddingLeft20">中转</span>
					    </div>
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">代码共享</label>
					    <input type="radio" class="form-control" name="route.shareCode" value="DISABLE"> <span class="paddingLeft20 marginRight20">禁止</span>
					    <input type="radio" class="form-control" name="route.shareCode" value="ENABLE"> <span class="paddingLeft20 marginRight20">允许</span>
					    <input type="radio" class="form-control" name="route.shareCode" value="LIMIT"> <span class="paddingLeft20">仅限同集团代码共享</span>
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">出发机场</label>
					    <div class="selectAirport">
					    	<a href="#">选择机场</a>
						    <textarea class="form-control" name="route.departAirportsInclude" id="departureAirportsInclude" rows="3" cols="25"></textarea>
					    </div>
					    <div class="excludeAirport">
					    	<a href="#">排除机场</a>
						    <textarea class="form-control" name="route.departAirportsExclude" id="departureAirportsExclude" rows="3"></textarea>
					    </div>
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">到达机场</label>
					    <div class="selectAirport">
					    	<a href="#">选择机场</a>
						    <textarea class="form-control" name="route.arriveAirportsInclude" id="arriveAirportsInclude" rows="3" cols="25"></textarea>
					    </div>
					    <div class="excludeAirport">
					    	<a href="#">排除机场</a>
						    <textarea class="form-control" name="route.arriveAirportsExclude" id="arriveAirportsExclude" rows="3"></textarea>
					    </div>
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">FareBasis</label>
					    <select name="route.fareBasis.fareBasisType" v-model="fareBasis" class="form-control span1 marginRight10">
						  <option value="INCLUDE">包含</option>
						  <option value="EXCLUDE">排除</option>
						  <option value="ALL_TRIP_SAME">全程一致</option>
						</select>
						<input type="text" name="route.fareBasis.list" v-show="isFareBasis" ref="fareBasis" class="form-control span8" id="fareBasis" placeholder="为空时表示没有限制，支持通配符% (可填写，功能未实现)">
					</div>
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">去程航班号</label>
					    <select name="route.departFlightnos.included" class="form-control span1 marginRight10">
						  <option value="true">包含</option>
						  <option value="false">排除</option>
						</select>
						<input type="text" class="form-control span8" name="route.departFlightnos.list" id="departFlightnos" placeholder="">
					</div>
					<div class="form-group" v-show="isReturnTtip">
					    <label class="control-label lableWidth100 marginRight10">回程航班号</label>
					    <select name="route.returnFlightnos.included" id="returnFltNoType" class="form-control span1 marginRight10">
						  <option value="true">包含</option>
						  <option value="false">排除</option>
						</select>
						<input type="text" class="form-control span8" name="route.returnFlightnos.list" id="returnFlightnos" placeholder="">
					</div>
					<div class="form-group" v-show="isTransfer">
					    <label class="control-label lableWidth100 marginRight10">中转点</label>
					    <select name="route.transfer.included" id="domesticTransfer" class="form-control span1 marginRight10">
						  <option value="true">包含</option>
						  <option value="false">排除</option>
						</select>
						<input type="text" class="form-control span8" name="route.transfer.list" id="returnFlightnos" placeholder="">
					</div>
				</div>
			</div>
			
			<div class="titleWrapper clearfix">
				<div class="title">规则信息</div>
			</div>
			<div class="formWrapper form-horizontal">
				<div class="formItem">
					<div class="form-group clearfix">
						<label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>乘客类型</label>
					    <div style="padding-top: 4px;float: left;margin-right: 10px;">
					    	<input type="checkbox" name="passengerTypes" checked="checked" value="ADT"> <span class="paddingLeft20 marginRight20">成人</span>
					    	<input type="checkbox" name="passengerTypes" id="checkCHD" v-model="checkCHD" value="CHD"> <span class="paddingLeft20 marginRight20">儿童</span>
					    	<input type="checkbox" name="passengerTypes" id="checkBaby" v-model="checkBaby" value="BABY"> <span class="paddingLeft20 marginRight20">婴儿</span>
					    	<input type="checkbox" name="passengerTypes" id="" value="STUDENT"> <span class="paddingLeft20 marginRight20">学生</span>
					    	<input type="checkbox" name="passengerTypes" id="" value="YOUTH"> <span class="paddingLeft20 marginRight20">青年</span>
					    	<input type="checkbox" name="passengerTypes" id="" value="IMMIGRATION"> <span class="paddingLeft20 marginRight20">移民</span>
					    	<input type="checkbox" name="passengerTypes" id="" value="LABOR"> <span class="paddingLeft20 marginRight20">劳务</span>
					    	<input type="checkbox" name="passengerTypes" id="" value="SAILOR"> <span class="paddingLeft20 marginRight20">海员</span>
					    	<input type="checkbox" name="passengerTypes" id="" v-model="checkSpecial" value="SPECIAL"> <span class="paddingLeft20 marginRight10">特殊身份</span>
					    </div>
					    <input type="text" name="specialValue" class="form-control span4" ref="specialValue" v-show="checkSpecial" v-bind:value="_checkModelValue('checkSpecial')"/>
				    </div>
				    <div class="form-group" v-show="checkCHD">
					    <label class="control-label lableWidth100 marginRight10">儿童</label>
					    <div style="padding-top: 4px;">
						    <input type="radio" name="childRewardType" class="form-control" value="AS_ADULT" v-bind:checked="checkCHD"> <span class="paddingLeft20 marginRight20">与成人同奖励</span>
						    <input type="radio" name="childRewardType" ref="childRewardType" class="form-control" value="BY_ASSIGN" v-bind:checked="_checkModelValue('checkCHD')"> <span class="paddingLeft20 marginRight20">指定奖励</span></br>
						    <input type="radio" name="chdSingleTkt" class="form-control" value="SINGLE_TICKET" v-bind:checked="checkCHD"> <span class="paddingLeft20">单开</span>
						    <input type="radio" name="chdSingleTkt" class="form-control" value="NO_SINGLE_TICKET" v-bind:checked="_checkModelValue('checkCHD')"> <span class="paddingLeft20">不单开</span>
					    </div>
					</div>
					<div class="form-group" v-show="checkBaby">
					    <label class="control-label lableWidth100 marginRight10">婴儿</label>
					    <div style="padding-top: 4px;">
						    <input type="radio" name="babyRewardType" value="NO_REWARD" class="form-control" v-bind:checked="checkBaby"> <span class="paddingLeft20">可开无奖励</span>
					    </div>
					</div>
				    <div class="form-group">
				    	<label class="control-label lableWidth100" style="float: none;">往返-返点</label>
					    <label class="control-label lableWidth100 marginRight10">混舱</label>
					    <div style="padding-top: 4px;">
						    <input type="radio" name="rebateMixCabin" class="form-control" value="HALF_VALUE" checked="checked"> <span class="paddingLeft20 marginRight20">取1/2值</span>
						    <input type="radio" name="rebateMixCabin" class="form-control" value="MIN_VALUE"> <span class="paddingLeft20 marginRight20">取最小值</span>
						    <input type="radio" name="rebateMixCabin" class="form-control" value="NUC_GROUP"> <span class="paddingLeft20 marginRight20">按各段实际奖励</span>
						    <input type="radio" name="rebateMixCabin" class="form-control" value="NO_AWARD"> <span class="paddingLeft20">全程无返点</span>
					    </div>
					</div>
				    <div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">跨季</label>
					    <div style="padding-top: 4px;">
						    <input type="radio" name="rebateAcrossSeason" class="form-control" value="HALF_VALUE" checked="checked"> <span class="paddingLeft20 marginRight20">取1/2值</span>
						    <input type="radio" name="rebateAcrossSeason" class="form-control" value="MIN_VALUE" id=""> <span class="paddingLeft20 marginRight20">取最小值</span>
						    <input type="radio" name="rebateAcrossSeason" class="form-control" value="NUC_GROUP" id=""> <span class="paddingLeft20 marginRight20">按各段实际奖励</span>
						    <input type="radio" name="rebateAcrossSeason" class="form-control" value="NO_AWARD" id=""> <span class="paddingLeft20">全程无返点</span>
					    </div>
				    </div>
				    <div class="form-group">
				    	<label class="control-label lableWidth100" style="float: none;">往返-返款</label>
					    <label class="control-label lableWidth100 marginRight10">混舱</label>
					    <div style="padding-top: 4px;">
						    <input type="radio" name="refundMixCabin" class="form-control" value="HALF_VALUE" checked="checked"> <span class="paddingLeft20 marginRight20">取1/2值</span>
						    <input type="radio" name="refundMixCabin" class="form-control" value="SINGLE_MIN_VALUE" id=""> <span class="paddingLeft20 marginRight20">取单项最小值</span>
						    <input type="radio" name="refundMixCabin" class="form-control" value="SINGLE_MAX_VALUE" id=""> <span class="paddingLeft20 marginRight20">取单项最大值</span>
						    <input type="radio" name="refundMixCabin" class="form-control" value="NO_AWARD" id=""> <span class="paddingLeft20">全程无返款</span>
					    </div>
					</div>
				    <div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">跨季</label>
					    <div style="padding-top: 4px;">
						    <input type="radio" name="refundAcrossSeason" class="form-control" value="HALF_VALUE" checked="checked"> <span class="paddingLeft20 marginRight20">取1/2值</span>
						    <input type="radio" name="refundAcrossSeason" class="form-control" value="SINGLE_MIN_VALUE" id=""> <span class="paddingLeft20 marginRight20">取单项最小值</span>
						    <input type="radio" name="refundAcrossSeason" class="form-control" value="SINGLE_MAX_VALUE" id=""> <span class="paddingLeft20 marginRight20">取单项最大值</span>
						    <input type="radio" name="refundAcrossSeason" class="form-control" value="NO_AWARD" id=""> <span class="paddingLeft20">全程无返款</span>
					    </div>
				    </div>
				</div>
			</div>
			<div class="titleWrapper clearfix">
				<div class="title">政策信息</div>
			</div>
			<div class="formWrapper form-horizontal">
				<div class="formItem" id="timeGroupWrapper">
					<div class="timeGroup" id="timeGroup1" v-for="(timeGroup, timeIndex) in timeGroups">
						<div class="titleWrapper clearfix">
							<div class="timeTitle">时间组{{timeIndex + 1}}</div>
							<button type="button" class="btn btn-mini btn-primary timeGroupBtn" @click="timeIndex === 0?_addTimeGroup():_removeTimeGroup(timeGroup)">{{timeIndex === 0?'添加一组时间':'删除该时间组'}}</button>
						</div>
						<div style="display: flex;">
							<div style="flex: 1;">
								<div class="form-group" style="margin-top: 10px;">
								    <label class="control-label lableWidth100 marginRight10">开票有效期</label>
								    <input class="span10 date-picker billingStartTimeHook" :name="_initName('timeGroups', timeIndex, 'printTktTime.start')" :id="_initTime('billingStartTime', timeIndex)"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title=""/>
									<span>至</span>
									<input class="span10 date-picker billingEndTimeHook" :name="_initName('timeGroups', timeIndex, 'printTktTime.end')" :id="_initTime('billingEndTime', timeIndex)" value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title=""/>
								</div>
								<div class="form-group">
								    <label class="control-label lableWidth100 marginRight10">去程有效期</label>
								    <input class="span10 date-picker departureStartTimeHook" :name="_initName('timeGroups', timeIndex, 'departTimes.start')" :id="_initTime('departureStartTime', timeIndex)"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title=""/>
									<span>至</span>
									<input class="span10 date-picker departureEndTimeHook" :name="_initName('timeGroups', timeIndex, 'departTimes.end')" :id="_initTime('departureEndTime', timeIndex)" value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title=""/>
								</div>
								<div class="form-group">
									<label class="control-label lableWidth100 marginRight10">去程适用班期</label>
								    <div style="padding-top: 4px;">
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'departureApplicableDays')" class="departureApplicableDaysHook" value="MON" checked="checked"> <span class="paddingLeft20 marginRight20">周一</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'departureApplicableDays')" class="departureApplicableDaysHook" value="TUE" checked="checked"> <span class="paddingLeft20 marginRight20">周二</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'departureApplicableDays')" class="departureApplicableDaysHook" value="WED" checked="checked"> <span class="paddingLeft20 marginRight20">周三</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'departureApplicableDays')" class="departureApplicableDaysHook" value="THU" checked="checked"> <span class="paddingLeft20 marginRight20">周四</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'departureApplicableDays')" class="departureApplicableDaysHook" value="FRI" checked="checked"> <span class="paddingLeft20 marginRight20">周五</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'departureApplicableDays')" class="departureApplicableDaysHook" value="SAT" checked="checked"> <span class="paddingLeft20 marginRight20">周六</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'departureApplicableDays')" class="departureApplicableDaysHook" value="SUN" checked="checked"> <span class="paddingLeft20">周日</span>
								    </div>
							    </div>
						    </div>
						    <div style="flex: 1;" class="isReturnTtipHook" v-show="isReturnTtip">
								<div class="form-group" style="margin-top: 10px;">
								    <label class="control-label marginRight10">回程超出截至有效期时</label>
								    <div style="padding-top: 4px;">
									    <input type="radio" class="form-control" :name="_initName('timeGroups', timeIndex, 'backOverdueType')" value="BY_CROSS_SEASON" v-bind:checked="isReturnTtip"> <span class="paddingLeft20 marginRight20">按跨季处理</span>
									    <input type="radio" class="form-control" :name="_initName('timeGroups', timeIndex, 'backOverdueType')" value="NO_AWARD"> <span class="paddingLeft20 marginRight20">无奖励</span>
									    <input type="radio" class="form-control" :name="_initName('timeGroups', timeIndex, 'backOverdueType')" value="NO_TICKET"> <span class="paddingLeft20">不开票</span>
								    </div>
								</div>
								<div class="form-group">
								    <label class="control-label lableWidth100 marginRight10">回程有效期截止</label>
								    <select :name="_initName('timeGroups', timeIndex, 'deadLineType')" id="" class="form-control span4 marginRight10">
								      <option value="">请选择</option>
									  <option value="FIRST_SEGMENT">First Segment</option>
									  <option value="LAST_SEGMENT_DEP">Last SegmentDep</option>
									  <option value="LAST_SEGMENT_ARR">Last SegmentArr</option>
									</select>
								    <input class="span10 date-picker" :name="_initName('timeGroups', timeIndex, 'deadLineTime')" :id="_initTime('returnDeadLine', timeIndex)"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title=""/>
								</div>
								<div class="form-group">
									<label class="control-label lableWidth100 marginRight10">回程适用班期</label>
								    <div style="padding-top: 4px;">
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'returnApplicableDays')" id="" value="MON" checked="isReturnTtip === true"> <span class="paddingLeft20 marginRight20">周一</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'returnApplicableDays')" id="" value="TUE" checked="isReturnTtip === true"> <span class="paddingLeft20 marginRight20">周二</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'returnApplicableDays')" id="" value="WED" checked="isReturnTtip === true"> <span class="paddingLeft20 marginRight20">周三</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'returnApplicableDays')" id="" value="THU" checked="isReturnTtip === true"> <span class="paddingLeft20 marginRight20">周四</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'returnApplicableDays')" id="" value="FRI" checked="isReturnTtip === true"> <span class="paddingLeft20 marginRight20">周五</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'returnApplicableDays')" id="" value="SAT" checked="isReturnTtip === true"> <span class="paddingLeft20 marginRight20">周六</span>
								    	<input type="checkbox" :name="_initName('timeGroups', timeIndex, 'returnApplicableDays')" id="" value="SUN" checked="isReturnTtip === true"> <span class="paddingLeft20">周日</span>
								    </div>
							    </div>
						    </div>
					    </div>
					    
					    <div class="formWrapper form-horizontal">
							<div class="formItem cabinGroupWrapper" id="cabinGroupWrapper">
							    <div class="cabinGroup clearfix" id="cabinGroup1" v-for="(cabinGroup,index) in timeGroup.timeGroup">
							    	<div class="titleWrapper clearfix">
										<div class="cabinTitle">舱位组{{index + 1}}</div>
										<button type="button" class="btn btn-mini btn-primary cabinGroupBtn" @click="[index === 0?_addCabinGroup(timeGroup):_removeCabinGroup(timeGroup,cabinGroup)]">{{index === 0?'添加一组舱位':'删除该舱位组'}}</button>
									</div>
									<div class="clearfix">
										<label class="control-label lableWidth100" style="float: none;">成人政策</label>
										<div class="form-group floatLeft width200">
										    <label for="inputEmail3" class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>代理费</label>
								    		<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'adtComission.agencyRatio', timeIndex)" :id="_initValidId('adtAgencyFee',index ,'{required:true,date:true}')" class="form-control span3 txt" placeholder="" value="0">&nbsp;&nbsp;%
										</div>
										<div class="form-group floatLeft width200">
								    		<label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>奖励扣率</label>
								    		<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'adtComission.awardRatio', timeIndex)" id="adtRewardDiscountRate" class="form-control span3" value="0">&nbsp;&nbsp;%
										</div>
										<div class="form-group floatLeft width200" v-show="isOneWay">
								    		<label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>单程奖励金额</label>
								    		<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'adtComission.owAwardMoney', timeIndex)" id="adtOneWayReward" class="form-control span3" value="0">&nbsp;&nbsp;元
										</div>
										<div class="form-group floatLeft width200" v-show="isReturnTtip">
								    		<label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>往返奖励金额</label>
								    		<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'adtComission.rtAwardMoney', timeIndex)" id="adtRoundTripReward" class="form-control span3" value="0">&nbsp;&nbsp;元
										</div>
										<div class="form-group floatLeft width200">
								    		<label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>开票费</label>
								    		<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'adtComission.tktFee', timeIndex)" id="adtBillingFare" class="form-control span3" value="0">&nbsp;&nbsp;元
										</div>
									</div>
									<div class="clearfix" v-show="checkCHD">
										<label class="control-label lableWidth100" style="float: none;">儿童政策</label>
										<div class="form-group floatLeft width200">
										    <label for="inputEmail3" class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>代理费</label>
								    		<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'chdComission.agencyRatio', timeIndex)" id="chdAgencyFee" class="form-control span3"  value="0">&nbsp;&nbsp;%
										</div>
										<div class="form-group floatLeft width200">
								    		<label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>奖励扣率</label>
								    		<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'chdComission.awardRatio', timeIndex)" id="chdRewardDiscountRate" class="form-control span3" value="0">&nbsp;&nbsp;%
										</div>
										<div class="form-group floatLeft width200" v-show="isOneWay && checkCHD">
								    		<label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>单程奖励金额</label>
								    		<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'chdComission.owAwardMoney', timeIndex)" id="chdOneWayReward" class="form-control span3" value="0">&nbsp;&nbsp;元
										</div>
										<div class="form-group floatLeft width200" v-show="isReturnTtip && checkCHD">
								    		<label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>往返奖励金额</label>
								    		<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'chdComission.rtAwardMoney', timeIndex)" id="chdRoundTripReward" class="form-control span3" value="0">&nbsp;&nbsp;元
										</div>
										<div class="form-group floatLeft width200">
								    		<label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>开票费</label>
								    		<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'chdComission.tktFee', timeIndex)" id="chdBillingFare" class="form-control span3" value="0">&nbsp;&nbsp;元
										</div>
									</div>
									<div class="clearfix" v-show="checkBaby">
										<label class="control-label lableWidth100" style="float: none;">婴儿政策</label>
										<div class="form-group floatLeft width200">
								    		<label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>开票费</label>
								    		<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'babyCommission.tktFee', timeIndex)"  class="form-control span3" value="0">&nbsp;&nbsp;元
										</div>
									</div>
									<div class="form-group" style="display: block;">
									    <label class="control-label lableWidth100 marginRight10"><i class="colorRed">*</i>适用舱位</label>
										<input type="text" :name="_initName('timeGroups.cabinGroups', index, 'fitCabins', timeIndex)" id="fitCabin" class="form-control marginRight20 span8" placeholder="">
									    <select :name="_initName('timeGroups.cabinGroups', index, 'fitCabinType', timeIndex)" class="form-control marginRight10">
										  <option value="CAN_CACROSSGROUP_CABIN">可跨组混舱</option>
										  <option value="CANNOT_CACROSSGROUP_CABIN">不可跨组混舱</option>
										  <option value="CAN_CACROSSGROUP_CABIN_NOT_SINGLE_OPEN">可跨组混舱，不单开</option>
										</select>
									</div>
							    </div>
						    </div>
					    </div>
					    
					</div>
				</div>
			</div>
			
			<div class="titleWrapper clearfix">
				<div class="title">政策备注</div>
			</div>
			<div class="formWrapper form-horizontal">
				<div class="formItem">
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">公开备注</label>
					    <textarea class="form-control" name="publicRemark" rows="3" cols="25" style="width: 300px;"></textarea>
					</div>
				</div>
				<div class="formItem">
					<div class="form-group">
					    <label class="control-label lableWidth100 marginRight10">内部备注</label>
					    <textarea class="form-control" name="privateRemark" rows="3" cols="25" style="width: 300px;"></textarea>
					</div>
				</div>
			</div>
			
			<div class="form-group btnGroup">
				<div class="col-sm-offset-4 col-sm-8">
					<!-- <a class="btn btn-danger marginRight20" id="btnSave">发布</a> @click="_submit" -->
					<input class="btn btn-danger marginRight20 submit" type="submit" value="提交">
					<a class="btn btn-primary" onclick="back();">返回</a>
				</div>
			</div>
	
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
			
			</form>
		</div>
	</div>
</div>

<div class="commonbg">
	<div class="workTime clearfix" style="width:630px">
		<h4>
			自定义工作时间 
			<span class="close"></span>
		</h4>
		<div class="chooseTime clearfix" id="issueTkt">
		<div class="chooseTit">出票工作时间：</div>
			<%@ include file="template/customWorkTimeTemplate.jspf" %>
		</div>
		<div class="chooseTime clearfix" id="invalidTkt">
		<div class="chooseTit">废票工作时间：</div>
			<%@ include file="template/customWorkTimeTemplate.jspf" %>
		</div>
		<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:;" class="btn btn-danger marginRight20" id="confirmWorkTime" >
			<span class="left"></span>
			<span class="center" style="padding:0 25px;">确定</span>
			<span class="right"></span>
		</a>
		<a href="javascript:;" class="btn btn-danger marginRight20" id="emptyWorkTime">
			<span class="center" style="padding:0 25px;">清空</span>
		</a>
		<a href="javascript:;" class="btn btn-danger marginRight20 medium" id="cancelWorkTime">
			<span class="center" style="padding:0 25px;">取消</span>
		</a> -->
		<div class="form-group btnGroup" style="margin-top: 0;">
			<div class="col-sm-offset-4 col-sm-8">
				<a class="btn btn-danger btn-sm marginRight20" onclick="save();" id="confirmWorkTime">确定</a>
				<a class="btn info btn-sm marginRight20" onclick="" id="emptyWorkTime">清空</a>
				<a class="btn btn-primary btn-sm" onclick="" id="cancelWorkTime">取消</a>
			</div>
		</div>
	</div>
</div>

	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
	
</body>
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		var map = new Map();
		var vm = new Vue({
		  el: '#main-container',
		  data: {
		    isOneWay: false,
		    isReturnTtip: false,
		    isGAP: false,
		    checkCHD: false,
		    checkBaby: false,
		    checkSpecial: false,
		    isTransfer: false,
		    isFareBasis: true,
		    fareBasis: '',
		    timeGroups: [],
		    workTime: '0'
		  },
		  methods: {
		  	_initName(preName, index, name, parentIndex) {
	  			if(parentIndex >= 0){
	  				let arr = preName.split('.');
	  				return arr[0] + "[" + parentIndex + "]." + arr[1] + "["+ index + "]." + name;
	  			}
	  			return preName + "["+ index + "]." + name;
	  		},
	  		_initTime(name, index) {
	  			return name + index;
	  		},
	  		_initValidId(name, index, validType) {
	  			var id = name + index;
	  			/* var obj = {};
	  			obj.key = id;
	  			obj.value = validType; */
	  			map.set(id, validType);
	  			return id;
	  		},
		  	_addTimeGroup() {
		  		let tmpTimeGroup = {"timeGroup": [{"cabinGroup": "1"}]};
				this.timeGroups.push(tmpTimeGroup);
				this.$nextTick( () => {
					for(let i = 0;i < this.timeGroups.length; i++){
						initDateTimePicker("#billingStartTime" +　i, "#billingEndTime" + i);
					}
				});
		  	},
		  	_removeTimeGroup(_timeGroup) {
		  		this.timeGroups.remove(_timeGroup);
		  	},
		  	_addCabinGroup(args) {
				let cabinGroup = {"cabinGroup": "1"};
				args.timeGroup.push(cabinGroup);
				this.$nextTick( () => {
					console.log(map);
					map.forEach(function (value, key, map) {
						console.log(value);
						var obj = JSON.parse('{"required":true,"date":true}');
						console.log(obj);
						$("#"+key).rules("add", obj);
					})
				});
			},
			_removeCabinGroup(_timeGroup,_cabinGroup) {
				_timeGroup.timeGroup.remove(_cabinGroup);
			},
			_checkModelValue(modelType) {
				  if("checkCHD" === modelType && !this.checkCHD){
					  return false;
				  } else if("checkSpecial" === modelType && !this.checkSpecial) {
					  return '';
				  }
			},
			_submit() {
				/* if(checkEndTime()){ */
					<%-- $.ajax({
						type: "POST",
						url: $("#pricingForm").attr("action"),
				    	data: $("#pricingForm").serialize(),
						cache: false,
						success: function(data){
							 if(0 == data.status){
								window.location.href = "<%=basePath%>pricing/list";
							 }else{
								alert(data.msg);
							 }
						}
					}); --%>
					this.$refs.pricingForm.submit();
					/*	} else {
					window.alert("表单校验不通过！");
					return false;
				} */
			}
		  },
		  computed: {
			  toggleDisable() {
				  if(this.isOneWay || this.isReturnTtip || this.isGAP) {
					  return false;
				  } else {
					  return true;
				  }
			  }
		  },
		  watch: {
			  toggleDisable(val) {
				  if(val) {
					  this.$nextTick( () => {
						  this.$refs.multiTrip.checked = false;
					  })
				  }
			  },
			  timeGroups() {
				this.$nextTick( () => {
					for(let i = 0;i < this.timeGroups.length; i++){
						initDateTimePicker("#billingStartTime" +　i, "#billingEndTime" + i);
						initDateTimePicker("#departureStartTime" +　i,"#departureEndTime" +　i,"#returnDeadLine" +　i);
					}
				});
			  },
			  fareBasis(val) {
				  if("ALL_TRIP_SAME" === val) {
					  this.isFareBasis = false;
					  this.$refs.fareBasis.value = '';
				  } else {
					  this.isFareBasis = true;
				  }
			  }
		  },
		  created: function () {
			  	let tmpTimeGroup = {"timeGroup": [{"cabinGroup": "1"}]};
		  	  	this.timeGroups.push(tmpTimeGroup);
		  }
		})
		
        $.get('<%=basePath%>pricing/pccListAjax',function(data){
        	$('#comboSelectPcc').bComboSelect({
               	showField : 'office',
               	keyField : 'id',
               	data : data
            });
        })
        
        $.get('<%=basePath%>pricing/labelListAjax',function(data){
        	$('#comboSelectLabel').bComboSelect({
               	showField : 'title',
               	keyField : 'id',
               	data : data,
               	multiple : true
            });
        })
        
        //工作时间自定义保存按钮
        $("#confirmWorkTime").bind("click", function() {
			if (!validateWorkTime()) {
				errorTimeSet();
			} else {
				$(".workTime").hide();
				$(this).parents(".commonbg").hide();
			}
		});
		//关闭自定义时间界面
		$("#cancelWorkTime").bind("click", function() {
			workTimeReload(1);
			if (isNull(tempIssueTktStr)) {
				$("select[name='work']").find("option[value='0']").prop("selected", true);
				$("#editWorkTime").hide();
			} else {
				$("select[name='work']").find("option[value='1']").prop("selected", true);
				$("#editWorkTime").show();
			}
			$(".workTime").hide();
			$(this).parents(".commonbg").hide();
		});
        
        $(".close").on("click", function() {
			$(".viewTime").hide();
		})
		// 初始化保存按钮
		//initSaveButton();
		
		// 自定义工作时间添加事件
		$(".weekTime>span").on("click", function() {
			$(this).toggleClass("bgBlue");
			$(".chooseAdd").on("click", function() {
				if ($(this).siblings("div").find(".weekTime span").has(".bgBlue") == true) {
					return false;
				}
			})
		})
		
		//初始化 开票有效期
		//initDateTimePicker("#billingStartTime","#billingEndTime");
		//初始化 去程有效期
		//initDateTimePicker("#departureStartTime","#departureEndTime","#returnDeadLine");
		
		/* $.validator.addClassRules({
			txt: {
				required: true,
				minlength: 5
			}
		}) */
        
		//自定义validate验证输入的数字小数点位数不能大于两位
	    jQuery.validator.addMethod("minNumber",function(value, element){
	        var returnVal = true;
	        var inputZ = value;
	        console.log(inputZ);
	        var ArrMen= inputZ.split(".");    //截取字符串
	        if(ArrMen.length==2){
	            if(ArrMen[1].length>2){    //判断小数点后面的字符串长度
	                returnVal = false;
	                return false;
	            }
	        }
	        console.log(returnVal);
	        return returnVal;
	    },"小数点后最多为两位");         //验证错误信息
	    
	  	//自定义validate验证输入的 去/回乘航班号 是否合法
	    jQuery.validator.addMethod("checkFlightnos",function(value, element){
	        var returnVal = true;
	        var inputX = value;
	        console.log(inputX);
	        var reg = /^(([A-Z]{2}[0-9]{1,3}%|[A-Z]{2}[0-9]{3,4})|([0-9]{1}[A-Z]{1}[0-9]{1,3}%|[0-9]{1}[A-Z]{1}[0-9]{3,4})|([A-Z]{2}[0-9]{3,4}|[0-9]{1}[A-Z]{1}[0-9]{3,4})~([A-Z]{2}[0-9]{3,4}|[0-9]{1}[A-Z]{1}[0-9]{3,4}))(\/{1}((([A-Z]{2}[0-9]{1,3}%|[A-Z]{2}[0-9]{3,4})|([0-9]{1}[A-Z]{1}[0-9]{1,3}%|[0-9]{1}[A-Z]{1}[0-9]{3,4}))|(([A-Z]{2}[0-9]{3,4}|[0-9]{1}[A-Z]{1}[0-9]{3,4})~([A-Z]{2}[0-9]{3,4}|[0-9]{1}[A-Z]{1}[0-9]{3,4}))))*$/ig;
	        if(inputX.match(reg) == null && inputX != ""){
	        	returnVal = false;
                return false;
	        }
	        console.log(returnVal);
	        return returnVal;
	    },"格式错误");         //验证错误信息/^[a-zA-Z]{3}(\/{1}[a-zA-Z]{3})*$/
	    
	  	//自定义validate验证输入的 出发/到达 机场
	    jQuery.validator.addMethod("checkAirport",function(value, element){
	        var returnVal = true;
	        var inputA = value;
	        console.log(inputA);
	        var reg = /^[A-Z]{3}(\/{1}[A-Z]{3})*$/;
	        if(inputA.match(reg) == null && inputA != ""){
	        	returnVal = false;
                return false;
	        }
	        console.log(returnVal);
	        return returnVal;
	    },"格式错误");         //验证错误信息
	    
	  	//自定义validate验证输入的 适用舱位/addon/ 去程/回程航班号
	    jQuery.validator.addMethod("checkCabin",function(value, element){
	        var returnVal = true;
	        var inputA = value;
	        console.log(inputA);
	        var reg = /^[A-Z]+(\/{1}[A-Z]+)*$/;
	        if(inputA.match(reg) == null){
	        	returnVal = false;
                return false;
	        }
	        console.log(returnVal);
	        return returnVal;
	    },"格式错误");         //验证错误信息
		
		$("#pricingForm").validate({
			debug:true,
			errorPlacement: function(error, element) {  
			    error.appendTo(element.parent());  
			    $(element).tips({
					side : 1,
					msg : error.text(),
					bg : '#FF5080',
					time : 3
				});
			},
			rules: {
				"route.routeTypes": {
					required: true,
					minlength: 1
				},
				adtAgencyFee: {  //代理费规则
					required: true,
					number: true,
					min: 0,
					minNumber: $("#adtAgencyFee").val()
				},
				adtRewardDiscountRate: {  //奖励扣率规则
					required: true,
					number: true,
					min: 0,
					minNumber: $("#adtRewardDiscountRate").val()
				},
				adtOneWayReward: { //单程奖励金额规则
					required: "#oneWay:checked",
					number: true,
					min: 0,
					minNumber: $("#adtOneWayReward").val()
				},
				adtRoundTripReward: {//成人往返奖励金额规则
					required: "#returnTrip:checked",
					number: true,
					min: 0,
					minNumber: $("#adtRoundTripReward").val()
				},
				adtBillingFare: { //成人开票费
					required: true,
					number: true,
					min: 0,
					minNumber: $("#adtBillingFare").val()
				},
				"operator1": {
					checkAirport: $("#departureAirportsInclude").val()
				},
				"operator2": {
					checkAirport: $("#departureAirportsExclude").val()
				},
				"operator3": {
					checkAirport: $("#arriveAirportsInclude").val()
				},
				"operator4": {
					checkAirport: $("#arriveAirportsExclude").val()
				},
				"route.returnFlightnos.included": {
					required: "#returnTrip:checked"
				},
				/* "fareBasis": {
					checkFareBasis: $("#fareBasis").val()
				}, */
				"route.departFlightnos.list": {
					checkFlightnos: $("#departFlightnos").val()
				},
				"route.returnFlightnos.list": {
					checkFlightnos: $("#returnFlightnos").val()
				},
				"passengerTypes": {
					required: true,
					minlength: 1
				},
				fareTypes: {
					required: true,
					minlength: 1
				},
				chdAgencyFee: {
					required: "#checkCHD:checked",
					number: true,
					min: 0,
					minNumber: $("#chdAgencyFee").val()
				},
				chdRewardDiscountRate: {
					required: "#checkCHD:checked",
					number: true,
					min: 0,
					minNumber: $("#chdRewardDiscountRate").val()
				},
				chdOneWayReward: { //儿童单程奖励金额
					required: function(){
						if($("#checkCHD").is(":checked") && $("#oneWay").is(":checked")){
							return true;
						}else{
							return false;
						}
					},
					number: true,
					min: 0,
					minNumber: $("#chdOneWayReward").val()
				},
				chdRoundTripReward: {
					required: function(){
						if($("#checkCHD").is(":checked") && $("#returnTrip").is(":checked")){
							return true;
						}else{
							return false;
						}
					},
					number: true,
					min: 0,
					minNumber: $("#chdRoundTripReward").val()
				},
				chdBillingFare: {
					required: "#checkCHD:checked",
					number: true,
					min: 0,
					minNumber: $("#chdBillingFare").val()
				},
				babyBillingFare: { //婴儿开票费
					required: "#checkBaby:checked",
					number: true,
					min: 0,
					minNumber: $("#babyBillingFare").val()
				},
				"route.domesticTransfer.list": { //境内中转点 规则
					checkCabin: $("#domesticTransfer").val()
				},
				"route.abroadTransfer.list": {  //境外中转点 规则
					checkCabin: $("#abroadTransfer").val()
				},
				departureWeekTimes: {
					required: true,
					minlength: 1
				},
				returnWeekTimes: {
					required: "#returnTrip:checked",
					minlength: 1
				},
				fitCabin: { //适用舱位
					required: true,
					minlength: 1,
					maxlength: 50,
					checkCabin: $("#fitCabin").val()
				},
				addonCabin: { //适用舱位
					required: true,
					minlength: 1,
					maxlength: 50,
					checkCabin: $("#addonCabin").val()
				}
			},
			messages: {
				airline: {
					required: "请输入航司",
					minlength: "不能少于 2 个字母",
					maxlength: "不能多于 2 个字母"
				},
				fitAirline: {
					minlength: "不能少于 2 个字母",
					maxlength: "不能多于 2 个字母"
				},
				provider: {
					required: "请输入供应商"
				},
				comboSelectPcc: {
					required: "请选择一个PCC"
				},
				"route.routeTypes": "至少选择一个航程类型",
				adtAgencyFee: {
					required: "请输入代理费",
					number: "请输入数字",
					min: "输入最小数字为0",
					length: "输入数字最多小数点后两位"
				},
				chdAgencyFee: {  //儿童政策代理费
					required: "请输入代理费",
					number: "请输入数字",
					min: "输入最小数字为0",
					length: "输入数字最多小数点后两位"
				},
				adtRewardDiscountRate: {
					required: "请输入奖励扣率",
					number: "请输入数字",
					min: "输入最小数字为0",
					length: "输入数字最多小数点后两位"
				},
				chdRewardDiscountRate: { //儿童政策奖励扣率
					required: "请输入奖励扣率",
					number: "请输入数字",
					min: "输入最小数字为0",
					length: "输入数字最多小数点后两位"
				},
				adtOneWayReward: {
					required: "请输入单程奖励金额",
					number: "请正确输入金额",
					min: "输入最小金额为0",
					length: "输入数字最多小数点后两位"
				},
				chdOneWayReward: { //儿童单程奖励金额
					required: "请输入单程奖励金额",
					number: "请正确输入金额",
					min: "输入最小金额为0",
					length: "输入数字最多小数点后两位"
				},
				adtRoundTripReward: {
					required: "请输入往返奖励金额",
					number: "请正确输入金额",
					min: "输入最小金额为0",
					length: "输入数字最多小数点后两位"
				},
				chdRoundTripReward: { //儿童往返奖励金额
					required: "请输入往返奖励金额",
					number: "请正确输入金额",
					min: "输入最小金额为0",
					length: "输入数字最多小数点后两位"
				},
				adtBillingFare: {
					required: "请输入开票费",
					number: "请正确输入金额",
					min: "输入最小金额为0",
					length: "输入数字最多小数点后两位"
				},
				chdBillingFare: {  //儿童开票费
					required: "请输入开票费",
					number: "请正确输入金额",
					min: "输入最小金额为0",
					length: "输入数字最多小数点后两位"
				},
				"route.returnFlightnos.included": {
					required: "请选择回程航班号类型"
				},
				"passengerTypes": "至少选择一种乘客类型",
				fareTypes: "至少选择一种运价类型",
				departureWeekTimes: "去程适用班期至少选择一个",
				returnWeekTimes: "回程适用班期至少选择一个"
			}
			
		});
	});
	
	
	function initDateTimePicker(beginSelector,endSelector,returnDeadLine){
		console.log(beginSelector);
		console.log(endSelector);
		$(beginSelector).datetimepicker({
			startView:2,
			format:"yyyy-mm-dd",
			minView:"month",
			todayBtn : "linked", 
			todayHighlight : true,
			language: "zh-CN",
			showMeridian:true,
			autoclose:true,
		}).on('changeDate',function(ev){
			var starttime=$(beginSelector).val();
			$(endSelector).datetimepicker('setStartDate',starttime);
			if(returnDeadLine){
				$(returnDeadLine).datetimepicker('setStartDate',starttime);
			}
			$(beginSelector).datetimepicker('hide');
		});
		$(endSelector).datetimepicker({
			startView:2,
			minView:"month",
			format:"yyyy-mm-dd",
			todayBtn : "linked",
			todayHighlight : true,
			language: "zh-CN",
			autoclose:true,
			showMeridian:true,
		}).on('changeDate',function(ev){
			 var starttime=$(beginSelector).val();
			 var endtime=$(endSelector).val();
			 $(beginSelector).datetimepicker('setEndDate',endtime);
			 $(endSelector).datetimepicker('hide');
		});
		if(returnDeadLine){
			$(returnDeadLine).datetimepicker({
				startView:2,
				format:"yyyy-mm-dd",
				minView:"month",
				todayBtn : "linked", 
				todayHighlight : true,
				language: "zh-CN",
				showMeridian:true,
				autoclose:true,
			});
		}
	}
    
	//添加时间组
	function addTimeGroup(obj){
		var index = $("#timeGroupWrapper > .timeGroup").length;
		var timeGroupCount = parseInt(index) + 1;
		var timeGroup = $(obj).parent().parent();
		var timeGroupWrapper = $(obj).parent().parent().parent();
		var newTimeGroup = timeGroup.clone();
		//只保留一个舱位组在 新的 时间组中
		var cabinCount = newTimeGroup.find('.cabinGroup').length;
		if(cabinCount > 1){
			newTimeGroup.find('.cabinGroup').first().nextAll().remove();
		}
		newTimeGroup.find('input').val('');
		newTimeGroup.find('input[type=checkbox]').attr("checked", false);
		newTimeGroup.find('.timeTitle').text('时间组'+ timeGroupCount);
		newTimeGroup.find('.timeGroupBtn').text('删除时间组').addClass('removeGroup');
		newTimeGroup.find('.timeGroupBtn').attr("onclick", "removeGroup(this,'time');");
		//添加vim绑定
		newTimeGroup.find('.isReturnTtipHook').attr('v-show','isReturnTtip');
		//更改时间组name下标
		newTimeGroup.find('.billingStartTimeHook').attr('name', 'timeGroups['+index+'].billingTktTime.start');
		newTimeGroup.find('.billingEndTimeHook').attr('name', 'timeGroups['+index+'].billingTktTime.end');
		newTimeGroup.find('.departureStartTimeHook').attr('name', 'timeGroups['+index+'].departTimes.start');
		newTimeGroup.find('.departureEndTimeHook').attr('name', 'timeGroups['+index+'].departTimes.end');
		
		newTimeGroup.find('.departureApplicableDaysHook').attr('name', 'timeGroups['+index+'].departureApplicableDays');
		
		timeGroupWrapper.append(newTimeGroup);
		return false;
	}
	//添加舱位组
	function addCabinGroup(obj){
		var index = $(obj).parent().parent().parent().find('.cabinGroup').length;
		var newIndex = parseInt(index) + 1;
		var cabinGroup = $(obj).parent().parent();
		var cabinGroupWrapper = $(obj).parent().parent().parent();
		var newCabinGroup = cabinGroup.clone();
		newCabinGroup.find('input').val('');
		newCabinGroup.find('.cabinTitle').text('舱位组'+ newIndex);
		newCabinGroup.find('.cabinGroupBtn').text('删除舱位组');
		newCabinGroup.find('.cabinGroupBtn').attr("onclick","removeGroup(this,'cabin');");
		cabinGroupWrapper.append(newCabinGroup);
		return false;
	}
	//根据type删除时间组或者舱位组
	function removeGroup(obj,type) {
		$.confirm({
		    theme: 'supervan',
		    title: type == 'cabin'? '删除舱位组':'删除时间组',
		    content: type == 'cabin'? '确定要删除该舱位组吗？':'确定要删除该时间组吗？',
		    buttons: {
		        confirm: {
		        	text: '确定',
		        	action: function () {
		        		if(type === 'cabin'){
			        		var cabinGroupWrapper = $(obj).parent().parent().parent();
				        	var index = cabinGroupWrapper.find('.cabinGroup').length;
			        		$(obj).parent().parent().remove();
			    	        for(i = $(obj).index() - 1; i < index; i++){
			    	            newNum = i + 1;
			    	            cabinGroupWrapper.find('.cabinGroup').eq(i).find(".cabinTitle").text("舱位组" + newNum);
			    	        }        			
		        		}
			        	if(type === 'time'){
			        		var index = $("#timeGroupWrapper > .timeGroup").length;
			        		$(obj).parent().parent().remove();
			    	        for(i = $(obj).index() - 1; i < index; i++){
			    	            newNum = i + 1;
			    	            $("#timeGroupWrapper > .timeGroup").eq(i).find(".timeTitle").text("时间组" + newNum);
			    	        }
			        	}
		            }
		        },
		        cancel: {
		        	text: '取消'
		        }
		    }
		});
	}
	
	function workTimeReload(option) {
		/**
		 * option ： 0 仅清空 option : 1 回到页面初始状态
		 */
		if (option == 0) {
			emptyWorkTime();
		} else if (option == 1) {
			if (isNull(tempIssueTktStr)) {
				emptyWorkTime();
			} else {
				$("#issueTktStr").attr("value", tempIssueTktStr);
				$("#invalidTktStr").attr("value", tempInvalidTktStr);
				resetWeekListThroughTimeStr();
			}
		}
		bgBlueBind();
	}
	function emptyWorkTime() {
		$("#issueTktStr").attr("value", "");
		$("#invalidTktStr").attr("value", "");
		resetWeekListThroughTimeStr();
		var weekArr = [ "周一", "周二", "周三", "周四", "周五", "周六", "周日", "法定节假日" ];
		var html = "";
		weekArr.forEach(function(e) {
			html += "<span class=''>" + e + "</span>";
		});
		$(".weekTime").each(function() {
			$(this).append(html);
		});
		$(".checkedWeekDiv").empty();
	}
	function resetWeekListThroughTimeStr() {
		$(".weekTime").html("&nbsp;");
		resetWeekList("issueTkt");
		resetWeekList("invalidTkt");
		bgBlueBind();
	}
	
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
			url: '<%=basePath%>pricing/checkOfficeNum',
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
	//返回
	function back() {
		window.history.go(-1);
	}
	//保存
	function save(){
		console.log($("#comboSelectPcc").val());
		console.log($("#comboSelectLabel").val());
		<%-- if(checkEndTime()){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>'+$("#pricingForm").attr("action"),
		    	data: $("#pricingForm").serialize(),
				cache: false,
				success: function(data){
					 if(0 == data.status){
						window.location.href = "<%=basePath%>pricing/list";
					 }else{
						alert(data.msg);
					 }
				}
			});
		}else{return false;} --%>
		
	}
	
	/* function initSaveButton() {
		$('#btnSave').click(function() {
			$('#btnSave').attr("disabled", "disabled");
			$("#btnSave").off("click");
			// filterAirports();
			if ($("select[name='work']").val() == "1" && !validateWorkTime()) {
				workTimeReload();
				errorTimeSet();
				initSaveButton();
				$('#btnSave').removeAttr("disabled");
				return;
			} else if($("select[name='work']").val() == "0") {
				$("#issueTktStr").attr("value","");
				$("#invalidTktStr").attr("value","");
			}
			if (valideFrom('pricingForm')) {
				completeHideInputValue();
				getTimeAndCabin();
				$.ajax({
					type : "POST",
					url : basepath + "/pricing/savePolicy",
					data : $("#internatPolicyForm").serialize(),
					success : function(result) {
						if (result.status == "SUCCESS") {
							location.href = "policyListPage";
						} else {
							$('#btnSave').removeAttr("disabled");
							initSaveButton();
							messagePopWindow(result.data);
						}
					},
					error : function(result) {
						$('#btnSave').removeAttr("disabled");
						initSaveButton();
						messagePopWindow(result.responseText);
					}
				})
			} else if (isNotEmpty(validateOfficeId())) {
				$('#btnSave').removeAttr("disabled");
				initSaveButton();
				messagePopWindow(validateOfficeId());
			} else {
				$('#btnSave').removeAttr("disabled");
				initSaveButton();
			}
		})
	} */
	
	function previewWorkTime(){
		$("#viewIssue").empty();
		$("#previewIssue .v-chooseAdd").empty();
		$("#viewInvalid").empty();
		$("#previewInvalid .v-chooseAdd").empty();
		if ($("#work option:selected").val() == 1) {
			createPreviewPart($("#issueTktStr").val(), "previewIssue");
			createPreviewPart($("#invalidTktStr").val(), "previewInvalid");
		} else {
			// 默认
			createPreviewPart($("#defaultIssueTime").val(), "previewIssue");
			createPreviewPart($("#defaultInvalidTime").val(), "previewInvalid");
		}
		$(".viewTime").show();
	}
	
	function workTimeView() {
		if ($("#work option:selected").val() == 1) {
			tempIssueTktStr = $("#issueTktStr").val();
			tempInvalidTktStr = $("#invalidTktStr").val();
			$(".commonbg").show();
			$(".workTime").show();
			heightAuto();
		}
	}
	
	function createPreviewPart(workTimeStr, id) {
		if (isTktSet(workTimeStr)) {
			console.log('.....');
			var weekArr = [ "周一", "周二", "周三", "周四", "周五", "周六", "周日", "法定节假日" ];
			// key : time 12:10-23:21 value : 周一/周二
			var workTimeArr = workTimeStr.split("/");
			var map = new Map();
			for (var i = 0; i < 8; i++) {
				if (workTimeArr[i] != "") {
					if (map.get(workTimeArr[i]) == null) {
						map.set(workTimeArr[i], weekArr[i]);
					} else {
						map.set(workTimeArr[i], map.get(workTimeArr[i]) + "/" + weekArr[i]);
					}
				}
			}
			var weekChinese = "";
			var time = "";
			map.forEach(function(value, key, map) {
				weekChinese += "<p class='v-weekTime'>";
				if (isNotEmpty(value)) {
					var arr = value.split("/");
					for (var i = 0; i < arr.length; i++) {
						weekChinese += "<span>" + arr[i] + "</span>";
					}
				}
				if (key == "00:00-00:00") {
					time += "<p>全天休息</p>";
				} else if (key == "00:00-23:59") {
					time += "<p>24小时</p>";
				} else {
					time += "<p>" + key + "</p>";
				}
				weekChinese += "</p>";
			});
			if (id == "previewIssue") {
				$("#viewIssue").append(weekChinese);
				$("#previewIssue .v-chooseAdd").append(time);
			} else if (id == "previewInvalid") {
				$("#viewInvalid").append(weekChinese);
				$("#previewInvalid .v-chooseAdd").append(time);
			}

		}
	}
	
	function addWorkTime(obj) {
		var divId = $(obj).closest("div").parent().attr("id");
		var optionValue;
		$("#" + divId + " input[name='ct01']").each(function() {
			if (this.checked) {
				optionValue = $(this).attr("value");
			}
		});
		var weekList = $("#" + divId + " span[class='bgBlue']");
		var fromHour = $("#" + divId + " select[name='fromHour']").val();
		var fromMinute = $("#" + divId + " select[name='fromMinute']").val();
		var toHour = $("#" + divId + " select[name='toHour']").val();
		var toMinute = $("#" + divId + " select[name='toMinute']").val();
		var weekList = $("#" + divId + " span[class='bgBlue']");
		// 在没有选择星期或者没有选择具体的时间，返回
		if (isNull(optionValue) || weekList.length == 0) {
			return;
		} else if(optionValue=="0" && (fromHour > toHour || (toHour == fromHour && fromMinute > toMinute))) {
			errorTimeSet();
			return;
		}
		// 将timeStr重置
		resetTimeStr(divId);
		// 根据timeStr做效果展示
		resetWeekList(divId);
		bgBlueBind();
	}
	
	function errorTimeSet(){
		$.alert({
		    title: '提示',
		    content: '起始时间不得晚于结束时间！'
		});
	}
	
	function resetTimeStr(divId) {
		var optionValue;
		$("#" + divId + " input[name='ct01']").each(function() {
			if (this.checked) {
				optionValue = $(this).attr("value");
			}
		});
		var timeZone = "";
		if (optionValue == "0") {
			timeZone = $("#" + divId + " select[name='fromHour']").val() + ":" + $("#" + divId + " select[name='fromMinute']").val() + "-"
					+ $("#" + divId + " select[name='toHour']").val() + ":" + $("#" + divId + " select[name='toMinute']").val();
		} else if (optionValue == "1") {
			timeZone = "00:00-23:59";
		} else if (optionValue == "2") {
			timeZone = "00:00-00:00";
		}

		var timeStr = $("#" + divId + "Str").attr("value");
		var timeArr;
		if (timeStr == null || timeStr == "") {
			timeArr = [ "", "", "", "", "", "", "", "" ];
		} else {
			timeArr = timeStr.split("/");
		}

		var weekList = $("#" + divId + " span[class='bgBlue']");
		weekList.each(function() {
			timeArr[weekTextToIdx($(this).text())] = timeZone;
			$(this).remove();
		})
		timeStr = strArrToStr(timeArr);

		$("#" + divId + "Str").attr("value", timeStr);
	}
	
	// 根据timeStr做效果展示
	function resetWeekList(divId) {
		var weekArr = [ "周一", "周二", "周三", "周四", "周五", "周六", "周日", "法定节假日" ];
		var timeArr = $("#" + divId + "Str").val().split("/");
		if (timeArr == null || timeArr.length != 8) {
			return;
		}
		// key : time 12:10-23:21 value : 周一/周二
		var map = new Map();
		for (var i = 0; i < 8; i++) {
			if (timeArr[i] != "") {
				if (map.get(timeArr[i]) == null) {
					map.set(timeArr[i], weekArr[i]);
				} else {
					map.set(timeArr[i], map.get(timeArr[i]) + "/" + weekArr[i]);
				}
			}
		}
		var html = "";
		map.forEach(function(value, key, map) {
			html += "<p class='" + divId + "CheckedWeek weekTime marginLeft20'>";
			if (value != null && value != "") {
				var arr = value.split("/");
				for (var i = 0; i < arr.length; i++) {
					html += "<span>" + arr[i] + "</span>";
				}
				if (key == "00:00-00:00") {
					html += "<label style='display: inline-block;'>全天休息</label>";
				} else if (key == "00:00-23:59") {
					html += "<label style='display: inline-block;'>24小时</label>";
				} else {
					html += "<label style='display: inline-block;'>" + key + "</label>";
				}
				html += "<i class='item-del' onclick='delChoosedWorkTime(this)'><img src='http://static.op1.tdxinfo.com/images/deleteButton1.gif'/></i>";
			}
			html += "</p>";
		});
		$("#" + divId + " div[class='checkedWeekDiv']").html(html);
	}
	
	function delChoosedWorkTime(obj) {
		var id = $(obj).closest(".chooseTime").attr("id");
		var timeArr = $("#" + id + "Str").attr("value").split("/");

		$(obj).closest("p").find("span").each(function() {
			timeArr[weekTextToIdx($(this).text())] = "";
		});
		var newString = strArrToStr(timeArr);
		$("#" + id + "Str").attr("value", newString);
		resetWeekList(id);
		resetWeekButton(id);
		bgBlueBind();
	}
	
	function resetWeekButton(id) {
		var p = $("#" + id + " p[class*='weekButton']");
		var timeStrArr = $("#" + id + "Str").attr("value").split("/");
		if (null == timeStrArr) {
			return;
		}
		var weekArr = [ "周一", "周二", "周三", "周四", "周五", "周六", "周日", "法定节假日" ];
		p.empty();
		for (var i = 0; i < timeStrArr.length; i++) {
			if (timeStrArr[i] == null || timeStrArr[i] == "") {
				p.append("<span class=''>" + weekArr[i] + "</span");
			}
		}
		p.append("&nbsp;&nbsp;");
	}
	
	function bgBlueBind() {
		// 自定义工作时间添加事件
		$(".weekTime>span").on("click", function() {
			if ($(this).hasClass(".bgBlue")) {
				$(this).removeClass("bgBlue");
			} else {
				$(this).addClass("bgBlue");
			}
		})
	}
	
	function weekTextToIdx(text) {
		if (text == "周一") {
			return 0;
		} else if (text == "周二") {
			return 1;
		} else if (text == "周三") {
			return 2;
		} else if (text == "周四") {
			return 3;
		} else if (text == "周五") {
			return 4;
		} else if (text == "周六") {
			return 5;
		} else if (text == "周日") {
			return 6;
		} else if (text == "法定节假日") {
			return 7;
		}
	}
	
	// 校验工作时间，是否有，且格式是否正确
	function validateWorkTime() {
		var issueTktStr = $("#issueTktStr").attr("value");
		var refundTktStr = $("#invalidTktStr").attr("value");
		if (isTktSet(issueTktStr) && isTktSet(refundTktStr)) {
			return true;
		} else {
			return false;
		}
	}
	
	function strArrToStr(array) {
		if (null == array || array.length == 0) {
			return "";
		}
		var string = "";
		for (var i = 0; i < array.length; i++) {
			string += array[i];
			if (i != array.length - 1) {
				string += "/";
			}
		}
		return string;
	}
	
	function isTktSet(string) {
		if (string == null || string == "") {
			return false;
		}
		var array = string.split("/");
		if (array.length != 8) {
			return false;
		}
		// 12:05-23:30
		for (var i = 0; i < array.length; i++) {
			if (array[i] == "" || array[i].match(/^(([0-1]\d)|(2[0-3])):[0-6]\d-(([0-1]\d)|(2[0-3])):[0-6]\d$/) == null) {
				return false;
			}
		}
		return true;
	}
	
	function isNotEmpty(obj) {
		if (obj != null && obj != undefined && obj != "") {
			return true;
		}
		return false
	}

	function isNull(arg) {
		return !isNotEmpty(arg);
	}
	
	function heightAuto() {
		$(".commonbg div").first().css({
			top : ($(window).height() - $(".commonbg div").first().height()) / 3
		});
	}
	
	
	
	function valideFrom(formId){
		console.log('aaaaa');
		/* pricingVali.validate(); */
	}
	
</script>
</html>