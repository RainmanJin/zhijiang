<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>预付卡企业监测-之江信用</title>
    <base href="${basePath}/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="keywords" content="企业查询,中小企业,三资企业,民营企业,私营企业,黄页大全"/>
    <meta http-equiv="description" content="之江信用提供中小企业,民营企业信息查询,私营企业信用查询服务。"/>
    <link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/gov/js/monitor/monitor.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">

        var monitorCfg = monitorCfg || {
                page: 'edit'
            };

    </script>
</head>

<body class="container container-jg">
<form>
    <input name="companyName" type="hidden" value="${companyName }"/>
    <input name="" id="foreignCapitalId" type="hidden"/>
</form>
<jsp:include page="/gov/gov_top.jsp"/>
<!--end nav-->

<jsp:include page="/gov/monitor/left.jsp"/>
<div class="right">
    <div class="content">
        <div class="content-bg">
            <div class="impotrant-tit"><a data-attr1="companyMonitore"
                                          href="${basePath }/gov/user/company/monitor/list">企业监测</a>>><a
                    href="javascript:void(0);">企业名单编辑</a></div>
        </div>
    </div>
    <div class="j-container">
        <div class="foreign">
            <p>
                <span id="chooseNumber">选中 0个文件</span>
                <input class="delet" name="" id="delete" type="button" value="批量删除"/>
                <input type="button" value="编辑添加" class="import includ" id="editAdd_a"/>
                <span id="excel_import_upload" style="float:right;">导入企业名单</span>
                <label style="color:#2f97de;float:right;margin-top: 7px;cursor:pointer;margin-right:40px;"
                       onclick="location.href='${basePath}/gov/user/company/monitor/prepare/download'" class=" includ"
                       id="excel_import_download" value="">下载企业名单模板</label>
                <%--<a href="#" class="" id="excel_import_upload">上传企业名单模板</a>--%>

            </p>
        </div>
    </div>

    <div class="j-container">
        <table cellpadding="0" cellspacing="0" border="0" class="spread" id="prepareListCallBack">
            <tr>
                <th class="pro05" style="padding-left:20px;"><input type="checkbox" id="operateAll"
                                                                    data-attr="unselected"/></th>
                <th class="pro06">企业名称</th>
                <th class="pro07">
                    <select name="" id="group" style="border: 1px solid #ccc;height: 26px;width: 90%;">
                        <option value="0" selected="selected">选择分组</option>
                        <c:if test="${not empty groupList}">
                            <c:forEach var="gl" items="${groupList}" >
                                <option value="${gl.id}"> ${gl.groupName} </option>
                            </c:forEach>
                        </c:if>
                    </select>

                </th>
                <th class="pro05">
                    <select name="" id="cityCode" style="border: 1px solid #ccc;height: 26px;width: 90%;">
                        <option value="0" selected="selected">选择地区</option>
                        <c:forEach items="${cityMap}" var="city">
                            <option value="${city.key}">${city.value}</option>
                        </c:forEach>
                    </select>
                </th>
                <th class="pro07">创建时间</th>
                <th class="pro05">操作</th>
            </tr>
            <tbody id="monitorEditTable">
            <tr style="display: none" model>
                <td class="pro05" style="padding-left:20px;"><input name="foreignCapitalId" type="checkbox" data-attr="{1}"
                                                                    value="{0}"/></td>
                <td class="pro06" show_length="20">{1}</td>
                <td class="pro07" show_length="10">{2}</td>
                <td class="pro05" show_length="10" style="max-width:138px;overflow:hidden;">{3}</td>
                <td class="pro07">{4}</td>
                <td class="pro05"><a href="javascript:void(0)" class="deleteTag" data-attr="{0}">删除</a></td>
            </tr>
            </tbody>
        </table>
        <div class="f-page"
             config='{name: "monitorEditTable", url:"${basePath}/gov/user/company/monitor/prepare/ajax/list",nodata:".detail_nodata", isAjax:true}'></div>
        <div class="detail_nodata" style="display: none;">
            未查询到相关信息
        </div>
        <input type="hidden" id="preparePageUniqueId" value=""/>
    </div>
</div>

<div class="seed-pop" style="display: none;z-index: 100;">
    <a id="closeBtn" style="display: none;"></a>
    <div class="foreign-pop">
        <div class="foreign-padding">
            <div class="foreign-main">

                <div class="engine-middle" style="position:relative;">
                    <p>
                        <span>企业名称</span><input id="companyNameKey" name="companyName" type="text"/>
                        <span id="prompt"
                              style="display: none;color: red;font-size: 9px;padding-left: 10px;position: absolute;top: 7px;width: auto;">*</span>
                    </p>
                </div>
                <p><span>类型</span>
                    <select name="type" id="type"
                            style="border: 1px solid #0c7d6;height: 27px;line-height: 27px;width: 51%;">
                        <option value="">请选择</option>
                        <c:if test="${not empty groupList}">
                            <c:forEach var="gl" items="${groupList}" >
                                <option value="${gl.id}"> ${gl.groupName} </option>
                            </c:forEach>
                        </c:if>
                    </select>
                    <span id="promptType"
                          style="display: none;color: red;font-size: 9px;padding-left: 10px;position: absolute;top: 7px;width: auto;">*</span>
                </p>
                <p><span>地区</span>
                    <select name="city" id="city"
                            style="border: 1px solid #0c7d6;height: 27px;line-height: 27px;width: 51%;">
                        <option value="">请选择</option>
                        <c:forEach items="${cityMap}" var="city">
                            <option value="${city.key}">${city.value}</option>
                        </c:forEach>
                    </select>
                    <!-- <input name="city" id="city" type="text" /> -->
                    <span id="promptCity"
                          style="display: none;color: red;font-size: 9px;padding-left: 10px;position: absolute;top: 7px;width: auto;">*</span>
                </p>

            </div>
            <div class="foreign-button">
                <input class="y" name="ensure" type="button" value="确定"/>
                <input class="n" name="cancel" type="button" value="取消"/>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/gov/footer.jsp"/>
</body>


</html>
