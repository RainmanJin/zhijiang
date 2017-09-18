<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>义乌小商品市场</title>
	<base href="${basePath }/" />
	<link href="${basePath }/style/new/trade_style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/trade.js" src="${basePath }/js/lib/require.js"></script>
  </head>
  <body data-attr="ecshop">
	<jsp:include page="/user/top.jsp"/>
	
	<div class="layout content" trade_left='2' >
        <jsp:include page="/trade/left.jsp" />
        <div class="main main2">
        	<div class="fancy">
                <ul>
                	<li class="active"><img src="${basePath}/images/trade-images/retails-yiwu-bg.jpg"></li>
                </ul>
                <a href="javascript:void(0);" class="fancy-left"><img src="${basePath}/images/trade-images/retails-img01.jpg"></a>
                <a href="javascript:void(0);" class="fancy-right"><img src="${basePath}/images/trade-images/retails-img02.jpg"></a>
			</div>
            <div class="ret-content">
            	<div class="ret-title"><p>义乌小商品市场</p></div>
                <div class="ret-induct">
                	<p>全球最大的小商品市场-中国义乌小商品市场，现大部份市场及专业街已移入义乌国际商贸城。许多人是从小商品开始了解义乌的，在中国凡是做小商品生意的人都知道在义乌能找到品种最全、价格最便宜的小商品。可以说是小商品让义乌这个十年前还默默无闻的县级市扬名海内外的。</p>
                    <p>义乌的小商品闻名海内外，从针头儿线脑儿、鞋带儿、纽扣儿、拉锁儿、牙签儿到精致的礼品、精美的饰物；从鞋袜、围巾、帽子、服装到毛纺织品；从各种玩具、打火机到电视机、红木家具、各种五金工具、和电子产品。据统计，2001年义乌商品市场成交额高达211.97亿元，商品成交额已经连续11年位居全国十大集贸市场榜首。</p>
					 <p>官方网站：<a href="http://www.yiwugou.com/" target="_blank">http://www.yiwugou.com/</a></p>
				</div>
            </div>
            <div class="ret-content">
            	<div class="ret-title"><p>诚信企业名录</p></div>
                <div class="ret-data">
                    <img src="${basePath}/images/trade-images/retails-img06.jpg">
                    <h3>暂无数据</h3>
				</div>
            </div>
            <div class="ret-apply">
            	<p><a href="javascript:void(0);">申请加入</a></p>
            </div>
        </div>
    </div>
     <jsp:include page="/footer.jsp" />
 </body>
</html>