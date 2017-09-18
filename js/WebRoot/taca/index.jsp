<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>之江信用-商贸联活动</title>
    <base href="${basePath }/" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
    <meta http-equiv="description" content="">
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath}/js/uzj/taca/taca_index.js" src="${basePath }/js/lib/require.js"></script>
    <script type="text/javascript">
        var taca_index = {};
        taca_index['deadlineDate'] = '${deadlineDate}';
    </script>
</head>

<body  style="background-color: #f2f4f8;">
<jsp:include page="../user/top.jsp" />
<div class="n-there">
    <div class="n-layout steps">
        <h2>浙江省商贸流通业诚信示范企业评选活动进行中</h2>
        <div class="steps-main" id="stepDiv">
            <img id="stepImg" src="${basePath}/images/steps02.png">
            <ul id="stepUl">
                <li class="steps-green">
                    <span>活动申报</span>
                    <span>${deadline}截止</span>
                </li>
                <li class="steps-gray">
                    <span>初审</span>
                    <span>10月25结束</span>
                </li>
                <li class="steps-gray">
                    <span>复审</span>
                    <span>11月12月份</span>
                </li>
                <li class="steps-gray" style="margin-right: 0;">
                    <span>信息公示</span>
                    <span>12月份</span>
                </li>
            </ul>
        </div>
        <h3>已参选企业：<span>${joinedCompany}家</span></h3>
        <h3><a href="javascript:void(0);" class="declare">申报入口</a>
            <a href="${basePath}/taca/audit/list" class="review">评审入口</a></h3>
    </div>
</div>
<!--end -->
<div class="n-layout steps-infor">
    <h2>申报流程</h2>
    <div class="steps-inblock">
        <img src="../images/steps-icon1.png">
        <h3>申请参加评选</h3>
        <h4>企业名称<span>|</span>实名信息<span>|</span>营业执照</h4>
        <a href="${basePath}/user/owner/<%=response.encodeURL("add_init") %>?attr=taca">立即申请</a>
    </div>
    <div class="steps-inblock">
        <img src="../images/steps-icon2.png">
        <h3>提交基础信息</h3>
        <h4>行业分类<span>|</span>企业所在地<span>|</span>企业联系方式</h4>
    </div>
    <div class="steps-inblock" style="margin-right: 0;">
        <img src="../images/steps-icon3.png">
        <h3>提交申报材料</h3>
        <h4>企业经营信息<span>|</span>企业经营及监管信息<span>|</span>法人治理信息</h4>
        <h4>企业管理信息<span>|</span>合同履约信息<span>|</span>行业地位信息</h4>
        <h4>...</h4>
    </div>
</div>
<!--end -->
<div class="n-there">
    <div class="n-layout steps-infor">
        <h2>活动细则</h2>
        <div class="steps-rule">
            <div class="steps-rule-p"><label>【活动时间】</label><span>即日起至 2017 年 12 月；</span></div>
            <div class="steps-rule-p"><label>【活动对象】</label><span>本活动面向在浙江省行政区域内依法登记注册，且经营期满3年以上的商贸流通企业；</span></div>
            <div class="steps-rule-p" style="margin-bottom: 0;"><label>【活动说明】</label>
                <div class="steps-rule-span">
                    <span>1.申报：2017年6-9月份为企业申报阶段。9月30日为申报截止日。企业通过自评，认为符合参评条件后，通过“之江信用”平台的“浙江省商贸流通业诚信示范企业评选页面”提交申报信息。活动期间每个企业用户仅能在线申报一次；</span>
                    <span>2.初审：2017年8-10月份为考察初审阶段，截止时间为10月25日。各市商务主管部门、商（贸）业联合会（省级商贸流通行业协会）负责审核本单位受理的申报材料，实地考察申报企业，完成初审并报浙商联，浙商联会同之江信用平台审核，择优向评选委员会推荐；</span>
                    <span>3.复审：评选委员会将联合之江信用平台，结合第三方信用信息，审核企业有无失信行为、负面新闻等，得出最终的 诚信企业名录；</span>
                    <span>4.公示表彰：复审结束后，评选委员会将评选名单在“浙商联官网”、“之江信用”及相关媒体上公示征询意见。公示结束后，对“诚信示范企业”进行表彰；</span>
                    <span>5.参加本活动的企业，平台将会自动为申报帐号在之江信用上认领对应企业；</span>
                    <span>6.参加本活动的企业，一律默认为已完整阅读<a href="${basePath}/about/privacy.jsp">《隐私协议》</a>和<a href="${basePath}/about/terms_service.jsp">《服务条款》</a>，并完全理解及全部同意；</span>
                    <span>7.本次活动最终解释权归之江信用平台所有；</span>
                    <span>8.活动过程中如有任何问题，可向平台在线客服咨询。<a href="http://wpa.qq.com/msgrd?v=3&uin=3252136845&site=qq&menu=yes" target="_blank"><img src="../images/step-qq.png"></a></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end -->
<div class="n-layout steps-infor">
    <div class="coop">
        <h3>主办方</h3>
        <h4>浙江省商贸联合会</h4>
    </div>
    <div class="coop">
        <h3>联合主办</h3>
        <img src="../images/steps-logo.png">
        <p>本次活动的主办单位及活动运营商</p>
    </div>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>
