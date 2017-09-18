<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<%--<div class="layout search">
	<div class="search-input">
		<ul>
			<li tab="all" tip="可以按企业名称、注册号、法人、股东、高管、品牌查询">全部</li>
			<li tab="company" tip="按企业名称查询">企业名</li>
			<li tab="person" tip="按法人、股东查询">股东法人</li>
			<li tab="employee" tip="按董高监查询">董高监</li>
			<li tab="address" tip="按地址查询" >地址</li>
			<li tab="scope" tip="按经营范围查询">经营范围</li>
			<li tab="trademark" tip="按品牌/产品查询">品牌/产品</li>
		</ul>
		<form id="searchForm" method="get" action="${basePath}/search">
			<input class="provice" type="hidden" value="${requestScope.provinceCode}" name="provinceCode"/>
			<input id="searchType" type="hidden" value="${requestScope.searchType}" name="searchType"/>
			<input id="searchKey" type="text" autocomplete="off" value="${requestScope.key}" placeholder="可以按企业名称、注册号、法人、股东、高管、品牌查询" name="key">
			<a href="javascript:void(0);" id="btn-search"></a>
		</form>
	</div>
</div>--%>


<div class="new_sea">
    <div class="n-b-ind n-b-index01">
        <ul>
            <li tab="all" class="current"  tip="可以按企业名称、注册号、法人、股东、高管、品牌查询">全部</li>
            <li tab="companyName" tip="按企业名称查询">企业名</li>
            <li tab="legalPerson,partnerStockName" tip="按法人、股东查询">股东法人</li>
            <li tab="employeeName" tip="按董高监查询">董高监</li>
            <li tab="companyAddress" tip="按地址查询" >地址</li>
            <li tab="businessScope" tip="按经营范围查询">经营范围</li>
            <li tab="trademark" tip="按品牌/产品查询">品牌/产品</li>
        </ul>
        <div class="n-b-inp">
            <form id="searchForm" method="get" action="${basePath}/gov/search">
                <input class="provice" type="hidden" value="${requestScope.provinceCode}" name="provinceCode"/>
                <input id="searchType" type="hidden" value="${requestScope.searchType}" name="searchType"/>
                <input id="industryName" type="hidden" value="${requestScope.industryName}" name="industryName"/>
                <input id="cityCode" type="hidden" value="${requestScope.cityCode}" name="cityCode"/>
                <input id="capitalNumberCode" type="hidden" value="${requestScope.capitalNumberCode}" name="capitalNumberCode"/>
                <input id="curCreditType" type="hidden" value="${requestScope.curCreditType}" name="curCreditType"/>
                <input id="markInput" type="hidden" name="mark" value="" />
                <p><input id="searchKey" type="text" autocomplete="off" value="${requestScope.key}" placeholder="可以按企业名称、注册号、法人、股东、高管、品牌查询" name="key" /><a href="javascript:void(0);" id="btn-search"></a></p>
            </form>
        </div>
    </div>
</div>
<c:if test="${not empty allCursorMarks}">
    <div id="pageListParams" style="display:none;">
        <c:forEach items="${allCursorMarks}" var="mark" varStatus="status">
            <input type="hidden" name="customParam${status.index}" value="${mark}" />
        </c:forEach>
    </div>
</c:if>