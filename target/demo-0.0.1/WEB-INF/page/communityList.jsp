
<%@page import="com.iyanda.entity.CommunityData"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>社团管理</title>
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


	<!--  商品列表页面 -->

	<br/>
	<table width="100%">
		<tr>
			<th>社团名称</th>
			<th>社团简介</th>
			<th>社团类型</th>
			<th>查看文件</th>
			<th>查看成员</th>
		
		</tr>
		<%
			List<CommunityData> cds = (List) request.getAttribute("cds");

			for (int i = 0; i < cds.size(); i++) {
		%>
		<tr>
			<td align="center"><%=cds.get(i).getCommunityname()%></td>
			<td align="center"><%=cds.get(i).getCommunityintro()%></td>
			<td align="center"><%=cds.get(i).getType()%></td>

			<td align="center"><a href=<%="getFlies.html?communityid=" + cds.get(i).getId()%>>查看文件</a></td>
			<td align="center"><a href=<%="getUsers.html?communityid=" + cds.get(i).getId()%>>查看成员</a></td>
		</tr>
		<%
			}
		%>

	</table>

</div>



</body>
</html>
