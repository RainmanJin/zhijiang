<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>搜索结果页-浙江信用</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="${basePath}/xyzj/style/style.css" rel="stylesheet" type="text/css" />
        <script data-main="${basePath }/xyzj/js/search_result.js" src="${basePath }/js/lib/require.js"></script>
        <script>
            config = {
                cookieValue : '${SHUIDIXY_HISTORY_COOKIE}',
                companyDetailUrl : "${basePath }/xyzj/detail?s={0}"
            };
        </script>
	</head>
<body style="background-color: #fff;">
<jsp:include page="head.jsp"/>
	<!-- end header-->
	<div class="layout">	
		<div class="menu-left">
			<div class="h-input">
				<div class="h-input-w">
                    <form id="searchForm" method="get" action="${basePath}/xyzj/search">
                        <input class="provice" type="hidden" value="${requestScope.provinceCode}" name="provinceCode"/>
                        <input id="searchType" type="hidden" value="${requestScope.searchType}" name="searchType"/>
                        <input id="cityCode" type="hidden" value="${requestScope.cityCode}" name="cityCode"/>
                        <input id="capitalNumberCode" type="hidden" value="${requestScope.capitalNumberCode}" name="capitalNumberCode"/>
                        <input id="establishType" type="hidden" value="${requestScope.establishType}" name="establishType"/>
                        <input id="markInput" type="hidden" name="mark" value="" />
					<input type="text" name="key" value="${requestScope.key}" placeholder="请输入企业名称" id="searchKey">
					<a href="javascript:void(0);" id="btn-search"></a>
                    </form>
				</div>			
			</div>
			<div class="menu-choose menu-span1">
				<p id="searchTypeTab"><label>搜索范围</label> <span>
                   <%-- <a tab="all" href="javascript:void(0)" <c:if test="${searchType=='all'}">class="current"</c:if>>全部</a>--%>
                    <a tab="companyName" <c:if test="${searchType=='companyName'}">class="current"</c:if>  href="javascript:void(0)">企业</a>
                    <a tab="legalPerson,partnerStockName"  href="javascript:void(0)" <c:if test="${searchType=='legalPerson,partnerStockName'}">class="current"</c:if>>法人</a>
                    <a tab="companyAddress"  href="javascript:void(0)" <c:if test="${searchType=='companyAddress'}">class="current"</c:if>>地址</a>
                    <a tab="businessScope"  href="javascript:void(0)" <c:if test="${searchType=='businessScope'}">class="current"</c:if>>经营范围</a></span>
                </p>
				<p id="capitalTab"><label>注册资本</label> <span>
                    <a href="javascript:void(0)" class="${empty capitalNumberCode ? 'current' : '' }">全部</a>
                    <c:forEach items="${capitalSectionEnum}" var="capitalSection">
                        <a href="javascript:void(0)" data-attr="${capitalSection.code}" class="${capitalNumberCode == capitalSection.code ? 'current' : '' }">${capitalSection.text}</a>
                    </c:forEach></span>
                </p>
				<p  id="establishTab"><label>成立期限</label> <span>
                    <a href="javascript:void(0)" class="${empty establishType ? 'current' : '' }">全部</a>
                    <c:forEach items="${establishDateEnum }" var="establish">
                        <a href="javascript:void(0)" class="${establishType == establish.code ? 'current' : '' }" data-attr="${establish.code}">${establish.text}级</a>
                    </c:forEach></span>
                </p>
				<p style="border-bottom: none;" id="areaTab"><label>地区</label>
                    <span>
                        <a href="javascript:void(0)" class="${empty cityCode ? 'current' : '' }" data-attr="">全部</a>
                    <c:forEach items="${cityMap}" var="city">
                        <a href="javascript:void(0)" data-attr="${city.key}"
                           class="${cityCode == city.key ? 'current' : '' }">${city.value }</a>
                    </c:forEach>
                        </span>
                   </p>
			</div>
			<div class="menu-tit">
				<p><c:if test="${not empty key }">搜索<span>"${key}"</span></c:if>共找到<i data-attr="${pageAll.displayCount}">${pageAll.displayCount}</i>家符合条件的企业</p>
			</div>
            <c:if test="${pageAll.total>0}">
            <div class="menu-choose menu-span2" id="all">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <th class="m1">公司</th>
                        <th class="m2">状态</th>
                    </tr>

                    <c:forEach items="${pageAll.content}" var="company" >
                        <tr>
                            <td class="m1">
                                <a href="${basePath }/xyzj/detail?s=${company.companyNo}" target="_blank">${company.companyName}</a>
                                <p>法定代表人：<span>${company.legalPerson}</span><i>|</i>成立时间：<span>${company.establishDate}</span><i>|</i>注册资本：<span>${company.capital}</span></p>
                            </td>
                            <td class="m2"><span>${company.companyStatus }</span></td>
                        </tr>
                    </c:forEach>

                </table>
                <%--    <div class="new-page">
                        <p>
                            <a href="javascript:void(0)" class="" page="2">上一页</a><a href="javascript:void(0)" class="current" page="1">1</a><a href="javascript:void(0)" class="" page="2">2</a><a href="javascript:void(0)" class="" page="3">3</a><a href="javascript:void(0)" class="" page="4">4</a><a href="javascript:void(0)" class="" page="5">5</a><a href="javascript:void(0)" class="" page="2">下一页</a><span>共10页&nbsp;&nbsp;到第</span><input type="text" value="1">页 &nbsp;<a href="javascript:void(0)" style="font-size: 16px;">确定</a>
                        </p>
                    </div>--%>
                <div class="new-page" config='{name: "all", url:"${basePath }/xyzj/search?key=${key}&searchType=all&industryName=${industryName}&cityCode=${cityCode}&capitalNumberCode=${capitalNumberCode}&establishType=${establishType}", npage:${empty param.npage ? '1' : param.npage}, spage:${pageAll.totalPages }, total:${pageAll.total }, pin:3, isAjax:false<c:if test="${not empty allCursorMarks}">,allCursorMarks:${allCursorMarks} </c:if>}'></div>
            </div>
            </c:if>
            <c:if test="${pageAll.total==0}">
                <div class="none-search data-no-tip">
                    <img src="${basePath }/images/sad-face.png" />
                    <h4>未找到符合条件的查询结果，请更改关键词重新查询！</h4>
                    <%--<h4>您也可以去<a href="http://www.shuidixy.com/search?key=${key}&searchType=all" target="_blank">水滴</a>查查看</h4>--%>
                </div>
            </c:if>
		</div>
		<div class="menu-right">
			<div class="menu-right-block" id="nearlyVisited">
                <p>最近浏览的企业</p>
<%--             	<a target="_blank" href="#">浙江商业银行股份有限公司</a>
             	<a target="_blank" href="#">浙江商业银行股份有限公司</a>
             	<a target="_blank" href="#">浙江商业银行股份有限公司</a>
             	<a target="_blank" href="#">浙江商业银行股份有限公司</a>
             	<a target="_blank" href="#">浙江商业银行股份有限公司</a>--%>
			</div>
			<div class="menu-right-block menu-ewm">
                <img src="${basePath}/xyzj/images/erweima.png">
                <h5>扫一扫关注我们</h5>
			</div>
		</div>
	</div>
	<!-- end search-->
			
	<div class="footer">
		<p>主办单位：浙江省信用中心     浙ICP备05004681号 </p>
	</div>

</body>