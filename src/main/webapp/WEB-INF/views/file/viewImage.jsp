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
	<title>瀑布流照片-北京老照片GIS后台管理系统</title>
	<c:import url="/page/header"></c:import>
	<link rel="stylesheet" href="<%=basePath %>css/gallery.css">
	<link rel="stylesheet" href="<%=basePath %>css/sweetalert.css">
	<style type="text/css">
		.gallery .image {
		    width: 25% !important;
		}
	</style>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid">
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
	                        <span>瀑布流</span>
	                    </li>
	                </ul>
	            </div>
	            <!-- END PAGE BAR -->
	            <!-- BEGIN PAGE TITLE-->
	            <h3 class="page-title"> 资源管理
	                <small>瀑布流照片查看</small>
	            </h3>
	            <!-- END PAGE TITLE-->
	            <!-- END PAGE HEADER-->
	            <div class="note note-info">
	                <p> A black page template with a minimal dependency assets to use as a base for any custom page you create </p>
	            </div>
	            
	            <div class="row">
               		<div class="col-md-12">
                  
                     	<div id="options" class="m-b-10">
                     	<div class="row">
                     	<div class="col-md-8">
			                <span class="gallery-option-set" id="filter" data-option-key="filter">
			                    <a href="#show-all" class="btn btn-info active" data-option-value="*">
			                        全部
			                    </a>
			                    <a href="#建筑风貌" class="btn btn-info" data-option-value=".建筑风貌">
			                        建筑风貌
			                    </a>
			                    <a href="#历史事件" class="btn btn-info" data-option-value=".历史事件">
			                        历史事件
			                    </a>
			                    <a href="#生活文化" class="btn btn-info" data-option-value=".生活文化">
			                        生活文化
			                    </a>
			                    <a href="#人物写真" class="btn btn-info" data-option-value=".人物写真">
			                        人物写真
			                    </a>
			                </span>
			            </div>
			            <div class="col-md-4">
			            <div class="pull-right">
			            	<a href="<%=basePath %>image/view/timeline/${locationId}" class="btn btn-success">
			                        <i class="fa fa-list-ul"></i>  时间轴查看
			                </a>
			                <a href="<%=basePath%>map/image/${locationId}" class="btn btn-success">
			                        <i class="fa fa-table"></i>  列表查看
			                </a>
			            </div>
			            </div>
			            </div>
			            </div>
                        <div id="gallery" class="gallery">
                        	<c:forEach var="image" items="${imageList }">
				                <div class="image ${image.type }">
				                    <div class="image-inner">
				                        <a href="http://image.pekingmemory.cn/${image.fileId }" data-lightbox="gallery-group-1">
				                            <img src="http://image.pekingmemory.cn/${image.thumbnailId }" alt="" />
				                        </a>
				                        <p class="image-caption">
				                            #${image.date }
				                        </p>
				                    </div>
				                    <div class="image-info">
				                        <div class="row">
				                        	<div class="col-md-6">
				                        		<h5 class="title">${image.title }</h5>
				                        	</div>
				                        	<div class="col-md-6">
				                        	<div class="pull-right">
				                        		<a class="btn btn-default btn-xs" href="<%=basePath %>image/info/${image.id}" title="查看">
				                        			<i class="fa fa-search"></i>
			                      				</a>
				                        		<a class="btn btn-default btn-xs" href="<%=basePath %>image/page/edit/${image.id}" title="编辑">
				                        			<i class="fa fa-edit"></i>
			                      				</a>
			                      				<a class="btn btn-default btn-xs" id="delete-img" title="删除" data-attr="${image.id}">
				                        			<i class="fa fa-trash"></i>
			                     				</a>
				                        	</div>
				                        	</div>
				                        </div>
				                        <div class="pull-right">
				                            <small>by</small> <a href="javascript:;">${image.creator }</a>
				                        </div>
				                        <div class="rating">
				                        </div>
				                        <div class="desc">
				                            ${image.description }
				                        </div>
				                    </div>
				                </div>
                        	</c:forEach>
			            </div>
            	<!-- END of the MAP box -->
            	</div>
            </div>
	        </div>
	    </div>
	    
    </div>
	
	<c:import url="/page/bottom"></c:import>
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script type="text/javascript" src="<%=basePath%>js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/lightbox-2.6.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/gallery.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/sweetalert.min.js"></script>
    <script type="text/javascript">
	   $(function(){
		   Gallery.init();
		   
		   //照片删除
		   $('#delete-img').click(function(){
			   var imageId = $(this).attr('data-attr');
			   var url = "<%=basePath%>image/delete/"+imageId;
			   swal(
			   {   
					title: "Are you sure?",   
					text: "是否确认删除该照片",   
					type: "warning",   
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",   
					confirmButtonText: "  OK  ",
					cancelButtonText: "Cancel",
					closeOnConfirm: false,
				}, function(){
					$.get(url).done(function(data){
						if(data.status==1000){
							swal(
								{
									title: "Success",   
									text: "已成功删除该照片",
									type: "success",   
									confirmButtonText: "  OK  ",
									closeOnConfirm: false,
								},function(){
									window.location.reload();
								}
							);
						}else{
							swal("Error", data.error, "error");
						}
					});
				})
			   
		   });
		   
		   $('#resource_admin').addClass('active');
	   });
   </script>
</body>
</html>