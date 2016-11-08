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
	<title>照片信息-北京老照片GIS后台管理系统</title>
	<c:import url="/page/header"></c:import>
	<link rel="stylesheet" href="<%=basePath %>css/sweetalert.css">
	<link rel="stylesheet" href="css/blog.min.css">
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
	                        <span>照片信息</span>
	                    </li>
	                </ul>
	            </div>
	            <!-- END PAGE BAR -->
	            <!-- BEGIN PAGE TITLE-->
	            <h3 class="page-title"> 资源管理
	                <small>照片信息</small>
	            </h3>
	            <!-- END PAGE TITLE-->
	            <!-- END PAGE HEADER-->
	            <div class="note note-info">
	                <p> A black page template with a minimal dependency assets to use as a base for any custom page you create </p>
	            </div>
	            
	            <div class="row">
	            <div class="blog-page blog-content-2">
                   <div class="col-md-12">
                   		<div class="col-lg-8">
                             <div class="blog-single-content bordered blog-container">
                                 <div class="blog-single-head">
                                     <h1 class="blog-single-head-title">${image.title }</h1>
                                     <div class="blog-single-head-date">
                                         <i class="icon-calendar font-blue"></i>
                                         <a href="javascript:;">${image.date }</a>
                                     </div>
                                 </div>
                                 <div class="blog-single-img">
                                     <img src="http://image.pekingmemory.cn/${image.fileId }" style="max-width: 100%">
                                 </div>
                                 <div class="blog-single-desc">
                                     <p>${image.description }</p>
                                 </div>
                                 <div class="blog-single-foot">
                                     <div class="item text-center" style="padding-top: 15px;">
									  <a id="image-delete" class="btn btn-warning"><i class="fa fa-trash"></i> 删除</a>
					                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                     <a href="<%=basePath %>image/page/edit/${image.id }" class="btn btn-success"><i class="fa fa-edit"></i> 编辑</a>
									  </div>
                                 </div>
                                 
                             </div>
                       </div>
                       <div class="col-lg-4">
                       		<div class="portlet light bordered">
	                           <div class="portlet-title">
	                               <div class="caption font-dark">
	                                   <i class="fa fa-leaf"></i>
	                                   <span class="caption-subject bold uppercase">照片元数据</span>
	                               </div>
	                               <div class="tools"> </div>
	                           </div>
	                           <div class="portlet-body">
	                           		<dl>
                                        <dt>题名：</dt>
                                        <dd>${image.title }</dd>
                                        <fieldset></fieldset>
                                        
                                        <dt>主题：</dt>
                                        <dd>${image.subject }</dd>
                                        <fieldset></fieldset>
                                        
                                        <dt>来源：</dt>
                                        <dd>${image.source }</dd>
                                        <fieldset></fieldset>
                                        
                                        <dt>标签：</dt>
                                        <dd>${image.tag }</dd>
                                        
                                        <fieldset></fieldset>
                                        <dt>形成时间：</dt>
                                        <dd>${image.date }</dd>
                                        
                                        
                                        <fieldset></fieldset>
                                        <dt>地理位置：</dt>
                                        <dd>${location.lng } ， ${location.lat }<br/>
                                        ${location.address }
                                        </dd>
                                        <fieldset></fieldset>
                                        <dt>详细地址：</dt>
                                        <dd>${image.address }</dd>
                                        <fieldset></fieldset>
                                        <dt>照片类型</dt>
                                        <dd>${image.type }</dd>
                                        
                                        <fieldset></fieldset>
                                        <dt>创建者：</dt>
                                        <dd>${image.creator }</dd>
                                        <fieldset></fieldset>
                                        <dt>出版者：</dt>
                                        <dd>${image.publisher }</dd>
                                        <fieldset></fieldset>
                                        <dt>其他责任者：</dt>
                                        <dd>${image.contributor }</dd>
                                        <fieldset></fieldset>
                                        <dt>资源上传者</dt>
                                        <dd>${user.username }</dd>
                                        
                                    </dl>
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
   <script type="text/javascript" src="<%=basePath%>js/sweetalert.min.js"></script>
    
    <script type="text/javascript">
    $(function(){
			$('#image-delete').click(function(){
			   var url = "<%=basePath%>image/delete/${image.id }";
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
									window.location.href="<%=basePath%>map/image/${location.id }";
								}
							);
						}else{
							swal("Error", data.error, "error");
						}
					});
				})
			});
		});
    
    	$('#resource_admin').addClass('active');
    </script>
</body>
</html>