<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>流通企业监测详情-之江信用</title>
    <base href="${basePath}/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="keywords" content="企业查询,中小企业,三资企业,民营企业,私营企业,黄页大全"/>
    <meta http-equiv="description" content="之江信用提供中小企业,民营企业信息查询,私营企业信用查询服务。"/>
    <link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css" />

    <link href="${basePath}/style/jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/gov/js/monitor/monitor.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">

        var monitorCfg = monitorCfg || {
                    page:'detail',
                    companyId : '${company.companyId}',
                    companyName: '${company.companyName}'
                };

    </script>
</head>

<body class="container container-jg" >
<jsp:include page="/gov/gov_top.jsp"/>
<!--end nav-->

<jsp:include page="/gov/monitor/left.jsp"/>
<div class="right">
    <div class="right-banner">
        <p class="banner-s">
            <input name="" type="text" value="请输入企业名或企业名包含的关键词" />
            <a href="#"></a>
        </p>
    </div>
    <div class="content">
        <div class="content-bg">
            <div class="impotrant-tit"><a href="${basePath }/gov/user/company/monitor/list">企业监测</a>>><a href="javascript:void(0)">信用监测详情</a></div>
            <div class="impotrant-comp">
                <div class="impotrant-comp-left">
                    <h2>${companyName}</h2>
                    <c:if test="${not empty prepaidCardMonitor}">
                        <span>备案登记机关：</span>
                        <span>${prepaidCardMonitor.recordAuthority}</span>
                    </c:if>
                    <c:if test="${not empty prepaidCardMonitor}">
                        <span>资金监管单位：</span>
                        <span>${prepaidCardMonitor.regulateAuthority}</span>
                        </h4>
                    </c:if>
                    <ul>
                        <c:set var="intVar1" value="${empty corpProdPenaltyPage ? 0 : corpProdPenaltyPage.total}" />
                        <c:set var="intVar2" value="${empty dataRentTaxInfos ? 0 : fn:length(dataRentTaxInfos) }" />
                        <a data-target="#prodPenaltyPageDiv"><li>行政处罚<em>${ intVar1+intVar2}</em></li></a>
                        <a data-target="#uncrePageDiv"><li>失信记录<em>${empty uncrePage ? 0 : uncrePage.total }</em></li></a>
                        <a data-target="#rentNoPayTaxDiv"><li>欠税信息<em>0</em></li></a>
                        <a data-target="#courtDocDiv"><li>诉讼记录<em><%--${empty courtDocPage ? 0 : courtDocPage.total}--%>0</em></li></a>
                        <a data-target="#newsDiv"><li>媒体报道<em>0</em></li></a>
                        <%--<li class="comp-black">良好信息<em>1</em></li>--%>
                    </ul>
                </div>
                <div class="impotrant-comp-right">
                    <p><a class="comp-sc">收藏此页</a><a class="comp-dy">打印此页</a></p>
                    <p class="comp-p">最新收录时间：2016-01 01:01:00</p>
                </div>
            </div>
            <div class="detail-list" id="detail" style="display:none;">
                <h2 class="tit"></h2>
                <ul class="change detail-ul" style="display:inline;"></ul><br/>
                <p>
                    <a href="javascript:returnTable();" id="back" style="background:#45a9ff;border-radius:5px;padding: 6px 7px;">
                        <font color="#ffffff">&nbsp&nbsp返回&nbsp&nbsp</font>
                    </a>
                </p>
            </div>
            <div class="detail-list" id='corpProdPenalty'>
                <div class="panel-body" id="prodPenaltyPageDiv">
                    <p class="tax-list-p">安监企业行政许可信息</p>
                    <c:if test="${empty corpProdPenaltyPage.content}">
                    <div class="panel-table" id="enterPrisePenalty_off">暂未收录该企业相关信息</div>
                </c:if>
                    <c:if test="${!(empty corpProdPenaltyPage.content)}">
                        <div class="panel-table" id="corpProdPenalty_list">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <th class="sh30">行政处罚决定书文号</th>
                                    <th class="sh31">违法违规类型</th>
                                    <th class="sh31">违法违规内容</th>
                                    <th class="sh30">处罚内容</th>
                                    <th class="sh31">处罚日期</th>
                                    <th class="sh31">操作</th>
                                </tr>
                                <tbody id="corpProdPenaltyTable">
                                <tr model style="display: none">
                                    <td class="sh30">{0}</td>
                                    <td class="sh31">{1}</td>
                                    <td class="sh31">{2}</td>
                                    <td class="sh30">{3}</td>
                                    <td class="sh31">{4}</td>
                                    <td class="sh31">
                                        <a detail-data="{5}" href="javascript:void(0);">查看详情</a>
                                    </td>
                                </tr>

                                <c:forEach items="${corpProdPenaltyPage.content}" var="patent" varStatus="i">
                                    <tr>
                                        <td class="sh30">${patent.punishDocCode}</td>
                                        <td class="sh31">${patent.illegalType}</td>
                                        <td class="sh31">${patent.illegalFacts}</td>
                                        <td class="sh30">${patent.punishContent}</td>
                                        <td class="sh31"><fmt:formatDate value="${patent.illegalDate}"
                                                                         pattern="yyyy/MM/dd"/></td>
                                        <td class="sh31">
                                            <a detail-data="${patent.id}" href="javascript:void(0);">查看详情</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <p>来源：质监部门监管信息</p>
                            <div id="corpProdPenaltyPage" class="f-page" config='{name: "corpProdPenaltyTable",url:"${basePath}/gov/user/company/monitor/corpProdPenalty/list?companyNameDigest=${companyNameDigest}",nodata:".data-no-tip",
                 npage:${empty param.npage ? '1' : param.npage}, spage:${corpProdPenaltyPage.totalPages }, total:${corpProdPenaltyPage.total }, pin:5, isAjax:false}'></div>
                        </div>
                    </c:if>

                    <%--<div class="panel-table" id="enterPrisePenalty_off" style="display:none;">暂未收录该企业相关信息</div>--%>
                    <div class="panel-table" id="enterPrisePenalty" style="display: none">
                        <table cellpadding="0" cellspacing="0" border="0" >
                            <tr>
                                <th class="sh30">税务登记证号</th>
                                <th class="sh31">行政处罚决定书文号</th>
                                <th class="sh30">违法违章情况</th>
                                <th class="sh31">现状</th>
                                <th class="sh31">处罚日期</th>
                                <th class="sh31">操作</th>
                            </tr>
                            <tbody id="enterPrisePenaltyTable">
                                          <tr model style="display: none">
                                            <td class="sh30">{0}</td>
                                            <td class="sh31">{1}</td>
                                            <td class="sh30">{2}</td>
                                            <td class="sh31">{3}</td>
                                            <td class="sh31">{4}</td>
                                            <td class="sh31">
                                              <a detail-data="{5}" href="javascript:void(0) ;">查看详情</a>
                                            </td>
                                          </tr>
                            </tbody>
                        </table>
                        <div id="enterPrisePenaltyPage" class="d-page" config='{name: "enterPrisePenaltyTable", url:"${basePath}/gov/user/company/monitor/detail/enterPrisePenalty/list?companyNameDigest=${companyNameDigest}", nodata:".detail_nodata", isAjax:true}'></div>
                        <p>来源：国税部门监管信息</p>
                    </div>
                    <c:if test="${empty dataRentTaxInfos}&& ${fn:length(dataRentTaxInfos)}">
                        <div class="panel-table">暂未收录该企业相关信息</div>
                    </c:if>
                    <c:if test="${!empty dataRentTaxInfos&&fn:length(dataRentTaxInfos)>0}">
                        <div class="panel-table">

                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <th class="sh30">所属起始日期</th>
                                    <th class="sh31">所属终止日期</th>
                                    <th class="sh30">当事人身份证号</th>
                                    <th class="sh31">当事人姓名</th>
                                    <th class="sh32">判刑机构</th>
                                </tr>
                                <c:forEach var="rentTaxInfos" items="${dataRentTaxInfos}">
                                    <tr>
                                        <td class="sh30"><fmt:formatDate value="${rentTaxInfos.startDate}"
                                                                         pattern="yyyy/MM/dd"/></td>
                                        <td class="sh31"><fmt:formatDate value="${rentTaxInfos.endDate}"
                                                                         pattern="yyyy/MM/dd"/></td>
                                        <td class="sh30">${rentTaxInfos.taxpayerCertno}</td>
                                        <td class="sh31">${rentTaxInfos.taxpayerName}</td>
                                        <td class="sh32">${rentTaxInfos.authority}</td>
                                    </tr>
                                </c:forEach>
                            </table>

                            <p>来源：地方税务稽查信息</p>
                        </div>
                    </c:if>
                </div>

                <div class="panel-body" id="uncrePageDiv">
                    <p class="tax-list-p">失信信息</p>
                    <c:if test="${empty uncrePage.content}">
                        <div class="panel-table">暂未收录该企业相关信息</div>
                    </c:if>
                    <c:if test="${!(empty uncrePage.content) }">
                        <div class="panel-table" id="uncre_list">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <th class="sh33">案号</th>
                                    <th class="sh34">失信行为</th>
                                    <th class="sh30">立案时间</th>
                                </tr>

                                <tbody id="uncreTable">
                                <tr model style="display: none">
                                    <td class="sh33">{0}</td>
                                    <td class="sh34">{1}</td>
                                    <td class="sh30">{2}</td>
                                </tr>
                                </tbody>
                            </table>
                            <div id="uncrePage" class="f-page" config='{name: "uncreTable",url:"${basePath}/gov/user/company/monitor/detail/uncre/list?companyNameDigest=${companyNameDigest}",nodata:".data-no-tip",
                  isAjax:true}'></div>
                        </div>

                    </c:if>
                </div>
                <div class="panel-body" id="rentNoPayTaxDiv">
                    <p class="tax-list-p">欠税信息</p>
                    <div class="panel-table" id="rentNoPayTax_off" style="display:none;">暂未收录该企业相关信息</div>
                    <div class="panel-table" id="rentNoPayTax">
                        <table cellpadding="0" cellspacing="0" border="0" style="display: none;">
                            <tr>
                                <th class="sh35">纳税人识别号</th>
                                <th class="sh35">法人代表或负责人</th>
                                <th class="sh35">欠税余额</th>
                                <th class="sh35">欠税税种</th>
                                <th class="sh35">欠税所属期</th>
                            </tr>
                            <tbody id="rentNoPayTaxTable">
                                          <tr style="display: none" model>
                                            <td class="sh35">{0}</td>
                                            <td class="sh35">{1}</td>
                                            <td class="sh35">{2}</td>
                                            <td class="sh35">{3}</td>
                                            <td class="sh35">{4}</td>
                                          </tr>
                            </tbody>
                        </table>

                        <div id="rentNoPayTaxPage" class="f-page" config='{name: "rentNoPayTaxTable",url:"${basePath}/gov/user/company/monitor/detail/rentNoPayTaxInfo/list?companyNameDigest=${companyNameDigest}",nodata:"#rentNoPayTax_off",
                  isAjax:true}'></div>
                    </div>

                </div>
                <%--        <div class="panel-body">
                          <p class="tax-list-p">良好信息</p>
                          <div class="panel-table">
                            <table cellpadding="0" cellspacing="0" border="0">
                              <tr>
                                <th class="sh35">纳税人识别号</th>
                                <th class="sh35">纳税信用等级</th>
                                <th class="sh36">评价年度</th>
                                <th class="sh36">主管税务机关</th>
                              </tr>
                              <tr>
                                <td class="sh35">330105734534060</td>
                                <td class="sh35">A</td>
                                <td class="sh36">2014年</td>
                                <td class="sh36">杭州市西湖区国家税务局</td>
                              </tr>
                            </table>
                          </div>
                        </div>--%>

                <div class="panel-body" id="courtDocDiv">
                    <p class="tax-list-p">诉讼记录</p>
                        <div class="panel-table" id="courtDocNoData" style="display: none">暂未收录该企业相关信息</div>
                        <div class="panel-table" id="courtDoc_list">
                            <table cellpadding="0" cellspacing="0" border="0" style="display: none" >
                                <tr>
                                    <th class="sh36">文书名</th>
                                    <th class="sh35">案件性质</th>
                                    <th class="sh36">判决时间</th>
                                    <th class="sh31">详情</th>
                                </tr>
                                <tbody id="courtDocTable">
                                <tr model style="display:none">
                                    <td class="sd22">{0}</td>
                                    <td class="sd10">{1}</td>
                                    <td class="sd24">{2}</td>
                                    <td class="sd25"><a detail-data="{3}" href="javascript:void(0);">详情</a></td>
                                </tr>
                                </tbody>

                            </table>

                            <div id="courtDocPage" class="f-page" config='{name: "courtDocTable",url:"${basePath}/gov/user/company/monitor/detail/court/list?companyNameDigest=${companyNameDigest}",nodata:"#courtDocNoData",
                  isAjax:true}'></div>
                        </div>
                </div>
                <div class="panel-body" id="newsDiv" >
                    <p class="tax-list-p">媒体报道</p>
                    <%--<div class="panel-table">暂未收录该企业相关信息</div>--%>
                    <%--<div class="media-main" id="scrollBarContent-2" style="height:50px;overflow:hidden;">--%>
                    <%--<a href="#">1、远程设计和协作软件供应商mural完成135万美元种子轮融资，与IBM打成合作协议</a>--%>
                    <%--<p><span>来源：亿欧网</span><span>昨天：17:55</span></p>--%>
                    <%--</div>--%>
                    <%--<div class="media-main">--%>
                    <%--<a href="#">2、远程设计和协作软件供应商mural完成135万美元种子轮融资，与IBM打成合作协议</a>--%>
                    <%--<p><span>来源：亿欧网</span><span>昨天：17:55</span></p>--%>
                    <%--</div>--%>

                    <div style="display:none;" id="media_report">
                        <%--<div class="title"><h2>媒体报道</h2></div>--%>
                        <ul id="scrollBarContent-2" style="height:300px;overflow:hidden;">
                            <p class="more" id="getMoreMediaReport"><a href="javascript:;"></a></p>
                        </ul>
                        <input type="hidden" id="mediaReportTotal" value="0">
                        <input type="hidden" id="number" value="0">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>