<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>外贸服务</title>
    <base href="${basePath}/"/>
    <link rel="stylesheet" href="${basePath }/style/Validform_style.css" type="text/css" media="all" />
    <link href="${basePath }/style/new/gov_style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/new/trade_style.css" rel="stylesheet"type="text/css" />
    <script data-main="${basePath }/gov/js/foreigntrade.js" src="${basePath }/gov/js/lib/require.js"></script>
</head>

<body style="background:#f9f9f9;" class="container-bg" data-attr="finance">
	<form>
		<input name="cityCode" type="hidden" value="${cityCode }" />
	</form>	
	<jsp:include page="/gov/gov_top.jsp" />
    <div class="trade-container">
        <div style="width: 80%;margin: 0 auto;">
    	<div class="trand-left">
        <div id="chartsZhejiangMap" style="width: 600px;height:400px;"></div>
        </div>
        <div class="trand-right">
        <div id="singleHorizontalBar" style="width: 640px;height:400px;"></div>
        </div>
    </div>
    </div>
    <div class="layout ret">
        <div class="j-container">
            <div class="s-category" id="areaChoose">
                <div class="sl-key" ><span>地区</span></div>
                <div class="sl-key-all"><a href="javascript:void(0)" class="${empty cityCode ? 'current' : ''}">全部</a></div>
               	<c:forEach items="${cityMap}" var="city">
                		<a href="javascript:void(0)" data-attr="${city.key }" class="${cityCode == city.key ? 'current' : '' }">${city.value }</a>
               	</c:forEach>
            </div>
            <div class="s-category" id="capital_choose">
                <div class="sl-key"><span>注册资金</span></div>
                <div class="sl-key-all"><a class="current">全部</a></div>
                <div class="sl-value">
                    <!-- <a>50万以下</a><a>50-100万</a><a>100-200万</a><a>200-500万</a><a>500-1000万</a><a>1000万以上</a> -->
                    <c:forEach items="${capitalSectionEnum}" var="capitalSection">
                            <a data-attr="${capitalSection.code}">${capitalSection.text}</a>
                    </c:forEach>
                </div>
            </div>
            <div class="s-category s-category-bottom" id="companyTypeDiv" >
                <div class="sl-key"><span>经营者类型</span></div>
                <div class="sl-key-all"><a href="javascript:void(0)" class="current">全部</a></div>
                <div class="sl-value" >
                    <%--<a href="#">有限责任公司</a><a href="#">私营有限责任公司</a><a href="#">其他有限责任公司</a><a href="#">私营企业</a><a href="#">国有企业</a><a href="#">外资企业</a><a href="#">股份有限公司</a><a href="#">私营独资企业</a><a href="#">中外合资经营企业</a><a href="#">合资经营企业（港或澳、台资）</a><a href="#">外国（地区）企业</a><a href="#">一人有限责任公司</a><a href="#">个人独资企业</a><a href="#">港、澳、台商独资经营企业</a>--%>
                    <c:forEach items="${companyTypes}" var="type">
                        <a href="javascript:void(0)">${type}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%-- <p class="search-qy" style="padding-left:20px;">
               	 为您查询到<span> ${((!empty pageAll) && (pageAll.totalNumber > 0)) ? (pageAll.totalNumber > 199 ? '200+' : pageAll.totalNumber) : 0 } </span>条符合条件的企业
        </p> --%>
        <div class="j-container" id="foreignTradeList">
        	<input type="hidden" id="foreignTradePageId"  />
            <table cellpadding="0" cellspacing="0" border="0" class="spread">
                <tr>
                    <th class="pro09">企业名称</th>
                    <th class="pro10">经营者类型</th>
                    <%--<th class="pro11">信用等级<img src="${basePath}/images/gov-images/down-icon-small.png" /></th>--%>
                </tr>
                <tbody id="foreigntradeTable">
                <tr model style="display:none;">
                	<td class="pro09">
                        <a href="${basePath}/gov/company/professionalInfo?n={6}"><h3>{0}</h3></a>
                        <h4><span class="span20">企业法人：{1}</span><span class="span20">注册资本：{2}万元</span><span>成立日期：{3}</span></h4>
	                </td>
	                <td class="pro10">{4}</td>
	                <%--<td class="pro11"><div class='istar' config='{"n":{5},"s":50,"size":12,"img":"${basePath}/images/star.png"}'></div></td>--%>
                </tr>
                </tbody>

            </table>


            <div class="f-page" config='{name: "foreigntradeTable", url:"${basePath}/gov/user/foreigntrade/ajaxlist?", pin:5,nodata:".detail_nodata", isAjax:true}'></div>
        </div>
        <div class="detail_nodata j-container"  style="width: 99.9%;margin-left:-0.2px;display:none;">
        			未查询到相关信息
        </div>
		

    </div>
<jsp:include page="/gov/footer.jsp" />

</body>
</html>
