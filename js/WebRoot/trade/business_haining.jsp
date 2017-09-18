<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>海宁皮革城-之江信用</title>
	<base href="${basePath }/" />
	<link href="${basePath }/style/new/trade_style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/trade.js" src="${basePath }/js/lib/require.js"></script>
  </head>
  <body data-attr="ecshop">
	<jsp:include page="/user/top.jsp"/>
	
	<div class="layout content" trade_left='1' >
        <jsp:include page="/trade/left.jsp" />
        <div class="main  main2">
        	<div class="fancy">
                <ul>
                	<li class="active"><img src="${basePath}/images/trade-images/retails-haining-bg.jpg"></li>
                </ul>
                <a href="javascript:void(0);" class="fancy-left"><img src="${basePath}/images/trade-images/retails-img01.jpg"></a>
                <a href="javascript:void(0);" class="fancy-right"><img src="${basePath}/images/trade-images/retails-img02.jpg"></a>
			</div>
            <div class="ret-content">
            	<div class="ret-title"><p>海宁皮革城</p></div>
                <div class="ret-induct">
                	<p>海宁中国皮革城于1994年建成开业，是中国具影响力的皮革专业市场，中国皮革业龙头市场，中国皮革服装、裘皮服装、毛皮服装、皮具箱包、皮毛、皮革、鞋类的集散中心，也是皮革价格信息、市场行情、流行趋势的发布中心。</p>
                    <p>海宁中国皮革城总部市场及配套设施总建筑面积约月100万平方米，设有A座、B座（皮装·鞋业广场）、C座（皮草广场）、D座（裘皮广场）、E座（女装馆）、F座（品牌旗舰店广场）以及原辅料市场、品牌风尚中心等区块。市场荟萃了国内外一流的皮衣、裘皮、皮毛、箱包、鞋类品牌，经营户3500多家，高峰时期日客流量达10万人次，年交易额150亿元。</p>
                    <p>官方网站：<a href="http://www.haipicheng.com/" target="_blank">http://www.haipicheng.com/</a></p>
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