
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang='zh'>
	<head>
		<title>IMSDK Web Demo V0.0.1</title>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<meta name='viewport' content='width=device-width, initial-scale=1.0'>
		<meta http-equiv='X-UA-Compatible' content='IE=edge'>
		
		<script src='javascript/plugins/jquery-2.1.4.min.js?v2.1.4'></script>
		
 		<!-- 新 Bootstrap 核心 CSS 文件 -->
<!--	<link rel='stylesheet' href='//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css'>

		可选的Bootstrap主题文件（一般不用引入）
		<link rel='stylesheet' href='//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css'>

		jQuery文件。务必在bootstrap.min.js 之前引入
		<script src='//cdn.bootcss.com/jquery/1.11.3/jquery.min.js'></script>

		最新的 Bootstrap 核心 JavaScript 文件
		<script src='//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js'></script> -->


		<script src='javascript/imsdk-javascript-sdk.min.js?v0.0.1'></script>

		<!--[if lt IE 9]><link rel='stylesheet' href='/views/fixiebg.css?br34k-01'><![endif]-->

		<style>
			body { background: #eee; }
			/*.container { width: 780px; }*/
			div#msg-list{
				height: 400px; 
				overflow: auto; 
				border: 2px solid rgb(199,191,211); 
				background: #fff; 
				border-radius: 4px;
				padding: 5px;
				margin: 5px; 
			}
			select#iptTargetType,
			input#iptTarget, 
			input#iptMsg {
				border: 2px solid rgb(199,191,211); 
				background: #fff; 
				border-radius: 4px;
				padding: 5px;
				margin: 5px; 
			}
			button#btnMsgSent {
				border-radius: 4px;
				padding: 5px;
				margin: 5px; 
			}

			.row{ margin-bottom: 10px;}
		</style>
	</head>
	
	<body>
		<div class='container'>
			<div class='row'>
				<div class='col-md-12'>
					<h3>IMSDK JS Lib <span id='verSpan'></span> Demo</h3>
				</div>
			</div>
			<div class='row'>
				<div class='col-md-3 col-offset-1'>
					<input id='iptAppKey' class='form-control' type='text' value='00b6413a92d4c1c84ad99e0a' placeholder='请输入App_Key' />
				</div>
				<div class='col-md-3 col-offset-1'>
					<button id='btnSetToken' class='btn btn-danger'>所有动作之前初始化</button>
				</div>
			</div>
			<div class='row'>
				<div class='col-md-5 col-offset-1'>
					<input id='iptToken' class='form-control' type='text' value='' placeholder='请输入token' />
				</div>
				<div class='col-md-5'>
					<input id='iptNick' class='form-control' type='text' placeholder='请输入昵称' />
				</div>
			</div>
			<div class='row'>
				<div class='col-md-5'>
					<input id='iptUser' class='form-control' type='text' value='' placeholder='请输入用户名' />
				</div>
				<div class='col-md-5 col-offset-1'>
					<input id='iptPwd' class='form-control' type='password' value='' placeholder='请输入密码' />
				</div>
			</div>
			<div class='row'>
				<div class='col-md-10 col-offset-1'>
					<button id='btnReg' class='btn btn-danger'>注册</button>
					<button id='btnLogin' class='btn btn-success'>登录</button>
					<button id='btnLogout' class='btn btn-default'>登出</button>
					<button id='btnUser' class='btn btn-info after-login disabled '>获取当前用户信息</button>
					<!--<button id='btnFriends' class='btn btn-info after-login disabled '>获取好友列表</button>
					<button id='btnGroups' class='btn btn-info after-login disabled'>获取群组列表</button>-->
				</div>
			</div>
			<div class='row'>
				<div class='col-md-10 col-offset-1'>
					<div id='msg-list'></div>
				</div>
			</div>
			<div class='row'>
				<div class='col-md-2 col-offset-1'>
					<select id='iptTargetType' class='form-control' placeholder='请选目标类型'>
						<option value="user">用户</option>
						<option value="team">群组</option>
					</select>	
				</div>
				<div class='col-md-2'>
					<input id='iptTarget' class='form-control' type='text' placeholder='请输入聊天对象' value='' />
				</div>
				<div class='col-md-4'>
					<input id='iptMsg' class='form-control' type='text' placeholder='请输入聊天内容' />
				</div>
				<div class='col-md-2 '>
					<button id='btnMsgSent' class='btn btn-success btn-block'>发送</button>
				</div>
			</div>
		</div>
		<script type='text/javascript'>


		$(function() {
			var imCli = null;
			var $content = $('#msg-list');


			var initCli = function(app_key) {
				return new IMSDK(app_key, {
					onInitialized : function(){
						console.log('finished initialize');
						$content.append('IMSDK JS Lib Demo V' + this.VERSION + '<br />初始化完成<br />');
					},
					onDisConnected : function(){
						console.log('disconnect');
						$content.append('连接已断开<br />');
					},
					onConnected : function(){
						console.log('connect succ');
						$content.append('连接成功<br />');
					},
					onConnectedError : function(){
						console.log('conn error');
						$content.append('连接服务器失败<br />');
					},
					onTextReceived : function(data){
						try {
							console.log('text recv - ' + data );
							$content.append( '<a id="u-' + data.from_cid + '" class="link-userinfo" href="#">' + data['from_cid'] + '</a>:' + data['content'] + '<br />');
						} catch(e){
							console.error('parse msg[' + data + '] error - ' + e);
						}
					},
					onTeamTextReceived : function(fromUser,groupInfo, sendTime, content){
						try {
							console.log('text recv - ' + content );
							$content.append( 
								'来自群 <a id="t-' + groupInfo.group_id + '" class="link-groupinfo" href="#">' + (groupInfo.group_name || groupInfo.group_id)+ '</a> ' +
								'的 <a id="u-' + fromUser.cid + '" class="link-userinfo" href="#">' + (fromUser.nick_name || fromUser.cid) + '</a> ' +
								' - ' + sendTime.toLocaleString() +
								': ' + content + '<br />');
						} catch(e){
							console.error('parse msg[' + content + '] error - ' + e);
						}
					},
					onImageReceived : function(data){
						console.log('image recv');
						$content.append('收到图片消息：' + data + '<br />');
					},
					onVoiceReceived : function(data){
						console.log('voice received');
						$content.append('收到语音消息：' + data + '<br />');
					},
					onSystemMsgReceived : function(data){
						console.log('system recv');
						$content.append('收到系统消息：' + data + '<br />');
					}
				});
			};

			$('#btnSetToken').click(function(){
				imCli = initCli($('#iptAppKey').val());
			});

			$('#btnReg').click(function(){
				imCli.register( $('#iptToken').val(),
				{
					'cid': $('#iptUser').val(),
					'password': $('#iptPwd').val(),
					'nick_name': $('#iptNick').val()
				}, function(data){
					console.info('reg succ - ' + data);
					$('#btnSetToken').attr('disabled','disabled');
					$('.after-login').removeClass('disabled');
					$content.append('注册成功，用户信息：'  + data + '<br />');
				}, function(code, data){
					console.info(code + '-' + data)
					$content.append('注册失败，错误码：' + code + ' 描述：' + data + '<br />');
				});
				return false;
			});
			$('#btnLogin').click(function(){
				imCli.login(
					$('#iptUser').val(),
					$('#iptPwd').val()
				, function(data){
					console.info('login succ - ' + data);
					$('#btnSetToken').attr('disabled','disabled');
					$('.after-login').removeClass('disabled');
					$content.append('登录成功，用户信息：'  + JSON.stringify(data) + '<br />');
				}, function(code, data){
					console.error(code + '-' + data)
					$content.append('登录失败，错误码：' + code + ' 描述：' + data + '<br />');
				});
				
				return false;
			});
			$('#btnLogout').click(function(){
				imCli.logout( function(data){
					console.info('logout succ - ' + data);
					$('#btnSetToken').attr('disabled','');
					$content.append('登出成功，用户信息：'  + data + '<br />');

				}, function(code, data){
					console.error('logout failed : ' + code + '-' + data)
					$content.append('登出失败，错误码：' + code + ' 描述：' + data + '<br />');
				});
				$('.after-login').addClass('disabled');
				
				return false;
			});

			$('#btnUser').click(function(){
				var userInfo = imCli.getUserInfo( $('#iptUser').val() );

				console.log(userInfo);
				
				$content.append(  ' 获取' + cid + '的信息：' +  JSON.stringify(userInfo) + '<br />' );
			});

			$('#btnMsgSent').click(function(){
				var target = $('#iptTarget').val();
				var msg = $('#iptMsg').val();
				var type = $('#iptTargetType').val();

				var msg = {
					'target' : target,
					'msg_type' : 'txt',
					'content' : msg
				};

				if (type==='user') {
					imCli.sendUserMsg( msg, 
						function(data, msg){
							var user = this.current;
							$content.append(  '<span style="color:green">我:' + msg.content + '</span><br />' );
						},
						function(status, error_msg, msg){
							console.log( status, error_msg, msg );
						});
				} else {
					imCli.sendTeamMsg( msg, 
						function(data, msg){
							var user = this.current;
							$content.append(  '<span style="color:green">我:' + msg.content + '</span><br />' );
						},
						function(status, error_msg, msg){
							console.log( status, error_msg, msg );
						});
				}
			});

			$('#btnFriends').click(function(){
				if (!imCli) return;

				var list = imCli.getFriends();
				$content.append(JSON.stringify(list) + '<br />');
			});

			$('#msg-list').on('click', 'a.link-userinfo', function(){

				var cid = $(this).attr('id').replace('u-', '');
				var user = imCli.getUserInfo(cid);

				$content.append(JSON.stringify(user) + '<br />');

				$('#iptTargetType').val('user');
				$('#iptTarget').val(cid);
			});

			$('#msg-list').on('click', 'a.link-groupinfo', function(){

				var tid = $(this).attr('id').replace('t-', '');
				var team = imCli.getGroup(tid);

				$content.append(JSON.stringify(team) + '<br />');

				$('#iptTargetType').val('team')
				$('#iptTarget').val(tid);
			});
		});
		</script>

		<div id='content'></div>
	</body>
</html>