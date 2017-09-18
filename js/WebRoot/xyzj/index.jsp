<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>首页-信用浙江</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${basePath}/xyzj/style/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath}/xyzj/js/index.js" src="${basePath }/xyzj/js/lib/require.js"></script>
</head>
<body style="background-color: #fff;">
<jsp:include page="head.jsp"/>
<!-- end header-->
<div class="layout search">
    <ul>
        <li><a href="javascript:void(0)" tip="请输入企业名称" class="current">企业</a><span>|</span></li>
        <li><a href="javascript:void(0)" tip="该类信息暂不开放查询">个人</a><span>|</span></li>
        <li><a href="javascript:void(0)"tip = "请输入政府机关名称">政府机关</a><span>|</span></li>
        <li><a href="javascript:void(0)" tip="请输入事业单位名称">事业单位</a><span>|</span></li>
        <li><a href="javascript:void(0)" tip="请输入社会组织名称">社会组织</a></li>
    </ul>
    <div class="h-input">
        <div class="h-input-w">
            <form method="get" id="searchForm" action="${basePath}/xyzj/search">
                <input id="searchType" type="hidden" value="companyName" name="searchType"/>
            <input name="key" type="text" id="searchKey" placeholder="请输入企业名称">
            <a href="javascript:void(0)" id="btn-search"></a>
            </form>
        </div>
        <a target="_blank" href="http://www.zjcredit.gov.cn/html/xyfw/xyfw8.htm" class="a-link"><img src="${basePath}/xyzj/images/a-link.png"></a>
    </div>
</div>
<!-- end search-->
<div class="layout sea-result">
    <h3><span>失信黑名单</span><a href="http://www.zjcredit.gov.cn/hmd/hmd.do">更多</a></h3>
    <div class="sea-result-main">
        <div class="result-left result-left-m">
            <p><a target="_blank" href="http://www.zjcredit.gov.cn/hmd/blackInfo.do?id=FE19160E4079B4889762D5DCD4B04BC6 ">省检察院:行贿犯罪失信黑名单</a></p>
            <p><a target="_blank" href="http://www.zjcredit.gov.cn/hmd/blackInfo.do?id=8C1249F0475F5740A4DD1FD5DC6173AE">省司法厅:律师事务所被吊销执业证书黑名单</a></p>
            <p><a target="_blank" href="http://www.zjcredit.gov.cn/hmd/blackInfo.do?id=80CF405792D255A866F3BA3B2DB3B103">省文化厅:浙江省文化市场黑名单</a></p>
            <p><a target="_blank" href="http://www.zjcredit.gov.cn/hmd/blackInfo.do?id=4B3382A739103A20C43CBC830C2EBB55">省新闻出版:浙江省新闻出版广播影视领失信黑名单</a></p>
            <p><a target="_blank" href="http://www.zjcredit.gov.cn/hmd/blackInfo.do?id=B15EB5E11200EF47B0A8735EF6A68E9A ">浙江保监局:保险代理人失信黑名单</a></p>
        </div>
        <div class="result-left">
            <p><a target="_blank" href="http://www.zjcredit.gov.cn/hmd/blackInfo.do?id=B15EB5E11200EF47B0A8735EF6A68E9A"> 省旅游局:旅行社业务经营失信黑名单</a></p>
            <p><a target="_blank" href="http://www.zjcredit.gov.cn/hmd/blackInfo.do?id=27B9C96BB929B9806279F9412F8B0C08"> 省食品药品:餐饮服务单位失信黑名单</a></p>
            <p><a target="_blank" href="http://www.zjcredit.gov.cn/hmd/blackInfo.do?id=8A6CB621E399FCCA482286ADB2A6AEF9"> 省质监局:产品质量失信黑名单</a></p>
            <p><a target="_blank" href="http://www.zjcredit.gov.cn/hmd/blackInfo.do?id=92CC499B14C20B249DE1F823C1BAA1A7"> 省地税局:重大税收违法黑名单</a></p>
            <p><a target="_blank" href="http://www.zjcredit.gov.cn/hmd/blackInfo.do?id=345EC412D8FF21F880E4A3E70CD045AF"> 省消防总队:消防安全失信黑名单</a></p>
        </div>
    </div>
