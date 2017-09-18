<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<div class="table" id="baseInfoDiv">
	<h2>登记注册信息</h2>
	<table class="table-a1" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td class="t1">统一社会信用代码</td>
			<td class="t2"><c:if test="${empty bizCompany.creditNo}">暂无</c:if>${bizCompany.creditNo}</td>
			<td class="t1">组织机构代码</td>
			<td class="t2"><c:if test="${empty bizCompany.orgCode}">暂无</c:if>${bizCompany.orgCode}</td>
		</tr>
		<tr>
			<td class="t1">法定代表人</td>
			<td class="t2">${bizCompany.legalPerson}</td>
			<td class="t1">公司名称</td>
			<td class="t2">${bizCompany.companyName}</td>
		</tr>
		<tr>
			<td class="t1">注册号</td>
			<td class="t2">${bizCompany.companyCode}</td>
			<td class="t1">注册地址</td>
			<td class="t2">暂无</td>
		</tr>
		<tr>
			<td class="t1">英文名称</td>
			<td class="t2">暂无</td>
			<td class="t1">英文地址</td>
			<td class="t2">暂无</td>
		</tr>
		<tr>
			<td class="t1">质监批准单位</td>
			<td class="t2">暂无</td>
			<td class="t1">质监作废日期</td>
			<td class="t2">暂无</td>
		</tr>
		<tr>
			<td class="t1">质监年检期限</td>
			<td class="t2">暂无</td>
			<td class="t1">质监年检日期</td>
			<td class="t2">暂无</td>
		</tr>
		<tr>
			<td class="t1">税务登记证号</td>
			<td class="t2">暂无</td>
			<td class="t1">企业状态（地税）</td>
			<td class="t2">暂无</td>
		</tr>
		<tr>
			<td class="t1">税务登记日期</td>
			<td class="t2">暂无</td>
			<td class="t1">海关注册号</td>
			<td class="t2">暂无</td>
		</tr>
		<tr>
			<td class="t1">注册日期</td>
			<td class="t2">暂无</td>
			<td class="t1">主管海关代码</td>
			<td class="t2">暂无</td>
		</tr>
		<tr>
			<td class="t1">主管外汇局</td>
			<td class="t2">暂无</td>
			<td class="t1">注册资本</td>
			<td class="t2">${fn:replace(bizCompany.capital,'None','-')}</td>
		</tr>
		<tr>
			<td class="t1">税务登记证号</td>
			<td class="t2">暂无</td>
			<td class="t1">企业状态（国税）</td>
			<td class="t2">暂无</td>
		</tr>
		<tr>
			<td class="t1">税务部门</td>
			<td class="t2">暂无</td>
			<td class="t1">税务登记日期</td>
			<td class="t2">暂无</td>
		</tr>
		<tr>
			<td class="t1">发证日期</td>
			<td class="t2">暂无</td>
			<td class="t1">银行</td>
			<td class="t2">暂无</td>
		</tr>
		<tr>
			<td class="t1">缴税银行帐号</td>
			<td class="t2">暂无</td>
			<td class="t1"></td>
			<td class="t2"></td>
		</tr>
		<tr>
			<td class="t1" style="vertical-align: top;">经营范围</td>
			<td class="t2" colspan="3" style="text-indent: 2em;">${bizCompany.businessScope}</td>
		</tr>
	</table>
</div>