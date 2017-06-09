<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>后台登陆页面</title>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link href="css/total.css" type=text/css rel=stylesheet>


<script type="text/javascript">
	
</script>

</head>

<body>
	<%
		String s = (String)request.getAttribute("loginSign");
		if (s!=null) {
	%>
	<script>
		alert("用户名或密码错误，请重新输入！");
	</script>
	<%
		}
	%>

	<div class="login_main">
		<div class="login_header">
			<img src="image/new_Logo2.jpg" width="580px">
		</div>
		<div>
			<div class="login_left">
				<img src="image/left.jpg" width="520px" height="300px">
			</div>
			<div class="login_right">

				<form action="adminLogin.html" method="post">
					<table>
						<tr>
							<td colspan="3"></td>
						<tr>
						<tr>
							<td>用户名:</td>
							<td><input type="text" name="username"
								class="login-text wid_ipt" placeholder="用户名" /></td>
						<tr>
						<tr>
							<td>密&nbsp;&nbsp;码:</td>
							<td><input type="password" name="password" value=""
								class="login-text wid_ipt" placeholder="密码" /></td>
						<tr>
						<tr>

						</tr>
						<tr>
							<td colspan="2"><input type="submit" id="btnLogin"
								value="登录" class="Login_btn" /></td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>
</body>
</html>
