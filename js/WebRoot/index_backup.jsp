<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>之江信用</title>
	<base href="${basePath }/" data-detailUrl="${companyDetailUrl }"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta name="renderer" content="webkit" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="" />
	<meta http-equiv="description" content="" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/activity.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
	<meta property="qc:admins" content="1453276267425345466727" />
	<script data-main="${basePath }/js/uzj/index.js" src="${basePath }/js/lib/require.js"></script>
</head>
<body id="body" style="background-color: #fff;">
<jsp:include page="/user/top.jsp"/>
<jsp:include page="/activity/pop.jsp"/>
<!--end n-header-->
<div class="n-banner" >
	<div class="n-layout">
		<div class="n-b-index">
			<ul>
				<li class="current" tab="all" tip="可以按企业名称、注册号、法人、股东、高管、品牌查询">全部<em></em></li>
				<li tab="companyName" tip="按企业名称查询">企业名<em></em></li>
				<li tab="legalPerson,partnerStockName" tip="按法人、股东查询">股东法人<em></em></li>
				<li tab="employeeName" tip="按董高监查询">董高监<em></em></li>
				<li tab="companyAddress" tip="按地址查询">地址<em></em></li>
				<li tab="businessScope" tip="按经营范围查询">经营范围<em></em></li>
				<li tab="trademark" tip="按品牌/产品查询">品牌/产品<em></em></li>
				<li id="industryTab">行业<i></i><em></em></li>
			</ul>
			<div class="n-b-input">
				<form method="get" id="searchForm" action="${basePath}/search"><!--可以按企业名称、注册号、法人、股东、高管、品牌查询  -->
					<p>
						<input name="key" type="text" id="searchKey" placeholder="可以按企业名称、注册号、法人、股东、高管、品牌查询" />
						<input type="hidden"  name="searchType" id="searchType" value="all"/>
						<a href="javascript:void(0)" id="btn-search"></a>
					</p>
				</form>
			</div>
			<div class="n-b-industry" style="display:none;">
				<c:forEach items="${industryNames}" var="industryName">
					<a href="${basePath}/search?industryName=${industryName}">${industryName}</a>
				</c:forEach>
				<%--                <a href="#">制造业</a><a href="#">批发业和零售业 </a><a href="#">租赁和商务服务业</a><a href="#">房地产业</a><a href="#">建筑业</a><a href="#">交通运输业、仓储和邮政业</a>
                                <a href="#">居民服务、修理和其他服务业</a><a href="#">住宿和餐饮业</a><a href="#">科学研究和技服务业</a><a href="#">农、林、牧、渔业</a><a href="#">金融业</a>
                                <a href="#">信息传输、软件和信息技术服务业</a><a href="#">文化、体育和娱乐业</a><a href="#">水利、环境和公共设施管理业</a>
                                <a href="#">电力、热力、燃气及水生产和供应业 </a><a href="#">采矿业      教育      卫生和社会工作</a><a href="#">公共管理、社会保障和社会组织</a>--%>
			</div>
		</div>
	</div>
</div>
<div class="n-horn">
	<div class="n-layout">
		<p><img src="${basePath}/images/new-images/img49.png"><span>之江信用平台的企业信用</span>档案已加入国家发改委全国企业信用诚信系统<span>豪华套餐啦~</span></p>
	</div>
</div>
<!--end n-banner-->
<div class="n-layout n-style">
	<div class="n-style-list">
		<div class="n-style-pad" attr-class="activity">
			<img src="${basePath}/images/new-images/img02.png" />
			<h4>信用灯塔</h4>
			<p>给予企业资质，提供企业认领和认证服务，点亮企业信用，护航企业发展</p>
		</div>
	</div>
	<div class="n-style-list">
		<div class="n-style-pad">
			<img src="${basePath}/images/new-images/img03.png" />
			<h4>品牌治理</h4>
			<p>针对品牌营销数据，提供并移送假冒品牌线索，提升授权品牌网站搜索流量</p>
		</div>
	</div>
	<div class="n-style-list">
		<div class="n-style-pad">
			<img src="${basePath}/images/new-images/img04.png" />
			<h4>放心预付</h4>
			<p>采集预付卡商户经营数据，联合第三方资金存管机构，提供消费者保险理赔服务</p>
		</div>
	</div>
	<div class="n-style-list">
		<div class="n-style-pad">
			<img src="${basePath}/images/new-images/img05.png" />
			<h4>信用金融</h4>
			<p>努力建设中</p>
		</div>
	</div>
