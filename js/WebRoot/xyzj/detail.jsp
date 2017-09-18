<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<head>
    <title>浙江信用</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${basePath}/xyzj/style/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath}/xyzj/js/detail.js" src="${basePath }/xyzj/js/lib/require.js"></script>
</head>
<body>
<jsp:include page="head.jsp"/>
<jsp:include page="top.jsp"/>
<jsp:include page="credit_score.jsp"/>
<div class="layout layout-over">
<%--    <div class="m-left score">
        <!-- 标签导航 -->
        <jsp:include page="detail_nav.jsp"/>
        <!-- 基本信息 -->
        <jsp:include page="base_info.jsp"/>
        <!-- 提示信息-->
        <jsp:include page="tip.jsp"/>
        <!-- 荣誉信息-->
        <jsp:include page="honer.jsp"/>
        <!-- 失信信息-->
        <jsp:include page="warning.jsp"/>
        <!-- 变更记录-->
        <jsp:include page="change.jsp"/>
    </div>--%>
    <div class="m-left score">
        <iframe id="iframe1" name="iframe1" style="width:100%;height:1000px;" frameborder="0" src="http://xyxx.zjzwfw.gov.cn/xyzjweb/corporation/e2Detail.do?id=${bizCompany.companyName}" ></iframe>
    </div>
    <div class="m-right">
        <jsp:include page="detail_right.jsp"/>
    </div>
</div>
<div class="footer">
    <p>主办单位：浙江省信用中心     浙ICP备05004681号 </p>
</div>

</body>
<script>
    var DetailCfg = DetailCfg || {
            bizCompanyId: '${bizCompany.companyId}',
            bizCompanyName: '${bizCompany.companyName}',
            companyNameDigest: '${bizCompany.companyNameDigest}',
            total:'${changepage.total}',
            categoryScores:'${categoryScores}',
            dataItemScores:'${dataItemScores}'
        };

</script>