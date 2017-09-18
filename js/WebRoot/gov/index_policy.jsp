<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<div class="news-service news-pl">
   	<div class="news-title"><h2>法规政策</h2><a href="${basePath }/gov/policy/list">More</a></div>
   	<ul style="height:150px;">
    <c:if test="${not empty policyPage and not empty policyPage.content and fn:length(policyPage.content) > 0 }">
    	<c:forEach items="${policyPage.content }" var="article">
		    <li><a href="${basePath }/gov/article/detail?s=${article.articleNo}" style="word-break: break-all;">${article.articleTitle }</a></li>
    	</c:forEach>
    </c:if>
   	</ul>
</div>