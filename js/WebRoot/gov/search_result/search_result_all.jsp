<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/path.jsp" %>

<!--全部-->
<c:if test="${searchType=='all'}">
<div id="all" class="list-result list-result-pad">
    <c:forEach items="${pageAll.content}" var="company" >
    <div class="left-list left-list-bottom">
        <div class="left-search-img">
            <img src="${basePath}/images/new-images/none-img.png"><span></span>
        </div>
        <div class="left-search-main">
            <h2><a href="${fn:replace(govCompanyDetailUrl, 'companyNo', company.companyNo)}" target="_blank">${company.companyName}<small class="searchbadge">${company.companyStatus }</small></a></h2>
            <h4><span>企业法人：${company.legalPerson}</span><span>注册资本：${company.capital}</span><span>成立日期：${company.establishDate}<%--<c:out value="${fn:substring(company.establishDate,0,10)}"/>--%></span></h4>
            <c:if test="${company.matchField == '名称' || company.matchField == '法人'}">
            <h5>地址：${company.companyAddress}</h5>
            </c:if>
            <c:if test="${not empty company.matchField && company.matchField != '名称' && company.matchField != '法人' }">
            <h5>${company.matchField}：
                    ${company.matchFieldValue}
                </h5>
            </c:if>
        </div>
    </div>
    </c:forEach>
    <div class="new-page" config='{name: "all", url:"${basePath }/gov/search?key=${key}&searchType=all&industryName=${industryName}&cityCode=${cityCode}&capitalNumberCode=${capitalNumberCode}&curCreditType=${curCreditType}", npage:${empty param.npage ? '1' : param.npage}, spage:${pageAll.totalPages }, total:${pageAll.total }, pin:3, isAjax:false<c:if test="${not empty allCursorMarks}">,allCursorMarks:${allCursorMarks} </c:if>}'></div>
</div>
</c:if>