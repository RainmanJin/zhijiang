<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${basePath}/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>企业监测</title>
    <link href="${basePath}/style/new/gov_monitor_style.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${basePath }/gov/js/monitor/select2css.js"></script>
    <script data-main="${basePath }/gov/js/monitor/monitor.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">
        var monitorCfg = monitorCfg || {
                page: 'detail',
                companyId: '${company.companyId}',
                companyName: '${company.companyName}'
            };
    </script>
<body class="gov_bg">

<jsp:include page="monitor_top.jsp"/>
<jsp:include page="monitor_left.jsp"/>


<div class="govMain">
    <div class="govList">
        <div class="govList_main_tit">
            <div class="gov_width gov_width3"></div>
            <div class="govList_h3">
                <div class="gov_search"><input type="text" placeholder="请输入企业名称" id="companyNameInput" value=""><a id="searchBtn"><img src="${basePath}/images/gov-images/zs_Gsearch.png"></a></div>
            </div>
        </div>
        <div class="govList_gk">
            <div class="gov_width gov_width3"></div>
            <div class="govAudit">
                <div class="govDetail_top">
                    <div class="govDetail_left">
                        <div class="govAudit_logo">
                            <img src="${basePath}/images/gov-images/zs_img05.jpg">
                        </div>
                        <div class="govDetail_name">
                            <h3>${companyName}</h3>
                            <c:if test="${not empty prepaidCardMonitor}">
                                <i>备案登记机关：</i>
                                <i>${prepaidCardMonitor.recordAuthority}</i>
                            </c:if>

                            <c:if test="${not empty prepaidCardMonitor}">
                                <i>资金监管单位：</i>
                                <i>${prepaidCardMonitor.regulateAuthority}</i>
                            </c:if>
                            <c:set var="intVar1" value="${empty corpProdPenaltyPage ? 0 : corpProdPenaltyPage.total}"/>
                            <c:set var="intVar2" value="${empty dataRentTaxInfos ? 0 : fn:length(dataRentTaxInfos) }"/>
                            <p>
                                <span data-target="#prodPenaltyPageDiv">行政处罚 <em>${ intVar1+intVar2}</em> </span>
                                <span data-target="#uncrePageDiv">失信记录 ${empty uncrePage ? 0 : uncrePage.total }</span>
                                <span data-target="#rentNoPayTaxDiv">欠税信息 <em>0</em></span>
                                <span data-target="#courtDocDiv">诉讼记录 <em>0</em></span>
                                <span data-target="#newsDiv">负面报道 <em>0</em></span>
                            </p>
                        </div>
                    </div>
                    <div class="govDetail_right">
                        <h5>
                            <a class="govColl">收藏</a>
                            <a class="govPrint">打印</a>
                        </h5>
                        <p>数据更新时间：<span>
                            <c:if test="${not empty userCompanyMonitor}">
                                <fmt:formatDate value="${userCompanyMonitor.statDate}"  type="date"/>
                            </c:if>
                            </span></p>
                    </div>
                </div>
                <div class="gov013">
                    <div class="detail-list" id="detail" style="display:none;margin-bottom: 0px;border-top: 0;">
                        <h2></h2>
                        <div class="gov013_main"></div>
                        <br/>
                        <p>
                            <a href="javascript:returnTable();" id="back" style="background:#45a9ff;border-radius:5px;padding: 6px 7px;">
                                <font color="#ffffff">&nbsp&nbsp返回&nbsp&nbsp</font>
                            </a>
                        </p>
                    </div>
                    <div class="detail-list" id='corpProdPenalty'>
                        <div class="panel-body" id="prodPenaltyPageDiv">
                            <p class="tax-list-p">行政处罚</p>
                            <c:if test="${empty corpProdPenaltyPage.content}">
                                <div class="panel-table" id="enterPrisePenalty_off">暂未收录该企业相关信息</div>
                            </c:if>
                            <c:if test="${!(empty corpProdPenaltyPage.content)}">
                                <div class="panel-table" id="corpProdPenalty_list">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <th class="sh30">税务登记证号</th>
                                            <th class="sh31">行政处罚决定书文号</th>
                                            <th class="sh30">违法违章情况</th>
                                            <th class="sh31">现状</th>
                                            <th class="sh31">处罚日期</th>
                                            <th class="sh31">操作</th>
                                        </tr>
                                        <tbody id="corpProdPenaltyTable">
                                        <tr model style="display: none;">
                                            <td class="sh30">{0}</td>
                                            <td class="sh31">{1}</td>
                                            <td class="sh30">{2}</td>
                                            <td class="sh31">{3}</td>
                                            <td class="sh31">{4}</td>
                                            <td class="sh31">
                                                <a detail-data="{5}" href="javascript:void(0) ;">查看详情</a>
                                            </td>
                                        </tr>
                                        <c:forEach items="${corpProdPenaltyPage.content}" var="patent" varStatus="i">
                                            <tr>
                                                <td class="sh30">${patent.punishDocCode}</td>
                                                <td class="sh31">${patent.illegalType}</td>
                                                <td class="sh30">${patent.illegalFacts}</td>
                                                <td class="sh31">${patent.punishContent}</td>
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
                                    <div id="corpProdPenaltyPage" class="zs_page"
                                         config='{name: "corpProdPenaltyTable",url:"${basePath}/gov/user/company/monitor/detail/corpProdPenalty/list?companyNameDigest=${companyNameDigest}",nodata:".data-no-tip",
    npage:${empty param.npage ? '1' : param.npage}, spage:${corpProdPenaltyPage.totalPages }, total:${corpProdPenaltyPage.total }, pin:5, isAjax:true}'></div>
                                </div>
                            </c:if>
                            <div class="panel-table" id="enterPrisePenalty" style="display:none;">
                                <table cellpadding="0" cellspacing="0" border="0">
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
                                <p>来源：国税部门监管信息</p>
                                <div id="enterPrisePenaltyPage" class="zs_page"
                                     config='{name: "enterPrisePenaltyTable", url:"${basePath}/gov/user/company/monitor/detail/enterPrisePenalty/list?companyNameDigest=${companyNameDigest}", nodata:".detail_nodata", isAjax:true}'></div>
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
                                    <div id="uncrePage" class="zs_page"
                                         config='{name: "uncreTable",url:"${basePath}/gov/user/company/monitor/detail/uncre/list?companyNameDigest=${companyNameDigest}",nodata:".data-no-tip",
                  isAjax:true}'></div>
                                </div>

                            </c:if>
                        </div>
                        <div class="panel-body" id="rentNoPayTaxDiv">
                            <p class="tax-list-p">欠税信息</p>
                            <div class="panel-table" id="rentNoPayTax_off" style="display: none">暂未收录该企业相关信息</div>
                            <div class="panel-table" id="rentNoPayTax">
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <th class="sh35">纳税人识别号</th>
                                        <th class="sh35">法人代表或负责人</th>
                                        <th class="sh35">欠税余额</th>
                                        <th class="sh35">欠税税种</th>
                                        <th class="sh35">欠税所属期</th>
                                    </tr>
                                    <tbody id="rentNoPayTaxTable">
                                    <tr model style="display:none;">
                                        <td class="sh35">{0}</td>
                                        <td class="sh35">{1}</td>
                                        <td class="sh35">{2}</td>
                                        <td class="sh35">{3}</td>
                                        <td class="sh35">{4}</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div id="rentNoPayTaxPage" class="zs_page"
                                     config='{name: "rentNoPayTaxTable",url:"${basePath}/gov/user/company/monitor/detail/rentNoPayTaxInfo/list?companyNameDigest=${companyNameDigest}",nodata:"#rentNoPayTax_off",
                  isAjax:true}'></div>
                            </div>
                        </div>
                        <div class="panel-body" id="courtDocDiv">
                            <p class="tax-list-p">诉讼记录</p>
                            <div class="panel-table" id="courtDocNoData" style="display: none">暂未收录该企业相关信息</div>
                            <div class="panel-table" id="courtDoc_list">
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <th class="sh37">文书名</th>
                                        <th class="sh38">案件性质</th>
                                        <th class="sh39">判决时间</th>
                                        <th class="sh40">详情</th>
                                    </tr>
                                    <tbody id="courtDocTable">
                                    <tr model style="display: none;">
                                        <td class="sh37">{0}</td>
                                        <td class="sh38">{1}</td>
                                        <td class="sh39">{2}</td>
                                        <td class="sh40"><a detail-data="{3}" href="javascript:void(0);">详情</a></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div id="courtDocPage" class="zs_page"
                                     config='{name: "courtDocTable",url:"${basePath}/gov/user/company/monitor/detail/court/list?companyNameDigest=${companyNameDigest}",nodata:"#courtDocNoData",
                  isAjax:true}'></div>
                            </div>
                        </div>
                        <div class="panel-body" id="newsDiv" style="    margin-bottom: 20px;">
                            <p class="tax-list-p" style="margin-bottom: 0px;">负面报道</p>
                            <%--<div class="zsBlock_edit">--%>
                                <%--<div class="zsReport" id="posi_and_nega">--%>
                               <%--     <div class="zsReport_ul">
                                        <ul>
                                            <li class="current" data-nav="posiDiv">正面报道<span class="zsReport_s1"
                                                                                             id="searchbadgePositive">(0)</span><span
                                                    class="zsReport_s2"><em></em></span>
                                            </li>
                                            <li data-nav="negaDiv">负面报道<span id="searchbadgeNegative">(0)</span><span
                                                    class="zsReport_s2"><em></em></span></li>
                                        </ul>
                                    </div>--%>
                              <%--      <div id="positiveNo">
                                        <div class="zsReport_list zsReport_h5" id="positiveNone" style="display: none">
                                            <h5>暂无报道</h5>
                                        </div>
                                    </div>--%>

                                        <div class="zsReport_list zsReport_h5" id="negativeNone" style="display: none;padding: 18px 0 15px 23px;">
                                            <h5>暂无报道</h5>
                                        </div>


                                   <%-- <div id="positiveMediaReport" mark="posiDiv" data-attr="media">
                                        <div class="zsReport_list" model style="display: none;">
                                            <a href="${basePath }/detail/detail_haosou.jsp?url={0}&s=${company.companyNo}&name=${company.companyName}">{1}</a>
                                            <p>发布时间：<span>{3}</span></p>
                                            <p>来源：<span>{2} </span></p>
                                        </div>
                                    </div>--%>

                                    <div id="negativeMediaReport" style="" mark="negaDiv"
                                         data-attr="media">
                                        <div class="zsReport_list" model style="display: none;">
                                            <a href="${basePath }/detail/detail_haosou.jsp?url={0}&s=${company.companyNo}&name=${company.companyName}">{1}</a>
                                            <p>发布时间：<span>{3}</span></p>
                                            <p>来源：<span>{2} </span></p>
                                        </div>
                                    </div>
                                <%--</div>--%>
                                <%--<div id='positiveMediaReport_page' data-attr="media" mark="posiDiv" class="zs_page" config='{name: "positiveMedia", url:"${basePath }/gov/user/new/company/monitor/detail/ajax/media/list?companyId=${company.companyId}&isPositive=1", npage:1, pin:2, isAjax:true, nodata:"#positiveNone",isShowRedict:true}'></div>--%>
                                <div id='negativeMediaReport_page' class="zs_page" style="margin-top: 5px;"
                                     config='{name: "negativeMedia", url:"${basePath }/gov/user/company/monitor/detail/ajax/media/list?companyId=${company.companyId}&isPositive=2", npage:1, pin:2, isAjax:true, nodata:"#negativeNone",isShowRedict:true}'></div>
                            <%--</div>--%>
                        </div>
                        <a target="_blank" href="${basePath}/gov/company/professionalInfo?s=${company.companyNo}" style="color: #ffffff;background-color:#20addd;padding: 11px 47px;margin-top: 10px;margin-left: 42%; ">查看更多信息</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="gov_width gov_width3"></div>
</div>
</div>
</body>
</html>
