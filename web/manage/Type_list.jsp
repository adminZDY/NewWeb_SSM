<%@ page import="com.sec.news.model.Type" %>
<%@ page import="com.sec.news.model.PageModel" %>
<%@ page import="com.sec.news.admin.biz.TypeBiz" %>
<%@ page import="com.sec.news.admin.biz.Impl.TypeBizImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/23
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    private String QueryURL(int pageNo)
    {
        String basePath = "../servlet/TypeServlet?op=query&pageNo=";

        return basePath+pageNo;
    }
    private String QueryURL(int pageNo,int total)
    {
        String basePath = "../servlet/TypeServlet?op=query&pageNo=";
        if(pageNo<=1)
        {
            pageNo = 1;
        }
        else if(pageNo >= total)
        {
            pageNo = total;
        }
        return basePath+pageNo;
    }
//    private String deleteURL(int pageNo)
//    {
//        String basePath = "../servlet/TypeServlet?op=delete&typeId=";
//
//        return basePath+pageNo;
//    }
    private String updateURL(int typeId)
    {
        String basePath = "../manage/Type_update.jsp?op=update&typeId=";

        return basePath+typeId;
    }
%>

<html>
<head>
    <title>Title</title>
</head>
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

    function change(obj)
    {
        window.location = "${pageContext.request.contextPath}/servlet/NewServlet?op=query&jsp=/manage/article_list.jsp&pageNo=1&typeId="+obj;
    }

</script>
<body>
<div class="container" >

    <div class="row">
        <div class="col-md-12" style="padding: 0 0 0 0;">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title">新闻类型列表</div>
                    <a href="${pageContext.request.contextPath}/manage/Type_add.jsp" class="btn btn-info btn-gradient pull-right">
                        <span class="glyphicons glyphicon-plus"></span> 添加新闻类型</a>
                </div>

                <form name="form1" method="post">
                    <div class="panel-body">
                        <div class="panel-body-title"><font size="5">新闻类型管理</font>

                        </div>

<%--                        <table class="table table-striped table-bordered table-hover dataTable">--%>
<%--                            <tr class="active">--%>
<%--&lt;%&ndash;                                <th class="text-center" width="100"><input type="checkbox" value="" id="checkall" class=""> 全选</th>&ndash;%&gt;--%>
<%--                                <td >编号</td>--%>
<%--                                <td >新闻类型</td>--%>
<%--                                <td >备注</td>--%>
<%--                                <td >操作</td>--%>
<%--                            </tr>--%>

<%--                                    <%--%>
<%--			 PageModel<Type> pm = (PageModel<Type>)request.getAttribute("data");--%>
<%--			 for(Type type : pm.getData())--%>
<%--			 {%>--%>
<%--                            <tr>--%>
<%--&lt;%&ndash;                                <td class="text-center"><input type="checkbox" value="1" name="idarr[]" class="cbox"></td>&ndash;%&gt;--%>
<%--                                &lt;%&ndash;编号&ndash;%&gt;--%>
<%--                                <td><%=type.getTypeId() %></td>--%>
<%--                                &lt;%&ndash;新闻类型 &ndash;%&gt;--%>
<%--                                <td><%=type.getTypeName() %></td>--%>
<%--                                <td><%=type.getRemark() %></td>--%>
<%--                                <td>--%>
<%--                                    &lt;%&ndash;管理新闻：查询出该类型对应的新闻 &ndash;%&gt;--%>
<%--                                    <a href="javascript:void(0)" onclick="change(<%=type.getTypeId() %>)" >[管 理 新 闻]</a>--%>
<%--                                    &lt;%&ndash;删除类型 &ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <a href="<%=deleteURL(pm.get(i).getTypeId())%>">[删 除]</a>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;修改类型 &ndash;%&gt;--%>
<%--                                    <a href="<%=updateURL(type.getTypeId()) %>">[修 改]</a>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <%}%>--%>
<%--                        </table>--%>

<%--&lt;%&ndash;                        <div class="pull-left">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <button type="submit" class="btn btn-default btn-gradient pull-right delall">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="glyphicons glyphicon-trash"></span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>

<%--                        <div class="pull-right">--%>
<%--                            <ul class="pagination" id="paginator-example">--%>
<%--                                <!-- <li><a>共&lt;%&ndash;=pm.getCountData() %>条数据，</a></li>--%>
<%--										<li><a>每页<%=pm.getPageSize() %>条，</a></li>--%>
<%--										<li><a>共<%=pm.getTotalPages() &ndash;%&gt;页，</a></li> -->--%>
<%--                                <li><a href="<%=QueryURL(1)%>">&lt;&lt;</a></li>--%>
<%--                                <li><a href="<%=QueryURL(pm.getPageNo()-1,pm.getTotalpages())%>">&lt;</a></li>--%>

<%--                                <li class="active"><a><%=pm.getPageNo() %></a></li>--%>

<%--                                <li><a href="<%=QueryURL(pm.getPageNo()+1,pm.getTotalpages())%>">&gt;</a></li>--%>
<%--                                <li><a href="<%=QueryURL(pm.getTotalpages())%>">&gt;&gt;</a></li>--%>
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
            ,url: '${pageContext.request.contextPath}/TypeSelect' //数据接口
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
                ,{field: 'typeId',title: '类型ID', width:80}
                , {field: 'typeName', title: '类型', align: "center"}
                , {field: 'Remark', title: '备注', align: "center",sort: true}
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
            if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    a.action ="/NewWeb_1/Typedelete?typeId="+data.typeId;
                    document.form1.submit();

                });
            } else if(layEvent === 'edit'){

                a.action ="/NewWeb_1/show_Type?typeId="+data.typeId;
                document.form1.submit();

            }
        });
    });
</script>
<!-- End: Content -->

<!-- End: Main -->
</body>
</html>
</body>
</html>
