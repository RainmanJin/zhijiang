<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>之江信用-我的关注</title>
    <base href="${basePath }/" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
	   var userCfg = userCfg || {page:'myFavorites'};
	       userCfg['remove'] = '<%=response.encodeURL("remove")%>';
	</script>
  </head>
  
  <body class="container-bg">
  	<jsp:include page="../user/top.jsp" />
  	<div class="layout new11-about">
  	   <jsp:include page="/user/left.jsp"/>
  	   <c:if test="${empty favoritesPage.content}">
  	      <div class="new11-fav">
  	          <table cellpadding="0" cellspacing="0" border="0">
  	             <tr><td class="fav-t1" colspan='5' style="text-align:center;">暂未关注企业相关信息</td></tr>
  	          </table>
  	      </div>
  	   </c:if>
  	   <c:if test="${!empty favoritesPage.content}">
	  	   <div class="new11-fav">
	    		<table cellpadding="0" cellspacing="0" border="0" id="favoritesTable">
	    			<tr>
	    				<th class="fav-t1">企业名称</th>
	    				<th class="fav-t2">企业法人</th>
	    				<th class="fav-t2">注册资本</th>
	    				<th class="fav-t2">成立日期</th>
	    				<th class="fav-t3">操作</th>
	    			</tr>
	    			<tbody id="favorites_list">
		    			 <tr model>
		    			     <td class="fav-t1"><a href="javascript:void(0)" companyNo="{5}">{1}</a></td>
			    			 <td class="fav-t2">{2}</td>
			    			 <td class="fav-t2">{3}</td>
			    			 <td class="fav-t2">{4}</td>
			    			 <td class="fav-t3"><a href="javascript:cancelClick({0})"  cancel-id="{0}">取消关注</a></td>
		    			 </tr>
	    			   <c:forEach items="${favoritesPage.content}" var="data">
			    			<tr>
			    				<td class="fav-t1"><a href="javascript:void(0)" companyNo="${data.companyNo}">${data.companyName }</a></td>
			    				<td class="fav-t2">${data.legalPerson}</td>
			    				<td class="fav-t2">${fn:replace(data.capital,'None','-')}</td>
			    				<td class="fav-t2"><fmt:formatDate value="${data.establishDate}" pattern="yyyy-MM-dd"/></td>
			    				<td class="fav-t3"><a href="javascript:cancelClick(${data.favoritesId})"  cancel-id="${data.favoritesId}">取消关注</a></td>
			    			</tr>
	    			   </c:forEach>
	    		   </tbody>
	    		</table>
	    		<div class="new-page new11-page" config='{name: "favorites", url:"${basePath}/user/favorites/get/ajax/list", npage:1, spage:${favoritesPage.totalPages }, pin:2, isAjax:true}'></div>
	    	</div>
      </c:if> 
  	</div>
  	
  <div class="myfav-pop" style="display: none;" id="myfav_model_show">
   	<h2><a href="javascript:void(0)" id="myfav_model_close"><img src="${basePath }/images/close.png"></a></h2>
   	<h3>确定要取消对该企业的关注吗？</h3>
   	<div class="myfav-btn">
   		<input type="button" value="确认" class="y-btn" id="myfav_define" style="cursor: pointer;"/>
   		<input type="button" value="取消" class="n-btn" id="myfav_cancel" style="cursor: pointer;"/>
   	</div>
  </div> 
  	
  	
  	
<%--     <jsp:include page="user_search.jsp"/>
    <!--end banner-->
    <div class="layout content">
    	<div id="infoMessage" style="left: 50%"></div>

        	<jsp:include page="/user/left.jsp"/>
            <div class="main">
            	<h2>我的关注</h2>
                <div class="personal">
                <table cellpadding="0" cellspacing="0" border="0" id="favoriteTable">
                	<tr>
                        <th class="p11">企业名称</th>
                        <th class="p11">企业信用等级</th>
                        <th class="p12">操作</th>
                    </tr>
                     <c:if test="${empty list}">
                    	<tr>
                    		<td colspan="3" align="center" style="color: gray">暂无数据</td>
                    	</tr>
                   	</c:if>
                    <c:forEach items="${list}" var="data">
	                    <tr>
							<td class="p11"><a href='${fn:replace(companyDetailUrl, 'companyNo', data.companyNo)}' target="_blank" to_h>${data.companyName }</a><em><img src="${basePath}/images/card-icon1.png" />
							<td class="p11">
	                       		<label class="istar" config="{'n':${data.creditLevel } ,'s':50, 'size':12, 'img':'${basePath}/images/star.png'}"></label>
							</td>
	                        <td class="p12"><a href="javascript:void(0)" cancel-id="${data.favoritesId}" >取消关注</a></td>
	                    </tr>
                    </c:forEach>
                </table>
                </div>
            </div>
        </div> --%>

    <jsp:include page="../footer.jsp" />
</body>
</html>
