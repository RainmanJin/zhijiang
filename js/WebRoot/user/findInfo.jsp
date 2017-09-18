<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>找回密码-之江信用</title>
<base href="${basePath }/" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
 <script type="text/javascript">
     var userCfg = userCfg || {page:'findInfo'};	
     userCfg['email'] = '${email}';
  </script>
</head>

<body>
	<jsp:include page="../user/top.jsp" />
    <div class="container-group">
        <div class="content">
            <div class="findInfo-title" >
            	<h2 >找回密码</h2>
                <img src="${basePath }/images/find2.png"/>
            </div>
            <div class="findInfo-content">
            	<h3 >邮箱验证<span>为了您的帐号安全，请完成身份验证</span></h3>
                <div class="findInfo-form">
                	<div class="findInfo-register-oneline" >
                        <div class="findInfo-register-text" >邮箱：</div>
                        <div class="findInfo-register-yx" id="email" ></div>
                    </div>
                    <div class="findInfo-register-oneline" >
                        <div class="findInfo-register-have" style="margin-left: 8.5%; "> 
                        	<p id="findInfo" style="color: #49A049;">${findInfo }</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </div>
</body>
</html>
