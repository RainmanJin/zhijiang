<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<link href="${basePath}/style/new/gov_monitor_style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/gov/js/monitor/ec_industry_digest.js" src="${basePath }/gov/js/lib/require.js"></script>

</head>

<body class="gov_bg" data-attr1="clueIndex" data-attr="clue">
<jsp:include page="monitor_top.jsp"/>
<jsp:include page="monitor_left.jsp"/>
<div class="govMain govMain_new">
    <div class="govList">
        <div class="govList_main_tit">
            <div class="gov_width gov_width3"></div>
            <div class="govList_h3">电商行业概况</div>
        </div>
        <div class="govList_gk">
            <div class="gov_width gov_width3"></div>
            <div class="govList_gk_list govList_gk_list1">
                <div class="govList_eleft"><img src="${basePath}/images/gov-images/zs_Geg01.png"></div>
                <div class="govList_eright govList_eright01">
                    <h4 class="gk_h4">活跃电商企业总数（家）</h4>
                    <p class="gk_p" id="shopTotalNum">40234</p>
                </div>
            </div>
            <div class="gov_width gov_width3"></div>
            <div class="govList_gk_list govList_gk_list2">
                <div class="govList_eleft"><img src="${basePath}/images/gov-images/zs_Geg02.png"></div>
                <div class="govList_eright govList_eright01">
                    <h4 class="gk_h4" >本月新增电商企业（家）</h4>
                    <p class="gk_p" id="shopNew">48</p>
                </div>
            </div>
            <div class="gov_width gov_width3"></div>
            <div class="govList_gk_list govList_gk_list3">
                <div class="govList_eleft"><img src="${basePath}/images/gov-images/zs_Geg03.png"></div>
                <div class="govList_eright govList_eright01">
                    <h4 class="gk_h4">本月歇业电商企业（家）</h4>
                    <p class="gk_p" id="shopClosed">0</p>
                </div>
            </div>
        </div>
        <div class="govList_gk">
            <div class="gov_width gov_width3"></div>
            <div class="govList_tb1213">
                <div class="tb1213_p1">
                    <p>电商企业近半年趋势</p>
                </div>
                <div class="">
                    <div class="tb1213_main">
                        <%--<img src="${basePath}/images/gov-images/zs_Geg04.png">--%>
                        <div id="siteShopStatHalfYear" style="width:auto;height:400px;"></div>
                    </div>
                </div>
            </div>
            <div class="gov_width gov_width3"></div>
        </div>
    </div>
</div>
<%--<jsp:include page="/gov/footer.jsp" />--%>

</body>

</html>
