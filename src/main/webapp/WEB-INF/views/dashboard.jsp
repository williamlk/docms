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
	<title>控制台-DOCMS后台管理系统</title>
	<c:import url="/page/header"></c:import>
	<link rel="stylesheet" href="">
	<style type="text/css">
		.gmap {
		    height: 700px;
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
                            <a href="<%=basePath%>dashboard">Home</a>
                            <i class="fa fa-circle"></i>
                        </li>
                        <li>
                            <span>Dashboard</span>
                        </li>
                    </ul>
                </div>
                <!-- END PAGE BAR -->
                <!-- BEGIN PAGE TITLE-->
                <h3 class="page-title"> Dashboard
                    <small>dashboard & statistics</small>
                </h3>
                <!-- END PAGE TITLE-->
                <!-- END PAGE HEADER-->
                <!-- BEGIN DASHBOARD STATS 1-->
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <a class="dashboard-stat dashboard-stat-v2 blue" href="<%=basePath %>page/subjectAdmin">
                            <div class="visual">
                                <i class="fa fa-line-chart"></i>
                            </div>
                            <div class="details">
                                <div class="number">
                                    <span data-counter="counterup" data-value="${subjectNum }">0 </span> <small>个</small>
                                </div>
                                <div class="desc"> 专题数量 </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <a class="dashboard-stat dashboard-stat-v2 red" href="<%=basePath %>page/resource">
                            <div class="visual">
                                <i class="fa fa-bar-chart-o"></i>
                            </div>
                            <div class="details">
                                <div class="number">
                                    <span data-counter="counterup" data-value="${imageNum }">0</span> </div>
                                <div class="desc"> 照片资源数量 </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <a class="dashboard-stat dashboard-stat-v2 green" href="<%=basePath %>page/map">
                            <div class="visual">
                                <i class="fa fa-area-chart"></i>
                            </div>
                            <div class="details">
                                <div class="number">
                                    <span data-counter="counterup" data-value="${locationNum }">0</span>
                                </div>
                                <div class="desc"> 地理映射点 </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <a class="dashboard-stat dashboard-stat-v2 purple" href="#">
                            <div class="visual">
                                <i class="fa fa-globe"></i>
                            </div>
                            <div class="details">
                                <div class="number"> 
                                    <span id="visit-num"  class="counter">0</span> </div>
                                <div class="desc"> 网站流量 </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="clearfix"></div>
                <!-- END DASHBOARD STATS 1-->
                
                <div class="row">
	            	<div class="col-md-12">
                       <!-- BEGIN EXAMPLE TABLE PORTLET-->
                       <div class="portlet light bordered">
                           <div class="portlet-title">
                               <div class="caption font-dark">
                                   <i class="fa fa-bar-chart"></i>
                                   <span class="caption-subject bold uppercase">资源地理分布</span>
                               </div>
                               <div class="tools"> </div>
                           </div>
                           <div class="portlet-body">
                               <div id="gmap" class="gmap"></div>
                           </div>
                       </div>
                     </div>
	            </div>
                
                
            </div>
            <!-- END CONTENT BODY -->
        </div>
        <!-- END CONTENT -->
	</div>
	<c:import url="/page/bottom"></c:import>
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="js/jquery.counterup.min.js" type="text/javascript"></script>
    <script src="js/pages/dashboard.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=25965f773ab63235c6d60c3b0bf79af8"></script> 
    <script type="text/javascript" src="<%=basePath%>js/countUp.js"></script>
    
    <script type="text/javascript">
    	$(function(){
    		var url = "http://statistics.pekingmemory.cn/api/visit/0af054213e75e7cd8ca2320bbaa48af282020c4d";
    		$.get(url).done(function(data){
    			var numAnim = new CountUp("visit-num", 0, data.visit);
 				numAnim.start();
    		});
    	});
    </script>
    
    <script type="text/javascript">
	    var map = new AMap.Map('gmap',{
	        zoom: 14,
	        features:['bg','road'],
			mapStyle:'light',
	        center: [116.397428,39.90923]
	    });
   
	    AMap.plugin(['AMap.ToolBar','AMap.Scale'],function(){
		    var toolBar = new AMap.ToolBar();
		    var scale = new AMap.Scale();
		    map.addControl(toolBar);
		    map.addControl(scale);
		});
   
	    var markerIconRed =  new AMap.Icon({
	        size: new AMap.Size(21, 36),  //图标大小
	        image: "<%=basePath%>img/red.png",
	        imageOffset: new AMap.Pixel(0, 20)
	    });
   
	    var data_url="<%=basePath%>map/locationData";
	    $.get(
			data_url,
			{},
			function(locations){
				for(var i=0;i<locations.data.length;i++){
					var marker = new AMap.Marker({
				        position: [locations.data[i].lng, locations.data[i].lat],
				        map:map,
				        icon:markerIconRed,
				        title:locations.data[i].name+":"+locations.data[i].address
				    });
					addMarkerEven(marker,locations.data[i].id);
				}
			}
		);
   
	    function addMarkerEven(marker,id){
		    AMap.event.addListener(marker,'click',function(){
			    window.location.href="<%=basePath%>image/view/"+id;
		   });
	   }
    </script>
</body>
</html>