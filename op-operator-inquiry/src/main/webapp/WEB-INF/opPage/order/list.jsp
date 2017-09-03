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
	</head> 
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix page-content">
  <div class="row-fluid">
	<div class="row-fluid">
		<!-- 检索  -->
				<form class="form-horizontal" role="form">
					<div class="form-group formWrapper">
						<div class="flex3">
							<span class="mb20"><label class="control-label lableWidth100 marginRight10">订单号</label><input type="text"></span>
							<span class="mb20"><label class="lableWidth100 control-label marginRight10">PNR</label><input type="text"></span>
						</div>
						<div class="flex3">
							<span class="mb20"><label class="lableWidth100 control-label marginRight10">订单起始时间</label><input class="form-control date-picker" type="text" data-date-format="dd-mm-yyyy"></span>
							<span class="mb20">
								<label class="lableWidth100 control-label marginRight10">订单类型</label>
									<select class="form-control">
										<option value="">全部</option>
										<option value="">出票</option>
										<option value="">退票</option>
										<option value="">改签</option>
									</select>
							</span>
						</div>
						<div class="flex3">
							<span class="mb20"><label class="lableWidth100 control-label marginRight10">订单截止时间</label><input class="form-control date-picker" type="text" data-date-format="dd-mm-yyyy"></span>
							<span class="mb20">
								<label class="lableWidth100 control-label marginRight10">订单状态</label>
								<select class="form-control">
									<option value="">新建</option>
									<option value="AL">待出票</option>
									<option value="AK">出票完成</option>
									<option value="AK">取消</option>
									<option value="AK">出票中</option>
									<option value="AK">出票拒绝</option>
									<option value="AK">自动出票中</option>
									<option value="AK">自动出票失败</option>
									<option value="AK">自动完成（有异常）</option>
								</select>
							</span>
						</div>
						<div class="flex3">
							<span class="mb20">
								<label class="lableWidth100 control-label marginRight10">订单来源</label>
								<select class="form-control">
									<option value="">1A(Amadues)</option>
									<option value="AL">1E(Ttavelsky)</option>
									<option value="AK">1G(Galileo)</option>
								</select>
							</span>
							<span class="mb20"><label class="lableWidth100 control-label marginRight10">票号</label><input type="text"></span>
						</div>
						<div class="flex center_btn">
							<button class="btn btn-info">查询</button>
						</div>
					</div><!-- /.row -->
				</form>
				<div class="col-xs-12">
					<div class="table-responsive">
						<table id="sample-table-1" class="table table-striped table-bordered table-hover" style="margin-top: 20px;">
							<thead>
							<tr>
								<th>日志</th>
								<th>订单号</th>
								<th>PNR</th>
								<th>票号</th>
								<th>客户名称</th>
								<th>订单类型</th>
								<th>订单状态</th>
								<th>供应商名称</th>
								<th>订单来源</th>
							</tr>
							</thead>
	
							<tbody>
							<tr>
								<td><a href="#">日志</a></td>
								<td><a href="#">2017080714252125</a></td>
								<td>ASDXXC</td>
								<td>111-1111111111</td>
								<td>不夜城</td>
								<td>出票</td>
								<td>新建</td>
								<td>南华</td>
								<td>Amadues</td>
							</tr>
							</tbody>
						</table>
					</div><!-- /.table-responsive -->
				</div>
			<!-- 检索  -->
			
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th>
						<th>客户名称</th>
						<th>GDS</th>
						<th>PCC</th>
						<th>AccountCode</th>
						<th>结算货币</th>
						<th>节假日模板</th>
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
					<!-- 开始循环 -->	
					<c:choose>
						<c:when test="${not empty providerList}">
							<c:forEach items="${providerList}" var="provider" varStatus="vs">
								<tr>
									<td class='center' style="width: 30px;">
										<label><input type="checkbox" name="ids" value="${provider.id }"/><span class="lbl"></span></label>
									</td>
									<td><a>${provider.name }</a></td>
									<td>${provider.urgentContact }</td>
									<td>${provider.urgentContact}</td>
									<td>${provider.urgentContact}</td>
									<td>${provider.urgentContact}</td>
									<td>${provider.settlementContact}</td>
									<td>${provider.isAuthorizePrintTicket == true?'是':'否'}</td>
									<td style="width: 60px;">
										<div class='hidden-phone visible-desktop btn-group'>
											<a class='btn btn-mini btn-info' title="查看详细信息" onclick="findprovider('${provider.id }');"><i class='icon-file'></i></a>
											<a class='btn btn-mini btn-info' title="编辑" onclick="editprovider('${provider.id }');"><i class='icon-edit'></i></a>
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
						<td style="vertical-align: top;"><a
							class="btn btn-small btn-success" onclick="add();">新增</a> 
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
	</div>
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
  
  <div class="modal fade" id="providerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="providerModalLabel"></h4>
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
			$("#providerSearchForm").submit();
		}
		
		//新增
		function add(){
			top.mainFrame.tabAddHandler('providerSubList','供应商录入','provider/goAddprovider');
			 <%-- $("#providerModalLabel").text("添加供应商");
			 $("#providerModal").modal({
				 remote: "<%=basePath%>provider/goAddprovider"
			 }) --%>
		}
		
		$('#providerModal').on('hidden.bs.modal', function (e) {
			 $(this).removeData();
		})
		
		//修改
		function editprovider(provider_id){
			 $("#providerModalLabel").text("修改供应商");
			 $("#providerModal").modal({
				 remote: "<%=basePath%>provider/goEditprovider?providerId="+provider_id+"&t="+Math.random(1000)
			 })
		}
		
		//删除
		function delprovider(providerId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>provider/deleteProvider?providerId="+providerId+"&tm="+new Date().getTime();
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
								url: '<%=basePath%>provider/deleteMultiProviders?tm='+new Date().getTime(),
						    	data: {providerIds : str},
								dataType:'json',
								cache: false,
								success: function(data){
									if(0 == data.status){
										<%-- window.location.href = "<%=basePath%>provider/list"; --%>
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

