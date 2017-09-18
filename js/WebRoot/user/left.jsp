<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<%--     <div class="side-menu" id="nav_user_left">
    	<c:if test="${user.userType == 2 }">
    	<h2 class="e-bg">企业后台</h2>
    	</c:if>
    	<c:if test="${user.userType != 2 }">
    	<!--<h2 class="e-bg">个人后台</h2>-->
    	</c:if>
       <!--  <h2 class="p-bg">个人用户后台</h2> -->
       <ul id="left_ul">
       		<a href="${basePath }/user/owner/<%=response.encodeURL("list") %>"><li data-nav="owner">我的企业</li></a>
       		<a href="${basePath }/user/favorites/<%=response.encodeURL("list") %>"><li data-nav="favorites">我的关注</li></a>
       		<a href="${basePath }/user/datum/<%=response.encodeURL("list") %>"><li data-nav="datum|comment">我的消息</li></a><!--就是原来的资料管理-->
       		<a href="${basePath }/user/authorization/<%=response.encodeURL("list") %>">	<li data-nav="authorization">授权管理</li></a>
            <a href="${basePath }/user/myAccount.jsp"><li data-nav="myAccount">账号管理</li></a>			
        </ul>
    </div> --%>
<h2 class="welcome">欢迎，<span>${user.userDigestedName}</span></h2>
<div class="new11-nav" id="nav_user_left">
	<ul id="left_ul">
		<li><a href="${basePath }/user/owner/<%=response.encodeURL("list") %>" data-nav="owner" >企业管理</a></li>
		<li><a href="${basePath }/user/favorites/<%=response.encodeURL("list") %>"  data-nav="favorites">我的关注</a></li>
		<li><a href="${basePath }/user/authorization/<%=response.encodeURL("list") %>"  data-nav="authorization|comment">消息管理</a></li>
		<li><a href="${basePath }/user/myAccount.jsp" data-nav="myAccount">账号管理</a></li>
	</ul>
</div>
