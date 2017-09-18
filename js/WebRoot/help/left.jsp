<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<div class="help-left" >
	<ul id="help_h">
    	<li data-nav="help"><a href="${basePath}/help/help.jsp" class="current">帮助中心</a></li>
        <%--<li data-nav="a"><a href="javascript:void(0);">关于平台数据</a></li>--%>
        <li data-nav="help_score"><a href="${basePath}/help/help_score.jsp">关于信用评分</a></li>
        <li data-nav="help_light"><a href="${basePath}/help/help_light.jsp">关于信用灯塔</a></li>
<%--        <li data-nav="b"><a href="javascript:void(0);">在线咨询</a></li>
        <li data-nav="c"><a href="javascript:void(0);">关于品牌保护</a></li>
        <li data-nav="d"><a href="javascript:void(0);">关于放心预付</a></li>--%>
        <li data-nav="help_privacy"><a href="${basePath}/help/help_privacy.jsp">隐私协议</a></li>
        <li data-nav="help_service"><a href="${basePath}/help/help_service.jsp">服务条款</a></li>
    </ul>
</div>