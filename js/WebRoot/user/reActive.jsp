<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>用户注册-之江信用</title>
<base href="${basePath }/" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/style/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
<script type="text/javascript">
var userCfg = userCfg || {page : 'reActive'};
userCfg['account'] = '${param.account}';
userCfg['sendEmail'] = '<%=response.encodeURL("sendEmail")%>';
</script>
</head>

<body>
	
	<jsp:include page="../user/top.jsp" />
	<!--end banner-->
    <div class="container-group">
    	<div id="infoMessage"></div>
        <div class="content">
            <div class="find-title">
            	<h2>用户注册-重新激活</h2>
                <%-- <img src="${basePath }/images/find3.png"/> --%>
            </div>
            <div class="find-content">
            	<h2 id="sendInfo"><a href="javascript:void(0)" id="resend">点击发送激活邮件</a></h2>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </div>
    
</body>
</html>
