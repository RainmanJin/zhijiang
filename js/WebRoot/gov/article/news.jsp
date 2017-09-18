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

<body class="container" id="body" data-attr="news" data-attr1="news">
<jsp:include page="article_header.jsp"/>
<div class="layout main" data-attr="news">
    <div class="main-left-g">
        <div class="main-report">
            <div class="policy-title"><h2>信用动态</h2></div>
            <c:if test="${not empty stickieList }">
                <div class="policy-box">
                    <c:forEach items="${stickieList }" var="article" varStatus="i">
                        <div class="policy-one ${i.index==0?'policy-pr':'' }">
                            <c:set var="defaultImgUrl" value="images/gov-images/loading.png"></c:set>
                            <img src="${basePath }/${(empty article.articleImg || article.articleImg == '') ? defaultImgUrl : article.articleImg }"
                                 alt="${article.articleTitle}"/>
                            <h3><a href="${basePath }/gov/article/detail?s=${article.articleNo}"
                                   style="word-break: break-all;">${article.articleTitle }</a></h3>
                            <h4>${article.articleIntro }</h4>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${!(empty page.content) }">
                <div id="articleList" >

                    <div class="policy-infor" model style="display: none;">
                        <h3><a href="${basePath }/gov/article/detail?s={0}">{1}</a></h3>
                        <h4>{2}</h4>
                        <h5>{3}</h5>
                    </div>

                    <c:forEach items="${page.content}" var="article" varStatus="i">
                        <div class="policy-infor" tag_attr="now_data">
                            <h3>
                                <a href="${basePath }/gov/article/detail?s=${article.articleNo}">${article.articleTitle }</a>
                            </h3>
                            <h4>${article.articleIntro }</h4>
                            <h5><fmt:formatDate value="${article.articleShowtime }" pattern="yyyy年MM月dd日"/></h5>
                        </div>
                    </c:forEach>
                </div>
                <div class="s-page" config='{name: "news", url:"${basePath }/gov/news/list?total=${param.total}", nodata:"#nodataNews", npage:${empty param.npage ? '1' : param.npage}, spage:${page.totalPages }, total:${page.total }, pin:2, isAjax:false, autoLoad:false}'></div>
            </c:if>

        </div>
    </div>
    <!--end main-left-->
    <jsp:include page="/gov/topvisited/list"/>

</div>
<jsp:include page="/gov/footer.jsp"/>
</body>
</html>