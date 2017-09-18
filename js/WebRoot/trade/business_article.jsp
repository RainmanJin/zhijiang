<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/path.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>之江观点-之江信用</title>
<base href="${basePath }/" />
<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
<script data-main="${basePath }/js/uzj/business_score.js"
	src="${basePath }/js/lib/require.js"></script>
</head>
<body class="bg119">
	<jsp:include page="/user/top.jsp" />
	<c:if test="${article!=null}">
	<div class="main119">
		<h2>${article.articleTitle}</h2>
		<h3>
			<c:if test="${! empty article.articleTags}">
				<c:forEach items="${fn:split(article.articleTags,' ')}" var="vt" varStatus="status">
					<c:if test="${vt!=''}">
					<c:if test="${status.index%2!=0}">
						<span class="sar01">${vt}</span>
					</c:if>
					<c:if test="${status.index%2==0}">
						<span class="sar02">${vt}</span>
					</c:if>

					</c:if>
				</c:forEach>
			</c:if>

			<i>发布时间：<em><fmt:formatDate value="${article.articleShowtime}" pattern="yyyy-MM-dd" /></em></i><i>来源：<em>${article.articleSource}</em></i>
		</h3>
		<div class="art120">
			<div class="art120_left">
				${article.articleContent}
				<h4>本文版权归之江信用所有,转载请注明出处：http://zhijiangxy.com/trade/zone/article?id=${article.articleId}</h4>
			</div>
			<div class="art120_right">
				<a href="${basePath}/trade/business_contributions.jsp"><img id="to_contributions" src="${basePath}/images/trade-images/vottp.jpg"></a>
				<div class="artEwm">
					<img src="${basePath}/images/trade-images/ewmtp.jpg">
					<p>更多精彩内容请关注公众号</p>
				</div>
			</div>

		</div>
	</div>

	</c:if>
	<c:if test="${article==null}">
		<div class="main119">
			暂无数据
		</div>
	</c:if>
	<jsp:include page="/footer.jsp" />
</body>
</html>