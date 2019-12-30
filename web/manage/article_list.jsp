
<%@page import="com.sec.news.model.Type"%>
<%@page import="com.sec.news.dao.TypeDao"%>
<%@page import="com.sec.news.model.News"%>
<%@page import="com.sec.news.model.PageModel"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.sec.news.admin.biz.TypeBiz" %>
<%@ page import="com.sec.news.admin.biz.Impl.TypeBizImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%!  String path = "";%>
<% path = request.getContextPath();%>
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

        <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/style/admin.css" media="all">

		<script type="text/javascript">
    	function returnMenu()
    	{
    		window.location.href = "${pageContext.request.contextPath}/manage/manage.jsp";
    	}	
    	function VailLen(obj)
    	{
    		if(obj.value.length >= 6)
    		{
    			obj.focus();
    			return true;
    		}
    		return false;
    	}
    	function change(obj)
		{
    		window.location = "${pageContext.request.contextPath}/servlet/NewServlet?op=query&jsp=/manage/article_list.jsp&pageNo=1&IfselectAll="+obj.value;
    	}
    	
    	function click1()
    	{
    		window.location= "${pageContext.request.contextPath}/manage/addNews.jsp";
    	}

    	function page(obj){
			var a =  document.getElementsByName("form1")[0];
    		a.action ="queryNews?pageNo=0";
			document.form1.submit();
		}

    </script>

    <style type="text/css">
    	.select{
    			height: 34px;
    			padding: 0px 15px;
    			font-size: 14px;
   				line-height: 1.428571429;
   				color: #555;
    			background-color: #fff;
    			background-image: none;
    			border: 1px solid #ccc;
    			border-radius: 4px;
    			float: right;
    			margin-top: -10px;
    			}
    </style>


		<%!
			public String update(int newsId)
			{
				return path+"/servlet/NewServlet?op=update&newsId="+newsId;
			}

			public String delete(int newsId)
			{
				return path+"/servlet/NewServlet?op=delete&jsp=/manage/article_list.jsp&delete="+newsId;
			}
		%>
	</head>

	<body>
	<!-- Start: Content -->

	<div class="container" >
		<div class="row">
			<div class="col-md-12" style="padding: 0 0 0 0;">
				<div class="panel">
					<div class="panel-heading">
						<div class="panel-title">新闻列表</div>
						<a href="${pageContext.request.contextPath}/manage/article_add.jsp" class="btn btn-info btn-gradient pull-right"><span class="glyphicons glyphicon-plus"></span> 添加文章</a>
					</div>

					<form action="${pageContext.request.contextPath}/deletes" name="form1" method="post">

						<div class="panel-body">
<%--							<div class="panel-body-title"><font size="5">新闻管理</font>--%>
<%--								<select onchange="page(this)" name="select" class="select" >--%>
<%--									<option value="0">所有新闻</option>--%>
<%--									<c:forEach items="${lst}" var="c" varStatus="st">--%>
<%--										<c:if test="${typeId == c.typeId}">--%>
<%--											<option value="${c.typeId}" selected>${c.typeName}</option>--%>
<%--										</c:if><c:if test="${typeId != c.typeId}">--%>
<%--											<option value="${c.typeId}">${c.typeName}</option>--%>
<%--										</c:if>--%>
<%--									</c:forEach>--%>
<%--								</select>--%>
<%--							</div>--%>

<%--							<table class="table table-striped table-bordered table-hover dataTable">--%>
<%--								<tr class="active">--%>
<%--									<th class="text-center" width="100"><input type="checkbox" value="" id="checkall" class=""> 全选</th>--%>
<%--									<td>编号</td>--%>
<%--									<td>标题</td>--%>
<%--									<td>类型</td>--%>
<%--									<td>点击次数</td>--%>
<%--									<td>正文大小</td>--%>
<%--									<td>发布时间</td>--%>
<%--									<td>推荐</td>--%>
<%--									<td>发布者</td>--%>
<%--									<td>操作</td>--%>
<%--								</tr>--%>

