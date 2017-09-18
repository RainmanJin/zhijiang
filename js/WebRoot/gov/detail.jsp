<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${basePath}/"/>
    <title>${bizCompany.companyName }怎么样？工商信息查询-之江信用</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta name="renderer" content="webkit">
    <meta http-equiv="keywords"
          content="${bizCompany.companyName }工商信息查询,${bizCompany.companyName }信用查询,${bizCompany.companyName }地址电话,${bizCompany.companyName }怎么样"/>
    <c:if test="${not empty bizCompany.establishDate && not empty bizCompany.companyAddress}">
        <meta http-equiv="description"
              content="${bizCompany.companyName }是由法人${bizCompany.legalPerson}于${bizCompany.establishDate}在${bizCompany.companyAddress}创办。企业主要从事${bizCompany.businessScope}"/>
    </c:if>
    <c:if test="${not empty bizCompany.establishDate && empty bizCompany.companyAddress }">
        <meta http-equiv="description"
              content="${bizCompany.companyName }是由法人${bizCompany.legalPerson}在${bizCompany.establishDate}日创办。企业主要从事${bizCompany.businessScope}"/>
    </c:if>
    <c:if test="${empty bizCompany.establishDate && not empty bizCompany.companyAddress }">
        <meta http-equiv="description"
              content="${bizCompany.companyName }是由法人${bizCompany.legalPerson}在${bizCompany.companyAddress}创办。企业主要从事${bizCompany.businessScope}"/>
    </c:if>
    <c:if test="${empty bizCompany.establishDate && empty bizCompany.companyAddress }">
        <meta http-equiv="description"
              content="${bizCompany.companyName }是由法人${bizCompany.legalPerson}创办。企业主要从事${bizCompany.businessScope}"/>
    </c:if>
	<link href="${basePath }/style/new-css/gov_style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/myStar.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/jquery.fancybox.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/jquery.fancybox-buttons.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/startcss.css" rel="stylesheet" type="text/css"/>

    <link href="${basePath}/style/jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${basePath }/gov/js/lib/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
<jsp:include page="/gov/gov_top.jsp" />
<jsp:include page="/gov/top_search.jsp"/>
<jsp:include page="/gov/to_report.jsp"/>
<jsp:include page="/gov/login_pop.jsp" />
<div class="mainStyle" style="width: 1180px;margin:0 auto;">
    <jsp:include page="/gov/detail/detail_top.jsp"/>
    <jsp:include page="/gov/detail/detail_category.jsp"/>

    <!--==end topCompany==-->


<!--==end companyNav==-->
<div class="layout01 content zs127">

    <jsp:include page="/detail/detail_subcategory.jsp" />
    <div class="left" id="detail_left_div">

        <div class="detail-list" id="detail" style="display:none;">
            <h2 style="color:red" class="tit"></h2>
            <ul class="change detail-ul" style="display:inline;"></ul>
            <br/>
            <p>
                <a href="javascript:returnTable();" id="back"
                   style="background:#45a9ff;border-radius:5px;padding: 6px 7px;">
                    <font color="#ffffff">&nbsp&nbsp返回&nbsp&nbsp</font>
                </a>
            </p>
        </div>
        <!--企业自述 -->
        <jsp:include page="/gov/detail/company_readme.jsp"/>
        <!--基础信息  -->
        <jsp:include page="/gov/detail/category_base_info.jsp"/>
        <!--经营状况  -->
        <jsp:include page="/gov/detail/category_operation_state.jsp"/>
        <!--风险信息  -->
        <jsp:include page="/gov/detail/category_judicial_proceedings.jsp"/>
        <!--知识产权  -->
        <jsp:include page="/gov/detail/detail_knowledge_right.jsp"/>
        <!--对外投资  -->
        <jsp:include page="/gov/detail/category_out_invest.jsp"/>
        <!--媒体报道  -->
        <jsp:include page="/gov/detail/media_report.jsp"/>
        <!--累计评论  -->
        <%-- <jsp:include page="/gov/detail/category_comment_info.jsp"/>
        <!--底部评论  -->
        <div class="tab-block zsBlock_edit zsBlock_pad detail-list" id="comment_info_div" style="display: none;">
            <jsp:include page="/gov/detail/detail_comment.jsp"/>
        </div> --%>
        <!--end detail-list-->
    </div>
    <!--企业信用码、图谱及最近查询 -->
    <div class="right">
        <jsp:include page="/gov/detail/detail_right.jsp"/>
    </div>


</div>
<!--==end layout content==-->


<a id="backtop" title="回到顶部" href="javascript:moveTo($('.topbar'),0,600)"></a>
</div>
<!--==end mainStyle==-->
 <jsp:include page="/gov/footer.jsp" />

</body>
</html>
<script data-main="${basePath }/gov/js/detail.js" src="${basePath }/gov/js/lib/require.js"></script>
<script>
    var DetailCfg = DetailCfg || {
            companyDetailUrl: '${govCompanyDetailUrl}',
            bizCompanyId: '${bizCompany.companyId}',
            bizCompanyName: '${bizCompany.companyName}',
            companyNameDigest: '${bizCompany.companyNameDigest}',
            curCreditLevelName: '${bizCompany.curCreditLevelName}',
            curCreditLevelValue: '${bizCompany.curCreditLevelValue}',
            companyNo: '${bizCompany.companyNo}',
            userName: '${user.userDigestedName}',
            encodExist: '<%=response.encodeURL("exist") %>',
            encodAdd: '<%=response.encodeURL("add") %>',
            encodRemove: '<%=response.encodeURL("remove") %>',
            encodApply: '<%=response.encodeURL("apply") %>',

            ssQualificationInformationCount: '${empty ssQualificationInformationPage ? 0 : ssQualificationInformationPage.total}',
            safetyProductionLicenseCount: '${empty safetyProductionLicensePage ? 0 : safetyProductionLicensePage.total}',
            qualityLicenseForSafetyCount: '${empty qualityLicenseForSafetyPage ? 0 : qualityLicenseForSafetyPage.total}',
            dischargePermitCount: '${empty dischargePermitPage ? 0 : dischargePermitPage.total}',
            corpProdUalsnbrfCount: '${empty corpProdUalsnbrfPage ? 0 : corpProdUalsnbrfPage.total}',

            adminPunishPageTotal: '${adminPunishPage.total}',
            adminPunishPageContent: '${adminPunishPage.content}',

            historyCookie: '${SHUIDIXY_HISTORY_COOKIE}',
            historyDetailUrl: '${fn:replace(govCompanyDetailUrl, "companyNo", "{0}")}',

            url_pv : "${basePath}/company/ubd/pv",
            url_kw : "${basePath}/company/ubd/kw"
        };
</script>

<script>window._bd_share_config =
    {
        "common": {
            "bdSnsKey": {},
            "bdText": "",
            "bdMini": "1",
            "bdMiniList": ["tsina", "weixin"],
            "bdPic": "",
            "bdStyle": "1",
            "bdSize": "16",
            "onAfterClick":function (cmd) {
                return false;
            }
        },
        "share": {
            "tag":"",
            "bdCustomStyle":""
        }
    };
with (document)0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>