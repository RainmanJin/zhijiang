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
    <link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/gov/js/monitor/prepay_card.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">
        var prepayCardCfg = prepayCardCfg || {
                    page:'edit'
                };
    </script>
</head>

<body class="container container-jg" data-attr1="listEdit" data-attr="clue">
<form>
    <input name="companyName" type="hidden" value="${companyName }" />
    <input name="" id="foreignCapitalId" type="hidden"  />
</form>
<jsp:include page="/gov/gov_top.jsp"/>
<!--end nav-->

<jsp:include page="/gov/monitor/left.jsp"/>
<div class="right">
    <div class="content">
        <div class="content-bg">
            <div class="impotrant-tit"><a href="${basePath}/gov/user/company/monitor/prepay/card/list">预付卡企业监测</a>>><a href="javascript:void(0);">企业名单编辑</a></div>
        </div>
	</div>
    <div class="j-container">
        <div class="foreign">
            <p><%--<a href="${basePath}/gov/user/companysearch">返回</a>--%>
                <span id="chooseNumber">选中0个文件</span>
                <%--<input type="button" id="chooseNumber" value="选中0个文件" style="background:#626262"></input>--%>
                <%--<input class="import" name="" type="button" id="export" value="编辑添加" />--%>
                <input class="delet" name="" id="delete" type="button" value="批量删除" />
            <input type="button" value="编辑添加" class="import includ" id="editAdd_a"/>
            </p>
        </div>
    </div>

    <div class="j-container">
        <table cellpadding="0" cellspacing="0" border="0" class="spread" id="prepaidCardListCallBack">
            <tr>
                <th class="pro05" style="padding-left:20px;"><input type="checkbox" id="operateAll" data-attr="unselected"/></th>
                <th class="pro06">企业名称</th>
                <th class="pro07">备案号</th>
                <th class="pro07">备案登记机关</th>
                <th class="pro07">资金监管单位</th>
                <th class="pro05">操作</th>
            </tr>
            <tbody id="prepayCardEditTable">
			<tr model style="display: none">
                <td class="pro05"  style="padding-left:20px;"><input name="foreignCapitalId" type="checkbox" value="{4}" data-attr="" /></td>
                <td class="pro06" show_length="20">{0}</td>
                <td class="pro07" show_length="10">{1}</td>
                <td class="pro07"  show_length="10" style="max-width:138px;overflow:hidden;">{2}</td>
                <td class="pro07">{3}</td>
                <td class="pro05"><a href="javascript:void(0)" class="deleteTag" data-attr="{4}">删除</a></td>
            </tr>
            </tbody>
        </table>
        <div class="f-page" config='{name: "prepayCardEditTable", url:"${basePath}/gov/user/company/monitor/prepay/card/user/ajax/list", nodata:".detail_nodata", isAjax:true}'></div>
        <div class="detail_nodata" style="display: none;">
               	未查询到相关信息
        </div>
        <input type="hidden" id="prepaidCardPageUniqueId" value=""/>
    </div>
</div>

<div class="seed-pop" style="display: none;z-index: 100;">
    <a id="closeBtn" style="display: none;"></a>
    <div class="foreign-pop">
    	<div class="foreign-padding">
            <div class="foreign-main">
            	
            	<div class="engine-middle" style="position:relative;">
            		<p>
	            		<span>企业名称</span><input id="companyNameKey" name="companyName" type="text" />
	            		<span  id="prompt" style="display: none;color: red;font-size: 9px;padding-left: 10px;position: absolute;top: 7px;width: auto;">*</span>
            		</p>
                </div>
                <p><span>备案号</span><input name="caseNumber" type="text" /></p>
                <p><span>登记机关</span><input name="regAuthority" type="text" /></p>
                <p><span>资金监管机关</span><input name="financialAuthority" type="text" /></p>
            </div>
            <div class="foreign-button">
	            <input class="y" name="ensure" type="button" value="确定" />
	            <input class="n" name="cancel" type="button" value="取消" />
			</div>
        </div>
    </div>
</div>

<jsp:include page="/gov/footer.jsp" />
</body>

</html>