</div>
<!-- end search-->
<div class="layout sea-result">
    <h3><span>制度创建</span><a target="_blank" href="http://www.zjcredit.gov.cn/html/hmd/zdjs.htm">更多</a></h3>
    <div class="sea-result-main result-main-top">
        <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <th class="e1">发布机关</th>
                <th class="e2">标题</th>
                <th class="e3">更新时间</th>
            </tr>
            <tr>
                <td class="e1">省民政厅</td>
                <td class="e2"><a target="_blank" href="http://www.zjcredit.gov.cn/article/2017/03/article_162984.htm">关于印发《浙江省社会组织失信“黑名单”管理办法（试行）》的通知浙民民〔2016〕203号</a></td>
                <td class="e3">2017-03-02</td>
            </tr>
            <tr>
                <td class="e1">省司法厅</td>
                <td class="e2"><a target="_blank" href="http://www.zjcredit.gov.cn/article/2017/01/article_162809.htm">关于印发《浙江省法律服务行业失信“黑名单”管理暂行办法》的通知（浙司[2016]141号）</a> </td>
                <td class="e3">2016-12-27</td>
            </tr>
            <tr>
                <td class="e1">省食品药品监督管理局</td>
                <td class="e2"><a target="_blank" href="http://www.zjcredit.gov.cn/article/2017/02/article_162864.htm">关于印发《浙江省食品药品安全严重失信者名单管理办法》的通知</a></td>
                <td class="e3">2016-12-19</td>
            </tr>
            <tr>
                <td class="e1">省环境保护厅</td>
                <td class="e2"><a target="_blank" href="http://www.zjcredit.gov.cn/article/2016/08/article_161504.htm">关于印发《浙江省环境违法“黑名单”管理办法（试行）》的通知（浙环发〔2016〕28号）</a></td>
                <td class="e3">2016-07-22</td>
            </tr>
            <tr class="e-last">
                <td class="e1">省安全生产监督管理局</td>
                <td class="e2"><a target="_blank" href="http://www.zjcredit.gov.cn/article/2016/06/article_160924.htm">关于印发《浙江省生产经营单位安全生产不良记录“黑名单”管理暂行办法》的通知（浙安监管法规 〔2016〕52号）</a></td>
                <td class="e3">2016-06-15</td>
            </tr>
        </table>

    </div>
</div>
<!-- end search-->
<div class="layout sea-result">
    <h3><span>工作动态</span><a target="_blank" href="http://www.zjcredit.gov.cn/html/hmd/zdjs.htm">更多</a></h3>
    <div class="sea-result-main result-main-top">
        <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="e4"><a target="_blank" href="http://www.zjcredit.gov.cn/article/2017/04/article_163306.htm">浙江温州第九批失信人对象名单公布</a></td>
                <td class="e3">2017-04-17</td>
            </tr>
            <tr>
                <td class="e4"><a target="_blank" href="http://www.zjcredit.gov.cn/article/2017/04/article_163264.htm ">银监会重拳惩处17家银行 建立市场禁入黑名单</a></td>
                <td class="e3">2017-04-11</td>
            </tr>
            <tr>
                <td class="e4"><a target="_blank" href="http://www.zjcredit.gov.cn/article/2017/03/article_163165.htm ">财政部：入库PPP咨询机构违规将进“黑名单”</a></td>
                <td class="e3">2017-03-31</td>
            </tr>
            <tr>
                <td class="e4"><a target="_blank" href="http://www.zjcredit.gov.cn/article/2017/03/article_163151.htm">杭州电梯白皮书发布十小区进电梯故障黑名单</a></td>
                <td class="e3">2017-03-28</td>
            </tr>
            <tr class="e-last">
                <td class="e4"><a target="_blank" href="http://www.zjcredit.gov.cn/article/2017/03/article_163105.htm">浙江省养殖户需注意，一旦失信，将被纳入“黑名单”</a></td>
                <td class="e3">2017-03-23</td>
            </tr>
        </table>






    </div>
</div>
<!-- end search-->

<div class="footer">
	<div class="footer-ul">
		<ul>
	        <li><a href="http://www.zjcredit.gov.cn/html/zzjg/zzjg.htm">组织架构</a></li>
	        <li><a href="http://www.zjcredit.gov.cn/html/zcfg/flfg6.htm">政策法规</a></li>
	        <li><a href="http://www.zjcredit.gov.cn/html/xydt/xyzj.htm">信用动态</a></li>
	        <li><a href="http://www.zjcredit.gov.cn/html/xyfw/xyfw4.htm">信用服务</a></li>
	        <li><a href="http://www.zjcredit.gov.cn/zygs/zygsList.do">信用承诺</a></li>
	        <li><a href="http://www.zjcredit.gov.cn/html/xyyj/xyyj.htm">信用研究</a></li>
	        <li><a href="http://www.zjcredit.gov.cn/html/yqlj/yqlj.htm">友情链接</a></li>
		</ul>
	</div>
    <p>主办单位：浙江省信用中心     浙ICP备05004681号 </p>
</div>

</body>