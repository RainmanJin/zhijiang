<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<div class="baseLeft" id="taca_details_nav">
	<a href="${basePath}/taca/audit/operate?auditId=${param.auditId}" data-nav="audit/operate">企业经营及监管机关信息</a>
	<a href="${basePath}/taca/audit/corporate/govern?auditId=${param.auditId}" data-nav="audit/corporate/govern">法人治理</a>
	<a href="${basePath}/taca/audit/company/management?auditId=${param.auditId}" data-nav="audit/company/management">企业管理</a>
	<a href="${basePath}/taca/audit/contract/performance?auditId=${param.auditId}" data-nav="audit/contract/performance">合同履约</a>
	<a href="${basePath}/taca/audit/industry/status?auditId=${param.auditId}" data-nav="audit/industry/status">行业地位</a>
	<a href="${basePath}/taca/audit/company/finance?auditId=${param.auditId}" data-nav="audit/company/finance">企业财务信息</a>
    <c:if test="${userTacaActivity.submitType == 1}">
	<a href="${basePath}/taca/audit/company/responsibility?auditId=${param.auditId}" data-nav="audit/company/responsibility">企业责任</a>
    </c:if>
	<a href="${basePath}/taca/audit/dispute?auditId=${param.auditId}" data-nav="audit/dispute">企业信用记录</a>
	<a href="${basePath}/taca/audit/record?auditId=${param.auditId}" data-nav="audit/record">工商信用记录</a>
	<a href="${basePath}/taca/audit/tax?auditId=${param.auditId}" data-nav="audit/tax">税务信用记录</a>
	<a href="${basePath}/taca/audit/labor?auditId=${param.auditId}" data-nav="audit/labor">劳动用工信用记录</a>
	<a href="${basePath}/taca/audit/bank?auditId=${param.auditId}" data-nav="audit/bank">银行信用记录</a>
	<a href="${basePath}/taca/audit/other?auditId=${param.auditId}" data-nav="audit/other">其他信用记录</a>
</div>