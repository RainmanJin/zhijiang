<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <base href="${basePath}/"/>
    <title>外资促进-之江信用</title>
    <%-- <link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" /> --%>
    <link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/gov/js/foreigncapital.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">
        var foreigncapitalCfg = foreigncapitalCfg || {
                    page: 'search'
                };
    </script>
    <style>
        .pro01 {
            padding-left: 0px;
        }
    </style>
</head>
<body class="container" id="body" data-attr="foreignCapital" data-attr2="companysearch" style="background:#d7d7d7;">
<form>
    <input name="cityCode" type="hidden" value="${cityCode }"/>
    <input name="orderField" type="hidden" value="${orderField }"/>
    <input name="orderType" type="hidden" value="${orderType }"/>
    <input name="key" type="hidden" value="${key }"/>
</form>
<jsp:include page="./foreigncapital_header.jsp"/>
<div class="layout">
    <div class="content">
        <div class="j-container">
            <div class="s-category" id="industryChoose">
                <div class="sl-key"><span>行业</span></div>
                <div class="sl-key-all"><a class="current">全部</a></div>
                <div class="sl-value">
                    <c:forEach items="${industryNames}" var="industry">
                        <a href="javascript:void(0)">${industry}</a>
                    </c:forEach>
                </div>
            </div>
            <div class="s-category  s-category-bottom" id="areaChoose">
                <div class="sl-key"><span>地区</span></div>
                <div class="sl-key-all"><a class="${empty cityCode ? 'current' : ''}">全部</a></div>
                <div class="sl-value">
                    <c:forEach items="${cityMap}" var="city">
                        <a href="javascript:void(0)" data-attr="${city.key }"
                           class="${cityCode == city.key ? 'current' : '' }">${city.value }</a>
                    </c:forEach>
                </div>
            </div>
            <div class="s-category  s-category-bottom" id="capitalChoose">
                <div class="sl-key"><span>注册资金</span></div>
                <div class="sl-key-all"><a class="current">全部</a></div>
                <div class="sl-value">
                    <%--<a href="#">50万以下</a><a href="#" >50-100万</a><a href="#">100-200万</a><a href="#">200-500万</a><a href="#">500-1000万</a><a href="#">1000万以上</a>--%>
                    <c:forEach items="${capitalSectionEnum}" var="capitalSection">
                        <a data-attr="${capitalSection.code}">${capitalSection.text}</a>
                    </c:forEach>
                </div>
            </div>
            <!--  <div class="s-category s-category-bottom">
              <div class="sl-key"><span>信用星</span></div>
              <div class="sl-key-all"><a href="#">全部</a></div>
              <div class="sl-value">
                  <a href="#">一星</a><a href="#" class="current">二星</a><a href="#">三星</a><a href="#">四星</a><a href="#">五星</a>
              </div>
          </div>   信用星-->
        </div>
        <div style="height: 33px;">
            <div class="f-search">
                <input name="" id="companyKey" type="text" value="${key }"/><a href="javascript:void(0)" id="companySearch"><img
                    src="${basePath }/images/retils/f-search.png"/></a>
            </div>
            <p class="search-qy" style="padding-left:20px;">
                <select name="" id="orderChoose" style="margin-top: 4px">
                    <option data-attr=""  ${empty orderField ? 'selected' : ''}>默认排序</option>
                    <option data-attr="establishDate" ${orderField == 'establishDate' ? 'selected' : '' }>成立时间</option>
                    <option data-attr="capitalNumber" ${orderField == 'capitalNumber' ? 'selected' : '' }>注册资金</option>
           <%--         <option data-attr="curCreditLevel" ${orderField == 'curCreditLevel' ? 'selected' : '' }>信用等级
                    </option>--%>
                </select>
                <a href="javascript:void(0)"><img src="${basePath }/images/retils/retails-down.png" id="orderImg"
                                                  style="float:right;margin-right:15px;margin-top:9px;display:none;"/></a>
                为您查询到<span id="totalforeign"> </span>条符合条件的企业

            </p>
        </div>


        <div class="j-container" id="company_list">
            <input type="hidden" id="foreignCapitalPageId">
            <table cellpadding="0" cellspacing="0" border="0" class="spread2">
                <tr>
                    <th class="pro01" style="padding-left:80px;text-align: left">企业</th>
                    <th class="pro02">成立时间</th>
                    <th class="pro02">注册资金</th>
                    <%--<th class="pro03">信用等级</th>--%>
                    <th class="pro04">操作</th>
                </tr>

                <tbody id="companySearchList">
                <tr model style="display:none;">
                    <td class="pro01">
                        <div class="ico_abs">
                            <div class="ico_abs_img"><span></span><img src="${basePath }/images/retils/img6.jpg"/></div>
                            <div class="ico_abs_infor">
                                <a target="_blank" href="${fn:replace(govCompanyDetailUrl, "companyNo", "{10}")}"><h4>{0}</h4></a>
                                <p>{1}<span>{2}</span></p>
                                <p class="icon-phone">{3}</p>
                                <p class="icon-place" show_length="20">{4}</p>
                            </div>
                        </div>
                    </td>
                    <td class="pro02">{5}</td>
                    <td class="pro02">{6}</td>
    <%--                <td class="pro03">
                        <div class='istar'
                             config='{"n":{7},"s":50,"size":12,"img":"${basePath}/images/star.png"}'></div>
                    </td>--%>
                    <td class="pro04" style="    text-align: center;"><a id="officialWebsiteId" target="_blank"  href="{8}">{11}</a>
                        <a href="javascript:void(0);" class="addToList"
                           data-attr="{9}">添加至列表</a></td>
                </tr>
                </tbody>
            </table>
            <div id="companySearchPage" class="f-page"
                 config='{name: "companySearchList", url:"${basePath}/gov/user/companysearch/list", pin:5,nodata:".detail_nodata", isAjax:true}'></div>
        </div>
        <div class="detail_nodata">
            未查询到相关信息
        </div>
    </div>
</div>
<div class="pop-content" id="addSuccess"
     style=" font-size:16px;color:#757171;line-height:25px;padding-bottom:30px;display: none">
    <div on class="base_msg"><img src="${basePath }/images/gov-images/succeed-pop.png"/></div>
    <div class="t">添加至列表成功!</div>
    <div class="c">您可在“已添加企业”，管理已添加的企业名单</div>
    <button class="pop-close">确定</button>
</div>
<jsp:include page="/gov/footer.jsp"/>
</body>
</html>