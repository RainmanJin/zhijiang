<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>关于信用评分-之江信用</title>
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
<body data-nav="help_score">
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
            <div class="help-where help-where-p">
            	<h4 class="help-h4-t">你们的信用评价规则是什么？</h4>
                <p>我们的信用评分模型是以中国人民大学三维信用理论为评价基础，结合中小企业信用特点和大数据技术的特点，注重定性与定量相结合，构建的多角度复合验证的中小企业信用评价模型。</p>
            </div>
            <div class="help-where-p">
            	<h4 class="help-h4-t">如果我对我所在企业的信用分不尽满意，该通过什么渠道来提升信用分？</h4>
                <p>针对信用分不尽人意的现象，影响因素包括两点：1. 企业存在失信行为；2. 贵企业在平台的信息较为不完善。对于前者需要企业自身不断改进，而对于信息不完善导致的信用分偏低，您可通过平台的“信用灯塔”服务来提升评分，也可咨询我们的客服小妹。</p>
            </div>
            <div class="help-where-p">
            	<h4 class="help-h4-t">企业信用等级是如何划分说明的？</h4>
                <p>平台的信用等级分为五级，具体请参考下图：</p>
                <div class="help-star">
                	<p><img src="${basePath}/images/new-images/img24.png" />五星满档，值得信赖</p>
                    <p><img src="${basePath}/images/new-images/img25.png" />已获认证，信用良好</p>
                    <p><img src="${basePath}/images/new-images/img26.png" />初步验证，仍需提升</p>
                    <p><img src="${basePath}/images/new-images/img27.png" />信用正在积累</p>
                    <p><img src="${basePath}/images/new-images/img28.png" />信用开始起步</p>
                    <p><img src="${basePath}/images/new-images/img29.png" />未获评阶段</p>
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