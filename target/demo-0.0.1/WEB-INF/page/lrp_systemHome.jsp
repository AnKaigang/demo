<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理系统</title>
    <meta name="viewport" content="width=device-width" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<link  href="css/system/total.css" type=text/css rel=stylesheet>
	<link  href="css/system/themes/default/easyui.css" type=text/css rel=stylesheet>
	<link  href="css/system//themes/icon.css" type=text/css rel=stylesheet>
	<script src="javascript/system/jquery-1.8.2.min.js"></script>
	<script src="javascript/system/jquery.easyui.min.js"></script>
	<script src="javascript/system/easyui-lang-zh_CN.js"></script>

	<script type="text/javascript">
		$(function () {
            binClickEvent();   
            
       });
        function binClickEvent() {
            //绑定超链接的单击事件
            $(".detailLink123").click(function () {
                var title = $(this).text();
                var url = $(this).attr("url");
                var isExt = $('#tt').tabs('exists', title);  //判断页签是否存在
                if (isExt) {
                    $('#tt').tabs('select', title);
                    return;
                }
                $('#tt').tabs('add', {
                    title: title,
                    content: showContent(url),
                    closable: true
                });
            })
        }
        //页签中显示的内容
        function showContent(url) {
            var strHtml = '<iframe src="' + url + '" scrolling="yes" width="100%" height="100%" frameborder="0"></iframe>';
            return strHtml;
        }
	</script>

  </head>
  
 <body class="easyui-layout">


    <!-----------------左边布局------------->
    <div region="west" split="false" border="false" title="&nbsp;&nbsp;社团汇app后台管理" class="west_div" >
        <img src="image/system/logo2.png" width="200px"/>
        <table class="Login_table">
            <tr>               
                <%-- <td width="60%">当前用户：${sessionScope.userName }</div></td>
                <td></td> --%>
                <td width="60%">用户名：</td>
          <%-- <td> <%=request.getSession().getAttribute("userName") %></td>  --%>    <td>${sessionScope.user.usernickname }</td>
            </tr>
           
        </table>

        <div id="aa" class="easyui-accordion" style="width:auto;height:auto;" border="true">
            <div title="用户管理" iconcls="icon-reload" selected="true" style="overflow:auto;padding:10px;">
                <a href="javascript:void(0)" class="detailLink123" url="userList.html">用户管理</a>
            </div>
            <div title="社团管理" iconcls="icon-reload"  style="padding:10px;">
                <a href="javascript:void(0)" class="detailLink123" url="communityList.html">社团管理</a>
                <br/><br/>
                <a href="javascript:void(0)" class="detailLink123" url="communityFileList.html">社团文件管理</a>
            </div>

            <div title="教务通知管理" iconcls="icon-reload"  style="padding:10px;">
                <a href="javascript:void(0)" class="detailLink123" url="JWCNoticList.html">教务通知管理</a>
            </div>

            <div title="位置数据分析" iconcls="icon-reload" style="padding:10px;">
                <a href="javascript:void(0)" class="detailLink123" url="location.html">数据分析</a><br />
            </div>
        </div>
    </div>
    <!-----------------左边布局结束------------->
    <!-----------------底部布局------------->
    <div region="south" border="true" split="false" style="overflow: hidden; height: 50px;">
        <div class="footer">Copyright © 社团汇团队</div>
    </div>
    <!-----------------底部布局结束------------->
    <!-----------------中间布局------------->
    <div region="center" id="mainPanle" border="false" style="overflow: hidden;">

        <div class="easyui-tabs" style="width:750px;height:250px;" fit="true" id="tt" border="true">
            <div title="欢迎您" style="padding:10px" data-options="closable:true">
                <iframe src="welcome.html" scrolling="no" width="100%" height="100%" frameborder="0"></iframe>
            </div>
        </div>
    </div>



    <!-----------------中间布局结束------------->


   



</body>
</html>
