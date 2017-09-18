<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${basePath}/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>认领趋势</title>
    <link href="${basePath}/style/new/gov_monitor_style.css" type="text/css" rel="stylesheet"/>
    <script data-main="${basePath }/gov/js/monitor/owner_monitor.js" src="${basePath }/gov/js/lib/require.js"></script>

<body class="gov_bg">

<jsp:include page="monitor_top.jsp"/>
<jsp:include page="monitor_left.jsp"/>


<div class="govMain govMain_new">
    <div class="govList">
        <div class="govList_main_tit">
            <div class="gov_width gov_width3"></div>
            <div class="govList_h3"></div>
        </div>
        <div class="govList_gk">
            <div class="gov_width gov_width3"></div>
            <div class="govList_gk_list govList_gk_list4">
                <div class="govList_eleft"><img src="${basePath}/images/gov-images/zs_Geg07.png"></div>
                <div class="govList_eright govList_eright01">
                    <h4 class="gk_h4">辖区内认领企业总数（家）</h4>
                    <p class="gk_p" id="shopTotalNum">${count}</p>
                </div>
            </div>
            <div class="gov_width gov_width3"></div>
            <div class="govList_gk_list govList_gk_list5">
                <div class="govList_eleft"><img src="${basePath}/images/gov-images/zs_Geg08.png"></div>
                <div class="govList_eright govList_eright01">
                    <h4 class="gk_h4" >辖区内认领审核通过数（家）</h4>
                    <p class="gk_p" id="shopNew">${passCount}</p>
                </div>
            </div>
            <div class="gov_width gov_width3"></div>
            <div class="govList_gk_list govList_gk_list6">
                <div class="govList_eleft"><img src="${basePath}/images/gov-images/zs_Geg09.png"></div>
                <div class="govList_eright govList_eright01">
                    <h4 class="gk_h4">辖区内认领审核驳回数（家）</h4>
                    <p class="gk_p" id="shopClosed">${noPassCount}</p>
                </div>
            </div>
        </div>
        <div class="govList_gk">
            <div class="gov_width gov_width3"></div>
            <div class="govAudit_main govMonitor govFont">
                <input type="hidden" id="userCityCode" value="${userCityCode}"/>
                <input type="hidden" id="userDistrictCode" value="${userDistrictCode}"/>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <th class="govA12">企业名称</th>
                        <th class="govA8">认领时间</th>
                        <th class="govA9">
                            <c:if test="${not empty userCityCode && userCityCode!=0}">
                                市
                            </c:if>
                        <c:if test="${empty userCityCode || userCityCode==0}">
                            <select id="citySelect">
                                <option value="">选择市</option>
                            </select>
                        </c:if>
                        </th>
                        <th class="govA8"></th>
                        <th class="govA9">
                        <c:if test="${not empty userDistrictCode && userDistrictCode!=0}">
                            区
                        </c:if>
                        <c:if test="${empty userDistrictCode || userDistrictCode==0}">
                            <select id="districtSelect">
                                <option value="">选择区</option>
                            </select>
                            </c:if>
                        </th>
                        <th class="govA10">状态</th>
                    </tr>
                    <tbody id="ownerMonitorTable">
                    <tr  model style="display:none">
                        <td class="govA12"><a style="border: none" href="${basePath}/company/professionalInfo?n={6}" target="_blank">{0}</a></td>
                        <td class="govA8">{1}</td>
                        <td class="govA9">{2}</td>
                        <td class="govA11">一</td>
                        <td class="govA9">{3}</td>
                        <td class="govA10"><a href="javascript:void(0)" class="{5}">{4}</a></td>
                    </tr>
                    </tbody>

                </table>
                <div class="zs_page"
                     config='{name: "ownerMonitorTable", url:"${basePath}/gov/user/owner/ajax/list", nodata:".detail_nodata", isAjax:true,isShowRedict:true}'></div>
                <div class="detail_nodata" style="display: none;">
                    未查询到相关信息
                </div>
            </div>
            <div class="gov_width gov_width3"></div>
        </div>
    </div>
</div>
</body>
</html>
