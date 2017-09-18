<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${key }-企业信用查询-之江信用</title>
    <base href="${basePath}/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="keywords" content="企业查询,中小企业,三资企业,民营企业,私营企业,黄页大全"/>
    <meta http-equiv="description" content="之江信用提供中小企业,民营企业信息查询,私营企业信用查询服务。"/>
    <link href="${basePath}/style/new/gov_monitor_style.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/gov/js/monitor/regulatory_effect.js"
            src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript" src="${basePath }/gov/js/monitor/select2css.js"></script>
    <script>
        var clueCfg = clueCfg || {
                page: 'index'
            };
    </script>

</head>

<body class="gov_bg" data-attr="regulatory_effect">

<jsp:include page="monitor_top.jsp"/>
<jsp:include page="monitor_left.jsp"/>

<!--end gov_nav-->
<div class="govMain govMain_new">
    <div class="govList">
        <div class="govList_main_tit">
            <div class="gov_width gov_width3"></div>
            <div class="govList_h3">监管成效概况</div>
        </div>
        <div class="govList_gk">
            <div class="gov_width gov_width3"></div>
            <div class="govList_cx govList_cx1">
                <p><span id="clueTotalNum">1000</span><br/>11月份发现线索总数（条）</p>
                <div class="govRound">
                    <h4 id="clueDealProbability">70%</h4>
                    <h5>完成率</h5>
                </div>
                <p><span id="clueDealNum">1000</span><br/>11月份初审线索处理数（条）</p>
            </div>
            <div class="gov_width gov_width4"></div>
            <div class="govList_cx govList_cx2">
                <p><span id="caseNum">1000</span><br/>11月份复审线索总数（条）</p>
                <div class="govRound">
                    <h4 id="caseDealProbability">70%</h4>
                    <h5>完成率</h5>
                </div>
                <p><span id="caseDealNum">1000</span><br/>11月份复审线索处理数（条）</p>
            </div>
            <div class="gov_width gov_width3"></div>
        </div>
        <div class="govList_gk">
            <div class="gov_width gov_width3"></div>
            <div class="govList_tb1213">
                <p class="tb1213_p1"><span style="line-height: 47px;"></span><label style="line-height: 47px;">监管成效近半年趋势</label></p>
                <div class="">
                    <div class="tb1213_main">
                        <%--<img src="../images/zs_Geg06.png">--%>
                        <div id="siteClueStatHalfYear" style="width:auto;height:400px;"></div>

                    </div>
                </div>
            </div>
            <div class="gov_width gov_width3"></div>
        </div>
        <div class="govList_main_tit">
            <div class="gov_width gov_width3"></div>
            <div class="govList_h3 govList_nl">线索管理</div>
        </div>
        <div class="govList_gk" style="margin-bottom: 10px;">
            <div class="gov_width gov_width3"></div>
            <div class="Man1213">
                <ul class="Man1213_ul1">
                    <li class="current">初审线索</li>
                    <li>复审线索</li>
                </ul>
                <div class="Man1213_input">
                    <form>
                        <input type='text' style='display:none'/>
                        <input name="clueState" type="hidden" value="0"/>
                        <input name="pageSize" type="hidden" value="5"/>
                        <input name="clueProcessType" type="hidden" value=""/>
                        <p>企业名称<input type="text" name="companyName" value=""></p>
                        <div id="uboxstyle">处置方式
                            <select name="clueProcessType" id="clueProcessType" style="">
                                <option value=""><font>请选择</font></option>
                                <c:forEach items="${clueProcessTypeMap }" var="processType">
                                    <option value="${processType.key}">
                                        <font>${processType.value}</font></option>
                                </c:forEach>

                            </select>

                            <input type="button" id="search" value="查 询" class="Man1213_button" style="cursor: pointer;">
                         <%--   <p style="margin-left: 306px;" id="total_page_format">每页显示&nbsp;
                                <select id="pageSizeChoose" name="pageSizeChoose">
                                    <option value="5" ${pageSize == 5 ? 'selected' : '' } data_attr="5"><font><a href="javascript:void(0);">5</a></font></option>
                                    <option value="10" ${pageSize == 10 ? 'selected' : '' } data_attr="10"><font><a href="javascript:void(0);">10</a></font></option>
                                </select>&nbsp;条记录
                                共&nbsp;<span id="record_total">${cluePage.total }</span>&nbsp;条记录 [<span id="page_record">1/1</span>]
                            </p>--%>
                        </div>


                    </form>
                </div>
            </div>
            <div class="gov_width gov_width3"></div>
        </div>
        <div class="govList_gk">
            <div class="gov_width gov_width3"></div>
            <div class="Man1213" id="clueIndex">
                <div class="Man1213_data">
                    <ul class="Man1213_ul2">
                        <li class="current" data_attr='0'>未处理线索</li>
                        <li data_attr='1'>已处理线索</li>
                    </ul>
                    <div class="data_right">
                        <%--<p>每页显示<input type="text" value="5" />条记录&nbsp;&nbsp;共<span>${cluePage.total }</span>条记录【1/1】</p>--%>
                            <div id="uboxstyle">
                                <p style="margin-left: 306px;" id="total_page_format">每页显示&nbsp;
                                    <select id="pageSizeChoose" name="pageSizeChoose">
                                        <option value="5" ${pageSize == 5 ? 'selected' : '' } data_attr="5"><font><a href="javascript:void(0);">5</a></font></option>
                                        <option value="10" ${pageSize == 10 ? 'selected' : '' } data_attr="10"><font><a href="javascript:void(0);">10</a></font></option>
                                    </select>&nbsp;条记录
                                    共&nbsp;<span id="record_total">${cluePage.total }</span>&nbsp;条记录 [<span id="page_record">1/1</span>]
                                </p>
                            </div>


                    </div>
                </div>
                <div class="Man1213_table" id="clue_deal_info">
                    <div id="undeal_div" data-attr="clue_div">
                    <table cellpadding="0" cellspacing="0" border="0" class="case" style="" data-attr="undeal_table">
                        <tr>
                            <th class="Man1213_t1 Man1213_t3">公司名称</th>
                            <th class="Man1213_t1">线索类型</th>
                            <th class="Man1213_t1">主管机构</th>
                            <th class="Man1213_t1">创建时间</th>
                            <th class="Man1213_t2 Man1213_t4">审核</th>
                        </tr>

                        <tbody id="clue_stat_undeal_model">
                        <tr model style="display: none;">
                            <td class="Man1213_t1 Man1213_t3">{0}</td>
                            <td class="Man1213_t1">{1}</td>
                            <td class="Man1213_t1">{2}</td>
                            <td class="Man1213_t1">{3}</td>
                            <td class="Man1213_t2 Man1213_t4">{4}</td>
                        </tr>
                        </tbody>

                    </table>
                    <div style="display: none;" class="zs_page"
                         config='{name: "clueIndex", url:"${basePath}/gov/user/corporate/ajax/list?clueStatus=${empty param.clueStatus?'':param.caseStatus}&companyName=${empty param.companyName?'':param.companyName}&clueState=0&clueProcessType=${empty param.clueProcessType?'':param.clueProcessType}&pageSize=${empty param.pageSize?'':param.pageSize}",
                         nodata:"#detail_nodata", isAjax:true, autoLoad:true,isShowRedict:true}'></div>
                    <div class="detail_nodata" style="display: none;">
                        未查询到相关信息
                    </div>
                    </div>

                    <div id="dealed_div" data-attr="clue_div">
                    <table cellpadding="0" cellspacing="0" border="0" class="case" style=""
                           data-attr="dealed_table">
                        <tr>
                            <th class="Man1213_t1 Man1213_t3">公司名称</th>
                            <th class="Man1213_t1">线索类型</th>
                            <th class="Man1213_t1">主管机构</th>
                            <th class="Man1213_t2">创建时间</th>
                            <th class="Man1213_t2">处置方式</th>
                            <th class="Man1213_t2">审核时间</th>
                            <th class="Man1213_t2 " style="padding-right: 0.3%;">操作</th>
                        </tr>

                        <tbody id="clue_stat_dealed_model">
                        <tr model style="display: none;">
                            <td class="Man1213_t1 Man1213_t3">{0}</td>
                            <td class="Man1213_t1">{1}</td>
                            <td class="Man1213_t1">{2}</td>
                            <td class="Man1213_t2">{3}</td>
                            <td class="Man1213_t2">{4}</td>
                            <td class="Man1213_t2">{5}</td>
                            <td class="Man1213_t2 " style="padding-right: 0.3%;">{6}</td>
                        </tr>
                        </tbody>
                    </table>
                    <div style="display: none;"  class="zs_page"
                         config='{name: "clueIndex", url:"${basePath}/gov/user/corporate/ajax/list?clueStatus=${empty param.clueStatus?'':param.caseStatus}&companyName=${empty param.companyName?'':param.companyName}&clueState=1&clueProcessType=${empty param.clueProcessType?'':param.clueProcessType}&pageSize=${empty param.pageSize?'':param.pageSize}",
                         nodata:"#detail_nodata", isAjax:true, autoLoad:true,isShowRedict:true}'></div>
                    <div class="detail_nodata" style="display: none;">
                        未查询到相关信息
                    </div>
                    </div>

                    <div id="second_undeal_div" data-attr="clue_div">
                    <table cellpadding="0" cellspacing="0" border="0" class="case" style=""
                           data-attr="second_undeal_table">
                        <tr>
                            <th class="Man1213_t1 Man1213_t3">公司名称</th>
                            <th class="Man1213_t1">线索类型</th>
                            <th class="Man1213_t1">主管机构</th>
                            <th class="Man1213_t2">处理方式</th>
                            <th class="Man1213_t2">创建时间</th>
                            <th class="Man1213_t2 Man1213_t4">审核</th>
                        </tr>

                        <tbody id="second_clue_stat_undeal_model">
                        <tr model style="display: none;">
                            <td class="Man1213_t1 Man1213_t3">{0}</td>
                            <td class="Man1213_t1">{1}</td>
                            <td class="Man1213_t1">{2}</td>
                            <td class="Man1213_t2">{3}</td>
                            <td class="Man1213_t2">{4}</td>
                            <td class="Man1213_t2 Man1213_t4">{5}</td>
                        </tr>
                        </tbody>
                    </table>
                    <div style="display: none;"  class="zs_page"
                         config='{name: "clueIndex", url:"${basePath}/gov/user/case/ajax/list?caseStatus=${empty param.clueStatus?0:param.caseStatus}&companyName=${empty param.companyName?'':param.companyName}&clueProcessType=${empty param.clueProcessType?'':param.clueProcessType}&pageSize=${empty param.pageSize?'':param.pageSize}",
                         nodata:"#detail_nodata", isAjax:true, autoLoad:true,isShowRedict:true}'></div>
                    <div class="detail_nodata" style="display: none;">
                        未查询到相关信息
                    </div>
                    </div>

                    <div id="second_dealed_div" data-attr="clue_div">
                    <table cellpadding="0" cellspacing="0" border="0" class="case" style=""
                           data-attr="second_dealed_table">
                        <tr>
                            <th class="Man1213_t1 Man1213_t3">公司名称</th>
                            <th class="Man1213_t2">线索类型</th>
                            <th class="Man1213_t2">主管机构</th>
                            <th class="Man1213_t2">处置方式</th>
                            <th class="Man1213_t2">创建时间</th>
                            <th class="Man1213_t2">处理结果</th>
                            <th class="Man1213_t2">处理时间</th>
                            <th class="Man1213_t2 " style="padding-right: 0.3%;">操作</th>
                        </tr>

                        <tbody id="second_clue_stat_dealed_model">
                        <tr model style="display: none;">
                            <td class="Man1213_t1 Man1213_t3">{0}</td>
                            <td class="Man1213_t2">{1}</td>
                            <td class="Man1213_t2">{2}</td>
                            <td class="Man1213_t2">{3}</td>
                            <td class="Man1213_t2">{4}</td>
                            <td class="Man1213_t2">{5}</td>
                            <td class="Man1213_t2">{6}</td>
                            <td class="Man1213_t2 " style="padding-right: 0.3%;">{7}</td>
                        </tr>
                        </tbody>
                    </table>
                    <div style="display: none;" class="zs_page"
                         config='{name: "clueIndex", url:"${basePath}/gov/user/case/ajax/list?caseStatus=${empty param.clueStatus?1:param.caseStatus}&companyName=${empty param.companyName?'':param.companyName}&clueProcessType=${empty param.clueProcessType?'':param.clueProcessType}&pageSize=${empty param.pageSize?'':param.pageSize}",
                         nodata:"#detail_nodata", isAjax:true, autoLoad:true,isShowRedict:true}'></div>
                    <div class="detail_nodata" style="display: none;">
                        未查询到相关信息
                    </div>
                    </div>

                </div>
            </div>
            <div class="gov_width gov_width3"></div>
        </div>
    </div>
    <!--end gov_govList-->
</div>

</body>

</html>
