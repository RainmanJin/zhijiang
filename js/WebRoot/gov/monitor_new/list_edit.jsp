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
    <link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/gov/js/monitor/monitor.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">
        var monitorCfg = monitorCfg || {
                page: 'edit'
            };
    </script>
</head>

<body class="gov_bg" data-attr="regulatory_effect">

<jsp:include page="monitor_top.jsp"/>
<jsp:include page="monitor_left.jsp"/>

<div class="govMain" id="prepareListCallBack">
    <div class="govList">
        <div class="govList_main_tit">
            <div class="gov_width gov_width3"></div>
            <div class="govList_h3">
                <div class="gov1226_left">选中<span style="display: inline-block;width: 20px;text-align: center;" id="chooseNumber">0</span>个文件
                    <a id="delete" href="javascript:void(0);">批量删除</a>
                    <a id="editAdd_a" href="javascript:void(0);">编辑添加</a></div>
                <div class="gov1226_right">
                    <a id="excel_import_download" href="${basePath}/gov/user/company/monitor/prepare/download"
                       class="gov1226_a1">下载企业名单模板</a>
                    <a id="excel_import_upload" href="javascript:void(0);" class="gov1226_a2">导入企业名单</a>
                </div>
            </div>
            <div class="gov_width gov_width3"></div>
        </div>
    </div>
    <div class="govList_gk">
        <div class="gov_width gov_width3"></div>
        <div class="govAudit_main govMonitor">
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <th class="govA2"><input type="checkbox" id="operateAll" style="margin-right: 6%;" data-attr="unselected"/>企业名称</th>
                    <th class="govA6">
                        <div id="uboxstyle03" class="govUb ">

                            <div id="select_type" class="select_box" style="margin-left: 0 !important;">
                                <div id="select_info_type" class="tag_select" data-attr="0" show_length="12" style="cursor: pointer;">请选择</div>
                                <ul id="options_type" class="tag_options" style="position: absolute; display: none; z-index: 999;">
                                    <li class="open_selected" data-attr="" id="selected_type" style="cursor: pointer;">请选择</li>
                                    <c:if test="${not empty groupList}">
                                        <c:forEach items="${groupList}" var="gl">
                                            <li class="open" data-attr="${gl.id}" style="cursor: pointer;">${gl.groupName}</li>
                                        </c:forEach>
                                    </c:if>
                                </ul>
                            </div>

                        </div>
                    </th>
                    <th class="govA1">
                        <div id="uboxstyle02" class="govUb ">

                            <div id="select_type" class="select_box" style="margin-left: 0 !important;">
                                <div id="select_info_cityCode" class="tag_select" data-attr="0" style="cursor: pointer;">请选择</div>
                                <ul id="options_city" class="tag_options" style="position: absolute; display: none; z-index: 999;">
                                    <li class="open_selected" data-attr="" id="selected_city" style="cursor: pointer;">请选择</li>
                                    <c:forEach items="${cityMap}" var="city">
                                        <li class="open" data-attr="${city.key}" style="cursor: pointer;">${city.value}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </th>
                    <th class="govA7">创建时间</th>
                    <th class="govA5">操作</th>
                </tr>
                <tbody id="monitorEditTable">
                <tr style="display: none" model>
                    <td class="govA2"><input name="foreignCapitalId" style="margin-right: 6%;" type="checkbox" data-attr="{1}" value="{0}"/>{1}
                    </td>
                    <td class="govA6">{2}</td>
                    <td class="govA1" style="max-width:138px;overflow:hidden;">{3}</td>
                    <td class="govA7">{4}</td>
                    <td class="govA5"><a href="javascript:void(0)" class="deleteTag" data-attr="{0}">删除</a></td>
                </tr>
                </tbody>
            </table>


            <div class="zs_page"
                 config='{name: "monitorEditTable", url:"${basePath}/gov/user/company/monitor/prepare/ajax/list",nodata:".detail_nodata", isAjax:true,isShowRedict:true}'></div>
            <div class="detail_nodata" style="display: none;">
                未查询到相关信息
            </div>
            <input type="hidden" id="preparePageUniqueId" value=""/>
        </div>
        <div class="gov_width gov_width3"></div>
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

</body>

</html>
