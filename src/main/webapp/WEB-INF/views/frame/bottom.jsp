<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	
	<!-- BEGIN FOOTER -->
    <div class="page-footer">
        <div class="page-footer-inner"> &copy; 2016 - <a href="http://www.irm.cn" title="" target="_blank">软件开发中心上海研发部</a>
            <!-- <a href="http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes" title="Purchase Metronic just for 27$ and get lifetime updates for free" target="_blank">Purchase Metronic!</a> -->
        </div>
        <div class="scroll-to-top">
            <i class="icon-arrow-up"></i>
        </div>
    </div>
    <!-- BEGIN CORE PLUGINS -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/js.cookie.min.js" type="text/javascript"></script>
    <script src="js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
    <script src="js/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="js/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="js/bootstrap-switch.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="js/raphael-min.js" type="text/javascript"></script>
    <script src="js/jquery.waypoints.min.js" type="text/javascript"></script>
    
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="js/app.min.js" type="text/javascript"></script>
    <!-- BEGIN THEME LAYOUT SCRIPTS -->
    <script src="js/layout/layout.min.js" type="text/javascript"></script>
    <script src="js/layout/demo.min.js" type="text/javascript"></script>
    <script src="js/layout/quick-sidebar.min.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    	$(function(){
    		$('#logout').click(function(){
    			$.get('<%=basePath%>user/logout').done(function(data){
    				if(data.status==1000){
    					window.location.href="<%=basePath%>";
    				}
    			});
    		});
    	});
    </script>
    
    