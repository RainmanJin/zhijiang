<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${basePath}/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>企业监测</title>
    <link href="${basePath}/style/new/gov_monitor_style.css" type="text/css" rel="stylesheet"/>
    <link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/gov/js/monitor/monitor.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">
        var monitorCfg = monitorCfg || {
                page: 'list'
            };
    </script>
<body class="gov_bg" style="min-width: 1307px">

<jsp:include page="../gov_top.jsp"/>
<%--<jsp:include page="monitor_left.jsp"/>--%>
<!--end gov_nav-->
<div class="govMain" style="    width: 100%;
    margin-top: 9px;" id="prepareListCallBack">
    <div class="govList">
        <div class="govList_main_tit">
            <div class="gov_width gov_width3"></div>
            <div class="govList_h3">
                <div class="gov_search"><input placeholder="请输入企业名称" id="companyNameInput" type="text" value=""/>
                    <a id="searchBtn"><img src="${basePath}/images/gov-images/zs_Gsearch.png"></a>
                </div>
                <div class="gov1226_left">

                    <a id="editAdd_a" href="javascript:void(0);">添加企业</a>
                    <a id="delete" href="javascript:void(0);">批量删除</a>
                    <span style="display: none" id="selectText">选中<span style="display: inline-block;width: 20px;text-align: center;" id="chooseNumber">0</span>家企业</span>
       <%--             <select id="sortSelect" style="margin-left: 30px; width: 100px;height: 29px;border: 1px solid #e2e7ea;">
                        <option value="">默认排序</option>
                        <option value="punishCount">行政处罚</option>
                        <option value="uncreditCount">失信记录</option>
                        <option value="owedTaxCount">欠税信息</option>
                        <option value="judgmentCount">诉讼记录</option>
                        <option value="newsCount">负面报道</option>
                    </select>
                    <img  id="sortImg" order_type="desc" style="width: 35px;vertical-align: middle;display: none;" src="${basePath}/images/gov-images/desc.png" alt=""/>--%>
                </div>
                <div class="gov1226_right">
                    <a id="excel_import_download" href="${basePath}/gov/user/company/monitor/prepare/download"
                       class="gov1226_a1">下载企业名单模板</a>
                    <a id="excel_import_upload" href="javascript:void(0);" class="gov1226_a2">导入企业名单</a>
                </div>

            </div>
            <div class="gov_width gov_width3"></div>
        </div>
    </div>
    <!--end govList_gk -->
    <div class="govList_gk">
        <div class="gov_width gov_width3"></div>
        <div class="govAudit_main govMonitor">
            <table cellpadding="0" cellspacing="0" border="0">
                <tr id="titleTr">
                    <th class="govA1"  style="text-align: left;padding-left: 8px;" >

                        <div id="uboxstyle02" class="govUb ">
                            <input type="checkbox" id="operateAll"  data-attr="unselected"/>
                            <div id="select_cityCode" class="select_box">
                                <div id="select_info_cityCode" class="tag_select" data-attr="0"
                                     style="cursor: pointer;">选择地区
                                </div>
                                <ul id="options_cityCode" class="tag_options" data-attr="0" style="position: absolute; display: none; z-index: 999;">
                                    <li class="open_selected" data-attr="0" id="selected_cityCode" style="cursor: pointer;">选择地区</li>
                                    <c:forEach items="${cityMap}" var="city">
                                        <li class="open" data-attr="${city.key}"
                                            style="cursor: pointer;">${city.value}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </th>
                    <th class="govA2">
                        <div id="uboxstyle03" class="govUb ">
                            <div id="select_type" class="select_box">
                                <div id="select_info_type" class="tag_select" show_length="12" data-attr="0"
                                     style="cursor: pointer;">选择分组
                                </div>
                                <ul id="options_type" class="tag_options" style="position: absolute; z-index: 999; display: none;">
                                    <li class="open" data-attr="0" style="cursor: pointer;">选择分组</li>
                                    <c:forEach items="${typeList}" var="type">
                                        <li class="open" data-attr="${type.id}">${type.groupName}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </th>
                    <th class="govA3">企业名称</th>
                    <th class="govA4" sort="" sort-field="punishCount">行政处罚</th>
                    <th class="govA4" sort="" sort-field="uncreditCount">失信记录</th>
                    <th class="govA4" sort="" sort-field="owedTaxCount">欠税信息</th>
                    <th class="govA4" sort="" sort-field="judgmentCount">诉讼记录</th>
                    <th class="govA4" sort="" sort-field="newsCount">负面报道</th>
                    <th class="govA5">操作</th>
                </tr>
                <tbody id="companyMonitorTable">
                <tr model style="display:none">
                    <td class='govA1' style="text-align: left;padding-left: 8px;"><input name="foreignCapitalId" style="margin-right: 16%;" type="checkbox" data-attr="{2}" value="{8}"/>{0}</td>
                    <td class='govA2'>{1}</td>
                    <td class='govA3'>{2}</td>
                    <td class='govA4' data_count>{3}</td>
                    <td class='govA4' data_count>{4}</td>
                    <td class='govA4' data_count>{5}</td>
                    <td class='govA4' data_count>{6}</td>
                    <td class='govA4' data_count>{7}</td>
                    <td class='govA5'><a target="_blank" href='${basePath}/gov/user/company/monitor/detail/list?monitorId={8}'>详情</a>
                        <a href="javascript:void(0)" class="deleteTag" data-attr="{8}">删除</a></td>
                </tr>
                </tbody>
            </table>

            <div class="zs_page"
                 config='{name: "companyMonitorTable", url:"${basePath}/gov/user/monitor/ajax/list?cityCode=0&type=0", nodata:".detail_nodata", isAjax:true,isShowRedict:true}'></div>
            <div class="detail_nodata" style="display: none;">
                未查询到相关信息
            </div>

        </div>
        <div class="gov_width gov_width3"></div>
    </div>