</div>
<!--end n-style-->
<div class="n-ch">
	<div class="n-layout">
		<h2>您与外界的餐厅后厨，其实只隔了一个屏幕的距离</h2>
		<a href="${basePath}/seed.jsp">立即前往</a>
	</div>
</div>
<!--end n-ch-->
<div class="n-layout n-main">
	<h2>给您，选择我们的理由</h2>
	<div class="n-main-r">
		<div class="n-main-r-list">
			<img src="${basePath}/images/new-images/img06.png" />
			<h3>01.更实用</h3>
			<p>提供专业的企业信息查询服务，政务便民服务，失信举报及预警服务，企业信用提升指导服务，企业品牌推广服务</p>
		</div>
		<div class="n-main-r-list">
			<img src="${basePath}/images/new-images/img07.png" />
			<h3>02.更可靠</h3>
			<p>绕开数据采集时遇到的脱敏技术，采用360云安全保障体系，确保数据及网络的安全，打造可靠理想的数据使用环境</p>
		</div>
		<div class="n-main-r-list">
			<img src="${basePath}/images/new-images/img08.png" />
			<h3>03.更全面</h3>
			<p>接入多方数据，政府部门数据，企业数据，行业经营数据，金融数据，覆盖面广而不泛，多维度展示信用信息</p>
		</div>
		<div class="n-main-r-list" style="margin-right:0;">
			<img src="${basePath}/images/new-images/img09.png" />
			<h3>04.更高效</h3>
			<p>高性能大数据存储平台，实时处理海量数据，简化应用场景，将数据快速有效的传递到用户身边</p>
		</div>
	</div>
