<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/path.jsp" %>
<div class="topList topList_tf" id="sReadme" style="display: none">
    <div class="topList_span">
        <span data-target="#readme1">企业自述</span>
        <span data-target="#readme2">产品服务</span>
        <span data-target="#readme3">发展历程</span>
        <span data-target="#readme4">企业荣誉</span>
    </div>
</div>

<div class="topList topList_tf" id="sOperationState" style="display: none">
    <div class="topList_span">
    <span  data-target="#annual_inspectDiv" class="current">年报信息 <em id="annual_inspect_count_num">${empty businessAnnualInspectPage ? '' : businessAnnualInspectPage.total==0?'':businessAnnualInspectPage.total}</em></span>
    <span  data-target="#taxStateDiv" >纳税状态</span>
    <span  data-target="#water_electric_gas_fund" >水、电、燃气、公积金缴费趋势</span>
    <span  data-target="#tax_div">税务信息 <em id="taxCount"></em></span>
    <span  data-target="#qc_basic_div">质监信息</span>
    <span  data-target="#customs_basic_div">海关信息</span>
    <span  data-target="#Corporate_standard_info">企业标准情况信息</span>
    <span  data-target="#ecshopDiv">电商趋势</span>
    <span  data-target="#manageCredit">网站经营状况 <em id="domainCountEm"></em></span>
    <span  data-target="#adminPunish_div">工商部门监管信息 <em id="adminPunishCountEm">${empty adminPunishPage ? '' : adminPunishPage.total==0?'':adminPunishPage.total}</em></span>
    <span  data-target="#credit_enterpriseInfos_div">依法统计信用企业信息 <em id="credit_enterpriseInfosCountEm">${empty credItenterpriseInfoPage ? '' : credItenterpriseInfoPage.total==0?'':credItenterpriseInfoPage.total}</em></span>
    <span  data-target="#corp_prod_awards_div">奖励等良好行为记录 <em id="corp_prod_awardsCountEm">${empty corpProdAwardPage ? '' : corpProdAwardPage.total==0?'':corpProdAwardPage.total}</em></span>
    </div>
</div>


<div class="topList topList_tf" id="sJudicialProceedings" style="display: none">
    <div class="topList_span">
        <span data-target="#corpProdPenalty_div">违法/行政处罚    <small>${empty corpProdPenaltyPage ? 0 : corpProdPenaltyPage.total }</small></span>
    <span data-target="#enterPrisePenalty_div">国税部门监管信息</span>
        <span data-target="#courtDoc_div">诉讼记录 <small>${empty courtDocPage ? 0 : courtDocPage.total}</small></span>
        <span data-target="#uncre_div">失信被执行 <small>${empty uncrePage ? 0 : uncrePage.total }</small></span>
        <span data-target="#exe_div">涉诉被执行 <small>${empty exePage ? 0 : exePage.total }</small></span>
    <span data-target="#dataRentTax_div">稽查信息 <%--<small id="searchbadge_dataRentTax" style="font-size:14px;margin-left:3px;" data-content="">0</small>--%></span>
    <span data-target="#rentNoPayTax_div">欠税信息<small id="searchbadge_rentNoPayTax" style="font-size:14px;margin-left:3px;" data-content="">0</small></span>
        <span data-target="#courtNotCarry_div">未履行生效裁判信息 <small>${empty courtNotCarryOutPage ? 0 : courtNotCarryOutPage.total}</small></span>
    <span data-target="#corpProdIspcheck_div">产品质量监督抽查不合格记录信息<small id="searchbadge_corpProdIspcheck" style="font-size:14px;margin-left:3px;" data-content="">0</small></span>
    <span data-target="#environmentIllegalCorp_div">环境违法信息 <small id="searchbadge_environmentIllegalCorp" style="font-size:14px;margin-left:3px;" data-content="">0</small></span>
    <span data-target="#identification_div">企业非正常户认定信息  <small id="searchbadge_identification" style="font-size:14px;margin-left:3px;" data-content="">0</small></span>
        <span data-target="#courtAnno_div">开庭公告 <small>${empty courtAnnoPage ? 0 :courtAnnoPage.total }</small></span>
    </div>
</div>

<div class="topList topList_tf" name="tab-menu-detail-knowledge" id="sKnowledge" style="display: none;">
    <div class="topList_span">
    <span  data-target="#tminfo_div" class="current">商标<small style="font-size:14px;margin-left:3px;" data-content="">${empty tmInfoPage ? 0 : tmInfoPage.total}</small></span>
    <span  data-target="#patentpage_div">专利 <small style="font-size:14px;margin-left:3px;" data-content="">${empty patentpage ? 0 : patentpage.total==0?0:patentpage.total}</small></span>
    <span  data-target="#patentpage_div">行政许可资质 <small style="font-size:14px;margin-left:3px;" data-content="">${empty honorpage ? 0 : honorpage.total==0?0:honorpage.total}</small></span>
    <span  data-target="#company_honor">企业荣誉 <small style="font-size:14px;margin-left:3px;" data-content="">0</small></span>
    <span  data-target="#software_div">软件著作权<small style="font-size:14px;margin-left:3px;" data-content="">${empty softwarepage ? 0 : softwarepage.total==0?0:softwarepage.total}</small></span>
    <span  data-target="#bookpage_div">作品著作权 <small style="font-size:14px;margin-left:3px;" data-content="">${empty bookpage ? 0 : bookpage.total==0?0:bookpage.total}</small></span>
    <span  data-target="#websites_div">域名<small style="font-size:14px;margin-left:3px;" data-content="">${empty uwcWebsites ? 0 : fn:length(uwcWebsites)==0?0: fn:length(uwcWebsites)}</small></span>
</div>
</div>