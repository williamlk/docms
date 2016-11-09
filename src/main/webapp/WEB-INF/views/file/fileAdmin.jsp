<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>文件管理-DOCMS后台管理系统</title>
	<c:import url="/page/header"></c:import>
	<link href="css/datatable/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="css/datatable/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<!-- top navbar-->
    <c:import url="/page/topNavBar"></c:import>
    
    <!-- BEGIN CONTAINER -->
    <div class="page-container">
	    <!-- sidebar-->
	    <c:import url="/page/sideBar"></c:import>
	    <!-- BEGIN CONTENT -->
	    <div class="page-content-wrapper">
	        <!-- BEGIN CONTENT BODY -->
	        <div class="page-content">
	            <!-- BEGIN PAGE HEADER-->
	            <!-- BEGIN PAGE BAR -->
	            <div class="page-bar">
	                <ul class="page-breadcrumb">
	                    <li>
	                        <a href="<%=basePath%>dashboard">控制台</a>
	                        <i class="fa fa-circle"></i>
	                    </li>
	                    <li>
	                        <span>文件管理</span>
	                    </li>
	                </ul>
	            </div>
	            <!-- END PAGE BAR -->
	            <!-- BEGIN PAGE TITLE-->
	            <h3 class="page-title"> 文件管理
	                <small>文件列表</small>
	            </h3>
	            <!-- END PAGE TITLE-->
	            
	            <div class="row">
                   <div class="col-md-12">
                       <!-- BEGIN EXAMPLE TABLE PORTLET-->
                       <div class="portlet light bordered">
                           <div class="portlet-title">
                               <div class="caption font-dark">
                                   <i class="icon icon-user"></i>
                                   <span class="caption-subject bold uppercase">文件列表</span>
                               </div>
                               <div class="tools"> </div>
                           </div>
                           <div class="portlet-body">
                               <table class="table table-striped table-bordered table-hover" id="datatable">
                                   <thead>
                                       <tr>
										   <th> 序号 </th>
                                           <th> 文件名 </th>
                                           <th> 描述 </th>
                                           <th> 上传人 </th>
                                           <th> 上传时间</th>
										   <th> 状态 </th>
                                           <th> 操作 </th>
                                       </tr>
                                   </thead>
                                   <tbody></tbody>
                               </table>
                           </div>
                       </div>
                     </div>
                 </div>
                 
	        </div>
	    </div>
    </div>
	
	<c:import url="/page/bottom"></c:import>
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="js/datatable/datatable.js" type="text/javascript"></script>
    <script src="js/datatable/datatables.min.js" type="text/javascript"></script>
    <script src="js/datatable/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
   <!--  <script src="js/datatable/table-datatables-buttons.min.js" type="text/javascript"></script> -->
    <script src="js/datatable/bootstrap-datepicker.min.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    	$(function(){
			/*
    		var table = $('#datatable').dataTable({
    	    	"ajax": "<%=basePath%>user/userData",
    			"columns": [
    		        { "data": "name" },
    		        { "data": "email" },
    		        { "data": "phone" },
    		        { "data": "status" },
    		        {
    	                "data": null,
    	                "defaultContent": '<div class="btn-group"><button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> 操作<i class="fa fa-angle-down"></i></button><ul class="dropdown-menu" role="menu"><li><a href="javascript:;"><i class="icon-docs"></i> 查看 </a></li><li><a href="javascript:;"><i class="icon-tag"></i> 禁用 </a></li></ul></div>'
    	            } 
    		    ],
    		    "deferRender": true,
    		    "language" : { "url" : "<%=basePath%>js/de_CN.json" },
    	    });
    		*/
			/*
    		$('#user_admin').addClass('active open');
    		$('#user_admin .arrow').addClass('open');
    		$('#user_admin_li').addClass('active open');
			*/
			$('#file_admin').addClass('active');
    	});
    	
    	
    
    </script>
    
</body>
</html>