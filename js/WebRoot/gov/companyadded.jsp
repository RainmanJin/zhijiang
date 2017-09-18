<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>外资促进-之江信用</title>
    <base href="${basePath}/"/>
    <%--<link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />--%>
    <link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/gov/js/foreigncapital.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">
        var foreigncapitalCfg = foreigncapitalCfg || {
                    page: 'add'
                };
    </script>
</head>
<body class="container" id="body" data-attr="foreignCapital" data-attr2="companyadded" style="background:#d7d7d7;">
<form>
    <input name="companyName" type="hidden" value="${companyName }"/>
    <input name="" id="foreignCapitalId" type="hidden"/>
</form>
<jsp:include page="./foreigncapital_header.jsp"/>
<div class="layout">
    <div class="right">

        <div class="j-container">
            <div class="foreign">
                <p><a href="${basePath}/gov/user/companysearch">返回</a><span id="chooseNumber">选中0个文件</span>
                    <input class="import" name="" type="button" id="export" value="导出至excel表"/>
                    <input class="delet" name="" id="delete" type="button" value="批量删除"/></p>
            </div>
        </div>

        <div class="j-container" id="companyAddList">
            <table cellpadding="0" cellspacing="0" border="0" class="spread">
                <tr>
                    <th class="pro05" style="padding-left:20px;"><input type="checkbox" id="operateAll" data-attr="unselected"/></th>
                    <th class="pro06">企业名</th>
                    <th class="pro07">电话</th>
                    <th class="pro07">官网</th>
                    <th class="pro08">地址</th>
                    <th class="pro05">操作</th>
                </tr>
                <c:if test="${!empty pageAll.content }">
                    <c:forEach items="${pageAll.content}" var="fc">
                        <tr>
                            <td class="pro05" style="padding-left:20px;"><input name="checkItem" type="checkbox"
                                                                                value=""
                                                                                data-attr="${fc.foreignCapitalId }"/>
                            </td>
                            <td class="pro06" show_length="20">${fc.companyName }</td>
                            <td class="pro07" show_length="10">${fc.companyOfficialPhone }</td>
                            <td class="pro07" show_length="10"
                                style="max-width:138px;overflow:hidden;">${fc.companyOfficialWebsite }</td>
                            <td class="pro08">${fc.companyAddress }</td>
                            <td class="pro05"><a href="javascript:void(0)" class="deleteTag" data-attr="${fc.foreignCapitalId }">删除</a></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
            <c:if test="${!empty pageAll.content }">
                <div class="page" config='{name: "companyAddList",url:"${basePath }/gov/user/foreigncapital/list",
                 nodata:".data-no-tip",
                 npage:${empty param.npage ? '1' : param.npage}, spage:${pageAll.totalPages }, total:${pageAll.total }, pin:5, isAjax:false}'></div>
            </c:if>
            <c:if test="${empty pageAll.content }">
                <div class="detail_nodata">
                    未查询到相关信息
                </div>
            </c:if>
        </div>

    </div>
</div>
<div class="pop-content" id="addSuccess"
     style="display:none; font-size:16px;color:#757171;line-height:25px;padding-bottom:30px;">
    <div on class="base_msg"><img src="${basePath }/images/gov-images/succeed-pop.png"/></div>
    <div class="t">名单导出成功!</div>
    <div class="c">你还可以挑挑其他符合条件的企业</div>
    <button class="pop-close">确定</button>
</div>
<jsp:include page="/gov/footer.jsp"/>
</body>

</html>