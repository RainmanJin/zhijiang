<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="${basePath }/" data-detailUrl="${companyDetailUrl }"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta name="renderer" content="webkit" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="" />
	<meta http-equiv="description" content="" />
	<title>首页-之江信用</title>
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/flow.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/activity.js" src="${basePath }/js/lib/require.js"></script>
	<script>
		var activityCfg = activityCfg || {page : 'flowThree'};
	</script>
</head>

<body>
<jsp:include page="/user/top.jsp"/>

<!--top_bg-->
<div class="top_bg_y"></div>

<!--flow-->
<div class="n-layout">
<div id="flow_y"><h3>申报流程</h3><dl class="flow_bg3_y"><span>填写基础信息</span><span>上传增信信息</span><span>确认支付</span><span>等待审核</span></dl></div>
<h2 class="flow_tetle_y">申报者个人信息</h2>
<ul class="flow_ul_y">
姓名：乐大人<br/>
联系方式：12345678901<br/>
工作邮箱：ledaren@163.com
</ul>

<h2 class="flow_tetle_y">企业基本信息</h2>
<ul class="flow_ul_y">
企业名称：XXXXXXXXXXXXXXXXXX有限公司<br/>
行业分类：酒类流通<br/>
企业所在地：浙江省杭州市<br/>
企业联系电话：0571-23121231<br/>
企业官方网站地址：www.www.com
</ul>

<h2 class="flow_tetle_y">证件资料</h2>
<ul class="flow_ul_y">
<li><p>基础类：</p></li>
<li class="h160_y"><span class="f_massmap_ok"><div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /></div><div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /></div>
</span>
<div class="clear"></div></li>
<li><p>基础类：</p></li>
<li class="h160_y"><span class="f_massmap_ok"><div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /></div><div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /></div>
</span>
<div class="clear"></div></li>
<div class="clear"></div></ul>

<ul class="f_alipay_y"><li>在线支付：<font>500.00元</font></li><li><a href="" class="f_pay_img"><img src="images/alipay_y.jpg" /></a><div class="clear"></div></li><li> <button class="f_btn_pay" onclick="postComment()">确认支付</button>请在一小时内完成支付，超出1小时再支付此次申报将被取消</li></ul>
</div>

<!--end n-main-->
<jsp:include page="/footer.jsp" />
	<!--end n-footer-->

<!--popup-->
<div class="all_black" style="display:;"></div>
<div class="f_pay_c">
  <h3><a href=""><img src="images/icon_y_05.png" /></a>支付500.00元</h3>
  <dl>
    <p><img src="images/erweima.jpg" /></p>
    <a href="">首次使用请下载手机支付宝</a>
  </dl>
</div>
</body>
</html>
