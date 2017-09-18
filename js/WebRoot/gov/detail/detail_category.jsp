<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<%--
<div class="layout companyNav" id="detail_category_div">
     <a href="javascript:;" data-mark="#comment_info_div,#registInfo,#safetyPermit,#safetyOrg,#dischargeLicense,#adminLicense" class="current"><span>基本信息</span></a>
     <a href="javascript:;" data-mark="#operationState,#ecshopDiv,#manageCredit,#adminPunishInfo"><span>经营状况<em id="operationCount">0</em></span></a>
     <a href="javascript:;" data-mark="#corpProdPenalty"><span>风险信息<em id="corpProdCount">${empty bookpage ? 0 : bookpage.total}</em></span></a>
     <a href="javascript:;" data-mark="#knowledgeInfo,#patentpage_div,#honorInfo,#company_honor,#software_div,#bookpage_div,#websites_div"><span>知识产权<em id="knowledgeCount">${empty bookpage ? 0 : bookpage.total}</em></span></a>
     <a href="javascript:;" data-mark="#outInvestInfo"><span>对外投资<em>${empty outinvestPage ? 0 : outinvestPage.total}</em></span></a>
     <a href="javascript:;" data-mark="#mediaReportInfo"><span>媒体报道<em>${empty mediaNum ? 0 : mediaNum}</em></span></a>
     <a href="javascript:;" data-mark="#commentInfo"><span>累计评论<em id="commentTotal">0</em></span></a>
</div>
--%>


<div class="topList topList_tt" >
     <div class="topList_ul" id="detail_category_div">
          <ul>
               <li data-mark="#companyReadme,#sReadme">企业自述</li>
               <li data-mark="#comment_info_div,#registInfo,#safetyPermit,#safetyOrg,#dischargeLicense,#adminLicense" class="current" >基本信息</li>
               <li id="operationTab" data-mark="#operationState,#ecshopDiv,#manageCredit,#adminPunishInfo,#sOperationState,#credit_enterpriseInfos_div,#corp_prod_awards_div,#credit_and_awards">经营状况<span id="operationCount">0</span></li>
               <li id="riskTab" data-mark="#corpProdPenalty,#sJudicialProceedings">风险信息<span id="corpProdCount">${empty bookpage ? 0 : bookpage.total}</span></li>
               <li id="knowledgeTab" data-mark="#knowledgeInfo,#patentpage_div,#honorInfo,#company_honor,#software_div,#bookpage_div,#websites_div,#sKnowledge" style="width: 137px;">知识产权<span id="knowledgeCount">${empty bookpage ? 0 : bookpage.total}</span></li>
               <li id="investTab" data-mark="#outInvestInfo" >对外投资<span>${empty outinvestPage ? 0 : outinvestPage.total}</span></li>
               <li id="mediaReportTab" data-mark="#mediaReportInfo">媒体报道<span id="mediaCountTab">0</span></li>
               <!-- <li data-mark="#commentInfo" style="border-right:0;width: 140px;">累计评论<span id="commentTotal">0</span></li> -->
          </ul>
     </div>
</div>