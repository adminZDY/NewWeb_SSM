<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/10
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>用AJAX以JSON方式提交数据</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<form >
    id：<input type="text" id="id" value="123" /><br/>
    名称：<input type="text" id="name" value="category xxx"/><br/>
    <input type="button" value="提交" id="sender">
</form>
<div id="messageDiv"></div>

<script>

    $('#sender').click(function(){
        var url="/NewWeb/servlet/TypeServlet?op=test&page=1&limit=1";
        $.post(
            url,
            function(data) {
                console.log(data);
                var categorys = $.parseJSON(data);
                console.log(categorys.length);


            });
    });
</script>
</body>

</html>