<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <base href="${basePath}/"/>
    <title>电商在线</title>
    <link href="${basePath }/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/trade_style.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath}/gov/js/ec/webshop_gov.js" src="${basePath}/gov/js/lib/require.js"></script>
</head>

<body class="container" id="body" data-attr="operate" style="background:#d7d7d7;">
<jsp:include page="/gov/gov_top.jsp"/>
<div class="layout">
    <form>
        <input name="curMainBusiness" type="hidden" value="${ecshop.curMainBusiness }"/>
        <input name="cityCode" type="hidden" value="${ecshop.cityCode }"/>
        <input name="curCreditLevel" type="hidden" value="${ecshop.curCreditLevel }"/>
        <input name="orderField" type="hidden" value="${ecshop.orderField }"/>
        <input name="orderType" type="hidden" value="${ecshop.orderType }"/>
        <input name="key" type="hidden" value="${key }"/>
    </form>
    <jsp:include page="nav.jsp"/>
    <div class="content">
        <!--  <div class="protect"> -->
        <div class="j-container">
            <div class="s-category" id="industryChoose">
                <div class="sl-key"><span>行业</span></div>
                <div class="sl-key-all"><a href="javascript:void(0);" class="${empty ecshop.curMainBusiness ? 'current' : ''}">全部</a>
                </div>
                <div class="sl-value">
                    <c:forEach items="${businessList}" var="business">
                        <a href="javascript:void(0)"
                           class="${ecshop.curMainBusiness == business ? 'current' : '' }">${business}</a>
                    </c:forEach>
                </div>
            </div>
            <div class="s-category s-category-bottom" id="areaChoose">
                <div class="sl-key"><span>地区</span></div>
                <div class="sl-key-all"><a href="javascript:void(0);" class="${empty ecshop.cityCode ? 'current' : ''}">全部</a></div>
                <div class="sl-value">
                    <c:forEach items="${cityMap}" var="city">
                        <a href="javascript:void(0)" data-attr="${city.key}"
                           class="${ecshop.cityCode == city.key ? 'current' : '' }">${city.value }</a>
                    </c:forEach>
                </div>
            </div>
            <%--  <div class="s-category s-category-bottom" id="creditValueChoose">
                 <div class="sl-key"><span>信用星</span></div>
                 <div class="sl-key-all"><a href="#" class="${empty ecshop.curCreditLevel ? 'current' : ''}" >全部</a></div>
                 <div class="sl-value">
                     <c:forEach items="${creditLevelMap }" var="creditLevel">
                         <a href="javascript:void(0)" data-attr="${creditLevel.key }" class="${ecshop.curCreditLevel == creditLevel.key ? 'current' : '' }">${creditLevel.value }</a>
                     </c:forEach>
                 </div>
             </div> --%>
        </div>

        <div class="j-container">
            <div class="mod_search_select" id="orderChoose">
                <div class="sort_b">
                    <a href="javascript:void(0);">排序</a>
                    <a href="javascript:void(0);" id="orderNone"
                       class="${empty ecshop.orderField ? 'current' : ''}">综合</a>
                    <a href="javascript:void(0);" id="orderSaleAmount" data-attr="saleAmount"
                       class="${ecshop.orderField == 'saleAmount' ? 'current' : '' }">销售额
                        <img class="orderImg" style="display:none;" src="${basePath }/images/retils/retails-down.png"/>
                    </a>
                    <a href="javascript:void(0);" id="orderCreditLevel" data-attr="curCreditLevel"
                       class="${ecshop.orderField == 'curCreditLevel' ? 'current' : '' }">信用星
                        <img class="orderImg" style="display:none;" src="${basePath }/images/retils/retails-down.png"/>
                    </a>
                </div>
                <div class="f-search">
                    <input name="" id="webShopKey" type="text" value="${key }"/><a href="javascript:void(0)"
                                                                                   id="webShopSearch"><img
                        src="${basePath }/images/retils/f-search.png"/></a>
                </div>
            </div>
        </div>

        <div class="j-container" id="webShopList">
            <input type="hidden" id="webshopPageId"/>
            <table cellpadding="0" cellspacing="0" border="0" class="spread">
                <tr>
                    <th class="pro01">店铺名称</th>
                    <th class="pro02">主办单位</th>
                    <th class="pro03">销售额（万元/月）</th>
                    <th class="pro04">信用星</th>
                </tr>
                <tbody id="webShop_list">
                <tr model style="display:none;">
                    <td class="pro01">
                        <div class="ico_abs" style="padding-left:0px;">
                            <div class="ico_abs_img"><span></span><img src="${basePath }/images/retils/img6.jpg"/></div>
                            <div class="ico_abs_infor">
                                <h4>{0}</h4>
                                <p><span>行业</span><a href="#">{1}</a></p>
                                <p><span>地区</span>{2}</p>
                            </div>
                        </div>
                    </td>
                    <td class="pro02"><a href="{3}" target="_blank">{4}</a></td>
                    <td class="pro03">{5}</td>
                    <td class="pro04">
                        <div class='istar'
                             config='{"n":{6},"s":50,"size":12,"img":"${basePath}/images/star.png"}'></div>
                    </td>
                </tr>
                </tbody>
                <%--  <c:if test="${!empty pageAll.content }">
                     <c:forEach items="${pageAll.content }" var="ecshop">
                     <tr tag_attr="now_data">
                         <td class="pro01">
                             <div class="ico_abs" style="padding-left:0px;">
                                 <div class="ico_abs_img"><span></span><img src="${basePath }/images/retils/img6.jpg" /></div>
                                 <div class="ico_abs_infor">
                                     <h4>${ecshop.shopName }</h4>
                                     <p><span>行业</span><a href="#">${ecshop.curMainBusiness }</a></p>
                                     <p><span>地区</span>${empty ecshop.city ? '未知' : ecshop.city }</p>
                                 </div>
                             </div>
                         </td>
                         <td class="pro02"><a href="${basePath }/company/professionalInfo?s=${ecshop.companyNo}&shopname=${ecshop.shopName}" target="_blank">${ecshop.companyName }</a></td>
                         <td class="pro03">${ecshop.saleAmountShow }</td>
                         <td class="pro04"><div class='istar' config='{"n":${empty ecshop.curCreditLevel ? 0 : ecshop.curCreditLevel},"s":50,"size":12,"img":"${basePath}/images/star.png"}'></div></td>
                     </tr>
                     </c:forEach>
                 </c:if> --%>
            </table>


            <div class="s-page" config='{name: "shop", url:"${basePath }/gov/user/ebusiness/monitor/shop/list/ajax?dataEcShop=${param.dataEcShop}&key=${param.key}", nodata:"#nodata_shop", pin:2, isAjax:true, autoLoad:true}'></div>

        </div>
        <div class="detail_nodata j-container" id="nodata_shop" style="display:none;width:99.9%;">
            未查询到相关信息
        </div>

        <div class="f-adv">
            <p>广告AD</p>
        </div>

        <!-- </div> -->
    </div>
    <%--    <div class="right">
                <div class="recent" id="ecshopVisited"></div>
         </div> --%>
    <!-- <div class="ret-right">
        <div class="j-container">
            <div class="j-padding" id="ecshopVisited">
                <h3>本周店铺热度排行榜</h3>
               <div class="j-bl">
                    <p><em class="j-number">1</em>ALTFINEISM官方旗舰店</p>
                    <h4>
                        <b>24888</b>
                        <div class="j-score"><i></i></div>
                    </h4>
                </div>
            </div>
        </div>
        <div class="j-container">
            <div class="j-padding">
                <a href="http://c.trustutn.org/plan.jsp" target="_blank" class="j-btn">网店认证通道  ></a>
            </div>
        </div>
    </div> -->
</div>
<jsp:include page="/gov/footer.jsp"/>
</body>
</html>