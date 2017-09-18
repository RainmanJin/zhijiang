<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>${key }-企业信用查询-之江信用</title>
	 <base href="${basePath}/" data-detailUrl="${govCompanyDetailUrl }"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="keywords" content="企业查询,中小企业,三资企业,民营企业,私营企业,黄页大全"/>
	<meta http-equiv="description" content="之江信用提供中小企业,民营企业信息查询,私营企业信用查询服务。"/>
	<link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new-css/gov_style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css" />
	 <script data-main="${basePath }/gov/js/search_result.js" src="${basePath }/gov/js/lib/require.js"></script>
	 <script>
		config = {
			cookieValue : '${SHUIDIXY_HISTORY_COOKIE}',
			companyDetailUrl : "${fn:replace(govCompanyDetailUrl, 'companyNo', '{0}')}"
		};
	</script>
</head>

<body style="overflow: scroll">
	<jsp:include page="/gov/gov_top.jsp" />
	<jsp:include page="/gov/top_search.jsp" />

    <div class="layout layout-tm content-width">
        <div class="j-container" style="padding-bottom: inherit;">
            <c:if test="${not empty key}">
            <div class="s-category  s-category-bg" id="searchTypeTab">
                <div class="sl-key sl-key-color"><span class="sl-span">匹配范围</span></div>
                <div class="sl-key-all sl-key-color1"><a tab="all" href="javascript:void(0)" <c:if test="${searchType=='all'}">class="current"</c:if>>全部</a></div>
                <div class="sl-value sl-value-m" >
                    <a tab="companyName" <c:if test="${searchType=='companyName'}">class="current"</c:if>  href="javascript:void(0)">企业名</a>
                    <a tab="legalPerson,partnerStockName"  href="javascript:void(0)" <c:if test="${searchType=='legalPerson,partnerStockName'}">class="current"</c:if>>股东法人</a>
                    <a tab="employeeName"  href="javascript:void(0)" <c:if test="${searchType=='employeeName'}">class="current"</c:if>>董高监</a>
                    <a tab="companyAddress"  href="javascript:void(0)" <c:if test="${searchType=='companyAddress'}">class="current"</c:if>>地址</a>
                    <a tab="businessScope"  href="javascript:void(0)" <c:if test="${searchType=='businessScope'}">class="current"</c:if>>经营范围</a>
                    <a tab="trademark" href="javascript:void(0)" <c:if test="${searchType=='trademark'}">class="current"</c:if>>品牌/产品</a>
                </div>
            </div>
            </c:if>
            <div class="s-category s-category-bg" id="industryTab">
                <div class="sl-key sl-key-color"><span class="sl-span">行业</span></div>
                <div class="sl-key-all sl-key-color1"><a href="javascript:void(0)" <c:if test="${empty industryName}">class="current"</c:if> data-attr="">全部</a></div>
                <div class="sl-value sl-value-m">
                    <c:forEach items="${industryNames}" var="industry">
                        <a href="javascript:void(0)" <c:if test="${industryName==industry}">class="current"</c:if> data-attr="${industry}" >${industry}</a>
                    </c:forEach>
                   <%-- <a href="javascript:void(0)">制造业</a>
                    <a href="javascript:void(0)">批发业和零售业</a>
                    <a href="#">租赁和商务服务业</a><a href="">房地产业</a><a href="">建筑业</a><a href="">交通运输业、仓储和邮政业</a><a href="">居民服务、修理和其他服务业</a><a href="">住宿和餐饮业</a><a href="">科学研究和技服务业</a><a href="">农、林、牧、渔业 </a><a href="">金融业</a><a href="">信息传输、软件和信息技术服务业</a><a href="">文化、体育和娱乐业</a><a href="">水利、环境和公共设施管理业</a><a href="">电力、热力、燃气及水生产和供应业</a><a href="">采矿业</a><a href="">教育</a><a href="">卫生和社会工作</a><a href="">公共管理、社会保障和社会组织</a>--%>
                </div>
            </div>
            <div class="s-category  s-category-bg" id="areaTab">
                <div class="sl-key sl-key-color"><span class="sl-span">地区</span></div>
                <div class="sl-key-all sl-key-color1"><a href="javascript:void(0)" class="${empty cityCode ? 'current' : '' }" data-attr="">全部</a></div>
                <div class="sl-value sl-value-m">
                    <c:forEach items="${cityMap}" var="city">
                        <a href="javascript:void(0)" data-attr="${city.key}"
                           class="${cityCode == city.key ? 'current' : '' }">${city.value }</a>
                    </c:forEach>
                    <%--<a href="javascript:void(0)">杭州</a><a href="javascript:void(0)">宁波</a><a href="">温州</a><a href="">嘉兴</a><a href="">湖州</a><a href="">绍兴</a><a href="">金华</a><a href="">衢州</a><a href="">舟山</a><a href="">台州</a><a href="">丽水</a>--%>
                </div>
            </div>
            <div class="s-category  s-category-bg" id="capitalTab">
                <div class="sl-key sl-key-color"><span class="sl-span">注册资本</span></div>
                <div class="sl-key-all sl-key-color1"><a href="javascript:void(0)" class="${empty capitalNumberCode ? 'current' : '' }">全部</a></div>
                <div class="sl-value sl-value-m">
                    <c:forEach items="${capitalSectionEnum}" var="capitalSection">
                        <a href="javascript:void(0)" data-attr="${capitalSection.code}" class="${capitalNumberCode == capitalSection.code ? 'current' : '' }">${capitalSection.text}</a>
                    </c:forEach>
                    <%--<a href="javascript:void(0)">50万以下</a><a href="javascript:void(0)">50-100万</a><a href="">100-200万</a><a href="">200-500万</a><a href="">500-1000万</a><a href="">1000万以上</a>--%>
                </div>
            </div>
            <div class="s-category  s-category-bg" id="creditTab">
                <div class="sl-key sl-key-color"><span class="sl-span">信用等级</span></div>
                <div class="sl-key-all sl-key-color1"><a href="javascript:void(0)" class="${empty curCreditType ? 'current' : '' }">全部</a></div>
                <div class="sl-value sl-value-m">
                    <c:forEach items="${creditTypeList }" var="type">
                        <a href="javascript:void(0)" class="${curCreditType == type ? 'current' : '' }" data-attr="${type}">${type}级</a>
                    </c:forEach>
                    <%--<a href="javascript:void(0)">A</a><a href="javascript:void(0)">AA</a><a href="">100-200万</a><a href="">200-500万</a><a href="">500-1000万</a><a href="">1000万以上</a>--%>
                </div>
            </div>
        </div>
    </div>


     <div class="layout content content-width">
    	<div class="left left-new">
        	<div class="list" style="min-height:409px;">
	            <div class="search-list-title">
	            <h3>
	            	<c:if test="${not empty key }">搜索<span>"${key}"</span></c:if>为您找到相关结果<font id="total" data-attr="${pageAll.displayCount}">${pageAll.displayCount}</font>条

	            </h3>
