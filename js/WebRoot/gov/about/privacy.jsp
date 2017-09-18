<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${basePath}/"/>
    <title>隐私保护-之江信用</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
    <meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
    <link href="${basePath }/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath}/gov/js/gov_about.js" src="${basePath}/gov/js/lib/require.js"></script>
</head>

<body data-attr="about">
<jsp:include page="/gov/gov_top.jsp"/>
<!--end banner-->
<div class="container-group">
    <div class="content content-group" user_left="1">
        <jsp:include page="/gov/about/left.jsp"/>
        <div class="list-right">
            <div class="answer-one privacy privacy-again">
                <br/>
                <p>
                    本网站采用cookies和其他技术来增强您的在线体验、了解您使用本站服务的习惯，以改善我们的服务质量。当您访问我们网站或使用我们的某些产品时，本站服务器会自动记录信息，包括URL、IP地址、浏览器的类型和使用的语言以及访问日期和时间。</p>
                <br/>
                <p>用户在注册、认领企业或提交异议、投诉时，需要提供部分个人信息。对于这些信息，本网站将安全妥善的予以保存，并对相关信息进行保密技术处理；未经用户许可，绝不会对外公开或向第三方泄漏。</p>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/gov/footer.jsp"/>
</body>
</html>
