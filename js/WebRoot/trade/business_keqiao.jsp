<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>柯桥轻纺城-之江信用</title>
	<base href="${basePath }/" />
	<link href="${basePath }/style/new/trade_style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/business_keqiao.js" src="${basePath }/js/lib/require.js"></script>
	<script>
	   var cfg =  cfg || {
		   companyDetailUrl: '${companyDetailUrl}'
	   }
	</script>
  </head>
  <body data-attr="ecshop">
	<jsp:include page="../user/top.jsp"/>
	
	<div class="layout content" trade_left='3' >
    <jsp:include page="/trade/left.jsp" />
    <div class="main main2">
      <div class="fancy">
        <ul>
          <li class="active"><img src="${basePath}/images/trade-images/retails-keqiao-bg.jpg"></li>
        </ul>
        <a href="javascript:void(0);" class="fancy-left"><img src="${basePath}/images/trade-images/retails-img01.jpg"></a>
        <a href="javascript:void(0);" class="fancy-right"><img src="${basePath}/images/trade-images/retails-img02.jpg"></a>
			</div>
      <div class="ret-content">
        <div class="ret-title"><p>柯桥轻纺城</p></div>
        <div class="ret-induct">
           <p>绍兴柯桥轻纺位于浙江绍兴，总建筑面积208万平方米，经营者10000多户，营业用房15000多间。经营面料3万余种，日客流量10万人次，产品销往173个国家和地区，常驻境外采购商2000余人，2005年成交额276亿元，是目前全国规模最大，设备最齐全，经营品种最多的纺织品集散中心，是亚洲的轻纺专业市场。</p>
					<p>官方网站：<a href="http://www.qfc.cn/" target="_blank">http://www.qfc.cn/</a></p>
					<div class="kq-logo">
						<img src="${basePath}/images/trade-images/kq-logo.jpg">
					</div>
				</div>
      </div>
       <div class="ret-content">
        <div class="ret-title"><em>注：企业“诚信指数”数据来源于网站“网上轻纺城”</em><p>诚信企业名录</p></div>

           <div class="ret-data" id="noData" style="display:none">
              <img src="${basePath}/images/trade-images/retails-img06.jpg">
               <h3>暂无数据</h3>
	      </div>


	         <div class="ret-list" id="keqiaoTable">
	        	<div class="ret-list-block" model>
	        		<h2><a target="_blank" href="{6}">{0}</a></h2>
	        		<div class="ret-list-lf">
	        			<p>企业法人：<span>{1}</span></p>
	        			<p>注册资本：<span>{2}</span></p>
	        			<p>经营年限：<span>{3}</span></p>
	        		</div>
	        		<div class="ret-list-md">
	        			<img src="${basePath}/images/trade-images/kq-line.png">
	        		</div>
	        		<div class="ret-list-rt">
	        			<div class="ret-list-star">
	        				<img src="${basePath}/{5}"/>
	        			</div>
	        			<p><a target="_blank" href="{4}">轻纺城 . 诚信指数</a></p>
	        		</div>
	        	</div>
	         </div>  
             <div class="d-page" config='{name: "keqiaoTable", url:"${basePath}/trade/keqiao/ajax/list", npage:1, pin:2, isAjax:true,autoLoad:true,nodata:"#noData"}'></div>

        </div>        
      </div>
    </div>
    </div>
     <jsp:include page="../footer.jsp" />
  </body>
</html>