<%--                <div class="area" id="area" style="display:none; right:2%; margin-left:0;">
           			<h4 class="areah4"> <a href="${basePath }/search?cityCode=&curCreditType=${param.curCreditType}">不限区域</a></h4>
           			<h4 class="areah4">
		            	<c:forEach items="${zjCityMap }" var="city">
		            		<a href="${basePath }/search?cityCode=${city.key }&curCreditType=${param.curCreditType}" code="${city.key}">${city.value }</a>
		            	</c:forEach>
	            	</h4>
           		</div>
           		<div class="area" id="creditType" style="display:none;right:2%; margin-left:0;">
           			<h4 class="areah4"> <a href="${basePath }/search?cityCode=${param.cityCode }&curCreditType=">不限等级</a></h4>
           			<h4 class="areah4">
		            	<c:forEach items="${creditTypeList }" var="type">
		            		<a href="${basePath }/search?cityCode=${param.cityCode }&curCreditType=${type}">${type}级</a>
		            	</c:forEach>
	            	</h4>
           		</div>--%>
	            </div>
                	
	            <!--全部-->
	            <jsp:include page="/gov/search_result/search_result_all.jsp" />
	            <jsp:include page="/gov/search_result/search_result_company.jsp" />
	            <jsp:include page="/gov/search_result/search_result_address.jsp" />
				<jsp:include page="/gov/search_result/search_result_person.jsp" />	   
				<jsp:include page="/gov/search_result/search_result_employee.jsp"/>   
				<jsp:include page="/gov/search_result/search_result_scope.jsp"/>  
				<jsp:include page="search_result/search_result_trademark.jsp"/>
           		<c:if test="${pageAll.total==0}">
            	<div class="none-search data-no-tip">
                	<img src="${basePath }/images/sad-face.png" />
                	<h4>未找到符合条件的查询结果，请更改关键词重新查询！</h4>
                	<h4>您也可以去<a href="http://www.shuidixy.com/search?key=${key}&searchType=all" target="_blank">水滴</a>查查看</h4>
                </div>
                </c:if>
	        </div>
	        <!--end left-->
    	</div>
    	<!--end left-->
<%--        <div class="right">
        	<div class="includ">
            	<p>没有你想要的企业？点击收录企业让之江信用找到你想要的企业</p>
                <a href="javascript:void(0)">收录企业</a>
            </div>
        </div>--%>

         <div class="right right-new">
             <div class="new-includ">
                 <div class="new-includ-pad">
                     <h3>没有你想要的<span>企业</span>？</h3>
                     <p>点击收录企业让之江信用找到你想要的企业。</p>
                     <img src="${basePath}/images/new-images/img48.png">
                     <a href="javascript:void(0)" class="new-includ-btn">收录企业</a>
                 </div>
             </div>
<%--             <div class="new-includ">
                 <h4>最近搜索公司</h4>
                 &lt;%&ndash;<div class="new-includ-name"  id="nearlyVisited">&ndash;%&gt;

                 </div>--%>
               <%--  <div style="line-height:45px;text-align:center;">您还未浏览过任何公司哦</div>--%>
             <div class="zsRight_block zsRight_a2" style="border-bottom: 0;" id="nearlyVisited" >
                 <p class="zsRight_b1" >最近被查询企业</p>
             </div>
             </div>

         </div>

<%--        <div class="right">
			<div class="recent" id="nearlyVisited"></div>
        </div>--%>
        <!--end right-->
    </div>
    
	 <jsp:include page="/gov/footer.jsp" />
	<!--收录弹框-->    
 	<div class="winbox">
        <div class="pop-consult-box showanimation" style="display:none;" id="includ_div">
        <div class="rel">
       		<h2><a href="javascript:void(0)"><img src="${basePath}/images/close-icon.png" class="closeImg"/></a>收录企业</h2>
            <div class="rel-btn">
            	<h3><span><i>*</i>企业全称</span><input name="companyname" id="companyname" type="text" placeholder="企业全称" style="color: #444;"/></h3>
                
            </div>
            <div class="rel-btn-h3">
            	<h3><input name="" type="button" class="rel-b" value="申请收录" /></h3>
            </div>
        </div>
    	</div>
    </div> 
</body>
</html>
