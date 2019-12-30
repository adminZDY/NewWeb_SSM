<%@page import="com.sec.news.model.Type"%>
<%@page import="com.sec.news.model.News"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.sec.news.admin.biz.TypeBiz" %>
<%@ page import="com.sec.news.admin.biz.Impl.TypeBizImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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


    <script type="text/javascript">

    	
    	function VailLen(obj)
    	{
    		if(obj.value.length <= 0)
    		{
    			obj.focus();
    			return true;
    		}
    		return false;
    	}
    	
    	function Submt()
    	{
    		var title = document.getElementByName("title")[0];
    		var contenet = document.getElementByName("content")[0];

    		if(Vailen(title))
    		{
    			alert("标题不能为空");
    			return false;
    		}
    		else if(Vailean(contenet))
    		{
    			alert("新闻内容不能为空");
    			return false;
    		}
    		else {
    			return  true;
    		}
    	}
    	
    	function preview()
    	{
    		var obj = document.getElementsByName("op")[0];
    		obj.value = "preview";
    	}
    </script>
	</head>

	<body>
		<div class="row">
			<div class="col-md-10 col-lg-8 center-column">
				<form action="${pageContext.request.contextPath}/update" method="post" class="cmxform" >
					<div class="panel">
						<div class="panel-heading">
							<div class="panel-title">编辑文章</div>
								<div class="panel-btns pull-right margin-left">
								<a href="${pageContext.request.contextPath }/manage/article_list.jsp"  class="btn btn-default btn-gradient dropdown-toggle">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<div class="col-md-7">
								<div class="form-group">
									<div class="input-group"><span class="input-group-addon">分类</span>
										<select name="type.typeId" id="standard-list1" class="form-control">
											<c:forEach items="${lst}" var="c" varStatus="st">
												<c:if test="${typeId == c.typeId}">
													<option value="${c.TypeId}" selected>${c.typeName}</option>
												</c:if><c:if test="${typeId != c.typeId}">
												<option value="${c.typeId}">${c.typeName}</option>
											</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group"><span class="input-group-addon">标题</span>
										<input type="text" name = "title" value="${data.title}" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group"><span class="input-group-addon">作者</span>
										<input type="text" readonly="true" name="author" value="${data.user.userName }" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group"><span class="input-group-addon">关键字</span>
										<input type="text" name = "keywords" value="${data.keywords}" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">发布时间：
										${data.releaseTime}
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">是否推荐该新闻:&nbsp;
										<c:if test="${data.recommended == 1}">
											<input type="radio" name="recommended" value="1" checked="checked" />推荐&nbsp;&nbsp;
											<input type="radio" name="recommended" value="0" />不推荐
										</c:if>
										<c:if test="${data.recommended != 1}">
											<input type="radio" name="recommended" value="1" />推荐 &nbsp;&nbsp;
											<input type="radio" name="recommended" value="0" checked="checked" />不推荐
										</c:if>
								</div>
							</div>
							</div>
								<div class="form-group col-md-12">新闻内容：
									<textarea id="myEditor" name="content" style="width:100%;height:200px;">${data.content}</textarea>
								</div>
							<div class="col-md-7">
								<div class="form-group">
									<input type="submit" value="提交" class="submit btn btn-blue"/>
									<input type="reset" value="重置" class="submit btn btn-blue"/> 
									<input type="submit" value="预览" class="submit btn btn-blue" onclick="preview()"/>
    								<input type="hidden" value="${data.newsId}" name="newsId"/>
    								<input type="hidden" value="../manage/news.jsp" name="jsp"> 
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/manage/umeditor/themes/default/_css/umeditor.css">
		<script src="${pageContext.request.contextPath }/manage/umeditor/editor_api.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/manage/umeditor/umeditor.config.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/manage/umeditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>。
		<script type="text/javascript">
		var ue = UM.getEditor('myEditor', {
		autoClearinitialContent: true,
		wordCount: false,
		elementPathEnabled: false,
		initialFrameHeight: 300
		});
		</script>
	</body>

</html>