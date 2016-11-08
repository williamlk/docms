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
	<title>时间轴查看-北京老照片GIS后台管理系统</title>
	<c:import url="/page/header"></c:import>
	<link rel="stylesheet" href="">
	<style type="text/css">
		.border-grey-salt{
			border-color: #bfcad1!important;
		}
		.bg-red {
		    background: #e7505a!important;
		}
		.bg-font-red {
		    color: #fff!important;
		}
		.mt-timeline-2>.mt-container>.mt-item>.mt-timeline-icon {
		    width: 70px;
		    height: 70px;
		    background-color: #ccc;
		    border-radius: 50%!important;
		    position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    z-index: 5;
		    border: 0;
		    overflow: hidden;
		}
	</style>
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
	                        <span>资源管理</span>
	                        <i class="fa fa-circle"></i>
	                    </li>
	                    <li>
	                        <span>查看照片</span>
	                    </li>
	                </ul>
	            </div>
	            <!-- END PAGE BAR -->
	            <!-- BEGIN PAGE TITLE-->
	            <h3 class="page-title"> 资源管理
	                <small>时间轴查看</small>
	            </h3>
	            <!-- END PAGE TITLE-->
	            <!-- END PAGE HEADER-->
	            <div class="note note-info">
	                <p> A black page template with a minimal dependency assets to use as a base for any custom page you create </p>
	            </div>
	            
	            <div class="row">
                   <div class="col-md-12">
                       <!-- BEGIN EXAMPLE TABLE PORTLET-->
                       <div class="portlet light bordered">
                           <div class="portlet-title">
                               <div class="caption font-dark">
                                   <i class="icon icon-user"></i>
                                   <span class="caption-subject bold uppercase">照片列表</span>
                               </div>
                               <div class="actions">
                               <a href="<%=basePath %>image/view/timeline/${locationId}" class="btn btn-success">
			                        <i class="fa fa-list-ul"></i>  时间轴查看
				                </a>&nbsp;&nbsp;
				                <a href="<%=basePath %>image/view/${locationId}" class="btn btn-success">
				                        <i class="fa fa-th"></i>  瀑布流查看
				                </a>
                                </div>
                           </div>
                           <div class="portlet-body">
                           	<div class="mt-timeline-2">
                                <div class="mt-timeline-line border-grey-steel"></div>
                                <ul class="mt-container">
                                <c:forEach var="image" items="${imageList }">
                                    <li class="mt-item">
                                        <div class="mt-timeline-icon bg-red bg-font-red border-grey-steel">
                                            <i class="icon-tag"></i>
                                        </div>
                                        <div class="mt-timeline-content">
                                            <div class="mt-content-container">
                                                <div class="mt-title">
                                                    <h3 class="mt-content-title">${image.title }</h3>
                                                </div>
                                                <div class="mt-author">
                                                    <div class="mt-author-name">
                                                        <a href="javascript:;" class="font-blue-madison">${image.creator }</a>
                                                    </div>
                                                    <div class="mt-author-notes font-grey-mint">${image.date }</div>
                                                </div>
                                                <div class="mt-content border-grey-salt">
                                                	<div class="text-center"><img class="img-responsive img-thumbnail img-area" src="http://image.pekingmemory.cn/${image.fileId }" alt="${image.title }" style="max-width: 90%"></div>
                                                    <p>${image.description }</p>
                                                    <a href="<%=basePath %>image/info/${image.id}" class="btn green-turquoise"><i class="fa fa-search"></i>查看</a>
                                                    <a href="<%=basePath %>image/page/edit/${image.id}" class="btn yellow"><i class="fa fa-edit"></i>编辑</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                           
                           </div>
                       </div>
                     </div>
                 </div>
	            
	            
	        </div>
	    </div>
	    
    </div>
	
	<c:import url="/page/bottom"></c:import>
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="js/pages/dashboard.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    	
    
    	$('#resource_admin').addClass('active');
    </script>
</body>
</html>