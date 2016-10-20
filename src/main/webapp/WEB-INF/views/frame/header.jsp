<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />

    <link href="css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="css/plugins.min.css" rel="stylesheet" type="text/css" />

    <link href="css/layout.min.css" rel="stylesheet" type="text/css" />
    <link href="css/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
    <link href="css/custom.min.css" rel="stylesheet" type="text/css" />