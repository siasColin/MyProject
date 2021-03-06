<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*" pageEncoding="utf-8" %>
<%@ page errorPage="Error_page_deal.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="css/font-awesome.min.css" type="text/javascript" rel="stylesheet">
<link href="css/bootsnav.css" type="text/css" rel="stylesheet">
<link href="css/normalize.css" type="text/css" rel="stylesheet">
<link href="css/css.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/bootsnav.js" type="text/javascript"></script>
<script src="http://cdn.bootcss.com/jquery/1.12.3/jquery.min.js"></script>
<script src="layer/layer/layer.js"></script>
<!-- <script src="js/jquery.js" type="text/javascript"></script> -->
<!--[if IE]><script src="js/html5.js"></script><![endif]-->
<title>重置密码</title>
</head>
<%  
	String message="";
    message=(String)session.getAttribute("message");
    
    if("".equals(message)  || message==null)
    {}
 	else
 	{
%>
		<script language="javascript">
		layer.msg('<%=message%>', {icon: 5});//这句话好坑，坑了我一晚上		    
		</script>
<% 
		session.setAttribute("message", "");  //把message从新设置为空
	}
%>
<script language="javascript">
function check() 
{
	if (form_login.username.value == "") {
	
		layer.msg("请输入你的学号");
		form_login.username.focus();
		return false;
		
	}
	if (form_login.username.value.length != 12) {
		
		layer.msg('学号格式错误');
		form_login.username.focus();
		return false;
		
	}
}
</script>

<body class="logobg_style">
  	<div id="large-header" class="large-header login-page">
  		<canvas id="demo-canvas" width="1590" height="711"></canvas>
  		<div class="login-form" style="top: 45%;left: 50%;">
  		
  			<div class="login-content">
  			<br><br><br>
  				<h2 class="title_name">找回密码</h2>
  				<br><br>
  				<form action="retrivePasswordController" name="form_login" class="login_padding" method="post" onSubmit="return check();">
				<input type="hidden" name="url" value=<%= "Retrieve_password.jsp"%> />
				<div class="form-group clearfix">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="icon_user"></i>
						</div>
						<input type="text" class="form-control" name="userId" id="username" placeholder="请输入学号" autocomplete="off" oninput="value=value.replace(/[^\d]/g , '')">
					</div>
				</div>
				
                  <div class="tishi"></div>
				<div class="form-group">
				<input type="submit" value="下一步" class="btn btn-danger btn-block btn-login">
						
				</div>
				<div class=" textright"><a href="login.jsp" class="forget">返回</a></div>
				<!-- Implemented in v1.1.4 -->				
				<div class="form-group">			
				</div>
			</form>
  			</div> 			
  		</div>
  	</div>
  	
<script src="js/TweenLite/TweenLite.min.js"></script>
<script src="js/TweenLite/EasePack.min.js"></script>
<script src="js/TweenLite/rAF.js"></script>
<script src="js/TweenLite/demo-1.js"></script>
</body>
</html>
