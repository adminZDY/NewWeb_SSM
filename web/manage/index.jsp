<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sec.news.model.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<!-- Meta, title, CSS, favicons, etc. -->
		<meta charset="utf-8">
		<title>CMS内容管理系统</title>
		<meta name="keywords" content="Admin">
		<meta name="description" content="Admin">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- Core CSS  -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/glyphicons.min.css">

		<!-- Theme CSS -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/theme.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pages.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugins.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/responsive.css">

		<!-- Boxed-Layout CSS -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/boxed.css">

		<!-- Demonstration CSS -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css">

		<!-- Your Custom CSS -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom.css">
		
		<!-- Core Javascript - via CDN --> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/uniform.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>

		<script>
			function logout() {
				window.location.href = "${pageContext.request.contextPath}/logout";
			}
		</script>
	</head>

	<body>
	<!-- Start: Header -->
	<header class="navbar navbar-fixed-top" >
		<div class="pull-left"> <a class="navbar-brand" href="#">
			<div class="navbar-logo"><img src="../images/logo.png" alt="logo"></div>
			</a> </div>
		<div class="pull-right header-btns">
			<a class="user"><span class="glyphicons glyphicon-user"></span>${sessionScope.user.userName}</a>
			<a href="javascript:logout()" class="btn btn-default btn-gradient" type="button"><span class="glyphicons glyphicon-log-out"></span> 退出</a>
		</div>
	</header>
	<!-- End: Header -->

	<!-- Start: Main -->
	<div id="main"> 
			<!-- Start: Sidebar -->
		<aside id="sidebar" class="affix">
			<div id="sidebar-search">
					<div class="sidebar-toggle"><span class="glyphicon glyphicon-resize-horizontal"></span></div>
			</div>
			<div id="sidebar-menu">
				<ul class="nav sidebar-nav">
					<li>
						<a href="index.jsp"><span class="glyphicons glyphicon-home"></span><span class="sidebar-title">后台首页</span></a>
					</li>

					<li> 
						<a href="#sideEight" class="accordion-toggle">
							<span class="glyphicons glyphicon-list"></span>
							<span class="sidebar-title">新闻管理中心</span>
							<span class="caret"></span>
						</a>
						
						<ul class="nav sub-nav" id="sideEight" style="">
							<li>
								<a href="${pageContext.request.contextPath }/article_add" target="iframe"  ><span class="glyphicons glyphicon-record"></span>发布新闻</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/manage/article_list.jsp" target="iframe">
									<span class="glyphicons glyphicon-record"></span>新闻管理</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/manage/Type_add.jsp" target="iframe"><span class="glyphicons glyphicon-record"></span>添加新闻类型</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/manage/Type_list.jsp" target="iframe">
									<span class="glyphicons glyphicon-record"></span>新闻类型管理</a>
							</li>
						</ul>	
					</li>
					 
					<li>
						<a href="user_list.html" class="accordion-toggle">
							<span class="glyphicons glyphicon-list"></span>
							<span class="sidebar-title">后台管理中心</span>
							<span class="caret"></span>
						</a>
						
						<ul class="nav sub-nav" id="sideEight" >
							<li>
								<a href="#sideEight-sub"><span class="glyphicons glyphicon-record"></span>关于系统</a>	
							</li>
							<li>
								<a href="#"><span class="glyphicons glyphicon-record"></span>关于用户</a>
							</li>
							<li>
								<a href="#"><span class="glyphicons glyphicon-record"></span>关于新闻类型管理</a>
							</li>
							<li>
								<a href="#"><span class="glyphicons glyphicon-record"></span>关于新闻管理</a>
							</li>
							<li>
								<a href="#"><span class="glyphicons glyphicon-record"></span>关于浏览新闻</a>
							</li>
						</ul>
					</li>
					
				</ul>
			</div>
		</aside>
		
		<!-- End: Sidebar -->    
		<!-- Start: Content -->
		
		<section id="content" >
		
			<div id="topbar" class="affix">
				<ol class="breadcrumb">
					<li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				</ol>
			</div>
			<div class="container" style="height: 100%; ">
			<div class="col-md-9" style="height: 100%; padding: 0 0 0 0;">
				<iframe src="${pageContext.request.contextPath }/manage/welcome.jsp"
						style="width: 110%; height:700px; padding: 0 0 0 0;" name="iframe" id="docs-content" ></iframe>
			</div>
			</div> 
			
		</section>
		
		<!-- End: Content --> 
	</div>
	<!-- End: Main --></body>

</html>
