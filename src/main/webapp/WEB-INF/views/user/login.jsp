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
	<title>登录-DOCMS文件管理系统</title>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />

    <link href="css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="css/plugins.min.css" rel="stylesheet" type="text/css" />

    
	<link href="css/login-5.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		li{list-style-type:none}
	</style>
</head>
<body>
	<!-- BEGIN : LOGIN PAGE 5-1 -->
    <div class="user-login-5">
        <div class="row bs-reset">
            <div class="col-md-6 bs-reset">
                <div class="login-bg" style="background-image:url(img/login/bg1.jpg)">
                    <img class="login-logo" src="img/logo-irm.png" width="288px"/> </div>
            </div>
            <div class="col-md-6 login-container bs-reset">
                <div class="login-content">
                    <h1>北京老照片GIS时光机后台管理系统</h1>
                    <p> “北京老照片档案‘时光机’”是基于地理信息系统的北京老照片档案集成与展示的平 台。展示的平台包括网站和手机 APP,满足不同人群对于照片档案利用的需求。“北京老照 片档案‘时光机’”旨在开创档案利用的新平台,使照片档案在北京成历史巨大变迁中不失 本色,同时焕发出更大的社会价值和商业价值。 </p>
                    <form role="form" data-parsley-validate="" name="login_form" class="login-form">
                        <div id="error_div" class="alert alert-danger display-hide">
                            <button class="close" data-close="alert"></button>
                            <span id="error_msg"></span>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                           		<input id="email" data-parsley-errors-container="#error_msg" type="email" placeholder="Enter email" autocomplete="off" required class="form-control form-control-solid placeholder-no-fix form-group">
                            </div>
                            <div class="col-xs-6">
                                <input data-parsley-errors-container="#error_msg" class="form-control form-control-solid placeholder-no-fix form-group" type="password" autocomplete="off" placeholder="Password" id="password" type="password" required class="form-control" data-parsley-length="[6, 20]"/> </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="rem-password">
                                    <label class="rememberme mt-checkbox mt-checkbox-outline">
                                        <input type="checkbox" name="remember" value="1" /> Remember me
                                        <span></span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-8 text-right">
                                <div class="forgot-password">
                                    <a href="javascript:;" id="forget-password" class="forget-password">忘记密码?</a>
                                </div>
                                <button class="btn green" id="login" type="submit">登录</button>
                            </div>
                        </div>
                    </form>
                    <!-- BEGIN FORGOT PASSWORD FORM -->
                    <form class="forget-form" action="javascript:;" method="post">
                        <h3 class="font-green">Forgot Password ?</h3>
                        <p> Enter your e-mail address below to reset your password. </p>
                        <div class="form-group">
                            <input class="form-control placeholder-no-fix form-group" type="text" autocomplete="off" placeholder="Email" name="email" /> </div>
                        <div class="form-actions">
                            <button type="button" id="back-btn" class="btn green btn-outline">Back</button>
                            <button type="submit" class="btn btn-success uppercase pull-right">Submit</button>
                        </div>
                    </form>
                    <!-- END FORGOT PASSWORD FORM -->
                </div>
                <div class="login-footer">
                    <div class="row bs-reset">
                        <div class="col-xs-5 bs-reset">
                            <ul class="login-social">
                                <li>
                                    <a href="javascript:;">
                                        <i class="icon-social-facebook"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <i class="icon-social-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <i class="icon-social-dribbble"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-xs-7 bs-reset">
                            <div class="login-copyright text-right">
                                <p>Copyright &copy;  2015 信息资源管理学院Web开发实验室@IRM409</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END : LOGIN PAGE 5-1 -->
	<!-- BEGIN CORE PLUGINS -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/js.cookie.min.js" type="text/javascript"></script>
    <script src="js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
    <script src="js/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="js/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="js/bootstrap-switch.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="js/app.min.js" type="text/javascript"></script>
    <!-- BEGIN THEME LAYOUT SCRIPTS -->
    <script src="js/layout/layout.min.js" type="text/javascript"></script>
    <script src="js/layout/demo.min.js" type="text/javascript"></script>
    <script src="js/layout/quick-sidebar.min.js" type="text/javascript"></script>
	
    <script src="js/select2.full.min.js" type="text/javascript"></script>
    <script src="js/jquery.backstretch.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/parsley.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/zh_cn.js"></script>
    
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    
    <script type="text/javascript">
    $(function(){
    	$(".login-bg").backstretch(["img/login/login-bg2.jpg", "img/login/login-bg3.jpg","img/login/login-bg1.jpg" ,"img/login/login-bg4.jpg"], {
            fade: 1e3,
            duration: 8e3
        }),
        $(".forget-form").hide()
    	  
          window.ParsleyConfig = $.extend( window.ParsleyConfig || {}, {
			  errorTemplate: '<li></li>'  
		  });    
    	  var passwordValidate = $('#password').parsley();
	 	  $('#password').on('input',function(){
	 		  $('#error_div').css('display','hidden');
	 		   window.ParsleyUI.removeError(passwordValidate,'email_error');
	 	  });
	 	  
	 	  $('form[name=login_form]').parsley()
			.on("form:success", function() {
				  $('#login').button('loading');
				  var url = "<%=basePath %>user/login";
				  $.post(
				    	url,
				    	{
		      				'email':$('#email').val(),
							'password':$('#password').val(),
							'type':'pc'
		      			},
				    	function(data){
		      				if(data.status==1000){
		      					window.location.href="<%=basePath%>dashboard";
		      				}else{
		      					console.log(data.error);
		      					$(".alert-danger", $(".login-form")).show();
		      					window.ParsleyUI.removeError(passwordValidate,'email_error');
		      					window.ParsleyUI.addError(passwordValidate,'email_error',data.error);
		      					$('#login').button('reset');
		      				}
				    	}
				  );
			})
			.on('form:submit', function() {
			    return false; 
			})
			.on('form:error',function(){
				$(".alert-danger", $(".login-form")).show();
			});
    });
    
    </script>
</body>
</html>