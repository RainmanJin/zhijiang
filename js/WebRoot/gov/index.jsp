<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>之江信用</title>
    <base href="${basePath}/"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/gov/js/lib/bootstrap3/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/gov_style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css" />

<script data-main="${basePath }/gov/js/index.js" src="${basePath }/gov/js/lib/require.js"></script>
</head>

<body id="body" data-attr="index">

	<jsp:include page="/gov/gov_top.jsp" />
    <div class="layout">
        <div class="index-input gov-banner">
            <ul>
                <li class="current" tab="all" tip="可以按企业名称、注册号、法人、股东、高管、品牌查询">全部</li>
                <li tab="companyName" tip="按企业名称查询">企业名</li>
                <li tab="legalPerson,partnerStockName" tip="按法人、股东查询">股东法人</li>
                <li tab="employeeName" tip="按董高监查询">董高监</li>
                <li tab="companyAddress" tip="按地址查询">地址</li>
                <li tab="businessScope" tip="按经营范围查询">经营范围</li>
                <li tab="trademark" tip="按品牌/产品查询">品牌/产品</li>
            </ul>
            <form method="get" id="searchForm" action="${basePath}/gov/search"><!--可以按企业名称、注册号、法人、股东、高管、品牌查询  -->
                <input class="" name="key" type="text" id="searchKey" placeholder="可以按企业名称、注册号、法人、股东、高管、品牌查询" />
                <input type="hidden"  name="searchType" id="searchType" value="all"/>
                <button id="btn-search" class="submitBtn" type="submit">搜索</button>
            </form>
        </div>
    </div>
    <!--end banner-->
    <div class="layout gov-main">
        <div class="gov-left">
            <div class="gov-adv">
          <%--      <div class="gov-adv1">
                    <a href="#">
                        <img src="../images/gov-images/adv-tab.jpg">
                    </a>
                </div>--%>

              <div id="carousel-example-generic" class="carousel slide">
                  <ol class="carousel-indicators">
<c:forEach items="${carouselList}" var="carousel"  varStatus="status">
                      <li data-target="#carousel-example-generic" data-slide-to="${status.index}" class="<c:if test="${status.index==0}">active</c:if>"></li>
    </c:forEach>
                  </ol>
                  <div class="carousel-inner">
<c:forEach items="${carouselList}" var="carousel"  varStatus="status">
                      <div style="height: 388px" class="item <c:if test="${status.index==0}">active</c:if>">
                          <a target="_blank" href="${carousel.jumpUrl}"><img   style="width:100%;height: 100%;" src="${basePath}/${carousel.carouselImg}"/></a>
                          <div class="carousel-caption">
                              <h3>${carousel.name}</h3>
                              <%--<p>${carousel.name}</p>--%>
                          </div>
                      </div>
</c:forEach>
                  </div>
                  <a class="left carousel-control" style="float:none;width: 15%;" href="#carousel-example-generic" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left"></span>
                  </a>
                  <a class="right carousel-control" style="width: 15%;" href="#carousel-example-generic" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right"></span>
                  </a>
              </div>







            </div>
            <!--end gov-adv-->
            <div class="gov-dynamics">
                <h2 class="gov-tit" style="margin-left: 23px;">信用动态</h2>
                <c:set var="defaultImgUrl" value="images/gov-images/loading.png"></c:set>
                <c:forEach items="${newsList}" var="news">
                    <div class="dynamics-list">
                        <a target="_blank" style="color:#444" href="${basePath }/gov/article/detail?s=${news.articleNo}">
                        <div class="dynamics-left">
                            <img src="${basePath}${(empty news.articleImg || news.articleImg == '') ? defaultImgUrl : news.articleImg }">
                        </div>
                        <div class="dynamics-right">
                            <h3>${news.articleTitle}</h3>
                            <p>${fn:substring(news.articleIntro,0,90)}..</p>
                            <h4><fmt:formatDate value="${news.articleShowtime}" pattern="yyyy-MM-dd" /></h4>
                        </div>
                        </a>
                    </div>
                </c:forEach>
                <div class="gov-btn gov-btn1">
                    <a href="${basePath}/gov/news/list" target="_blank">查看全部</a>
                </div>
            </div>
        </div>
        <!--end gov-left-->
        <div class="gov-right">
            <div class="gov-public">
                <h2 class="gov-tit">名单公示</h2>
                <ul class="ul-public" id="publicTab">
                    <li class="current" tab="keepList">红榜</li>
                    <li tab="breakList">黑榜</li>
                </ul>
                <div id="keepList">
                    <c:forEach items="${keepList}" var="keep">
                        <h3 class="h3-public">
                            <a target="_blank" href="${basePath}/gov/company/professionalInfo?n=${keep.companyNameDigest}">${keep.companyName}</a><em><fmt:formatDate value="${keep.createTime}" pattern="yyyy-MM-dd" />添加</em>
                        </h3>
                    </c:forEach>

                </div>
                <div id="breakList" style="display: none">
                    <c:forEach items="${breakList}" var="breakPublic">
                        <h3 class="h3-public">
                            <a target="_blank" href="${basePath}/gov/company/professionalInfo?n=${breakPublic.companyNameDigest}">${breakPublic.companyName}</a><em><fmt:formatDate value="${breakPublic.createTime}" pattern="yyyy-MM-dd" />添加</em>
                        </h3>
                    </c:forEach>

                </div>
                <div class="gov-btn gov-btn2">
                    <a href="${basePath}/gov/publicity" target="_blank">查看全部</a>
                </div>
            </div>
            <div class="gov-public">
                <h2 class="gov-tit">政策法规</h2>
                <c:forEach items="${policyList}" var="policy">
                    <div class="gov-policy">
                        <h3><i></i><a target="_blank" style="color:#444" href="${basePath }/gov/article/detail?s=${policy.articleNo}"><em>${policy.articleTitle}</em></a></h3>
                        <h4><fmt:formatDate value="${policy.articleShowtime}" pattern="yyyy-MM-dd" /></h4>
                    </div>
                </c:forEach>
                <div class="gov-btn gov-btn2">
                    <a href="${basePath}/gov/policy/list" target="_blank">查看全部</a>
                </div>
            </div>
        </div>
        <!--end gov-right-->
    </div>
	<jsp:include page="/gov/footer.jsp" />

	</body>
</html>
