<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>之江信用-资料管理</title>
    <base href="${basePath }/" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
  <script type="text/javascript">
     var userCfg = userCfg || {page:'consensus'};
  </script>
  </head>
  
  <body>
	<jsp:include page="../user/top.jsp" />
    <!--end banner-->
    <div class="container-group">
        <div class="content" user_left="6">
        	<jsp:include page="/user/left.jsp"/>
            <div class="drop-right">
            	<h2>舆论预警</h2>
            	<c:if test="${empty list }"><center style="color: gray">暂无数据</center></c:if>
            	<c:if test="${not empty list }">
            		<div class="drop-date"> 
	               		<p>当前企业</p>
	                    <div class="nice-select nice-left" style="z-index:99;" value="true" name="nice-select">
	                    <input type="text" readonly="" value="${list[0].companyName }" name="address" id="currentCompany">
	                    <ul style="display: none">
	                    	<c:forEach items="${list }" var="owner">
	                    		<li ownerId="${owner.ownerId }">${owner.companyName }</li>
	                    	</c:forEach>
	                    </ul>
	                   </div>
	               </div>
	               <div class="drop-name" align="center" style="margin-top: 100px; color: gray">
	               		暂无该企业的舆论预警信息!
	               </div>
            	</c:if>
            </div>
        </div>
    </div>
	<div class="pop-content" id="hon_detail" style="display:none;">
    	<div class="pop-close"><a href="javascript:void(0)"><img src="${basePath}/images/close.png" class="closeImg"></a></div>
    	<h2 class="tit">未通过原因</h2>
        <ul></ul>
   	</div>
   	<jsp:include page="../footer.jsp" />
</body>
</html>
