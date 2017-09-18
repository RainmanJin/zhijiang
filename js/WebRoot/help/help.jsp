<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>帮助中心-之江信用</title>
	<base href="${basePath }/" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/help.js" src="${basePath }/js/lib/require.js" defer></script>
</head>
<body data-nav="help">
	<jsp:include page="../user/top.jsp" />
    <!--end n-header-->
    <div class="n-layout n-help">
    	<jsp:include page="/help/left.jsp" />
        <div class="help-right">
        <div class="help-right-main">
         	<div class="help-tit-img">
            	<img src="${basePath}/images/new-images/img18.png" />
                <p>小江为您罗列了以下问题答疑，希望可以帮到您……此外，</p>
                <p>您也可以在线咨询我们的<a href="http://wpa.qq.com/msgrd?v=3&uin=3252136845&site=qq&menu=yes" target="_blank">客服小江</a></p>
            </div>
            <div class="help-where help-where-t">
            	<h4 class="help-h4-t">你们的数据从哪儿来？</h4>
                <h4>我们的数据主要来源于信用浙江数据库、浙江省商务厅、奇虎360、浙江省中小企业信息管理系统、相关商业银行、各类市场化平台。</h4>
                <h4>详细内容请见下图：</h4>
                
            </div>
            <div class="help-where" style="border-top: 0;">
            	<div class="help-data">
                	<div class="help-data-left">
                    	<span>行政类信用数据</span>
                    </div>
                    <div class="help-data-right">
                    	<p>基本登记信息：企业名称、信用代码、组织机构代码、工商注册号、税务登记号、成立时间、企业地址、所属行业、经营业态、法人信息、注册资金等情况</p>
                        <p>行政信息：行政许可、资质认定、行政处罚、法院判决裁定等信用信息</p>
                        <p><span>来源：信用浙江数据库</span></p>
                    </div>
                </div>
            </div>
            <div class="help-where">
                <div class="help-data">
                	<div class="help-data-left">
                    	<span>市场类信用数据</span>
                    </div>
                    <div class="help-data-right">
                    	<p>交易类信用数据：上下游交易合同、交易金额、交易执行情况、有无违约情况等</p>
                        <p>经营类信用数据：营业额、经营规模、门店数量</p>
                        <p><span>来源：各类市场化平台</span></p>
                    </div>
                </div>
            </div> 
            <div class="help-where">
                <div class="help-data">
                	<div class="help-data-left">
                    	<span>金融类信用数据</span>
                    </div>
                    <div class="help-data-right">
                    	<p>税收交纳、水电交纳等</p>
                        <p>企业与商业银行、保险等部门金融往来产生的部分数据</p>
                        <p><span>来源：浙江省中小企业信息管理系统、商业银行等</span></p>
                    </div>
                </div>
            </div>
            <div class="help-where">
                <div class="help-data">
                	<div class="help-data-left">
                    	<span>商务类信用数据</span>
                    </div>
                    <div class="help-data-right">
                    	<p>重点流通企业备案</p>
                        <p>企业对外贸易备案数据</p>
                        <p>单用途预付卡备案数据</p>
                        <p><span>来源：浙江省商务厅相关部门管理系统</span></p>
                    </div>
                </div>
            </div>
            <div class="help-where">
                <div class="help-data">
                	<div class="help-data-left">
                    	<span style="margin-top:0;">第三方机构类数据</span>
                    </div>
                    <div class="help-data-right">
                    	<p>360集团内部相关浙江企业信用信息，以及360通过互联网收集的第三方组织机构信息</p>
                        <p><span>来源：奇虎360</span></p>
                    </div>
                </div>
            </div>
            <div class="help-where-t">
            	<h4 class="help-h4-t">你们的数据主要服务哪几类群体？</h4>
                <h4 style="line-height: 33px;">我们平台的数据受用主体包括：个人、企业、政府、协会、金融机构等。实际应用场景请见下图：</h4>
            </div>
            <div class="help-cj">
            	<div class="help-cj-tit">
                	<p><span>应用场景</span></p>
                </div>
                <div class="help-cj-main">
                	<div class="help-cj-ml">
                    	<img src="${basePath}/images/new-images/img19.png" />
                        <h5>个人</h5>
                        <p>信用信息查询</p>
                        <p>举报投诉</p>
                        <p>企业评价</p>
                    </div>
                    <div class="help-cj-ml">
                    	<img src="${basePath}/images/new-images/img20.png" />
                        <h5>企业</h5>
                        <p>建设企业形象</p>
                        <p>诚信企业展示</p>
                        <p>失信企业公示</p>
                        <p>良好企业品牌保护及推广</p>
                        <p>企业信用报告</p>
                    </div>
                    <div class="help-cj-ml">
                    	<img src="${basePath}/images/new-images/img21.png" />
                        <h5>政府</h5>
                        <p>行业监控</p>
                        <p>企业监管</p>
                        <p>地域监测</p>
                        <p>信用预警</p>
                        <p>上下游协同工作</p>
                    </div>
                    <div class="help-cj-ml">
                    	<img src="${basePath}/images/new-images/img22.png" />
                        <h5>协会</h5>
                        <p>企业管理</p>
                        <p>企业信用评价</p>
                        <p>线上线下合作支持</p>
                    </div>
                    <div class="help-cj-ml" style="border-right:0;">
                    	<img src="${basePath}/images/new-images/img23.png" />
                        <h5>金融机构</h5>
                        <p>精准营销</p>
                        <p>贷前、贷后风险监控</p>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
    <!--end n-help-->
    <jsp:include page="../footer.jsp" />
    <!--end n-footer-->
</body>
</html>