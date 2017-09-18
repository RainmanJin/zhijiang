<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<div class="baseLeft" id="taca_nav_id">
		<a href="${basePath}/taca/apply/company/operate?activityId=${param.activityId}" data-nav="company/operate">企业经营及监管机关信息</a>
		<a href="${basePath}/taca/apply/corporate/govern?activityId=${param.activityId}" data-nav="corporate/govern">法人治理</a>
		<a href="${basePath}/taca/apply/company/management?activityId=${param.activityId}" data-nav="company/management">企业管理</a>
		<a href="${basePath}/taca/apply/contract/performance?activityId=${param.activityId}" data-nav="contract/performance">合同履约</a>
		<a href="${basePath}/taca/apply/industry/status?activityId=${param.activityId}" data-nav="industry/status">行业地位</a>
		<a href="${basePath}/taca/apply/company/finance?activityId=${param.activityId}" data-nav="company/finance">企业财务信息</a>
		<c:if test="${activity.submitType == 1}">
			<a href="${basePath}/taca/apply/company/responsibility?activityId=${param.activityId}" data-nav="company/responsibility">企业责任</a>
		</c:if>
		<a href="${basePath}/taca/apply/dispute?activityId=${param.activityId}" data-nav="apply/dispute">企业信用记录</a>
		<a href="${basePath}/taca/apply/record?activityId=${param.activityId}" data-nav="apply/record">工商信用记录</a>
		<a href="${basePath}/taca/apply/tax?activityId=${param.activityId}" data-nav="apply/tax">税务信用记录</a>
		<a href="${basePath}/taca/apply/labor?activityId=${param.activityId}" data-nav="apply/labor">劳动用工信用记录</a>
		<a href="${basePath}/taca/apply/bank?activityId=${param.activityId}" data-nav="apply/bank">银行信用记录</a>
		<a href="${basePath}/taca/apply/other?activityId=${param.activityId}" data-nav="apply/other">其他信用记录</a>
</div>