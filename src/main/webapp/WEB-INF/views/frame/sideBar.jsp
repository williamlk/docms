<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
    <!-- BEGIN SIDEBAR -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <li class="sidebar-toggler-wrapper hide">
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler">
                    <span></span>
                </div>
                <!-- END SIDEBAR TOGGLER BUTTON -->
            </li>
            <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
            <li class="sidebar-search-wrapper">
                <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
                <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
                <form class="sidebar-search  sidebar-search-bordered" action="page_general_search_3.html" method="POST">
                    <a href="javascript:;" class="remove">
                        <i class="icon-close"></i>
                    </a>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                            <a href="javascript:;" class="btn submit">
                                <i class="icon-magnifier"></i>
                            </a>
                        </span>
                    </div>
                </form>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
            </li>
            <li class="heading">
                <h3 class="uppercase">控制台</h3>
            </li>
            <li class="nav-item start ">
                <a href="<%=basePath %>dashboard" class="nav-link">
                    <i class="icon-home"></i>
                    <span class="title">主页</span>
                </a>
            </li>
            
            <li class="heading">
                <h3 class="uppercase">资源</h3>
            </li>
            <li class="nav-item" id="file_admin">
                <a href="<%=basePath %>page/fileAdmin" class="nav-link nav-toggle">
                    <i class="fa fa-database"></i>
                    <span class="title">文件管理</span>
                </a>
            </li>
			<!--
			
            <li class="nav-item" id="resource_admin">
                <a href="<%=basePath %>page/resource" class="nav-link nav-toggle">
                    <i class="fa fa-map"></i>
                    <span class="title">地理资源管理</span>
                </a>
            </li>
            <li class="nav-item" id="location_admin">
                <a href="<%=basePath %>page/map" class="nav-link nav-toggle">
                    <i class="fa fa-map-marker"></i>
                    <span class="title">地理位置管理</span>
                </a>
            </li>
            <li class="nav-item" id="recommend_admin">
                <a href="<%=basePath %>page/recommend" class="nav-link nav-toggle">
                    <i class="fa fa-thumbs-o-up"></i>
                    <span class="title">首页推荐管理</span>
                </a>
            </li>
            <li class="nav-item" id="search_admin">
                <a href="<%=basePath %>page/search" class="nav-link nav-toggle">
                    <i class="fa fa-search"></i>
                    <span class="title">资源检索</span>
                </a>
            </li>
            -->
			<!--
			
            <li class="heading">
                <h3 class="uppercase">交互</h3>
            </li>
            <li class="nav-item" id="check_admin">
                <a href="<%=basePath %>page/check" class="nav-link nav-toggle">
                    <i class="fa fa-calendar-check-o"></i>
                    <span class="title">资源纠错请求</span>
                    <span class="badge badge-danger">${unCheckNum }</span>
                </a>
            </li>
            <li class="nav-item" id="contribution_admin">
                <a href="<%=basePath %>page/contribution" class="nav-link nav-toggle">
                    <i class="fa fa-file-image-o"></i>
                    <span class="title">贡献资源审核</span>
                    <span class="badge badge-success">${unHandleContributionNum }</span>
                </a>
            </li>
            <li class="nav-item" id="feedback_admin">
                <a href="<%=basePath %>page/feedback" class="nav-link nav-toggle">
                    <i class="fa fa-commenting-o"></i>
                    <span class="title">用户反馈</span>
                    <span class="badge badge-info">${unhandleFeedbackNum }</span>
                </a>
            </li>
            
            -->
            <li class="heading">
                <h3 class="uppercase">系统</h3>
            </li>
            <li class="nav-item" id="user_admin">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="fa fa-user"></i>
                    <span class="title">用户</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item" id="user_admin_li">
                        <a href="<%=basePath %>page/userAdmin" class="nav-link ">
                            <span class="title">用户管理</span>
                        </a>
                    </li>
                    
                </ul>
            </li>
        </ul>
        <!-- END SIDEBAR MENU -->
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>