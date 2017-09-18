<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<div class="n-banner" style="position: relative;">
	<div class="notice522">
		<div class="n-layout index-notice">
			<span>浙江省商贸流通业诚信示范企业评选活动火热进行中</span>
			<a href="${basePath}/taca/index">查看详情</a><a href="${basePath}/taca/immediately/declare">立即申报</a>
		</div>
	</div>
	<div class="n-layout n-b-index">
		<h2>浙江省商务信用公众服务平台</h2>
		<h4>企业信用档案共享至国家发改委全国信用信息系统</h4>
		<div class="n-b-input">
			<form method="get" id="searchForm" action="${basePath}/search">
				<input name="key" type="text" id="searchKey" placeholder="可以输入企业名称、法人、股东、高管、品牌等进行查询" />
				<a href="javascript:void(0)" id="btn-search"></a>
			</form>
			<p>或者点击
			  <a href="javascript:void(0);" id="industry_modal_button" >行业</a>
			</p>
		</div>
		<div class="n-b-industry" id="industry_modal_show" style="display:none;left:40%;margin:80px auto 0;">
			<h3>行业选择<a href="javascript:void(0);" id="industry_modal_close_btn"><img src="${basePath}/images/new-images/icon_y_05.png"/></a></h3>
			<div class="industry-main">
				<a href="${basePath}/search?searchType=all">全部</a>
				<a href="${basePath}/search?industryName=制造业">制造业</a>
				<a href="${basePath}/search?industryName=批发和零售业">批发和零售业</a>
				<a href="${basePath}/search?industryName=租赁和商务服务业">租赁和商务服务业</a>
				<a href="${basePath}/search?industryName=建筑业">建筑业</a>
				<a href="${basePath}/search?industryName=房地产业">房地产业</a>
				<a href="${basePath}/search?industryName=交通运输、仓储和邮政业">交通运输、仓储和邮政业</a>
				<a href="${basePath}/search?industryName=居民服务、修理和其他服务业">居民服务、修理和其他服务业</a>
				<a href="${basePath}/search?industryName=金融业">金融业</a>
				<a href="${basePath}/search?industryName=科学研究和技术服务业">科学研究和技术服务业</a>
				<a href="${basePath}/search?industryName=信息传输、软件和信息技术服务业">信息传输、软件和信息技术服务业</a>
				<a href="${basePath}/search?industryName=农、林、牧、渔业">农、林、牧、渔业</a>
				<a href="${basePath}/search?industryName=住宿和餐饮业">住宿和餐饮业</a>
				<a href="${basePath}/search?industryName=文化、体育和娱乐业">文化、体育和娱乐业</a>
				<a href="${basePath}/search?industryName=水利、环境和公共设施管理业">水利、环境和公共设施管理业</a>
				<a href="${basePath}/search?industryName=电力、热力、燃气及水生产和供应业">电力、热力、燃气及水生产和供应业</a>
				<a href="${basePath}/search?industryName=教育">教育</a>
				<a href="${basePath}/search?industryName=采矿业">采矿业</a>
				<a href="${basePath}/search?industryName=卫生和社会工作">卫生和社会工作</a>
				<a href="${basePath}/search?industryName=公共管理、社会保障和社会组织">公共管理、社会保障和社会组织</a>

			</div>

		</div>
		<div class="maybe">
			<h3>也许你还不知道成功<span>认领企业</span>后可以<span>免费享受</span>哪些服务？<a href="${basePath}/benefit.jsp" style="text-align: center;"><img src="${basePath}/images/new-images/handes.png" /></a></h3>
		</div>
	</div>
</div>
<!--end n-banner-->

