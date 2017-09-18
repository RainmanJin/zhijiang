<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="${basePath }/" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>信用直通车-之江信用</title>
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
		var userCfg = userCfg || {page : 'registerResult'};
		userCfg['sendEmail'] = '<%=response.encodeURL("sendEmail")%>';
	</script>
</head>

<body class="container-bg">
<jsp:include page="../user/top.jsp" />
<!--end layout-->
<div class="n-banner01">
	<div class="n_login">
		<div class="n_login_main succeed succeed_new">
			<h3><img src="${basePath }/images/new_s.png" />还差一步即可完成注册！</h3>
			<h4>注册成功后，您可以享受如下服务：</h4>
			<h4>企业认领、企业信用动态关注、企业信用评价等</h4>
			<div class="find-email">
				<p>${addInfo }</p>
				<p>${registerEmail }</p>
				<p>
					<a href="javascript:void(0)" target="_blank" id="mailLink" >请进入您的邮箱查收激活邮件</a>
					<a href="javascript:void(0)" id="resend">点击重新发送(未收到邮件?)</a>
				</p>
			</div>
		</div>
	</div>
</div>
<!--end layout-->
<jsp:include page="../footer.jsp" />
</body>
</html>
