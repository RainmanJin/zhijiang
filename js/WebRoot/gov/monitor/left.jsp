<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="left" >
  <ul class="left-menu" id="leftNav">
    <li class="left-jg" ><a data-nav="monitor/stat"  href="${basePath }/gov/user/company/monitor/stat">企业信用概况</a>
      <ul>
        <li><a data-nav="corporate|clue/" href="${basePath }/gov/user/corporate/list">初审线索</a></li>
        <li><a data-nav="case"  href="${basePath}/gov/user/case/list" >复审线索</a></li>
      </ul>
    </li>
<%--    <li class="left-bh"><a data-nav="circulate"  href="${basePath}/gov/user/company/monitor/circulate/list">流通企业监测</a>
    </li>

    <li class="left-jc" ><a data-nav="/prepay/card/list"  href="${basePath }/gov/user/company/monitor/prepay/card/list">预付卡企业监测</a>
      <ul>
        <li><a data-nav="card/user/list"  href="${basePath}/gov/user/company/monitor/prepay/card/user/list" >企业名单编辑</a></li>
      </ul>
    </li>--%>
    <li class="left-jc" ><a data-nav="company/monitor/list|company/monitor/detail" href="${basePath }/gov/user/company/monitor/list">企业监测</a>
      <ul>
        <li><a  data-nav="monitor/prepare/list" href="${basePath}/gov/user/company/monitor/prepare/list" >企业名单编辑</a></li>
      </ul>
    </li>
  </ul>
</div>