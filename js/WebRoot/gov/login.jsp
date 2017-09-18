<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户登录-之江信用</title>
      <base href="${basePath}/"/>
	<link rel="stylesheet" href="${basePath }/style/Validform_style.css" type="text/css" media="all" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/gov_style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css" />
      <script data-main="${basePath }/gov/js/login.js" src="${basePath }/gov/js/lib/require.js"></script>
  </head>
  <body class="container-bg">
	<jsp:include page="gov_top.jsp"/>
    <div class="layout login">
        <div class="login-main">
        	<div class="login-pt"></div>
            <div class="login-form">
            	<h2><span>用户登录</span></h2>
            	<input type="hidden" id="fromUrl" value="${sessionScope.fromURL}"/>
            	<input type="hidden" id="toUrl" value="${toUrl}"/>
                <form id="loginForm" method="post" action="${basePath }/gov/<%=response.encodeURL("ajaxLogin") %>">
                	<div class="login-infor" id="errorMsg" style="display:none;"><img src="${basePath }/images/wrong-icon.png" /><label></label></div>
                	<input type="hidden" name="from" value="${from }">
                	 <div class="form-item-wrap">
                	 	<div class="form-item">
               				<input name="name" id="login_username" role type="text" placeholder="请输入您的用户名或邮箱" des="用户名或邮箱" minlength="1" maxlength="30" class="login-w1 login-m" msgtip="innerLeft" />
                		</div>
                	 	<div class="form-item">
                   			<input id="login_password" type="password" role  placeholder="请输入您的密码" des="密码" minlength="6" maxlength="30" name="password"  class="login-w1  login-m" msgtip="innerLeft" />
	                    </div>			
                   		<p class="form-pr"><%-- <a href="${basePath }/user/findPwd.jsp">忘记密码</a> --%></p> 
	                    <button class="login-z login-m" id="loginBtn"  type="submit">登 录</button>
	                    <h4><%--您还没有账号？ <a href="${basePath }/user/toRegister">立刻注册</a>或者使用以下方式登录--%></h4>
	                     <%--<p class="auto-login">
		                    <h5>
			                    <a href="${basePath }/user/third/login?type=qq&toUrl=${fromURL}"  style="font-size: 12px;"><img src="${basePath }/images/qq-icon.png" /></a>
			                    <a href="${basePath }/user/third/login?type=weixin&toUrl=${fromURL}"  style="font-size: 12px;"><img src="${basePath }/images/wx-icon.png"></a>
		                    </h5>
	                    </p>--%>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--end layout-->
    <jsp:include page="/gov/footer.jsp" />	
	</body>
</html>