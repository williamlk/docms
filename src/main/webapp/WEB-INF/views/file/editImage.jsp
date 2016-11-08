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
	<title>编辑照片-北京老照片GIS后台管理系统</title>
	<c:import url="/page/header"></c:import>
	<link rel="stylesheet" href="<%=basePath %>css/sweetalert.css">
	<style type="text/css">
		label {
			font-weight: normal;
		}
		.img-select{
			margin-bottom: 10px;
		}
		.img-area{
			height: 222px;
			margin-bottom: 10px;
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
	                        <span>编辑照片</span>
	                    </li>
	                </ul>
	            </div>
	            <!-- END PAGE BAR -->
	            <!-- BEGIN PAGE TITLE-->
	            <h3 class="page-title"> 资源管理
	                <small>编辑照片</small>
	            </h3>
	            <!-- END PAGE TITLE-->
	            <!-- END PAGE HEADER-->
	            <div class="note note-info">
	                <p> A black page template with a minimal dependency assets to use as a base for any custom page you create </p>
	            </div>
	            
	            <div class="row">
	            <form name="imageForm" enctype="multipart/form-data" role="form" class="form-horizontal">
                  <div class="col-md-5">
                       <div class="portlet light bordered">
                           <div class="portlet-title">
                               <div class="caption font-dark">
                                   <i class="fa fa-book"></i>
                                   <span class="caption-subject bold uppercase">资源内容描述类</span>
                               </div>
                               <div class="tools"></div>
                           </div>
                           <div class="portlet-body form">
                                <div class="form-body">
	                               <fieldset>
			                           <div class="img-select text-center">
			                          	 <img src="http://image.pekingmemory.cn/${image.fileId }" class="img-responsive img-thumbnail img-area">
			                          	 <br/>
			                           </div>
		                           </fieldset>
		                           <fieldset>
			            			<div class="form-group">
				                          <label class="col-sm-2 control-label">题名：</label>
				                          <div class="col-sm-9">
				                             <input type="text" name="title" class="form-control" value="${image.title }">
				                             <span class="help-block m-b-none">照片资源题名信息</span>
				                          </div>
				                    </div>
				            		</fieldset>
				            		<fieldset>
				                       <div class="form-group">
				                          <label class="col-sm-2 control-label">主题：</label>
				                          <div class="col-sm-9">
				                             <input type="text" name="subject" class="form-control" value="${image.subject }">
				                             <span class="help-block m-b-none">照片资源主题与关键语词</span>
				                          </div>
				                       </div>
				                    </fieldset>
				                    <fieldset>
				                       <div class="form-group">
				                          <label class="col-sm-2 control-label">描述：</label>
				                          <div class="col-sm-9">
				                          	 <textarea name="description" class="form-control" rows="7" style="resize: none;">${image.description }</textarea>
				                             <span class="help-block m-b-none">照片资源的内容描述信息</span>
				                          </div>
				                       </div>
				                    </fieldset>
				                    <fieldset>
				                       <div class="form-group">
				                          <label class="col-sm-2 control-label">来源：</label>
				                          <div class="col-sm-9">
				                             <input type="text" name="source" class="form-control" value="${image.source }">
				                             <span class="help-block m-b-none">照片资源的收集渠道或来源</span>
				                          </div>
				                       </div>
				                    </fieldset>
				                    <fieldset>
				                       <div class="form-group">
				                          <label class="col-sm-2 control-label">标签：</label>
				                          <div class="col-sm-9">
				                             <input type="text" name="tag" class="form-control" value="${image.tag }">
				                             <span class="help-block m-b-none">照片资源的标签Tag</span>
				                          </div>
				                       </div>
				                    </fieldset>
                                  </div>
                           		</div>
                       		</div>
                   		</div>
                   		
                   	<div class="col-md-7">
	                  <div class="portlet light bordered">
                           <div class="portlet-title">
                               <div class="caption font-dark">
                                   <i class="fa fa-map"></i>
                                   <span class="caption-subject bold uppercase">外部属性描述类</span>
                               </div>
                               <div class="tools"></div>
                           </div>
                           <div class="portlet-body form">
                                <div class="form-body">
                                  <fieldset>
			            			<div class="form-group">
				                          <label class="col-sm-2 control-label">形成时间：</label>
				                          <div class="col-sm-9">
				                             <input type="text" name="date" data-masked data-inputmask="'mask': '9999-99-99'" placeholder="Date" class="form-control" value="${image.date }">
				                             <span class="help-block m-b-none">照片资源的形成时间</span>
				                          </div>
				                    </div>
					            	</fieldset>
					            	<fieldset>
				            			<div class="form-group">
				                           <label class="col-sm-2 control-label">地理位置：</label>
				                           <div class="col-sm-10">
				                              <div class="row">
				                                 <div class="col-md-5">
				                                    <input type="text" placeholder="经度" name="lng" value="${location.lng }" disabled="disabled" class="form-control">
				                                    <span class="help-block m-b-none">经度</span>
				                                 </div>
				                                 <div class="col-md-5" style="margin-left: 6%;">
				                                    <input type="text" placeholder="纬度" name="lat" value="${location.lat }" disabled="disabled" class="form-control">
				                                    <span class="help-block m-b-none">纬度</span>
				                                 </div>
				                                 <input type="hidden" name="imageId" value="${image.id }"/>
				                              </div>
				                           </div>
				                        </div>
					            	</fieldset>
					            	<fieldset>
				            			<div class="form-group">
				                          <label class="col-sm-2 control-label">详细地址：</label>
				                          <div class="col-sm-9">
				                             <input type="text" name="address" class="form-control"  value="${image.address }">
				                             <span class="help-block m-b-none">照片资源详细精确地理位置</span>
				                          </div>
					                    </div>
					            	</fieldset>
					            	<fieldset>
				            			<div class="form-group">
				                          <label class="col-sm-2 control-label">照片类型：</label>
				                          <div class="col-sm-9">
				                              <select name="type" class="form-control m-b" value="${image.type }">
				                                 <option value="建筑风貌">建筑风貌</option>
				                                 <option value="生活文化">生活文化</option>
				                                 <option value="历史事件">历史事件</option>
				                                 <option value="人物写真">人物写真</option>
				                              </select>
				                             <span class="help-block m-b-none">照片内容所反映的类型</span>
				                          </div>
					                    </div>
					            	</fieldset>
                                </div>
                      		</div>
                  		</div>
	                  </div>
	                  
	                  <div class="col-md-7">
	                  <div class="portlet light bordered">
                           <div class="portlet-title">
                               <div class="caption font-dark">
                                   <i class="fa fa-copyright"></i>
                                   <span class="caption-subject bold uppercase">版权信息描述类</span>
                               </div>
                               <div class="tools"></div>
                           </div>
                           <div class="portlet-body form">
                                <div class="form-body">
                                  <fieldset>
			            			<div class="form-group">
				                          <label class="col-sm-2 control-label">创建者：</label>
				                          <div class="col-sm-9">
				                             <input type="text" name="creator" class="form-control" value="${image.creator }">
				                             <span class="help-block m-b-none">照片资源责任者、创建人</span>
				                          </div>
				                    </div>
					            	</fieldset>
					            	<fieldset>
				            			<div class="form-group">
				                          <label class="col-sm-2 control-label">出版者：</label>
				                          <div class="col-sm-9">
				                             <input type="text" name="publisher" class="form-control" value="${image.publisher }">
				                             <span class="help-block m-b-none">照片资源出版者</span>
				                          </div>
					                    </div>
					            	</fieldset>
					            	<fieldset>
				            			<div class="form-group">
				                          <label class="col-sm-2 control-label">其他责任者：</label>
				                          <div class="col-sm-9">
				                             <input type="text" name="contributor" class="form-control" value="${image.contributor }">
				                             <span class="help-block m-b-none">除创建者以外的撰稿人或贡献者</span>
				                          </div>
					                    </div>
					            	</fieldset>
					            	<fieldset class="text-center">
					                     <a id="cancel" class="btn btn-warning"> 取消</a>
					                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                     <a id="confirm" class="btn btn-success" data-loading-text="保存中.."> 提交</a>
					                 </fieldset>
                                </div>
                      		</div>
                  		</div>
	               </div>
                 </form>
              </div>
	            
	        </div>
	    </div>
	    
    </div>
	
	<c:import url="/page/bottom"></c:import>
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script type="text/javascript" src="<%=basePath%>js/sweetalert.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.inputmask.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>
	<script type="text/javascript">
		$(function(){
			
			//提交表单
			$('#confirm').click(function(){
				$(this).button('loading');
				var url = "<%=basePath%>/image/edit"
				$('form[name=imageForm]').ajaxSubmit({
					type:'post',
					url:url,
					data:$(this).serialize(),
					success:function(data){
						if(data.status == 1000){
							swal(
								{
									title: "Success",   
									text: "已成功修改资源",
									type: "success",   
									confirmButtonText: "  OK  ",
									closeOnConfirm: false,
								},function(){
									window.location.href="<%=basePath%>/image/view/${image.locationId}";
								}
							);
						}else{
							swal(
								{
									title: "Warning",   
									text: "修改失败，错误"+data.error,
									type: "warning",   
									confirmButtonText: "  OK  ",
									closeOnConfirm: false,
								},function(){
									window.location.href="<%=basePath%>/image/view/${image.locationId}";
								}
							);
						}
					}
				});
			});
			
			$("select[name=type] option[value='${image.type}']").attr('selected','selected');
			
			$('[data-masked]').inputmask();
			$('#resource_admin').addClass('active');
		});
	</script>
</body>
</html>