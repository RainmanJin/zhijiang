<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <base href="${basePath}/"/>
    <title>之江信用</title>
    <link href="${basePath }/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/jquery.circliful.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath}/gov/js/ec/operate.js" src="${basePath}/gov/js/lib/require.js"></script>
</head>

<body class="container" id="body" data-attr="operate" data-attr-child="operate" style="background:#d7d7d7;">
<jsp:include page="/gov/gov_top.jsp"/>
<div class="layout">
    <jsp:include page="nav.jsp"/>
    <div class="content" id="operation_boss">
        <div class="protect">
            <div class="protect-ope">
                <div class="ope-padding">
                    <p class="ope-padding-p">浙江省<label id="dateBetween"></label>电商行业经营概况</p>
                    <div class="ope-padding-tp">
                        <div id="graphChart" style="width: 100%;height:180px;"></div>
                        <div style="position:relative; color:#fff;">
                            <div style=" position:absolute; margin-top:-8%; margin-left:-8%;">畅销行业占比</div>
                            <div style=" position:absolute; margin-top:-15%; margin-left:18%;">交易额<span
                                    style="font-size:13px;">/亿元</span></div>
                            <div style=" position:absolute; margin-top:-8%; margin-left:45%;">店铺数量<span
                                    style="font-size:13px;">/家</span></div>
                            <div style=" position:absolute; margin-top:-4%; margin-left:84%;">独立电商数<span
                                    style="font-size:13px;">/家</span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ope-title">
                <ul id="operate_three">
                    <li data-nav="operate1" class="current">区域分布</li>
                    <li data-nav="operate2">行业概况</li>
                    <li data-nav="operate3">B店注册情况</li>
                </ul>
                <p><span>时间：</span>截止至<label id="endDate"></label></p>
            </div>
        </div>
        <!--本省B店、C店区域分布情况  -->
        <jsp:include page="/gov/ec/operate/area_dist.jsp"/>
        <!--浙江省B店、C店交易额对比  -->
        <jsp:include page="/gov/ec/operate/amount_compare.jsp"/>
        <!--浙江省独立电商分布解读  -->
        <jsp:include page="/gov/ec/operate/ind_ec_dist.jsp"/>
        <!--行业概况  -->
        <jsp:include page="/gov/ec/operate/industry_overview.jsp"/>
        <!--B店注册情况  -->
        <jsp:include page="/gov/ec/operate/b_shop_reg.jsp"/>

    </div>

</div>
<jsp:include page="/gov/footer.jsp"/>
</body>
</html>