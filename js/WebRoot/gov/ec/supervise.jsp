<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <base href="${basePath}/"/>
    <title>之江信用</title>
    <link href="${basePath }/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/gov/js/lib/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${basePath}/gov/js/lib/My97DatePicker/WdatePicker.js" ></script>
    <script data-main="${basePath}/gov/js/ec/supervise.js" src="${basePath}/gov/js/lib/require.js"></script>
</head>

<body class="container" id="body" data-attr-child="supervise" data-attr="operate" style="background:#d7d7d7;">
<jsp:include page="/gov/gov_top.jsp"/>
<div class="layout">
    <jsp:include page="nav.jsp"/>
    <div class="content" id="operation_boss">
        <div class="protect" style="padding-top: 20px">
            <div class="protect-dis protect-bg" style="background: white">
                <div class="protect-pad">
                    <div class="gk-line">
                        <p class="mbc_title">
                            <em class="mbc_line"></em>
                            <span class="mbc_title_warp"><em class="font_f_1">工商处罚<i></i></em></span>
                        </p>
                    </div>
                    <div class="analysis analysis-bottom">
                        <h4>处罚单位地域分布</h4>
                        <div class="punish">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                   <c:if test="${not empty punishedCityList}">
                                        <c:forEach items="${punishedCityList}" var="punishedArea" varStatus="status">
                                            <th class="p${status.count}">${punishedArea.city} ${punishedArea.quantity}家</th>
                                        </c:forEach>
                                    </c:if>

                                </tr>
                                <tr>
                                    <c:if test="${not empty punishedCityList}">
                                        <c:forEach var="punishedAreaProportion" items="${punishedCityList}" varStatus="status">
                                            <td class="p${status.count}">${punishedAreaProportion.proportion/100}%</td>
                                        </c:forEach>
                                    </c:if>

                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="analysis analysis-bottom">
                        <h4>处罚金额分布</h4>
                        <div class="punish">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <c:if test="${not empty punishedAmountList}">
                                        <c:forEach items="${punishedAmountList}" var="punishedAmount" varStatus="status">
                                            <th class="p${status.count} p${status.count}-bg">${punishedAmount.punishedType} ${punishedAmount.quantity}家</th>
                                        </c:forEach>
                                    </c:if>
                                </tr>
                                <tr>
                                    <c:if test="${not empty punishedAmountList}">
                                        <c:forEach items="${punishedAmountList}" var="punishedAmount" varStatus="status">
                                            <td class="p${status.count}">${punishedAmount.proportion/100}%</td>
                                        </c:forEach>
                                    </c:if>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="protect" style="padding-top: 20px">
            <div class="protect-dis protect-bg" style="background: white">
                <div class="protect-pad">
                    <div class="gk-line">
                        <p class="mbc_title">
                            <em class="mbc_line"></em>
                            <span class="mbc_title_warp"><em class="font_f_1">广告违法监测<i></i></em></span>
                        </p>
                    </div>
                    <div class="analysis analysis-bottom">
                        <div class="analysis-choose" id="ad_illegal_monitor">
                            <p><span>地区</span></p>
                            <ul>
                                <li class="current" data-nav="4003001">杭州市</li>
                                <li data-nav="4003003">温州市</li>
                                <li data-nav="4003002">宁波市</li>
                                <li data-nav="4003007">金华市</li>
                                <li data-nav="4003010">台州市</li>
                                <li data-nav="4003004">嘉兴市</li>
                                <li data-nav="4003006">绍兴市</li>
                                <li data-nav="4003005">湖州市</li>
                                <li data-nav="4003011">丽水市</li>
                                <li data-nav="4003008">衢州市</li>
                                <li data-nav="4003009">舟山市</li>
                            </ul>
                        </div>
                        <div class="analysis-num">
                            <div class="analysis-fb">
                                <div class="num-tit">
                                    <h5 style="font-size: 15px;">广告违法地域分布指数</h5>
                                    <div id="adIllegalAreaDistributionIndex"
                                         style="width: 500px;height:400px;left:-40px;"></div>
                                </div>
                                <div class="num-tit-right">
                                    <h5>
                                      <span style="float:left; display:inline-block; width:65%;font-size: 15px;">广告违法地域分布图（前三占比）</span>
                                       <input class="Wdate" value="${maxDate}" style="margin-left: 5px;margin-right: 5px;padding: 0 5px; width:27%;"
                                            type="text" id="startStatDate" onchange="javascript:changeSuperviseDate();"
                                            onFocus="WdatePicker({skin:'whyGreen',isShowClear:false,readOnly:true,dateFmt:'yyyy-MM',minDate:'${minDate}',maxDate:'${maxDate}'})"/>
                                        <input type="hidden" id="currentMaxDate" value="${maxDate}"/>
                                    </h5>
                                    <div id="adIllegalAreaDistributionPie"
                                         style="width: 500px;height:400px;left:-40px;"></div>
                                </div>
                            </div>
                            <div class="analysis-fb analysis-fb-top">
                                <div class="num-tit">
                                    <h5 style="font-size: 15px;">广告违法线索行业分布图</h5>
                                    <div class="turn-bg">
                                        <div id="categoryChart" style="width:980px ;height:400px;left:20px;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="protect" style="padding-top: 20px">
            <div class="protect-dis protect-bg" style="background: white">
                <div class="protect-pad">
                    <div class="gk-line">
                        <p class="mbc_title">
                            <em class="mbc_line"></em>
                            <span class="mbc_title_warp"><em class="font_f_1">其他行政处罚信息数量统计<i></i></em></span>
                        </p>
                    </div>
                    <div class="analysis analysis-bottom">
                        <div style="width:980px;height: 170px;left:20px;" id="otherPunishmentTreemap"></div>
                        <div class="add-infor">
                            <p><label>注：</label>"其他行政处罚信息"包括质监处罚、国税部门监管信息、诉讼记录、失信被执行、涉诉被执行、
                                开庭公告、税务稽查信息、欠税信息、未履行生效裁判信息、产品质量监督抽查不合格记录信息、环境违法信息、企业非正常户认定信息等</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<jsp:include page="/gov/footer.jsp"/>
</body>
</html>