</div>
<!--end n-main-->
<div class="n-there">
	<div class="n-layout n-main" style="margin-bottom: 50px;">
		<h2>因为信用，他们汇集在这里</h2>
		<!--   <h4>如果您希望您所在的企业也出现在这里，那就赶快加入我们的“信用灯塔计划”<span>&gt;&gt;</span><a href="javascript:void(0)">了解详情</a></h4> -->
		<%--<div data-role="scrollContent" id="scrollDiv">--%>
		<%--<a href="${fn:replace(companyDetailUrl, 'companyNo', '{6}')}" style="color: #444;" id="scrollModel">--%>
		<%--<div class="n-there-list" style="display:none;">--%>
		<%--<div class="n-there-list-pad">--%>
		<%--<p class="n-p1">{0}</p>--%>
		<%--<p class="n-p2"><span>{1}{2}</span><span>{3}</span><span>诚信示范企业</span></p>--%>
		<%--<div class="n-p3">--%>
		<%--<div class="n-p3-star">--%>
		<%--<div class='istar' config='{"n":{4},"s":50,"size":12,"img":"${basePath}/images/star.png"}'></div>--%>
		<%--</div>--%>
		<%--<span>{5}分</span>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</a>--%>
		<%--<div class="n-there-main" data-role="scrollUl" id="scrollUl" style="margin-bottom: 10px;">--%>
		<%--<div data-role="scrollItem" style="display: inline-block;">--%>
		<%--<a href="${fn:replace(companyDetailUrl, 'companyNo', '91321859474897794995309536497437')}" style="color: #444;">--%>
		<%--<div class="n-there-list">--%>
		<%--<div class="n-there-list-pad">--%>
		<%--<p class="n-p1">杭州娃哈哈集团有限公司</p>--%>
		<%--<p class="n-p2"><span>浙江杭州</span><span>食品/饮料制造业</span><span>诚信示范企业</span></p>--%>
		<%--<div class="n-p3">--%>
		<%--<div class="n-p3-star"><img src="${basePath}/images/new-images/img10.png" /></div>--%>
		<%--<span class="n-p3-span">3563分</span>--%>
		<%--</div>												  --%>
		<%----%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</a>--%>
		<%--<a href="${fn:replace(companyDetailUrl, 'companyNo', '91074231983628088797292208772024')}" style="color: #444;">--%>
		<%--<div class="n-there-list">--%>
		<%--<div class="n-there-list-pad">--%>
		<%--<p class="n-p1">雅戈尔集团股份有限公司</p>--%>
		<%--<p class="n-p2"><span>浙江宁波</span><span>服装制造</span><span>诚信示范企业</span></p>--%>
		<%--<div class="n-p3">--%>
		<%--<div class="n-p3-star"><img src="${basePath}/images/new-images/img10.png" /></div>--%>
		<%--<span class="n-p3-span">3563分</span>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</a>--%>
		<%--<a href="${fn:replace(companyDetailUrl, 'companyNo', '95273948247676763455733286733135')}" style="color: #444;">--%>
		<%--<div class="n-there-list">--%>
		<%--<div class="n-there-list-pad">--%>
		<%--<p class="n-p1">万向集团公司</p>--%>
		<%--<p class="n-p2"><span>浙江杭州</span><span>汽车制造业</span><span>诚信示范企业</span></p>--%>
		<%--<div class="n-p3">--%>
		<%--<div class="n-p3-star"><img src="${basePath}/images/new-images/img10.png" /></div>--%>
		<%--<span class="n-p3-span">3563分</span>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</a>--%>
		<%--</div>--%>
		<%--<div data-role="scrollItem" style="display: inline-block;">--%>
		<%--<a href="${fn:replace(companyDetailUrl, 'companyNo', '98932256307331786777660824265196')}" style="color: #444;">--%>
		<%--<div class="n-there-list">--%>
		<%--<div class="n-there-list-pad">--%>
		<%--<p class="n-p1">正泰集团股份有限公司</p>--%>
		<%--<p class="n-p2"><span>浙江乐清</span><span>机器设备/仪器仪表制造业</span><span>诚信示范企业</span></p>--%>
		<%--<div class="n-p3">--%>
		<%--<div class="n-p3-star"><img src="${basePath}/images/new-images/img10.png" /></div>--%>
		<%--<span class="n-p3-span">3547分</span>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</a>--%>
		<%--<a href="${fn:replace(companyDetailUrl, 'companyNo', '55957308397149761611682642756068')}" style="color: #444;">--%>
		<%--<div class="n-there-list">--%>
		<%--<div class="n-there-list-pad">--%>
		<%--<p class="n-p1">红蜻蜓集团有限公司</p>--%>
		<%--<p class="n-p2"><span>浙江永嘉</span><span>商务服务业</span><span>诚信示范企业</span></p>--%>
		<%--<div class="n-p3">--%>
		<%--<div class="n-p3-star"><img src="${basePath}/images/new-images/img10.png" /></div>--%>
		<%--<span class="n-p3-span">3571分</span>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</a>--%>
		<%--<a href="${fn:replace(companyDetailUrl, 'companyNo', '16659903918956869663196380462734')}" style="color: #444;">--%>
		<%--<div class="n-there-list">--%>
		<%--<div class="n-there-list-pad">--%>
		<%--<p class="n-p1">浙江报喜鸟服饰股份有限公司</p>--%>
		<%--<p class="n-p2"><span>浙江永嘉</span><span>批发业</span><span>诚信示范企业</span></p>--%>
		<%--<div class="n-p3">--%>
		<%--<div class="n-p3-star"><img src="${basePath}/images/new-images/img10.png" /></div>--%>
		<%--<span class="n-p3-span">3547分</span>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</a>--%>
		<%--</div>--%>
		<%--<div data-role="scrollItem" style="display: inline-block;">--%>
		<%--<a href="${fn:replace(companyDetailUrl, 'companyNo', '17730101423744861850365644445409')}" style="color: #444;">--%>
		<%--<div class="n-there-list">--%>
		<%--<div class="n-there-list-pad">--%>
		<%--<p class="n-p1">杭州老板电器股份有限公司</p>--%>
		<%--<p class="n-p2"><span>浙江杭州</span><span>电气机械和器材制造业</span><span>诚信示范企业</span></p>--%>
		<%--<div class="n-p3">--%>
		<%--<div class="n-p3-star"><img src="${basePath}/images/new-images/img10.png" /></div>--%>
		<%--<span class="n-p3-span">3660分</span>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--<a href="${fn:replace(companyDetailUrl, 'companyNo', '93002015361191810099858333415383')}" style="color: #444;">--%>
		<%--<div class="n-there-list">--%>
		<%--<div class="n-there-list-pad">--%>
		<%--<p class="n-p1">杭州民生药业有限公司</p>--%>
		<%--<p class="n-p2"><span>浙江杭州</span><span>医药制造业</span><span>诚信示范企业</span></p>--%>
		<%--<div class="n-p3">--%>
		<%--<div class="n-p3-star"><img src="${basePath}/images/new-images/img10.png" /></div>--%>
		<%--<span class="n-p3-span">3819分</span>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</a>--%>
		<%--</div>--%>
		<%--</div>--%>
		<%--</div>--%>
		<div style="width: 1202px; overflow: hidden; height: 271px;position: relative;">
			<div data-role="scrollContent" id="scrollDiv" style="position: absolute; overflow: hidden; width: 3402px; transition-duration: 0.5s; transform: translate3d(406px, 0px, 0px); backface-visibility: hidden; left: 0px;margin-left: -399px;">
				<div class="all029" mark='lightShow' name="lightPage1" style="float: left; margin-right: 3%;">
					<div class="n-there-list">
						<img src="${basePath}/images/there01.jpg" />
						<a href="${fn:replace(companyDetailUrl, 'companyNo', '91321859474897794995309536497437')}">杭州娃哈哈集团有限公司</a>
						<ul>
							<li><em></em>浙江杭州</li>
							<li><em></em>食品/饮料制造业</li>
							<li><em></em>诚信示范企业</li>
						</ul>
					</div>
					<div class="n-there-list">
						<img src="${basePath}/images/there02.jpg" />
						<a href="${fn:replace(companyDetailUrl, 'companyNo', '91074231983628088797292208772024')}">雅戈尔集团股份有限公司</a>
						<ul>
							<li><em></em>浙江宁波</li>
							<li><em></em>服装制造</li>
							<li><em></em>诚信示范企业</li>
						</ul>
					</div>
					<div class="n-there-list">
						<img src="${basePath}/images/there03.jpg" />
						<a href="${fn:replace(companyDetailUrl, 'companyNo', '95273948247676763455733286733135')}">万向集团公司</a>
						<ul>
							<li><em></em>浙江杭州</li>
							<li><em></em>汽车制造业</li>
							<li><em></em>诚信示范企业</li>
						</ul>
					</div>
					<div class="n-there-list n_list_last">
						<img src="${basePath}/images/there04.jpg" />
						<a href="${fn:replace(companyDetailUrl, 'companyNo', '98932256307331786777660824265196')}">正泰集团股份有限公司</a>
						<ul>
							<li><em></em>浙江乐清</li>
							<li><em></em>机器设备/仪器仪表制造业</li>
							<li><em></em>诚信示范企业</li>
						</ul>
					</div>
				</div>
				<div class="all029" mark='lightShow'  name="lightPage2" style="float: left; ">
					<div class="n-there-list">
						<img src="${basePath}/images/there05.jpg" />
						<a href="${fn:replace(companyDetailUrl, 'companyNo', '55957308397149761611682642756068')}">红蜻蜓集团有限公司</a>
						<ul>
							<li><em></em>浙江永嘉</li>
							<li><em></em>商务服务业</li>
							<li><em></em>诚信示范企业</li>
						</ul>
					</div>
					<div class="n-there-list">
						<img src="${basePath}/images/there06.jpg" />
						<a href="${fn:replace(companyDetailUrl, 'companyNo', '16659903918956869663196380462734')}">浙江报喜鸟服饰股份有限公司</a>
						<ul>
							<li><em></em>浙江永嘉</li>
							<li><em></em>批发业</li>
							<li><em></em>诚信示范企业</li>
						</ul>
					</div>
					<div class="n-there-list">
						<img src="${basePath}/images/there07.jpg" />
						<a href="${fn:replace(companyDetailUrl, 'companyNo', '17730101423744861850365644445409')}">杭州老板电器股份有限公司</a>
						<ul>
							<li><em></em>浙江杭州</li>
							<li><em></em>电器机械和器材制造业</li>
							<li><em></em>诚信示范企业</li>
						</ul>
					</div>
					<div class="n-there-list n_list_last">
						<img src="${basePath}/images/there08.jpg" />
						<a href="${fn:replace(companyDetailUrl, 'companyNo', '93002015361191810099858333415383')}">杭州民生药业集团有限公司</a>
						<ul>
							<li><em></em>浙江杭州</li>
							<li><em></em>医药制造业</li>
							<li><em></em>诚信示范企业</li>
						</ul>
					</div>
				</div>
			</div>

		</div>


	</div>
	<div class="round029" id="lightShow" style="position: relative;">
		<ul>
			<li class="current" data-nav="lightPage1"></li>
			<li data-nav="lightPage2"></li>
		</ul>
	</div>
</div>
<!--end n-there-->
<div class="n-layout n-main">
	<h2>我们的指导单位</h2>
	<div class="n-zd">
		<div class="n-zd-list">
			<img src="${basePath}/images/new-images/img13.png" /><span></span>
		</div>
		<div class="n-zd-list">
			<img src="${basePath}/images/new-images/img14.png" /><span></span>
		</div>
		<div class="n-zd-list">
			<img src="${basePath}/images/new-images/img15.png" /><span></span>
		</div>
		<div class="n-zd-list">
			<img src="${basePath}/images/new-images/img11.png" /><span></span>
		</div>
		<div class="n-zd-list">
			<img src="${basePath}/images/new-images/img12.png" /><span></span>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp" />

</body>
</html>
