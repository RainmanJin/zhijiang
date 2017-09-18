<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <base href="${basePath}/"/>
    <title>信用动态-之江信用</title>
    <link href="${basePath }/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath}/gov/js/article.js" src="${basePath}/gov/js/lib/require.js"></script>

</head>
<body class="container" id="body" data-attr="news">
<jsp:include page="article_header.jsp"/>
<div class="layout main">
    <div class="main-left-g">
        <div class="main-report">
            <div class="report-title">
                <h2>${article.articleTitle }</h2>
                <h3>发布时间：<fmt:formatDate value="${article.articleShowtime }" pattern="yyyy年MM月dd日"/>
                    <span>来源：${article.articleSource }</span></h3>
            </div>
            <div class="article">
                <div class="article-list">
                    ${article.articleContent }
                </div>
            </div>
        </div>
    </div>
    <!--end main-left-->
    <jsp:include page="/gov/topvisited/list"/>
</div>
<jsp:include page="/gov/footer.jsp"/>
</body>
</html>