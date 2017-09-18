
<%@ page language="java" pageEncoding="UTF-8" %>

<div class="gov_nav" id="leftNav">
    <ul>
        <li class="gov_li gov_li05" data-nav="monitor/list|company/monitor/detail/list" href="${basePath}/gov/user/monitor/list">企业监测<em></em></li>
       <%-- <li class="gov_li gov_li06" data-nav="company/monitor/prepare" href="${basePath}/gov/user/company/monitor/prepare/list">企业名单编辑<em></em></li>--%>
        <li data-nav="overview" class="gov_li gov_li01" href="${basePath}/gov/user/monitor/overview/list">企业信用概况<em></em></li>
        <%--<li class="gov_li gov_li04" data-nav="credit" href="${basePath}/gov/user/monitor/credit/list">企业信用概况<em></em></li>--%>
        <li data-nav="stat" class="gov_li gov_li03" href="${basePath}/gov/user/company/monitor/stat">电商行业概况<em></em></li>
        <li data-nav="corporate/list|clue/auth|clue/detail|case/detail|case/audit" class="gov_li gov_li02" href="${basePath}/gov/user/corporate/list">监管成效<em></em></li>

        <li class="gov_li gov_li05" data-nav="owner/list" href="${basePath}/gov/user/owner/list">认领趋势<em></em></li>
    </ul>
</div>


