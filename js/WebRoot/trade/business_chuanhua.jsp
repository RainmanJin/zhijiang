<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>传化物流-之江信用</title>
	<base href="${basePath }/" />
	<link href="${basePath }/style/new/trade_style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/trade.js" src="${basePath }/js/lib/require.js"></script>
	<script>
	  var financeCfg =  financeCfg ||{};
	</script>
	   
  </head>
  <body data-attr="ecshop">
	<jsp:include page="/user/top.jsp"/>
	
	<div class="layout content" trade_left='4' >
        <jsp:include page="/trade/left.jsp" />
        <div class="main main2">
        	<div class="fancy">
                <ul>
                	<li class="active"><img src="${basePath}/images/trade-images/retails-chuanhua-bg.jpg"></li>
                </ul>
                <a href="javascript:void(0);" class="fancy-left"><img src="${basePath}/images/trade-images/retails-img01.jpg"></a>
                <a href="javascript:void(0);" class="fancy-right"><img src="${basePath}/images/trade-images/retails-img02.jpg"></a>
			</div>
            <div class="ret-content">
            	<div class="ret-title"><p>传化物流</p></div>
                <div class="ret-induct">
                	<p>传化物流是国内领先的公路物流行业平台运营商，致力于构建“中国智能公路物流网络运营系统”，通过“互联网物流平台网络”和“公路港共享平台网络”的互联互通，系统性解决中国公路物流短板问题，提升公路物流效率，降低公路物流成本，打造“物流+互联网+金融服务”为特征的中国公路物流新生态。</p>
                    <p>传化物流紧紧围绕“物流价值链”与“增值服务价值链”，逐步构建公路港平台和信息服务系统的共享平台，打造“陆鲸”、“易货嘀”、“传化运宝”等开放的物流互联网产品，形成一个“共创、共赢、共享”的传化物流创客平台。从而，为货主企业、物流企业及个体货运司机等公路物流主体提供综合性物流及配套服务，共同形成“高效的货物调度平台”、“优质的货运生活服务圈”以及“可靠的物流诚信运营体系”，发展公路物流O2O全新生态。</p>
					 <p>官方网站：<a href="http://www.etransfar.com/" target="_blank">http://www.etransfar.com/</a></p>
				</div>
            </div>
            <div class="ret-content">
            	<div class="ret-title"><p>诚信企业名录</p></div>
                <div class="ret-data">
                    <img src="${basePath}/images/trade-images/retails-img06.jpg">
                    <h3>暂无数据</h3>
				</div>
            </div>
            <div class="ret-apply">
            	<p><a href="javascript:void(0);">申请加入</a></p>
            </div>
        </div>
    </div>
     <jsp:include page="/footer.jsp" />
 </body>
</html>