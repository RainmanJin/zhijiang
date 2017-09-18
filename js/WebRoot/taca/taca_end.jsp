<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>之江信用-商贸联活动</title>
	<base href="${basePath }/" data-detailUrl="${companyDetailUrl }"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css" />
	<meta property="qc:admins" content="1453276267425345466727" />
	<script data-main="${basePath }/js/uzj/taca/taca_unclaimed.js" src="${basePath }/js/lib/require.js"></script>
	
</head>
<body id="body" style="background-color: #f2f4f8;">
 <jsp:include page="/user/top.jsp"/>
 <jsp:include page="/taca/top.jsp"/>
     <div class="n-layout base">
         <c:if test="${activity.status=='submit'}">
             <div class="base-sud">
                 <img src="${basePath }/images/base-sud.png">
                 <h3>您的评选材料已成功提交</h3>
                 <h4>根据评选日程安排，8-10月为初审阶段，11-12月为最终评审和表彰阶段</h4>
                 <h4>请保持手机畅通，评选的最新动态将会以短信形式发送给您</h4>
                 <button onclick="{window.location.href='${basePath}/taca/index'}" >返回主页</button>
             </div>
         </c:if>

         <c:if test="${activity.status=='first_approved'}">
             <div class="base-sud">
                 <img src="${basePath }/images/happy.png">
                 <h3>您的评选材料已通过初审</h3>
                 <h4>根据评选日程安排，8-10月为初审阶段，11-12月为最终评审和表彰阶段</h4>
                 <h4>请保持手机畅通，评选的最新动态将会以短信形式发送给您</h4>
                 <button onclick="{window.location.href='${basePath}/taca/index'}" >返回主页</button>
             </div>
         </c:if>

         <c:if test="${activity.status=='first_unapproved'}">
             <div class="base-sud">
                 <img src="${basePath }/images/sad-5.png">
                 <h3>您的评选材料未通过初审</h3>
                 <h4>感谢您的参与</h4>
                 <h4>若有疑问，可致电您的活动组织动员方询问审核细节</h4>
                 <button onclick="{window.location.href='${basePath}/taca/index'}" >返回主页</button>
             </div>
         </c:if>
	</div>
<jsp:include page="/footer.jsp" /> 
</body>
</html>
