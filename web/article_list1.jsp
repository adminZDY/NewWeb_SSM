<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 2019/12/16
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="keywords" content="HTML, DHTML, CSS, XML, XHTML, JavaScript, VBScript，关键词">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/style/admin.css" media="all">
</head>
<body>

<div>
    <div class="layui-card">
        <div class="layui-form">
        <table class="layui-hide" id="demo"lay-filter="test" ></table>

            <script type="text/html" id="buttonTpl">
                {{# console.log(d.recommended); if(d.recommended){ }}
                <button class="layui-btn layui-btn-xs">推荐</button>
                {{#  } else { }}
                <button class="layui-btn layui-btn-primary layui-btn-xs">不推荐</button>
                {{#  } }}
            </script>

            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">预览</a>
                <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </script>

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
                        //layer.alert('编辑 [id]：'+ checkStatus.data[0].typeId);

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
            if(layEvent === 'detail'){
                layer.msg('查看操作');
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'edit'){
                layer.msg('编辑操作');

                layer.open({
                    type: 1,
                    title: '编辑分类',
                    content: '//localhost:8080/NewWeb/type_update.html?id=' + checkStatus.data[0].typeId,
                    area: [
                        '600px',
                        '650px'
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
        });
    });
</script>
</body>
</html>
