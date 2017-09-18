<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/path.jsp" %>
<!--法人，股东-->
<c:if test="${searchType=='legalPerson,partnerStockName'}">
    <div id="all" class="list-result list-result-pad">
        <c:forEach items="${pageAll.content}" var="company" >
            <div class="left-list left-list-bottom">
                <div class="left-search-img">
                    <img src="${basePath}/images/new-images/none-img.png"><span></span>
                </div>
                <div class="left-search-main">
                    <h2><a href="${fn:replace(govCompanyDetailUrl, 'companyNo', company.companyNo)}" target="_blank">${company.companyName}<small class="searchbadge">${company.companyStatus }</small></a></h2>
                    <h4><span>法人匹配：${company.legalPerson}</span><span>注册资本：${company.capital}</span><span>成立日期：${company.establishDate}</span></h4>
                    <h5>股东匹配：<c:forEach items="${company.partnerStockName}" var="stockName">${stockName} </c:forEach> </h5>
                </div>
            </div>
        </c:forEach>
        <div class="new-page" config='{name: "person", url:"${basePath }/gov/search?key=${key}&searchType=legalPerson,partnerStockName&industryName=${industryName}&cityCode=${cityCode}&capitalNumberCode=${capitalNumberCode}&curCreditType=${curCreditType}", npage:${empty param.npage ? '1' : param.npage}, spage:${pageAll.totalPages }, total:${pageAll.total }, pin:3, isAjax:false,<c:if test="${not empty allCursorMarks}"> allCursorMarks:${allCursorMarks} </c:if>}'></div>
    </div>
</c:if>