

<%@page import="com.iyanda.entity.Inform"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>教务通知管理</title>
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

	<br>
	<table width="100%">
		<tr>
			<th>标题</th>

			<th>查看</th>

		</tr>
		<%
			List<Inform> informs = (List) request.getAttribute("informs");

			for (int i = 0; i < informs.size(); i++) {
		%>
		<tr>
			<td align="center"><%=informs.get(i).getTitle()%></td>
			<td align="center"><a href=<%="getJWCContent.html?id=" + informs.get(i).getId()%> >查看</a></td>
		</tr>
		<%
			}
		%>

	</table>

</div>



</body>
</html>
