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
		<form action="pricing/labelList" method="post" name="pricingSearchForm" id="pricingSearchForm">
			<div class="formWrapper form-horizontal" style="with:100%;display:flex;">
				<div class="formLeft" style="flex:1;">
					<div class="form-group">
					    <label for="inputEmail3" class="control-label lableWidth100 marginRight10">标签名称</label>
					    <input type="email" class="form-control" id="inputEmail3" placeholder="">
					</div>
				</div>
				<div class="formRight" style="flex:1;">
					<div style="text-align: right;">
						<button type="submit" class="btn btn-primary" style="margin-right: 17%;line-height: 25px;padding: 0 20px;border-radius:5px !important;">查询</button>
					</div>
				</div>
			</div>
			<!-- 检索  -->
			
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th class="center"></th>
						<th>标签名称</th>
						<th>关联政策</th>
						<th>备注</th>
						<th>修改时间</th>
						<th>操作员</th>
						<th>操作</th>
					</tr>
				</thead>
										
				<tbody>
					<!-- 开始循环 -->	
					<c:choose>
						<c:when test="${not empty pricingLabels}">
							<c:forEach items="${pricingLabels}" var="pricingLabel" varStatus="vs">
								<tr>
									<td class='center' style="width: 30px;">
										<label><input type="checkbox" name="ids" value="${pricingLabel.id }"/><span class="lbl"></span></label>
									</td>
									<td><a>${pricingLabel.title }</a></td>
									<td>${pricingLabel.pricingKeys.size }</td>
									<td>${pricingLabel.remark}</td>
									<td><fmt:formatDate value="${pricingLabel.updateTime}" type="both"/></td>
									<td>${pricingLabel.operatorName}</td>
									<td>
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
							<a class="btn btn-small btn-success" onclick="add();">添加标签</a> 
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
  
  <div class="modal fade" id="labelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="labelModalLabel"></h4>
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
			$("#labelModalLabel").text("添加标签");
			 $("#labelModal").modal({
				 remote: "<%=basePath%>pricing/goAddLabel"
			 })
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

