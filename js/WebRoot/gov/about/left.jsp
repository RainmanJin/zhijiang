<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<div class="list-group" id="gov_about_us" style="text-align:center;">
	<ul>
		<li data-nav="about_us"><a href="${basePath }/gov/about/about_us.jsp">关于我们</a></li>
		
		<%--<li><a href="${basePath }/about/contact_us.jsp">联系我们</a></li>--%>
		
		<li data-nav="privacy"><a href="${basePath }/gov/about/privacy.jsp">隐私保护</a></li>
		
		<%--<li><a href="${basePath }/about/help.jsp">帮助中心</a></li>--%>
		
		<li><a href="${basePath }/about/report.jsp">举报中心</a></li>
		
		<%--<li><a href="${basePath }/about/model.jsp">信用模型</a></li>--%>

		<li><a href="${basePath }/about/advise.jsp">意见反馈</a></li>
		
	</ul>
</div>