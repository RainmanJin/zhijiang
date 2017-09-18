<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>之江信用-用户中心</title>
    <base href="${basePath }/" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
	var userCfg = userCfg || {page:'index'};
		userCfg['userId'] = '${user.userId}';
		userCfg['userName'] = '${user.userName}';
		userCfg['updateUserType'] = '<%=response.encodeURL("updateUserType")%>';
		userCfg['ajaxListuRL'] = '<%=response.encodeURL("ajax/list") %>';
		userCfg['countComments'] ='<%=response.encodeURL("count")%>';
		userCfg['countCorrections'] = '<%=response.encodeURL("countCorrections")%>';
		userCfg['remove'] = '<%=response.encodeURL("remove")%>';
		
		var bindingPopCfg = bindingPopCfg || {
			toBinding : '<%=response.encodeURL("toBinding")%>',
			toBindEmail : '<%=response.encodeURL("toBindEmail")%>',
			updateNick : '<%=response.encodeURL("updateNick") %>',
			validatePhoneCode : '<%=response.encodeURL("validatePhoneCode")%>',
			binding : '<%=response.encodeURL("binding")%>'
		};
		
	</script>
  </head>
  <body>
	<jsp:include page="../user/top.jsp" />
    <!--end banner-->
    <div class="container-group">
    	<div id="infoMessage" style="left: 50%"></div>
    	<jsp:include page="/user/binding_pop.jsp"/>
        <div class="content">
           <jsp:include page="/user/left.jsp"/>
           <div class="drop-right">
           	<h2>欢迎您，${user.userDigestedName }</h2>
               <div class="status">
               		<p>账户状态：
	               		<c:if test="${user.emailValidate == 1 }">
	               			<a href="javascript:void(0)" class="status1">已绑定邮箱</a>
	               		</c:if>
	               		<c:if test="${user.emailValidate == 0 }">
	               			<a href="javascript:void(0)" class="status1" id="popButton">点击绑定邮箱</a>
	               		</c:if>
	               		<c:if test="${user.phoneValidate == 0 }">
	               			<a href="javascript:void(0)" class="status2" id="popButton1">点击绑定手机</a>
	               		</c:if>
	               		<c:if test="${user.phoneValidate == 1 }">
	               			<a href="javascript:void(0)" class="status2">已绑定手机</a>
	               		</c:if>
               		</p>
               </div>
               <div class="care">
               	<ul>
                   	<li class="care1"><div class="care-wz"><p>关注企业</p><span class="countFavorite"></span></div></li>
                       <li class="care2"><div class="care-wz"><p>我的评论</p><span id="countComment"></span></div></li>
                       <li class="care3"><div class="care-wz"><p>我的纠错</p><span id="countCorrection"></span></div></li>
                   </ul>
               </div>
               <c:if test="${user.userType == 1 }">
               		<a href="javascript:void(0)" id="openCompanyOwner"><div class="open" id="openCompanyMenu">我也是企业主，希望开通企业模块，点此开通</div></a>
               </c:if>
               <div class="attention">
               	<h3>我关注的企业(<span class="countFavorite"></span>)<!-- <a  href="javascript:void(0)">+更多</a> --></h3>
               		<div id="listFavorites"></div>
                   <%-- <div class="attention1 attention-right"><img src="${basePath }/images/add-icon.png" id="popButton"/><span></span></div>  --%>
               </div>
           </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>
