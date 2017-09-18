<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <title>电商在线</title>
	    <base href="${basePath}/" />
	    <%--<link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css" />--%>
	    <%--<link href="${basePath }/style/new/trade_style.css" rel="stylesheet" type="text/css" />--%>
        <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
        <link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
		<script data-main="${basePath }/js/uzj/combination.js" src="${basePath }/js/lib/require.js"></script>
		<script type="text/javascript">
			var CompanySchemaCfg = CompanySchemaCfg || {
				cookieValue:'${SHUIDIXY_ECSHOP_COOKIE}',
				companyDetailUrl:"${fn:replace(companyDetailUrl, 'companyNo', '{0}')}"
			}
		</script>
	</head>
	<body style="background:#f9f9f9;" class="container-bg" data-attr="retails">
		<jsp:include page="/user/top.jsp"/>
		<div class="layout ret">
			<form>
				<input name="curMainBusiness" type="hidden" value="${ecshop.curMainBusiness }" />
				<input name="cityCode" type="hidden" value="${ecshop.cityCode }" />
				<input name="curCreditLevel" type="hidden" value="${ecshop.curCreditLevel }" />
				<input name="orderField" type="hidden" value="${ecshop.orderField }" />
				<input name="orderType" type="hidden" value="${ecshop.orderType }" />
				<input name="key" type="hidden" value ="${key }" />
			</form>	
		   
		        <div class="j-container">
		            <div class="s-category" id="industryChoose">
		                <div class="sl-key" ><span class="sl-span">行业</span></div>
		                <div class="sl-key-all"><a href="javascript:void(0)" class="${empty ecshop.curMainBusiness ? 'current' : ''}">全部</a></div>
		                <div class="sl-value">
		                	<c:forEach items="${businessList}" var="business">
		                		<a href="javascript:void(0)" class="${ecshop.curMainBusiness == business ? 'current' : '' }">${business}</a>
		                	</c:forEach>
		                </div>
		            </div>
		            <div class="s-category s-category-bottom" id="areaChoose">
		                <div class="sl-key"><span class="sl-span">地区</span></div>
		                <div class="sl-key-all"><a href="javascript:void(0)" data-attr="" class="${empty ecshop.cityCode ? 'current' : ''}">全部</a></div>
		                <div class="sl-value" >
		                	<c:forEach items="${cityMap}" var="city">
		                		<a href="javascript:void(0)" data-attr="${city.key }" class="${ecshop.cityCode == city.key ? 'current' : '' }">${city.value }</a>
		                	</c:forEach>
		                </div>
		            </div>
		           <%--  <div class="s-category s-category-bottom" id="creditValueChoose">
		                <div class="sl-key"><span>信用星</span></div>
		                <div class="sl-key-all"><a href="#" data-attr="" class="${empty ecshop.curCreditLevel ? 'current' : ''}" >全部</a></div>
		                <div class="sl-value">
		                	<c:forEach items="${creditLevelMap }" var="creditLevel">
		                		<a href="javascript:void(0)" data-attr="${creditLevel.key }" class="${ecshop.curCreditLevel == creditLevel.key ? 'current' : '' }">${creditLevel.value }</a>
		                	</c:forEach>
		                </div>
		            </div> --%>
		        </div>
		
		        <div class="j-container">
		            <div class="mod_search_select">
		                <div class="sort_b"  id="orderChoose">
		                    <a href="javascript:void(0)" data-attr="">排序</a>
		                    <a href="javascript:void(0)" id="orderNone" data-attr=""  class="${empty ecshop.orderField ? 'current' : ''}" >综合</a>
		                    <a href="javascript:void(0)" id="orderSaleAmount" data-attr="saleAmount" class="${ecshop.orderField == 'saleAmount' ? 'current' : '' }" >销售额
		                    	<img class="orderImg" style="display:none;" src="${basePath }/images/retils/retails-down.png"  />
		                    </a>
		                    <a href="javascript:void(0)" id="orderCreditLevel" data-attr="curCreditLevel" class="${ecshop.orderField == 'curCreditLevel' ? 'current' : '' }" >信用星
		                    	<img class="orderImg" style="display:none;" src="${basePath }/images/retils/retails-down.png"  />
		                    </a>
		                </div>
		                <div class="f-search" id="webShopK">
		                    <input name="" id="webShopKey" type="text" value="${key }" /><a href="javascript:void(0)" id="webShopSearch"><img src="${basePath }/images/retils/f-search.png" /></a>
		                </div>
		            </div>
		        </div>
			 	<div class="ret-left">
		        <div class="j-container" id="webShopList">
		        	<input  type="hidden" id="webshopPageId" value="0"/>
		            <table cellpadding="0" cellspacing="0" border="0" class="spread">
		                <tr>
		                    <th class="pro01">店铺名称</th>
		                    <th class="pro02">主办单位</th>
		                    <th class="pro03">销售额（万元/月）</th>
		                    <th class="pro04">信用星</th>
		                </tr>
		                <tbody id="webShop_tr">
			                <tr model>
			                	<td class="pro01" >
			                        <div class="ico_abs" style="padding-left:0px;">
			                            <div class="ico_abs_img"><span></span><img src="${basePath }/images/retils/img6.jpg" /></div>
			                            <div class="ico_abs_infor" id="ico_abs_infor">
			                                <h4 id="showLength" show_length="6">{0}</h4>
			                                <p><span>行业</span><a href="javascript:void(0)">{1}</a></p>
			                                <p><span>地区</span>{2}</p>
			                            </div>
			                        </div>
			                    </td>
			                    <td class="pro02"><a href="{3}" target="_blank">{4}</a></td>
			                    <td class="pro03">{5}</td>
			                    <td class="pro04"><div class='istar' config='{"n":{6},"s":50,"size":12,"img":"${basePath}/images/star.png"}'></div></td>
			                </tr>
		                </tbody>
		            </table>
                    <div class="d-page" config='{name: "webShopInfo", url:"${basePath }/trade/webshop/list", nodata:"#detail_nodata", pin:3, isAjax:true}'></div>
		        </div>

		        <div class="detail_nodata j-container" id="detail_nodata" style="display:none;width:99.9%;" >
		        			未查询到相关信息
				</div>
		        <div class="f-adv">
		            <p>广告AD</p>
		        </div>
		
		    </div>
			 <div class="right" style="width:27%;">
					<div class="recent" id="ecshopVisited"></div>

                 <div class="j-container" style="padding-bottom: 0">
                     <div class="j-padding">
                         <a href="http://c.trustutn.org/plan.jsp" target="_blank" class="j-btn">网店认证通道</a>
                     </div>
                 </div>
		     </div>
		</div>
		<jsp:include page="/footer.jsp" />
	</body>
</html>