<%--							<c:forEach items="${data.data}" var="c" varStatus="st">--%>
<%--								<tr class="success">--%>
<%--									<td class="text-center"><input type="checkbox" value="${c.newsId}" name="idarr" class="cbox"></td>--%>
<%--									<td>${c.newsId}</td>--%>
<%--									<td>${c.title}</td>--%>
<%--									<td>${c.type.typeName}</td>--%>
<%--									<td>${c.click}</td>--%>
<%--									<td>${fn:length(c.content)}</td>--%>
<%--									<td>${c.releaseTime}</td>--%>
<%--									<td>${c.recommended == 1 ? "是" : "否"}</td>--%>
<%--									<td>${c.user.userName}</td>--%>
<%--									<td>--%>
<%--										<div class="btn-group">--%>
<%--										<a href="show_update?newsId=${c.newsId}" class="btn btn-default btn-gradient">--%>
<%--                                            <span class="glyphicons glyphicon-pencil"></span>--%>
<%--                                        </a>--%>
<%--                                        <a onclick="return confirm('确定要删除吗？');" href="delete?newsId=${c.newsId}" class="btn btn-default btn-gradient dropdown-toggle">--%>
<%--                                            <span class="glyphicons glyphicon-trash"></span>--%>
<%--                                        </a>--%>
<%--                                    	</div>--%>
<%--                                	</td>--%>
<%--                            	</tr>--%>
<%--							</c:forEach>--%>
<%--                        </table>--%>

<%--                        <div class="pull-left">--%>
<%--                            <button type="submit" class="btn btn-default btn-gradient pull-right delall">--%>
<%--                                <span class="glyphicons glyphicon-trash"></span>--%>
<%--                            </button>--%>
<%--                        </div>--%>

<%--                        <div class="pull-right">--%>
<%--                            <ul class="pagination" id="paginator-example">--%>
<%--                                <li><a href="javascript:void(0)">共有&nbsp;${data.getTotalRecords()}&nbsp;条数据，每页&nbsp;${data.pageSize}&nbsp;条，共&nbsp;${data.getTotalpages()}&nbsp;页</a></li>--%>
<%--                                <li><a href='queryNews?pageNo=0'>&lt;&lt;</a></li>--%>
<%--                                <li><a href='queryNews?pageNo=${data.pageNo-data.pageSize}'>&lt;</a></li>--%>

<%--&lt;%&ndash;                                <li class="active"><a>${data.pageNo}</a></li>&ndash;%&gt;--%>

<%--                                <li><a href='queryNews?pageNo=${data.pageSize}'>&gt;</a></li>--%>
<%--                                <li><a href='queryNews?pageNo=${data.last}'>&gt;&gt;</a></li>--%>

