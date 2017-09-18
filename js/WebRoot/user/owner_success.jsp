<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>认领企业-之江信用</title>
<base href="${basePath }/" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/style/new/trade_style.css" rel="stylesheet" type="text/css" />
<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
<script type="text/javascript">
  var userCfg = userCfg || {page:'ownerSuccess'};
</script>
</head>

<body>
 <jsp:include page="../user/top.jsp" />
   <div class="layout new_lc">
  	<span>1.选择您要认领的企业</span>
  	<span>2.提交认领资料</span>
  	<span class="current">3.等待审核</span>
  </div>
  <div class="layout admit-lc">
  	<div class="adv-lc"><img src="${basePath}/images/adv-lc.jpg" /></div>
  	<div class="input-lc">
  		<div class="fina-main fina-succeed">
					<img src="${basePath}/images/trade-images/fi-icon3.png" />
					<h3>恭喜您提交成功！</h3>
					<h4>我们会尽快核实您提交的资料，请您耐心等待~</h4>
					<h5><span id="owner_time">3</span>秒钟后自动跳转信用之江首页</h5>
					<input type="button" value="立即前往" id="back_index" />
				</div>
		</div>
  </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>