<div class="n-layout n-main">
	<h2>诚信企业展示台</h2>
	<div style="width: 1202px; overflow: hidden; height: 396px;position: relative;">
		<div data-role="scrollContent" id="scrollDiv" style="position: absolute; overflow: hidden; width: 3402px; transition-duration: 0.5s; transform: translate3d(400px, 0px, 0px); backface-visibility: hidden; left: 0px;margin-left: -399px;">
			<div class="all029 all029-hover" mark='lightShow' name="lightPage1" style="float: left;">
				<a href="${basePath}/company/professionalInfo?s=91321859474897794995309536497437">
					<div class="n-there-list">
						<div class="clogo">
							<img src="${basePath}/images/there01.jpg" /><span></span>
						</div>
						<h4>杭州娃哈哈集团有限公司</h4>
						<ul>
							<li class="nil">浙江杭州</li>
							<li class="ni2">食品/饮料制造业</li>
							<li class="ni3">诚信示范企业</li>
						</ul>
					</div>
				</a>
				<a href="${basePath}/company/professionalInfo?s=91074231983628088797292208772024">
					<div class="n-there-list">
						<div class="clogo">
							<img src="${basePath}/images/there02.jpg" /><span></span>
						</div>
						<h4>雅戈尔集团股份有限公司</h4>
						<ul>
							<li class="nil">浙江宁波</li>
							<li class="ni4">服装制造</li>
							<li class="ni3">诚信示范企业</li>
						</ul>
					</div>
				</a>
				<a href="${basePath}/company/professionalInfo?s=55957308397149761611682642756068">
					<div class="n-there-list">
						<div class="clogo">
							<img src="${basePath}/images/there05.jpg" /><span></span>
						</div>
						<h4>红蜻蜓集团有限公司</h4>
						<ul>
							<li class="nil">浙江永嘉</li>
							<li class="ni5">商务服务业</li>
							<li class="ni3">诚信示范企业</li>
						</ul>
					</div>
				</a>
				<a href="${basePath}/company/professionalInfo?s=95273948247676763455733286733135">
					<div class="n-there-list">
						<div class="clogo">
							<img src="${basePath}/images/there03.jpg" /><span></span>
						</div>
						<h4>万向集团公司</h4>
						<ul>
							<li class="nil">浙江杭州</li>
							<li class="ni2">汽车制造业</li>
							<li class="ni3">诚信示范企业</li>
						</ul>
					</div>
 			  </a>
			</div>
			<div class="all029 all029-hover" mark='lightShow'  name="lightPage2" style="float: left; ">
				 <a href="${basePath}/company/professionalInfo?s=17730101423744861850365644445409">
					<div class="n-there-list">
						<div class="clogo">
						<img src="${basePath}/images/there07.jpg" /><span></span>
						</div>
						<h4>杭州老板电器股份有限公司</h4>
						<ul>
							<li class="nil"><em></em>浙江杭州</li>
							<li class="ni6"><em></em>电器机械和器材制造业</li>
							<li class="ni3"><em></em>诚信示范企业</li>
						</ul>
					</div>
				 </a>
				 <a href="${basePath}/company/professionalInfo?s=93002015361191810099858333415383">
					<div class="n-there-list">
						<div class="clogo">
						<img src="${basePath}/images/there08.jpg" /><span></span>
						</div>
						<h4>杭州民生药业集团有限公司</h4>
						<ul>
							<li class="nil"><em></em>浙江杭州</li>
							<li class="ni7"><em></em>医药制造业</li>
							<li class="ni3"><em></em>诚信示范企业</li>
						</ul>
					</div>
				 </a>
				 <a href="${basePath}/company/professionalInfo?s=16659903918956869663196380462734">
					<div class="n-there-list">
						<div class="clogo">
						<img src="${basePath}/images/there06.jpg" /><span></span>
						</div>
						<h4>浙江报喜鸟服饰股份有限公司</h4>
						<ul>
							<li class="nil">浙江永嘉</li>
							<li class="ni8">批发业</li>
							<li class="ni3">诚信示范企业</li>
						</ul>
					</div>
				</a>
				<a href="${basePath}/company/professionalInfo?s=98932256307331786777660824265196">
					<div class="n-there-list">
						<div class="clogo">
						<img src="${basePath}/images/there04.jpg" /><span></span>
						</div>
						<h4>正泰集团股份有限公司</h4>
						<ul>
							<li class="nil"><em></em>浙江乐清</li>
							<li class="ni9"><em></em>机器设备/仪器仪表制造业</li>
							<li class="ni3"><em></em>诚信示范企业</li>
						</ul>
					</div>
				</a>
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


<!--end 诚信企业展示台-->
<div class="n-there">
	<div class="n-layout n-main">
		<h2>服务优势</h2>
		<div class="all029">
			<div class="n-main-r-list">
				<img src="${basePath}/images/new-images/img06.png" />
				<h3>更实用</h3>
				<p>提供专业的企业信息查询服务，政务便民服务，失信举报及预警服务，企业信用提升指导服务，企业品牌推广服务</p>
			</div>
			<div class="n-main-r-list">
				<img src="${basePath}/images/new-images/img07.png" />
				<h3>更可靠</h3>
				<p>绕开数据采集时遇到的脱敏技术，采用360云安全保障体系，确保数据及网络的安全，打造可靠理想的数据使用环境</p>
			</div>
			<div class="n-main-r-list">
				<img src="${basePath}/images/new-images/img08.png" />
				<h3>更全面</h3>
				<p>接入多方数据，政府部门数据，企业数据，行业经营数据，金融数据，覆盖面广而不泛，多维度展示信用信息</p>
			</div>
			<div class="n-main-r-list" style="margin-right:0;">
				<img src="${basePath}/images/new-images/img09.png" />
				<h3>更高效</h3>
				<p>高性能大数据存储平台，实时处理海量数据，简化应用场景，将数据快速有效的传递到用户身边</p>
			</div>
		</div>
	</div>
</div>
<!--end n-main-->

<div class="n-layout n-main">
	<h2>指导单位</h2>
	<div class="all029" style="margin-bottom: 0;">
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
		<div class="n-zd-list" style="border-right: 0;">
			<img src="${basePath}/images/new-images/img12.png" /><span></span>
		</div>
	</div>
</div>
