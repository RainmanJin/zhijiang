<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<div class="ds-tab">
    <ul class="ds-tab-left" id="e_business_nav">
        <a href="${basePath}/gov/user/ec/operate">
            <li data-nav="operate">经营状况</li>
        </a>
        <a href="${basePath}/gov/user/ec/supervise">
            <li data-nav="supervise">监管分析</li>
        </a>
        <a href="${basePath}/gov/user/ec/credit">
            <li data-nav="credit|shop">信用排名</li>
        </a>
    </ul>
<!--     <div class="ds-tab-right">
        <input name="" type="text" placeholder="搜索"/>
    </div> -->
</div>
