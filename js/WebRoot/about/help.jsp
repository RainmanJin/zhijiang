<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

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
	<%--<link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />--%>
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/js/uzj/about.js" src="${basePath }/js/lib/require.js"></script>
</head>
<body>
<jsp:include page="/user/top.jsp" />
	<div class="about-banner"></div>
	<!--end banner-->
	<div class="ab-container">
		<div class="ab-main">	
			<jsp:include page="/about/left.jsp" />
			<div class="list-right">
				<h2>帮助中心<span>HELP CENTER</span></h2>
				<a href="http://wpa.qq.com/msgrd?v=3&uin=3252136845&site=qq&menu=yes" class="ab-kf"><img src="${basePath }/images/new-images/ab-kf.png"></a>
				<div class="answer-one">
					<h3>Q1：你们的数据从哪儿来？</h3>
					<p>我们的数据主要来源于信用浙江数据库、浙江省商务厅、奇虎360、浙江省中小企业信息管理系统、相关商业银行、各类市场化平台。</p>
					<p>详细内容请见下图：</p>					
					<img class="a1-top" src="${basePath }/images/new-images/ab-h1.png">
				</div>
				<div class="answer-one">
					<h3>Q2：你们的数据主要服务哪几类群体？</h3>
					<p>我们平台的数据受用主体包括：个人、企业、政府、协会、金融机构等。实际应用场景请见下图：</p>
					<div class="help-cj-main">
	                	<div class="help-cj-ml">
	                    	<img src="${basePath }/images/new-images/img19.png" />
	                        <h5>个人</h5>
	                        <p>信用信息查询</p>
	                        <p>举报投诉</p>
	                        <p>企业评价</p>
	                    </div>
	                    <div class="help-cj-ml">
	                    	<img src="${basePath }/images/new-images/img20.png" />
	                        <h5>企业</h5>
	                        <p>建设企业形象</p>
	                        <p>诚信企业展示</p>
	                        <p>失信企业公示</p>
	                        <p>良好企业品牌保护及推广</p>
	                        <p>企业信用报告</p>
	                    </div>
	                    <div class="help-cj-ml">
	                    	<img src="${basePath }/images/new-images/img21.png" />
	                        <h5>政府</h5>
	                        <p>行业监控</p>
	                        <p>企业监管</p>
	                        <p>地域监测</p>
	                        <p>信用预警</p>
	                        <p>上下游协同工作</p>
	                    </div>
	                    <div class="help-cj-ml">
	                    	<img src="${basePath }/images/new-images/img22.png" />
	                        <h5>协会</h5>
	                        <p>企业管理</p>
	                        <p>企业信用评价</p>
	                        <p>线上线下合作支持</p>
	                    </div>
	                    <div class="help-cj-ml" style="border-right:0;">
	                    	<img src="${basePath }/images/new-images/img23.png" />
	                        <h5>金融机构</h5>
	                        <p>精准营销</p>
	                        <p>贷前、贷后风险监控</p>
	                    </div>
                	</div>									
				</div>
				<div class="answer-one">
					<h3>Q3：你们的信用评价规则是什么？</h3>
					<p>我们的信用评分模型是以中国人民大学三维信用理论为评价基础，结合中小企业信用特点和大数据技术的特点，注重定性与定量相
结合，构建的多角度复合验证的中小企业信用评价模型。</p>					
				</div>
				<div class="answer-one">
					<h3>Q4：如果我对我所在企业的信用分不尽满意，该通过什么渠道来提升信用分？</h3>
					<p>针对信用分不尽人意的现象，影响因素包括两点：</p>		
					<div class="impact">
						<div class="impact-left">1</div>
						<div class="impact-right">
							<h5>企业存在失信行为</h5>
							<h5>解决方案：需企业自身履行生效法律文书所确定得义务</h5>
						</div>
					</div>
					<div class="impact">
						<div class="impact-left">2</div>
						<div class="impact-right">
							<h5>贵企业在平台的信息较为不完善</h5>
							<h5>解决方案：用户可在？<a href="${basePath}/user/owner/add_init">认领企业</a>后，于个人中心（用户账号入口）上传增信材料，经审核验证后，即可提升企业信用分。</h5>
						</div>
					</div>
					<p style="margin-top: 30px;">注：增信材料包括行政许可资质、房屋租赁合同、产品/行业体系认证证书、行业协会证书等（选择性上传）</p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>
