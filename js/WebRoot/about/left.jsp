<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<%-- <div class="list-group" id="nav_about_us" style="text-align:center;">
	<ul>
		<li data-nav="about_us"><a href="${basePath }/about/about_us.jsp">关于我们</a></li>
		
		<li><a href="${basePath }/about/contact_us.jsp">联系我们</a></li>
		
		<li data-nav="privacy"><a href="${basePath }/about/privacy.jsp">隐私保护</a></li>
		
		<li><a href="${basePath }/about/help.jsp">帮助中心</a></li>
		
		<li data-nav="report"><a href="${basePath }/about/report.jsp">举报中心</a></li>
		
		<li><a href="${basePath }/about/model.jsp">信用模型</a></li>

		<li data-nav="advise"><a href="${basePath }/about/advise.jsp">意见反馈</a></li>
		
	</ul>
</div> --%>

<div class="ab-left" id="nav_about_us"  style="text-align:center;">
	<ul>
		<a data-nav="about_us" class="ab-li1" href="${basePath }/about/about_us.jsp"><li >关于我们</li></a>
		<a data-nav="help" class="ab-li2" href="${basePath }/about/help.jsp"><li >帮助中心</li></a>
		<a data-nav="report" class="ab-li3" href="${basePath }/about/report.jsp"><li >失信举报</li></a>
		<a data-nav="privacy" class="ab-li4" href="${basePath }/about/privacy.jsp"><li >隐私协议</li></a>
		<a data-nav="terms_service" class="ab-li5" href="${basePath }/about/terms_service.jsp"><li >服务条款</li></a>
	</ul>
</div>
