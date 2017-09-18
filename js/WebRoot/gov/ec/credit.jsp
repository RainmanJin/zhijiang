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
    <script data-main="${basePath}/gov/js/ec/credit.js" src="${basePath}/gov/js/lib/require.js"></script>

</head>

<body class="container" id="body" data-attr-child="credit" data-attr="operate" style="background:#d7d7d7;">
<jsp:include page="/gov/gov_top.jsp"/>
<div class="layout">
    <jsp:include page="nav.jsp"/>
    <div class="content" id="operation_boss">
        <div class="protect" style="padding-top: 20px">
            <div class="industry">
                <div class="industry-tit-p"><p>时间：<label id="statDateLabel">2016年10月</label></p></div>
                <div class="industry-tit" id="industryRank">
                    <div class="industry-tit-list" style="display:none" model>
                        <h4 >{0}行业（B店热门）信用平均指数</h4>
                        <p><span>{1}</span><b class="{2}">{3}%</b><b class="industry-tit-c2">环比</b></p>
                    </div>
                </div>
                <div class="industry-rank">
                    <div class="industry-rank-half">
                        <p>行业信用排行</p>
                        <div class="industry-rank-tp">
                            <div id="rankingBar1" style="width: auto;height:400px;"></div>

                        </div>
                    </div>
                    <div class="industry-rank-half">
                        <p>行业信用环比涨幅排行</p>
                        <div class="industry-rank-tp">
                            <div id="rankingBar2" style="width: auto;height:400px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="protect" style="padding-top: 20px">
            <div class="industry">
                <div class="industry-zs">本省网店行业信用指数<a href="${basePath}/gov/user/ebusiness/monitor/shop/list">更多</a>
                </div>
                <div class="industry-area">
                    <div id="areaChoose" class="s-category s-category-bottom">
                        <div class="sl-key" style=" width:5%">
                            <span>地区</span>
                        </div>
                        <div class="sl-value" id="credit_value" style="width:88%;">
                            <a code="0" class="current" data-city="全部" href="javascript:void(0)">全部</a>
                            <a code="4003001" data-city="杭州" href="javascript:void(0)">杭州市</a>
                            <a code="4003003" data-city="温州" href="javascript:void(0)">温州市</a>
                            <a code="4003002" data-city="宁波" href="javascript:void(0)">宁波市</a>
                            <a code="4003007" data-city="金华" href="javascript:void(0)">金华市</a>
                            <a code="4003010" data-city="台州" href="javascript:void(0)">台州市</a>
                            <a code="4003004" data-city="嘉兴" href="javascript:void(0)">嘉兴市</a>
                            <a code="4003006" data-city="绍兴" href="javascript:void(0)">绍兴市</a>
                            <a code="4003005" data-city="湖州" href="javascript:void(0)">湖州市</a>
                            <a code="4003011" data-city="丽水" href="javascript:void(0)">丽水市</a>
                            <a code="4003008" data-city="衢州" href="javascript:void(0)">衢州市</a>
                            <a code="4003009" data-city="舟山" href="javascript:void(0)">舟山市</a>
                        </div>
                    </div>
                </div>
                <div class="industry-creid">
                    <div class="industry-trand">
                        <p>信用指数趋势图<span id="credit_index_time">时间：2016-05至2016-10</span></p>
                        <div class="industry-trand-tp">
                            <div id="lineChart" style="width: auto;height: 350px;"></div>
                        </div>
                    </div>
                    <div class="industry-db">
                        <div class="industry-db-tit">
                            <h4>选择行业对比</h4>
                            <p>（所选类型不可超过五个）</p>
                        </div>
                        <div class="industry-choose" id="credit_check">
                            <p><input name="creditCheck" checked="checked" type="checkbox" value="17"/><span>男装</span></p>
                            <p><input name="creditCheck" checked="checked" type="checkbox" value="1"/><span>女装</span></p>
                            <p><input name="creditCheck" type="checkbox" value="4"/><span>家居生活</span></p>
                            <p><input name="creditCheck" type="checkbox" value="16"/><span>图书音像</span></p>
                            <p><input name="creditCheck" type="checkbox" value="11"/><span>鞋包配饰</span></p>
                            <p><input name="creditCheck" type="checkbox" value="14"/><span>零食特产</span></p>
                            <p><input name="creditCheck" type="checkbox" value="13"/><span>户外运动</span></p>
                            <p><input name="creditCheck" type="checkbox" value="8"/><span>美妆护理</span></p>
                            <p><input name="creditCheck" type="checkbox" value="6"/><span>手机数码</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
<jsp:include page="/gov/footer.jsp"/>
</body>

</html>