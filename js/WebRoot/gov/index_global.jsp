<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<div class="news-service news-pr">
   	<div class="news-title"><h2>公众服务</h2><a href="${basePath }/gov/index">More</a></div>
   	<ul style="height:150px;">
    <c:if test="${not empty globalPage and not empty globalPage.content and fn:length(globalPage.content) > 0 }">
    	<c:forEach items="${globalPage.content }" var="article">
		    <li><a href="${basePath }/gov/article/detail?s=${article.articleNo}" style="word-break: break-all;">${article.articleTitle }</a></li>
    	</c:forEach>
    </c:if>
   	</ul>
</div>