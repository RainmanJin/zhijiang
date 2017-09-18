<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

		<div class="main-right-g">
            <div class="mod-search mod-padding">
                <h3>信用信息查询</h3>
                <div class="mod-search-inupt">
                	<form action="${basePath }/search" method="get" id="search">
	                    <input name="key" type="text" class="search-i">
	                    <input name="searchType" value="all" type="hidden"/>
	                    <input name="" type="submit" class="search-b" value="查询">
                    </form>
                </div>
            </div>
            <c:if test="${not empty topList and fn:length(topList) > 0 }">
            <div class="mod-search mod-care">
                <h3>大家关注</h3>
                <c:forEach items="${topList }" var="article" varStatus="i">
                	<div class="mod-line">
	                    <p><a href="${basePath }/gov/article/detail?s=${article.articleNo}">${article.articleTitle }</a></p>
	                </div>
                </c:forEach>
            </div>
            </c:if>
        </div>
        <!--end main-right-->
       <%-- <script>
        	$("#search").submit(function (){
        		var keyObj = $(this).find("[name='key']");
        		keyObj.val($.trim(keyObj.val()));
        		if(keyObj.val() == ""){
        			return false;
        		}
        		return true;
        	});
        </script>--%>