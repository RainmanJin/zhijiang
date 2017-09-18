<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>品牌保护-之江信用</title>
    <base href="${basePath}/"/>
    <link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/gov/js/lib/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${basePath }/gov/js/lib/My97DatePicker/WdatePicker.js"></script>
    <script data-main="${basePath }/gov/js/protect.js" src="${basePath }/gov/js/lib/require.js"></script>
</head>

<body class="container" data-attr="excitation" style=" background-color:#e8edf0;">
<jsp:include page="/gov/gov_top.jsp"/>
<div class="layout">
    <div class="p-right new-p-right">
       <%--  <div class="right-banner">
            <p class="banner-s">
                <input name="" type="text"  value="请输入企业名或企业名包含的关键词" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999"/>
                <input name="" type="text" placeholder="请输入企业名或企业名包含的关键词"/>
                <a href="javascript:void(0)"></a>
            </p>
        </div> --%>
        <div class="content" style="background-color:#fff;">
            <div class="protect">

                <div class="protect-dis protect-bg"><!-- style="width:100%; overflow:hidden;"-->

                    <div class="" style="float:left; width:75%;">
                        <div class="protect-t"><p>浙江品牌——张小泉</p></div>
                        <div class="protect-trend protect-bg">
                            <div class="protect-pad">
                                <div class="gk-line">
                                    <p class="mbc_title3">
                                        <em class="mbc_line3"></em>
                                        <span class="mbc_title_warp3"><em class="font_f_13">趋势概况<i></i></em></span>
                                    </p>
                                </div>
                                <div class="gk-time">
                                    <p>范围：<span> <a class="left-title-a" id="areachoose" href="javascript:void(0)"
                                                    code="-1" style="color: #1d97ff">全国</a></span></p>
                                    <p>请选择时间：<span>
                                  <input class="Wdate" style="margin-left: 5px;margin-right: 5px;padding: 0 5px;"
                                         type="text" id="startStatDate" onchange="changeStatDate()"
                                         onFocus="WdatePicker({skin:'whyGreen',isShowClear:false,readOnly:true,dateFmt:'yyyy-MM'})"/>至
                                    <input class="Wdate" style="margin-left: 5px;margin-right: 5px;padding: 0 5px;"
                                           type="text" id="endStatDate" onchange="changeStatDate()"
                                           onFocus="WdatePicker({skin:'whyGreen',isShowClear:false,readOnly:true,dateFmt:'yyyy-MM'})"/>
                                </span></p>

                                </div>
                                <div class="area"
                                     style="display:none; margin-top: -14px;z-index: 9;position:absolute; right: 2%;"></div>
                                <div class="gk-chart">
                                    <div id="container" style="min-width:550px;height:321px"></div>
                                    <%-- <img src="${basePath}/images/spvision_images/b-img12.png" /> --%>
                                    <!-- <div class="gk-choose">
                                       <p class="choose1">企业授权网点</p>
                                       <p class="choose2">未经企业授权网点</p>
                                   </div>  -->
                                    <div style=" position:absolute; bottom:43px; right:10px; color:#b1b1b1;">
                                        数据统计来源：天猫/淘宝
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pro-same">
                        <div class="same-title"><p>各品牌当月全国分布网点数</p></div>
                        <div class="same-tab">
                            <input type="hidden" id="currentBrandName" value="张小泉"/>
                            <table cellpadding="0" cellspacing="0" border="0" id="brandTable">
                                <tr>
                                    <td class="sam01"><em class="em-yellow">1</em><label>天堂伞</label></td>
                                    <td class="sam02">
                                        <p class="sam-bottom" style="width: 2%;"></p>
                                        <p class="sam-green" style="width: 100%;"></p>
                                    </td>
                                    <td class="sam03">
                                        <p>1</p>
                                        <p>5157</p>
                                    </td>
                                </tr>
                                <tr class="current">
                                    <td class="sam01"><em class="em-yellow">2</em><label>张小泉</label></td>
                                    <td class="sam02">
                                        <p class="sam-bottom" style="width:8%;"></p>
                                        <p class="sam-green" style="width:50%;"></p>
                                    </td>
                                    <td class="sam03">
                                        <p>6</p>
                                        <p>1605</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sam01"><em class="em-yellow">3</em><label>会稽山</label></td>
                                    <td class="sam02">
                                        <p class="sam-bottom" style="width:2%;"></p>
                                        <p class="sam-green" style="width:30%;"></p>
                                    </td>
                                    <td class="sam03">
                                        <p>1</p>
                                        <p>304</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sam01"><em class="em-yellow">4</em><label>胡庆余堂</label></td>
                                    <td class="sam02">
                                        <p class="sam-bottom" style="width:2%;"></p>
                                        <p class="sam-green" style="width:25%;"></p>
                                    </td>
                                    <td class="sam03">
                                        <p>1</p>
                                        <p>149</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sam01"><em class="em-black">5</em><label>王星记</label></td>
                                    <td class="sam02">
                                        <p class="sam-bottom" style="width:5%;"></p>
                                        <p class="sam-green" style="width:20%;"></p>
                                    </td>
                                    <td class="sam03">
                                        <p>5</p>
                                        <p>115</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sam01"><em class="em-black">6</em><label>楼外楼</label></td>
                                    <td class="sam02">
                                        <p class="sam-bottom" style="width:2%;"></p>
                                        <p class="sam-green" style="width:18%;"></p>
                                    </td>
                                    <td class="sam03">
                                        <p>1</p>
                                        <p>106</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sam01"><em class="em-black">7</em><label>采芝斋</label></td>
                                    <td class="sam02">
                                        <p class="sam-bottom" style="width:2%;"></p>
                                        <p class="sam-green" style="width:15%;"></p>
                                    </td>
                                    <td class="sam03">
                                        <p>2</p>
                                        <p>84</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sam01"><em class="em-black">8</em><label>方回春堂</label></td>
                                    <td class="sam02">
                                        <p class="sam-bottom" style="width:2%;"></p>
                                        <p class="sam-green" style="width:10%;"></p>
                                    </td>
                                    <td class="sam03">
                                        <p>1</p>
                                        <p>24</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sam01"><em class="em-black">9</em><label>民生药业</label></td>
                                    <td class="sam02">
                                        <p class="sam-bottom" style="width:2%;"></p>
                                        <p class="sam-green" style="width:8%;"></p>
                                    </td>
                                    <td class="sam03">
                                        <p>1</p>
                                        <p>10</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sam01"><em class="em-black">10</em><label>华东药业</label></td>
                                    <td class="sam02">
                                        <p class="sam-bottom" style="width:2%;"></p>
                                        <p class="sam-green" style="width:5%;"></p>
                                    </td>
                                    <td class="sam03">
                                        <p>1</p>
                                        <p>6</p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="protect-dis protect-bg">
                    <div class="protect-pad">
                        <div class="gk-line">
                            <p class="mbc_title3">
                                <em class="mbc_line3"></em>
                                <span class="mbc_title_warp3"><em class="font_f_1">店铺分布<i></i></em></span>
                            </p>
                        </div>
                        <div class="dis-title">
                            <div class="dis-t-left" id="typeCheck">
                                <input type="hidden" id="brandChecked" value="0"/>
                                <p><input id="allBrand" name="q" type="radio" value="0" checked="checked"/>店铺分布</p>
                                <p><input id="authedBrand" name="q" type="radio" value="1"/>授权店铺分布</p>
                                <p><input id="unAuthedBrand" name="q" type="radio" value="2"/>未授权店铺分布</p>
                                <p><input id="allSoldBrand" name="q" type="radio" value="3"/>授权店铺销量</p>
                            </div>
                            <div class="dis-t-right">
                                <p><span style="margin-right:10px">请选择时间：</span><input class="Wdate" type="text"
                                                                                       id="proportionStatDate"
                                                                                       onchange="javascript:proportionStatDateChang()"
                                                                                       onFocus="WdatePicker({skin:'whyGreen',isShowClear:false,readOnly:true,dateFmt:'yyyy-MM'})"/>
                                </p>
                            </div>
                        </div>
                        <div class="proportion" id="topFiveProvince">
                        </div>
                    </div>
                    <div class="protect-pad">
                        <div class="gk-chart">
                            <div class="map">
                                <div id="container2" style="width: auto;height:700px;"></div>
                            </div>
                            <div class="outlet" style="display: none;">
                                <div class="outlet-title"><p>选择需处理的未经授权网点</p></div>
                                <div class="outlet-area">
                                    <div class="outlet-top">
                                        <c:if test="${empty provinces }">
                                            无数据
                                        </c:if>
                                        <c:if test="${not empty provinces }">
                                            <c:forEach items="${provinces }" var="province" varStatus="status">
                                                <a href="javascript:void(0)" id="${province.id }"
                                                   onclick="javascript:unauthedProvinceClick(this)">${province.name }</a>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="outlet-middle">
                                        <div class="" style="float:left; display:inline-block;">已增加：</div>
                                        <div style="float:left; display:inline-block;" id="addedProvince">
                                            <p style="width: 200px;"></p>
                                        </div>
                                    </div>
                                    <div class="outlet-btn"><a href="javascript:void(0)">确定</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/gov/footer.jsp"/>
</body>
</html>