</div>
</div>
<div class="foreign-pop" style="display: none;">
    <div class="foreign-padding">
        <div class="foreign-main">
            <div class="repeat1227 repeat1227_over">
                <span>企业名称</span>
                <input id="companyNameKey" name="companyName" type="text" class="ui-autocomplete-input">
                <span id="prompt"
                      style="display: none;color: red;font-size: 9px;padding-left: 5px;position: absolute;top: 7px;width: auto;">*</span>
            </div>
            <div class="repeat1227 repeat1227_over">
                <span>类型</span>
                <input id="companyType" name="groupName" type="text" class="ui-autocomplete-input">
                <span id="promptGroup" style="display: none;color: red;font-size: 9px;padding-left: 5px;position: absolute;top: 7px;width: auto;">*</span>
            </div>
            <div class="repeat1227">
                <span>地区</span>
                <div id="uboxstyle04" class="govUb">
                    <div id="select_type" class="select_box" style="margin-left: 0 !important;">
                        <div id="select_info_cityCode_pop" class="tag_select" data-typename="" data-attr="0" style="cursor: pointer;">请选择</div>
                        <ul id="options_city_pop" class="tag_options" style="position: absolute; display: none; z-index: 999;">
                            <li class="open_selected" data-attr="" id="selected_city" style="cursor: pointer;">请选择</li>
                            <c:forEach items="${cityMap}" var="city">
                                <li class="open" data-attr="${city.key}" style="cursor: pointer;">${city.value}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <%--<span id="promptType" style="display: none;color: red;font-size: 9px;padding-left: 5px;position: absolute;top: 7px;width: auto;">*</span>--%>
            </div>
            <span id="promptCity"
                  style="display: none;color: red;font-size: 9px;padding-left: 5px;top: 9px;width: auto;">*</span>
            <p></p>

        </div>
        <div class="foreign-button">
            <input class="y" name="ensure" type="button" value="确定">
            <input class="n" name="cancel" type="button" value="取消">
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>
