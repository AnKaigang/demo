
<%@page import="com.iyanda.entity.Rlation"%>
<%@page import="com.iyanda.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户管理</title>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="css/system/tableStyle.css" rel="stylesheet" />
<link href="css/system/pageBar.css" rel="stylesheet" />
<link href="css/system/themes/default/easyui.css" rel="stylesheet" />
<link href="css/system/themes/icon.css" rel="stylesheet" />
<script src="js/system/jquery-1.8.2.min.js"></script>
<script src="js/system/jquery.easyui.min.js"></script>
<script src="js/system/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	
</script>

</head>

<div>


	<p>
	<form id="search" action="getCUserByName.html">
		<a>用户名</a><input type="text" name="username"> 
		<a href="javascript:void(0)" onclick="document.getElementById('search').submit()" class="add">查询</a>
		所属社团：<%=request.getAttribute("communityname") %>
		<input type="hidden" name="communityid" value=<%=request.getAttribute("communityid")%>>
	</form>
	</p>
	<!--  商品列表页面 -->


	<table width="100%">
		<tr>
			<th>职位</th>
			<th>用户名</th>
			<th>用户昵称</th>
			<th>用户角色</th>
			<th>登陆状态</th>
			<th>管理</th>
		
		</tr>
		<%
			List<User> users = (List) request.getAttribute("users");
			List<Rlation> rlations = (List) request.getAttribute("rlations");

			for (int i = 0; i < users.size(); i++) {
		%>
		<tr>
			<td align="center"><%=rlations.get(i).getPosition()%></td>
			<td align="center"><%=users.get(i).getUsername()%></td>
			<td align="center"><%=users.get(i).getUsernickname()%></td>
			<td align="center"><%=users.get(i).getImagesrc().equals("1") ? "管理员"
						: "普通用户"%></td>
			<td align="center"><%=users.get(i).getPersonalsign().intValue() == 1 ? "在线"
						: "离线"%></td>
			<td align="center"><a href=<%="deleteCUser.html?userid=" + users.get(i).getId()+"&communityid="+request.getAttribute("communityid")%>>删除</a></td>
		</tr>
		<%
			}
		%>

	</table>

</div>



</body>
</html>
