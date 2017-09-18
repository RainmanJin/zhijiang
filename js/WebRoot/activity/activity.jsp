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
		<link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />
		<meta property="qc:admins" content="1453276267425345466727" />
		<script data-main="${basePath }/js/uzj/activity.js" src="${basePath }/js/lib/require.js"></script>
		<script>
			var activityCfg = activityCfg || {page : 'activity'};
		</script>
	</head>
	<body id="body">
   <jsp:include page="../user/top.jsp" />

	 <!--header-->
	 <div id="banner_y" class="w100"><a id="button_y" href="javascript:void(0);">立即申报</a></div> 
	 <!--activity-->
	 <div id="activity_forecast_y" class="w100">
	   <ul>
	    <li class="f_l enterprise_y">
	      <p class="w190">已参选企业：</p>
	      <p class="w125">${empty companyCount ? 0 : companyCount}</p>
	      <p class="w58">家</p>
	    </li>
	    <li class="f_r countdown_y">
	      <p class="w136">距结束：</p>
	      <p class="w60" attr-role="day"></p>
	      <p class="w58">天</p>
	      <p class="w60" attr-role="hour"></p>
	      <p class="w58">时</p>
	      <p class="w60" attr-role="minite"></p>
	      <p class="w58">分</p>
	      <p class="w60" attr-role="second"></p>
	      <p class="w58">秒</p>
	    </li>
	   </ul>
	   <div class="clear"></div>
	 </div>
	 
	 <!--image_text-->
	 <div id="tetle_y" class="w100">
	   <p class="down_y"></p>
	   <font>我们能为企业提供哪些服务？</font><br/>
	         以下服务针对信用评级三星及以上的企业
	 </div>
	 
	 <div id="image_text_y" class="w100 bg_y_f">
   	   <div class="image_text_y bg_pic_01">
	      <h3>点亮企业<font>信用彩虹</font></h3>
	      <dl>
			  都说光代表着希望，信用彩虹让企业信誉不再黯淡，
			   让用户看着更加放心。
	      </dl>
	     <span>甲方：“哟，点亮后好像确实有点好看嘛……”<br/>
			    乙方：“对呀对呀，人靠衣装，企业详情页靠彩虹装……”
	     </span>
	  </div>
    </div>
    
	<div id="image_text_y" class="w100">
	  <div class="image_text_y bg_pic_02">
	    <h3 class="number2_y">平台推荐<font>企业名录</font>展示</h3>
	    <dl>
	            之江信用平台首页展示，建设企业信用形象，让用户第一眼就看到你，有效提升企业访问量。
	    </dl>
	    <span>甲方：“这位置采光不错，邻里气氛融洽，我很满意……”<br/>
	                  乙方：“知道吗，您的满意可是对我KPI莫大的支持啊……”
	    </span>
	  </div>
	</div>	
	
	<div id="image_text_y" class="w100 bg_y_f">
	  <div class="image_text_y bg_pic_03">
	    <h3 class="number3_y">360搜索展示<font>企业信用信息</font></h3>
	    <dl>
	                     搜索只是一种方式，而信用却是一种态度。之江信用
	                     联合凭安水滴，借助360搜索展示企业信用信息，抓得住流量，看得见信任。
	    </dl>
	  </div>
	</div>
	
	<div id="image_text_y" class="w100">
       <div class="image_text_y">
		   <h3 class="number4_y">诚信企业<font>电子证书</font></h3>
		   <dl>
			      诚信企业电子证书彰显企业信用形象，加持企业信誉，
			      一证在手，诚信我有
			    </dl>
		   <span>甲方：“啥，我结果能发朋友圈吗？”<br/>
			   OS：其实我就想炫耀下下<br/>
			        乙方：“啊，那，那您就把诚信企业电子证书截个图发朋友圈呗…”<br/>
			   OS：其实我懂您想炫耀的心
		   </span>
	   </div>
	</div>
    
    <!--selection-->
	<div id="tetle_y" class="w100">
	  <p class="down_y"></p>
	  <font>评选流程</font>
	 </div>
	  
	<div id="selection_y" class="w100">
	  <div class="selection_y">
	    <dl>
	                 注：付款说明请见下面的<font class="color_44c">“活动细则”</font>初审时间按活动截止的次日（2016年10月26日）起算，复审及信息公示涉及时间依次类推
	    </dl>
	  </div>
	</div>
	
	<!--information-->
	<div id="tetle_y" class="w100">
	  <p class="down_y"></p>
	  <font>您需要提供的信息</font>
	</div>
	
	<div id="information_y" class="w100">
	  <ul class="information_y">
	    <li class="inf_y_1">
	      <h3>文字信息</h3>
	      <h4>申报者个人信息：</h4>
	      <h5>真实姓名、联系方式、工作邮箱</h5>
	      <h4>企业基本信息：</h4>
	      <h5>名称、行业分类、所在地、联系电话、网站地址；</h5>	      	      
	      <p>注：若企业暂无网站地址，此项可以不填写</p>
	    </li>
	    <li class="inf_y_2">
	      <h3>基础类实体信息</h3>
	      <h4>申报者企业名片</h4>	      
	      <h4>企业工商营业执照</h4>
	      <h4>行业经营许可证</h4>	      
	    </li>
	    <li class="inf_y_3">
	      <h3>增信类实体信息</h3>
	      <h4>企业经营状况信息</h4>
	      <h4>企业人事信息</h4>
	      <h4>企业资产清单</h4>
	      <h4>企业债务债券类合同</h4>
	      <h4>企业信用类资料</h4>
	      <h4>各类权证证明</h4>	      
	      <p>注：以上信息，申报者可选择性上传</p>
	    </li>
	  </ul>
	  <div class="clear"></div>
	</div>
	
	<div id="tetle_y" class="w100">
	  <p class="down_y"></p>
	  <font>活动细则</font>
	</div>
	
    <div id="activity_rules_y" class="w100">
	  <div id="rules_y">
	    <dl>
	      <p><font class="color_ffo">【活动时间】</font><span>即日起至2016年12月31日；</span></p>
	      <p><font class="color_ffo">【活动对象】</font><span>本活动面向所属行业协会的会员企业，且在工商行政管理部门注册登记满3年以上，具有２年以上稳定的经营记录；</span></p>
	      <p><font class="color_ffo">【付款说明】</font><span>之江信用建立企业信用档案技术服务费实行统一标准，每家企业服务费为500元/年，内容涵盖：信息审核、增信咨询、企业信用档案建设、企业信用监控、电子证书制作及公示（该项仅针对信用评级三星以上的企业）
			注：该技术服务费不以评选成功为前提，不支持退款；</span></p>
	      <p><font class="color_ffo">&nbsp;<br/>
		        【活动说明】</font><span>1. 活动期间每个企业用户仅能在线申报一次，且需按规定提交资料。若通过审核，平台客服人员会在第一时间致电申报者并将结果发至您的工作邮箱，在5个工作日内<br />
		        安排企业信用信息的线上展示（协会负责线下实体证书制作与收费）；<br />
		        2. 初审：活动截止次日，平台将针对申报者提交的资料对企业信用状况作信用评分，与行业协会的评分结 果（行业协会评价以其自有的一套评价系统为标准）合并形<br/>
		        成初步的综合信用分；<br />
	        3. 复审：结合第三方信用信息，平台审核其有无失信行为、负面新闻等，得出最终的信用评级；<br />
	        4. 评级说明：<br />
	        <img src="${basePath}/images/new-images/explain_y_01.jpg" style="margin-bottom: 10px;"  /><br>
	        5. 参加本活动的企业， 一律默认为已完整阅读《隐私协议》和《服务条款》，并完全理解及全部同意，因此希望申报者在申报前仔细阅读；<br />
	        6. 本次活动最终解释权归之江信用平台所有；<br />
	        7. 活动过程中如有任何问题，您都可以在线咨询我们的客服小江,或拨打客服热线：0571-8769-2515</span></p>
	      <div class="clear"></div>
	    </dl>
	    <a class="button_y1" id="button_y1" href="javascript:void(0);">立即申报</a> 
	  </div>
    </div>
	
	<!--sponsor-->
	<div class="sponsor_y">
	   <div class="s_main_y">
	      <span>主办方：（主办单位及活本次活动动运营商）<img src="${basePath}/images/new-images/logo.png" /></span>
	      <p></p>
	      <span style="padding-top: 7px;">联合主办：<img src="${basePath}/images/new-images/logo_y_02.png" /></span>
	    </div>
	</div>
	 <jsp:include page="/footer.jsp" />
  </body>
</html>