<%--                            </ul>--%>
<%--                        </div>--%>
							<table class="layui-hide" id="demo"lay-filter="test" ></table>

							<script type="text/html" id="buttonTpl">
								{{# if(d.recommended){ }}
								<button class="layui-btn layui-btn-xs">推荐</button>
								{{#  } else { }}
								<button class="layui-btn layui-btn-primary layui-btn-xs">不推荐</button>
								{{#  } }}
							</script>

							<script type="text/html" id="barDemo">
								<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">预览</a>
								<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
								<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
							</script>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
	<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use(['layer', 'table'], function(){
			var layer = layui.layer //弹层
					,table = layui.table //表格

			//执行一个 table 实例
			table.render({
				elem: '#demo'
				,height: 'full'
				,cellMinWidth: 80   //全局定义常规单元格的最小宽度，layui 2.2.1 新增
				,url: '//localhost:8080/NewWeb_1/NewsSelect' //数据接口
				,title: '新闻类型表'
				// ,page: true //开启分页
				,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
					theme: '#1E9FFF'
					,prev:"上一页"
					,next:"下一页"
					,groups: 6 //只显示 6 个连续页码
					,first: false //不显示首页
					,last: false //不显示尾页
					,layout:  ['count', 'prev', 'page', 'next', 'limit']
				}
				,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
				,totalRow: true //开启合计行
				, cols: [[ //表头
					{type: 'checkbox', fixed: 'left'}
					,{type: 'numbers',title: '序号', width:60,fixed: 'left'}
					,{field: 'newsId',title: '文章ID', width:80}
					, {field: 'typeName', title: '类型', align: "center"}
					, {field: 'title', title: '新闻标题', align: "center",sort: true}
					, {field: 'userName', title: '作者', align: "center"}
					, {field: 'releaseTime', title: '发布时间', align: "center",sort: true}
					, {field: 'click', title: '点击数', align: "center"}
					, {field: "recommended", title: "发布状态", templet: "#buttonTpl", align: "center"}
					, {fixed: 'right', title:'操作', width: 165, align:'center', toolbar: '#barDemo'}
				]]
			});

			//监听头工具栏事件
			table.on('toolbar(test)', function(obj){
				var checkStatus = table.checkStatus(obj.config.id)
						,data = checkStatus.data; //获取选中的数据
				console.log(data);
				switch(obj.event){
					case 'add':
						layer.open({
							type: 1,
							title: '添加文章',
							content: 'article_add.jsp',
							area: [
								'700px',
								'400px'
							],
							btn: [
								'确定',
								'取消'
							],
							yes: function (e, i) {
								var n = i.find('iframe').contents().find('#layuiadmin-app-form-tags'),
										l = n.find('input[name="tags"]').val();
								l.replace(/\s/g, '') && (t.update({
									tags: l
								}), layer.close(e))
							},
							success: function (t, e) {
								var n = t.find('iframe').contents().find('#layuiadmin-app-form-tags').click();
								n.find('input[name="tags"]').val(i.tags)
							}
						});
						break;
					case 'update':
						if(data.length === 0){
							layer.msg('请选择一行');
						} else if(data.length > 1){
							layer.msg('只能同时编辑一个');
						} else {
							layer.alert('编辑 [id]：'+ checkStatus.data[0].newsId);

							layer.open({
								type: 2,
								title: '编辑分类',
								content: 'type_update.html?id=' + checkStatus.data[0].typeId,
								area: [
									'600px',
									'500px'
								],
								btn: [
									'确定',
									'取消'
								],
								yes: function (e, i) {
									var n = i.find('iframe').contents().find('#layuiadmin-app-form-tags'),
											l = n.find('input[name="tags"]').val();
									l.replace(/\s/g, '') && (t.update({
										tags: l
									}), layer.close(e))
								},
								success: function (t, e) {
									var n = t.find('iframe').contents().find('#layuiadmin-app-form-tags').click();
									n.find('input[name="tags"]').val(i.tags)
								}
							});
						}
						break;
					case 'delete':
						if(data.length === 0){
							layer.msg('请选择一行');
						} else {
							layer.msg('删除');
						}
						break;
				};
			});

			//监听行工具事件
			table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				var data = obj.data //获得当前行数据
						,layEvent = obj.event; //获得 lay-event 对应的值
				var a =  document.getElementsByName("form1")[0];
				if(layEvent === 'detail'){
					layer.msg('查看操作');
					a.action ="/NewWeb_1/preview?newsId="+data.newsId;
					document.form1.submit();
				} else if(layEvent === 'del'){
					layer.confirm('真的删除行么', function(index){
						a.action ="/NewWeb_1/delete?newsId="+data.newsId;
						document.form1.submit();
						// obj.del(); //删除对应行（tr）的DOM结构
						// layer.close(index);
						//向服务端发送删除指令
					});
				} else if(layEvent === 'edit'){
					layer.msg('编辑操作');
					a.action ="/NewWeb_1/show_update?newsId="+data.newsId;
					document.form1.submit();
					// layer.open({
					// 	type: 1,
					// 	title: '编辑分类',
					// 	content: '//localhost:8080/NewWeb/type_update.html?id=' + checkStatus.data[0].typeId,
					// 	area: [
					// 		'600px',
					// 		'650px'
					// 	],
					// 	btn: [
					// 		'确定',
					// 		'取消'
					// 	],
					// 	yes: function (e, i) {
					// 		var n = i.find('iframe').contents().find('#layuiadmin-app-form-tags'),
					// 				l = n.find('input[name="tags"]').val();
					// 		l.replace(/\s/g, '') && (t.update({
					// 			tags: l
					// 		}), layer.close(e))
					// 	},
					// 	success: function (t, e) {
					// 		var n = t.find('iframe').contents().find('#layuiadmin-app-form-tags').click();
					// 		n.find('input[name="tags"]').val(i.tags)
					// 	}
					// });
				}
			});
		});
	</script>
<!-- End: Content -->

<!-- End: Main -->
</body>
</html>
