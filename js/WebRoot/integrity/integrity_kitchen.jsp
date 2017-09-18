<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>诚信厨房</title>
    <base href="${basePath}/" />
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/js/uzj/combination.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
	      var CompanySchemaCfg = CompanySchemaCfg || {}
	</script>
</head>

<body data-attr="add_integrity">
<div style="background-color: #fff;">
  <jsp:include page="/user/top.jsp"/>
    <div class="seed-show">
	    <p><a href="${basePath }/user/integrity/kitchen/addInit">申请入驻</a></p>
	</div>
	<div class="layout c-content" id="integritySlide" style="position: relative;">
		<h3>诚信品牌餐饮后厨<span>AFTER DINING KITCHEN</span></h3>		
		<div class="menu-prev" ><em><i id="kitchenLeft" data-nav="lightPage1" style="cursor: pointer;"></i></em></div>
		<div class="menu-next" ><em><i id="kitchenRight" data-nav="lightPage2" style="cursor: pointer;"></i></em></div>
		 <div style="width: 1202px;position: relative;height: 400px;overflow: hidden;">
		    <div data-role="scrollContent" id="scrollDiv" style="position: absolute; overflow: hidden; width: 3402px; transition-duration: 0.5s; transform: translate3d(400px, 0px, 0px); backface-visibility: hidden; left: 0px;margin-left: -399px;">
				<div class="c-int" mark='lightShow' name="lightPage1" style="float: left;">
				
					<div class="int-main-block">
						<img src="${basePath }/images/kitchen/sj10.jpg" />
						<strong>九品火锅餐厅</strong>
					</div>
					<div class="int-main-block">
						<img src="${basePath }/images/kitchen/sj11.jpg" />
						<strong>千岛湖开元度假村（凝香苑）</strong>
					</div>
					<div class="int-main-block">
						<img src="${basePath }/images/kitchen/sj12.jpg" />
						<strong>华侨豪生中餐厅</strong>
					</div>
					<div class="int-main-block">
						<img src="${basePath }/images/kitchen/sj13.jpg" />
						<strong>星都宾馆星樂自助餐厅</strong>
					</div>
					<div class="int-main-block">
						<img src="${basePath }/images/kitchen/sj14.jpg" />
						<strong>虾佬圣汤</strong>
					</div>
				</div>
				<div class="c-int" mark='lightShow' name="lightPage2" style="float: left;">
				
					<div class="int-main-block">
						<img src="${basePath }/images/kitchen/sj15.jpg" />
						<strong>潮牛海记（绍兴投醪河店）</strong>
					</div>
					<div class="int-main-block">
						<img src="${basePath }/images/kitchen/sj16.jpg" />
						<strong>臻货</strong>
					</div>
					<div class="int-main-block">
						<img src="${basePath }/images/kitchen/sj17.jpg" />
						<strong>山葵家精致料理</strong>
					</div>
					<div class="int-main-block">
						<img src="${basePath }/images/kitchen/sj18.jpg" />
						<strong>麦田工坊</strong>
					</div>
					<div class="int-main-block">
						<img src="${basePath }/images/kitchen/sj19.jpg" />
						<strong>牛约潮汕鲜牛肉火锅</strong>
					</div>
				</div>
		</div>
	</div>
	</div>
  <jsp:include page="/footer.jsp" />
</body>
</html>
