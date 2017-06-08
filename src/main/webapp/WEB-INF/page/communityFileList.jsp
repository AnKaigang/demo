
<%@page import="com.iyanda.entity.CommunityData"%>
<%@page import="com.iyanda.entity.Doc"%>
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



	<!--  商品列表页面 -->
	<br/>

	<table width="100%">
		<tr>
			<th>文件名</th>
			<th>访问权限</th>
			<th>上传日期</th>
			<th>所属社团</th>
			<th>下载查看</th>
			<th>管理</th>
		
		</tr>
		<%
			List<Doc> docs = (List) request.getAttribute("docs");
			List<CommunityData> communitys = (List) request.getAttribute("communitys");

			for (int i = 0; i < docs.size(); i++) {
		%>
		<tr>
			<td align="center"><%=docs.get(i).getDocumentname()%></td>
			<td align="center"><%=docs.get(i).getPermissionnum().intValue()==0?"社团管理可见":"所有成员可见"%></td>
			<td align="center"><%=docs.get(i).getDate()%></td>
			<td align="center"><%=communitys.get(i).getCommunityname()%></td>
			<td align="center"><a href=<%="download.html?fileid=" + docs.get(i).getId()%>>下载</a></td>
			<td align="center"><a href=<%="deleteFileA.html?fileid=" + docs.get(i).getId()%> >删除</a></td>
		</tr>
		<%
			}
		%>

	</table>

</div>



</body>
</html>
