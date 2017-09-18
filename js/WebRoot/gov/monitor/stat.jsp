<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>初审线索-之江信用</title>
    <base href="${basePath}/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="keywords" content="企业查询,中小企业,三资企业,民营企业,私营企业,黄页大全"/>
    <meta http-equiv="description" content="之江信用提供中小企业,民营企业信息查询,私营企业信用查询服务。"/>
    <link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/gov/js/monitor/stat.js" src="${basePath }/gov/js/lib/require.js"></script>
</head>

<body class="container container-jg" data-attr="clue" data-attr1="clue">
<jsp:include page="/gov/gov_top.jsp" />
<jsp:include page="/gov/monitor/left.jsp" />

<div class="right">
    <div class="right-banner">
        <p class="banner-s">
                <input name="" type="text"  placeholder="请输入企业名或企业名包含的关键词"/>
            <a href="#"></a>
        </p>
    </div>

        <div class="content">
            <div class="content-infor">
             <div class="content-title"><p>全省概况</p></div>
		        <div class="main">
		            <div class="small-main-left small-left-blue">
		                <div class="small-left-all">
		                    <h3>本省企业总数</h3>
		                    <h2><span><fmt:formatNumber value="${platformCompanyStat.companyTotal}" pattern="#,###"/></span>家</h2>
		                </div>
		                <div class="small-left-ud">
		                	<div class="small-left-up small-left-mb"><fmt:formatDate value="${platformCompanyStat.statDate}" pattern="M" />月新增<span><fmt:formatNumber value="${platformCompanyStat.companyNew }" pattern="#,###"/></span>家</div>
		                    <div class="small-left-up"><fmt:formatDate value="${platformCompanyStat.statDate}" pattern="M" />月歇业<span><fmt:formatNumber value="${platformCompanyStat.companyClosed }" pattern="#,###"/></span>家</div>
		                </div>
		            </div>
		            
		            <div class="small-main-left small-left-yellow">
		                <div class="small-left-all">
		                    <h3><fmt:formatDate value="${platformCompanyStat.statDate}" pattern="M" />月平均信用等级</h3>
		                    <h2><span>${platformCompanyStat.companyAvglevel }</span>级</h2>
		                </div>
		                <div class="small-left-ud">
		                	<div class="small-left-up small-left-mb"><fmt:formatDate value="${lastPlatformCompanyStat.statDate}" pattern="M" />月信用等级<span>${lastPlatformCompanyStat.companyAvglevel}</span>级</div>
		                    <div class="small-left-up"><fmt:formatDate value="${platformCompanyStat.statDate}" pattern="yyyy" />年度平均信用等级<span>${empty currentMonthAvgLevel?platformCompanyStat.companyAvglevel:currentMonthAvgLevel }</span>级</div>
		                </div>
		            </div>
		         </div>
                
		      <div class="protect-pad">
					<div class="analysis">
		                <h4><label id="statDateLabel"></label>本省企业数量分布</h4>
		                <div class="distrib">
		                    <div class="distrib-tb">
		                        <div id="businessContrastBar" style="width:auto;height:390px;" >
		                         </div>
		                    </div>
		                    <div class="distrib-tb">
		                        <div id="tradingAmountProportion" style="width:auto;height:390px; ">
		                        </div>
		                    </div>
		                </div>
					</div>
		      </div>
		   <div class="protect-pad">
			<div class="analysis">
                <h4><fmt:formatDate value="${platformCompanycityStatList[0].statDate}" pattern="MM月份"/>本省企业信用等级统计</h4>
                <div class="distrib">
              		<table cellpadding="0" cellspacing="0" border="0" class="survey" style="width:100%">

                            <tr>
                                <th class="t1">排名</th>
                                <th class="t2">城市</th>
                                <th class="t2">企业总数</th>
                                <th class="t2">AAA级</th>
                                <th class="t2">AA级</th>
                                <th class="t2">A级</th>
                                <th class="t2">B级</th>
                                <th class="t2">C级</th>
                            </tr>
                            <c:forEach items="${platformCompanycityStatList }" var="record" varStatus="i">
                                <tr>
                                    <td class="t1 ${i.index < 3?'y-bg':'g-bg' }">${i.index + 1 }</td>
                                    <td class="t2">${record.city }</td>
                                    <td class="t2"><a href="${basePath}/search?cityCode=${record.cityCode}&curCreditType=" target="_blank">${record.companyTotal }</a></td>
                                    <td class="t2"><a href="${basePath}/search?cityCode=${record.cityCode}&curCreditType=AAA" target="_blank">${record.companyLevel1 }</a></td>
                                    <td class="t2"><a href="${basePath}/search?cityCode=${record.cityCode}&curCreditType=AA" target="_blank">${record.companyLevel2 }</a></td>
                                    <td class="t2"><a href="${basePath}/search?cityCode=${record.cityCode}&curCreditType=A" target="_blank">${record.companyLevel3 }</a></td>
                                    <td class="t2"><a href="${basePath}/search?cityCode=${record.cityCode}&curCreditType=B" target="_blank">${record.companyLevel4 }</a></td>
                                    <td class="t2"><a href="${basePath}/search?cityCode=${record.cityCode}&curCreditType=C" target="_blank">${record.companyLevel5 }</a></td>
                                </tr>
                                <c:set var="statDate" value="${record.statDate }"></c:set>
                            </c:forEach>
                        </table>
                        <c:if test="${not empty statDate }">
                            <div style="float:right;color:silver;margin-top:10px;">备注：数据更新截至到<fmt:formatDate value="${statDate }" pattern="yyyy-MM-dd"/>号之前</div>
                        </c:if>
                </div>
			</div>
    	</div>
            </div>
            <div class="content-infor">
                <div class="content-title"><p>电商行业概况</p></div>
                <div class="main">
                    <div>
                        <strong>活跃电商企业总数：</strong><span id="shopTotalNum"></span>
                        <strong>本月新增电商企业数：</strong><span id="shopNew"></span>
                        <strong>本月歇业电商企业数：</strong><span id="shopClosed"></span>
                    </div>
                    <div id="siteShopStatHalfYear" style="width:auto;height:400px;"></div>
                </div>
            </div>
            <div class="content-infor">
                <div class="content-title"><p>监管成效概况</p></div>
                <div class="main">
                    <div class="pro pro-mr">
                        <div class="top-wz pro-left">
                            <h2><label>本月</label>发现线索总数</h2>
                            <h3><span id="clueTotalNum"></span>条</h3>
                        </div>
                        <div class="pro-middle">
                            <h3 id="clueDealProbability"></h3>
                            <h4>完成率</h4>
                        </div>
                        <div class="top-wz pro-right">
                            <h2><label>本月</label>初审线索处理数</h2>
                            <h3><span id="clueDealNum"></span>条</h3>
                        </div>
                    </div>

                    <div class="pro" >
                        <div class="top-wz pro-left">
                            <h2><label>本月</label>复审线索总数</h2>
                            <h3><span id="caseNum"></span>条</h3>
                        </div>
                        <div class="pro-middle">
                            <h3 id="caseDealProbability"></h3>
                            <h4>完成率</h4>
                        </div>
                        <div class="top-wz pro-right">
                            <h2><label>本月</label>复审线索处理数</h2>
                            <h3><span id="caseDealNum"></span>条</h3>
                        </div>
                    </div>
                </div>
                <div id="siteClueStatHalfYear" style="width:auto;height:400px;"></div>
        </div>
    </div>
</div>
<jsp:include page="/gov/footer.jsp" />
</body>

</html>
