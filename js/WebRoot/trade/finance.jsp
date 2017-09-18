<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>信用金融</title>
	<base href="${basePath }/" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<%-- <link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" /> --%>
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/trade_style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/trade.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
	   var financeCfg = financeCfg || {};
	</script>
  </head>
  <body data-attr="financial">
	<jsp:include page="/user/top.jsp"/>
	<div class="finance-banner">
		<p><a href="${basePath }/user/trade/financial/addInit">立即申请</a></p>
	</div>
	<div class="fina-infor">
		<div class="layout">
			<div class="fina-ib fina-ib1">
				<div class="fina-ib-left" style="padding: 32px 14px 0 37px;">
					<img src="${basePath}/images/trade-images/fi-icon5.png">
				</div>
				<div class="fina-ib-right">
					<h4>贷前</h4>
					<h5>身份核验，降低放贷风险</h5>
				</div>
			</div>
			<div class="fina-ib fina-ib2">
				<div class="fina-ib-left" style="padding: 32px 14px 0 42px;">
					<img src="${basePath}/images/trade-images/fi-icon6.png">
				</div>
				<div class="fina-ib-right">
					<h4>贷中</h4>
					<h5>实时监测，加强风险管控</h5>
				</div>
			</div>
			<div class="fina-ib fina-ib1">
				<div class="fina-ib-left" style="padding: 32px 14px 0 32px;">
					<img src="${basePath}/images/trade-images/fi-icon7.png">
				</div>
				<div class="fina-ib-right">
					<h4>贷后</h4>
					<h5>行为跟踪，发现异常预警</h5>
				</div>
			</div>
		</div>
	</div>
	<div class="layout c-content">
		<h3>产品介绍与服务<span>PRODUCTS AND SERVICES</span></h3>
		<h4>反欺诈是上海凭安征信针对金融机构自主研发的互联网金融信用服务产品。通过对海量样本数据的规则生成、机器识别，贷前身份核验，降低放贷风险；贷中实时监测，加强风险管；贷后行为
跟踪，发现异常预警，做到全生命周期安全防护。支持 API 接口查询和 WEB 界面查询。</h4>
		<div class="c-int">
			<div class="c-blcok">
				<div class="c-blcok-top">
					<img src="${basePath}/images/trade-images/fi-icon8.png"><span></span>
				</div>
				<div class="c-blcok-bt">
					<h5>黑名单</h5>
					<p>有效针对用户在其他机构发生金融失信行为，包括且不限于逾期、失联、跑路等</p>
				</div>
			</div>
			<div class="c-blcok">
				<div class="c-blcok-top">
					<img src="${basePath}/images/trade-images/fi-icon9.png"><span></span>
				</div>
				<div class="c-blcok-bt">
					<h5>染黑度</h5>
					<p>基于贷前客户被催收的记录，分析其贷款所带来的风险</p>
				</div>
			</div>
			<div class="c-blcok">
				<div class="c-blcok-top">
					<img src="${basePath}/images/trade-images/fi-icon10.png"><span></span>
				</div>
				<div class="c-blcok-bt">
					<h5>联合建模</h5>
					<p>基于加密后客户自有数据和凭安大数据分析指标，挖掘有效产量并建模，满足多场景应用需求</p>
				</div>
			</div>
			<div class="c-blcok" style="margin-right: 0;">
				<div class="c-blcok-top">
					<img src="${basePath}/images/trade-images/fi-icon11.png"><span></span>
				</div>
				<div class="c-blcok-bt">
					<h5>规则生成引擎</h5>
					<p>对获取的样本数据通过机器识别，在云服务上生成适用性规则，供以用户下载结构化数据</p>
				</div>
			</div>
		</div>
	</div>
    <jsp:include page="/footer.jsp" />
 </body>
</html>