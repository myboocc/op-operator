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
	<!-- jsp文件头和头部 -->
	<%@ include file="../system/admin/top.jsp"%>
	<style type="text/css">
		.formWrapper{margin-bottom: 10px;}
		.lableWidth100{width: 100px !important;}
		.marginRight10{margin-right: 10px !important;}
		.form-group{margin-bottom: 10px;}
	</style>
	</head> 
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
		<!-- 检索  -->
		<form action="pricing/list" method="post" name="pricingSearchForm" id="pricingSearchForm">
			<div class="formWrapper form-horizontal" style="with:100%;display:flex;">
				<div class="formLeft" style="flex:1;">
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">政策ID</label>
					    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">出发机场</label>
					    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
				  	</div>
				  	<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">航程类型</label>
					    <select class="form-control">
						  <option>所有</option>
						  <option>单程</option>
						  <option>往返</option>
						</select>
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">政策标签</label>
					    <select class="form-control">
						  <option>所有</option>
						</select>
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">开票有效期</label>
					    <input class="span10 date-picker" name="startTime" id="lastLoginStart"  value="${startTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title=""/>
						<span>至</span>
						<input class="span10 date-picker" name="endTime" value="${endTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title=""/>
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">去程有效期</label>
					    <input class="span10 date-picker" name="startTime" id="lastLoginStart"  value="${startTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title=""/>
						<span>至</span>
						<input class="span10 date-picker" name="endTime" value="${endTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title=""/>
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">发布日期</label>
					    <input class="span10 date-picker" name="startTime" id="lastLoginStart"  value="${startTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title=""/>
						<span>至</span>
						<input class="span10 date-picker" name="endTime" value="${endTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title=""/>
					</div>
				</div>
				<div class="formMiddle" style="flex:1;">
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">适用航司</label>
					    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">到达机场</label>
					    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
					<div class="form-group">
				    	<label for="inputEmail3" class="control-label lableWidth100 marginRight10">乘客类型</label>
					    <select class="form-control">
						  <option>所有</option>
						  <option>成人</option>
						  <option>儿童</option>
						  <option>婴儿</option>
						</select>
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">审核类型</label>
					    <select class="form-control">
						  <option>所有</option>
						  <option>自动</option>
						  <option>人工</option>
						</select>
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">出票类型</label>
					    <select class="form-control">
						  <option>所有</option>
						  <option>自动</option>
						  <option>人工</option>
						</select>
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">发布人</label>
					    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">排序方式</label>
					    <select class="form-control">
						  <option>按修改时间</option>
						</select>
					</div>
				</div>
				<div class="formRight" style="flex:1;">
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">适用舱位</label>
					    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">供应商</label>
				      	<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
				    </div>
				    <div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">OFFICE号</label>
					    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">代理费</label>
					    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">&nbsp;&nbsp;%
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">政策类型</label>
					    <select class="form-control">
						  <option>普通政策</option>
						</select>
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">政策状态</label>
					    <select class="form-control">
						  <option>所有</option>
						  <option>已发布</option>
						  <option>已挂起</option>
						  <option>已过期</option>
						  <option>已作废</option>
						</select>
					</div>
					<div style="text-align: right;">
						<button type="submit" class="btn btn-primary" style="margin-right: 17%;line-height: 25px;padding: 0 20px;border-radius:5px !important;">查询</button>
					</div>
				</div>
			</div>
			
			<!-- 检索  -->
			
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr style="background: rgb(215,215,215);">
						<th class="center">
							<label><input type="checkbox" id="zcheckbox" /><span class="lbl">全选1000条</span></label>
						</th>
						<th><center><a href="#">发布</a></center></th>
						<th><center><a href="#">挂起</a></center></th>
						<th><center><a href="#">作废</a></center></th>
						<th colspan="5"><font color="red">标红政策即将过期，请注意</font></th>
					</tr>
					<tr>
						<th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th>
						<th>政策ID</th>
						<th>标签</th>
						<th>固定电话</th>
						<th>紧急联系号码</th>
						<th>出票联系人</th>
						<th>结算联系人</th>
						<th>是否授权自动出票</th>
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
					<!-- 开始循环 -->	
					<c:choose>
						<c:when test="${not empty pricingList}">
							<c:forEach items="${pricingList}" var="pricing" varStatus="vs">
								<tr>
									<td class='center' style="width: 30px;">
										<label><input type="checkbox" name="ids" value="${pricing.id }"/><span class="lbl"></span></label>
									</td>
									<td><a>${pricing.name }</a></td>
									<td>${pricing.urgentContact }</td>
									<td>${pricing.telephone}</td>
									<td>${pricing.augentPhone}</td>
									<td>${pricing.ticketContact}</td>
									<td>${pricing.settlementContact}</td>
									<td>${pricing.isAuthorizePrintTicket == true?'是':'否'}</td>
									<td style="width: 60px;">
										<div class='hidden-phone visible-desktop btn-group'>
										<a class='btn btn-mini btn-info' title="查看详细信息" onclick="findpricing('${pricing.id }');"><i class='icon-file'></i></a>
											<a class='btn btn-mini btn-info' title="编辑" onclick="editpricing('${pricing.id }');"><i class='icon-edit'></i></a>
											<a class='btn btn-mini btn-danger' title="删除" onclick="delpricing('${pricing.id }','${pricing.name }');"><i class='icon-trash'></i></a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="10" class="center">没有相关数据</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr>
						<td style="vertical-align: top;">
							<a class="btn btn-small btn-success" onclick="add();">新增政策</a> 
							<a title="批量删除" class="btn btn-small btn-danger"
							onclick="delAll('确定要删除选中的数据吗?');"><i class='icon-trash'></i></a>
						</td>
						<td style="vertical-align: top;">
							<div class="pagination"
								style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
  
  <div class="modal fade" id="pricingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="pricingModalLabel"></h4>
	      </div>
	      <div class="modal-body">
	      
	      </div>
	      <div class="modal-footer text-center">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-danger" onclick="save();">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
  
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		
		
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#pricingSearchForm").submit();
		}
		
		//新增
		function add(){
			//siMenu('pricingSubList','pricingMenu','政策录入','pricing/goAddPricing');
			top.mainFrame.tabAddHandler('pricingSubList','政策录入','pricing/goAddPricing')
		}
		
		$('#pricingModal').on('hidden.bs.modal', function (e) {
			 $(this).removeData();
		})
		
		//修改
		function editpricing(pricing_id){
			 $("#pricingModalLabel").text("修改供应商");
			 $("#pricingModal").modal({
				 remote: "<%=basePath%>pricing/goEditpricing?pricingId="+pricing_id+"&t="+Math.random(1000)
			 })
		}
		
		//删除
		function delpricing(pricingId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>pricing/deletepricing?pricingId="+pricingId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		//批量删除
		function delAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str==''){
						  		str += document.getElementsByName('ids')[i].value;
						  	} else{
						  		str += ',' + document.getElementsByName('ids')[i].value;
						  	}
						  }
					}
					console.log(str);
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									
									}
								}
							 ]
						);
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>pricing/deleteMultipricings?tm='+new Date().getTime(),
						    	data: {pricingIds : str},
								dataType:'json',
								cache: false,
								success: function(data){
									if(0 == data.status){
										<%-- window.location.href = "<%=basePath%>pricing/list"; --%>
										nextPage(${page.currentPage});
									 }else{
										 bootbox.dialog(data.msg, 
													[
													  {
														"label" : "关闭",
														"class" : "btn-small btn-success"
														}
													 ]
												);
										/* alert(data.msg); */
									 }
								}
							});
						}
					}
				}
			});
		}
		
		//全选非全选
		$("#zcheckbox").click(function() {
            $('input[name="ids"]').attr("checked",this.checked); 
        });
        var $subBox = $("input[name='ids']");
        $subBox.click(function(){
            $("#zcheckbox").attr("checked",$subBox.length == $("input[name='ids']:checked").length ? true : false);
        });
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			//日期框
			$('.date-picker').datepicker();
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			
		});
		</script>
		
	</body>
</html>

