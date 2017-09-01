<%
	String pathl = request.getContextPath();
	String basePathl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathl+"/";
%>
		<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
		<div id="sidebar" class="menu-min">

				<div id="sidebar-shortcuts">

					<div id="sidebar-shortcuts-large">
						<button class="btn btn-small btn-success" onclick="changeMenu();" title="切换菜单"><i class="icon-pencil"></i></button>
					</div>

					<div id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>

				</div><!-- #sidebar-shortcuts -->


				<ul class="nav nav-list">

					<li class="active" id="fhindex">
					  <a href="main/index"><i class="icon-dashboard"></i><span>后台首页</span></a>
					</li>
					
					<li id="sysMenu">
					  <a style="cursor:pointer;" class="dropdown-toggle" >
						<i class="icon-desktop"></i>
						<span>系统管理</span>
						<b class="arrow icon-angle-down"></b>
					  </a>
					  <ul class="submenu">
						<li id="sysSubUser">
							<a style="cursor:pointer;" target="mainFrame"  onclick="siMenu('sysSubUser','sysMenu','系统用户','user/list')"><i class="icon-double-angle-right"></i>系统用户</a>
						</li>
				  	  </ul>
					</li>
					<li id="providerMenu">
					  <a style="cursor:pointer;" class="dropdown-toggle" >
						<i class="icon-list-alt"></i>
						<span>供应商管理</span>
						<b class="arrow icon-angle-down"></b>
					  </a>
					  <ul class="submenu">
						<li id="providerSubList">
							<a style="cursor:pointer;" target="mainFrame"  onclick="siMenu('providerSubList','providerMenu','供应商信息','provider/list')"><i class="icon-double-angle-right"></i>供应商信息</a>
						</li>
				  	  </ul>
					</li>

				</ul><!--/.nav-list-->

				<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>

			</div><!--/#sidebar-->

