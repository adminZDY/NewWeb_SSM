<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>
    
     <%
     	String user = request.getParameter("user");
    	//获取Session中的值判断是否为false(用户名或密码错误),null(用户未登录)，其他(用户登录过)
    	if(user == null)
    	{
    		//提示请输入登录信息
    		user = "请输入登录信息";
    	}
    	else
    	{	
    		user = "用户名或密码错误！";
    	}
     %>
    
    <style>
    	div{
    		float: left
    	}
		body
		{
			margin-top:250px;
			margin-left:450px;
			background-color:#CCC;
		}
    </style>
    <script type="text/javascript">
    	//登录验证
    	function Login()
    	{
    		var flag = false;
       		var userName = document.getElementsByName("userName")[0].value;
    		var userPwd = document.getElementsByName("password")[0].value;
    		if(userName == null || userName.length == 0)
    		{
    			document.getElementById("tips").innerHTML = "用户名不能为空";
    			document.getElementsByName("userName")[0].focus();
    		}
    		else if(userPwd == null || userPwd.length < 6 )
    		{
    			document.getElementById("tips").innerHTML = "密码的长度要大于等于六位";
    			document.getElementsByName("password")[0].focus();
    		}
    		else
    		{
    			flag = true;
    		}
    		return flag;
    	}
    </script>
    <link href="css/normalize.css">
  </head>
 	
  <body>
  <div style="width:400px; height:160px; background-color:#FFF;" id="frmdiv">
  		<div style="background-color: blue; text-align:center; width:400px;">登录窗口</div>
  		<div>
  			<form action="${pageContext.request.contextPath}/login" method="post" onsubmit="return Login();">
  			
  			<table border="0" width="400" height="125" cellspacing="0" cellpadding="0"> <!-- 4行-3列 -->
  				<tr>
  					<td width="94" rowspan="4">
  					<img src="${pageContext.request.contextPath}/manage/img/Login.jpg" alt="登录图片" width="100px" height="100px"/>
  					</td>
  				</tr>
  				<tr>
  					<td width="70">
  						<strong>用户名：</strong>
  					</td>
  					<td width="203">
  						<input type="text" name = "userName"/>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<strong>密&nbsp;&nbsp;码：</strong>
  					</td>
  					<td>
  						<input type = "password" name="password"/>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="2" id = "tips"><%=user%></td>
  				</tr>
  				<tr>
  					<td colspan="3" align="right">
	  					<input type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;
	  					<input type="reset" value="重置"/>&nbsp;
  					</td>
  				</tr>
  			</table>
  			</form>
		</div>
  	</div>
  </body>
</html>

