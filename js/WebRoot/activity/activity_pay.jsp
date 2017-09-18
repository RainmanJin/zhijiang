<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>之江信用</title>
		<base href="${basePath }/" data-detailUrl="${companyDetailUrl }"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta name="renderer" content="webkit" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="" />
		<meta http-equiv="description" content="" />
		
		<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new-css/flow.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new-css/slider.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new-css/lightbox.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />
		<meta property="qc:admins" content="1453276267425345466727" />
		<script data-main="${basePath }/js/uzj/activity.js" src="${basePath }/js/lib/require.js"></script>
		<script>
			var activityCfg = activityCfg || {};
		</script>
	</head>
	<body id="body">
	<jsp:include page="/user/top.jsp"/>
		<!--top_bg-->
	<div class="top_bg_y"></div>
	
	<!--flow-->
	<div class="n-layout">
		<div id="flow_y">
		   <h3>申报流程</h3>
		   <dl class="flow_bg3_y">
		     <span>填写基础信息</span>
		     <span>上传增信信息</span>
		     <span>确认支付</span>
		     <span>等待审核</span>
		   </dl>
		</div>
		<h2 class="flow_tetle_y">申报者个人信息</h2>
		<ul class="flow_ul_y">
			姓名：${companyIndLight.userRealName}<br/>
			联系方式：${companyIndLight.userPhone}<br/>
			工作邮箱：${companyIndLight.userEmail}
		</ul>
		<h2 class="flow_tetle_y">企业基本信息</h2>
		<ul class="flow_ul_y">
			企业名称：${companyIndLight.companyName}<br/>
			行业分类：${companyIndLight.industryName}<br/>
			企业所在地：${companyIndLight.province}${companyIndLight.city}<br/>
			企业联系电话：${companyIndLight.companyContacts}<br/>
			企业官方网站地址：${companyIndLight.companySite}
		</ul>
		
		<h2 class="flow_tetle_y">证件资料</h2>
		<ul class="flow_ul_y">
			<li><p>基础类：</p></li>
			<li class="h160_y">
			  <span class="f_massmap_ok" id="basisA">
			    <c:if test="${not empty companyIndLight.userBusinessCard}">
				    <div class="f_upload1_pic_y">
				      <a class="example-image-link" href="http://${domain }/${companyIndLight.userBusinessCard}" data-lightbox="example-set" >
				         <img src="http://${domain }/${companyIndLight.userBusinessCard}" width="90px" height="90px"/>
				      </a>
				    </div>
			    </c:if>
			    <c:if test="${not empty companyIndLight.businessLicense}">
				    <div class="f_upload1_pic_y">
				      <a class="example-image-link" href="http://${domain }/${companyIndLight.businessLicense}" data-lightbox="example-set" >
				         <img src="http://${domain }/${companyIndLight.businessLicense}" width="90px" height="90px"/>
				       </a>
				    </div>
			    </c:if>
			    <c:if test="${not empty companyIndLight.industryLicense}">
				    <div class="f_upload1_pic_y">
				      <a class="example-image-link" href="http://${domain }/${companyIndLight.industryLicense}" data-lightbox="example-set" >
				         <img src="http://${domain }/${companyIndLight.industryLicense}" width="90px" height="90px"/>
				       </a>
				    </div>
			    </c:if>
			    <c:if test="${not empty companyIndLight.bankLicense}">
				    <div class="f_upload1_pic_y">
				      <a class="example-image-link" href="http://${domain }/${companyIndLight.bankLicense}" data-lightbox="example-set" >
				         <img src="http://${domain }/${companyIndLight.bankLicense}" width="90px" height="90px"/>
				       </a>
				    </div>
			    </c:if>
		     </span>
		     <div class="clear"></div>
		   </li>
		   <li><p>增信类：</p></li>
		   <li class="h160_y" >
		   <c:if test="${not empty companyIndLightDatums}">
		     <span class="f_massmap_ok" id="letterA">
		        <c:forEach items="${companyIndLightDatums}" var="datums">
			        <div class="f_upload1_pic_y">
			            <img src="http://${domain }/${datums.datumPath }" />
			        </div>
		        </c:forEach>
		      </span>
		    </c:if>
		    <div class="clear"></div>
		  </li>
		  <div class="clear"></div>
		</ul>
		
	   <ul class="f_alipay_y">
	        <li>在线支付：<font>${orderRealAmount}元</font></li>
	        <li>
	           <a href="javascript:void(0)" class="f_pay_img">
	             <img src="${basePath}/images/new-images/alipay_y.jpg" />
	           </a>
	           <div class="clear"></div>
	       </li>
	       <li>
               <form action="${basePath}/order/pay" method="post">
                   <input type="hidden" name="orderNo" value="${orderNo}" />
                   <input type="hidden" name="orderTypeCode" value="${orderType}" />

	          <input class="f_btn_pay" type="submit" value="确认支付" />请在一小时内完成支付，超出1小时再支付此次申报将被取消
               </form>
	       </li>
	    </ul>
	</div>
	<jsp:include page="/footer.jsp" />

	
	<!--popup-->
	<div class="all_black" style="display:none;" id="slideMark"></div>
	<div class="f_pay_c" id="openPost" style="display:none;">
	   <h3>
	     <a href="javascript:void(0)" id="closePay">
	       <img src="${basePath}/images/new-images/icon_y_05.png" />
	     </a>支付500.00元
	   </h3>
	   <dl>
	     <p><img src="${basePath}/images/new-images/erweima.jpg" /></p>
	     <a href="javascript:void(0)">首次使用请下载手机支付宝</a>
	   </dl>
	</div>
  </body>
</html>
