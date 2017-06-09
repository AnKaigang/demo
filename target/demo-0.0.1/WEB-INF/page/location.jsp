<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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

<title>My JSP 'location.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%-- <%@ include file="LocationAnalysis.jsp" %> --%>
	<table width="100%" height="100%" border="0">
		<tr >
			<td rowspan="2" width="50%"><iframe src="LocationAnalysis.html" width="100%" height="100%"></iframe></td>
			<td><iframe src="AnalysisResult.html" width="100%" height="100%"></iframe>
			</td>
			<td rowspan="2" ><iframe src="resultPage.html" width="100%" height="100%"></iframe></td>
		</tr>
		<tr>

			<td><iframe src="pie.html" width="100%" height="100%"></iframe></td>
		<tr>
	</table>

</body>
</html>
