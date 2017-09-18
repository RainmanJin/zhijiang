<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
		<div class="header" style="background-color:white;">
			<div class="navs">
				<div class="layout" style="width:59%;">
					<ul class="fleft">
					 	<li><a href="${basePath }/gov/<%=response.encodeURL("index") %>" >平台首页</a><span></span></li>
	                    <li><a href="javascript:void(0)" id="addFavorite">加入收藏</a><span></span></li>
	                   	<li><a href="javascript:void(0)" id="setHome" >设为首页</a><span></span></li>
             		</ul>
				</div>
			</div>
	    	<div class="layout" style="overflow:inherit;">
	    	<div style="width: 100%;height: 77px;position: relative;">
	        	<h1><a href="${basePath}/"><img style="margin-left: 10px;margin-top: 19px;" src="${basePath}/images/new-images/logo_infor.png"></a></h1>
	        	
	        	<%--<c:if test="${user.userType !=3 }">--%>
		        	<div class="dropdown" id="userCenterDiv" style="display:none;">
	       			 	<s><b></b></s>
			           	<ul class="profile-navigation" id="userCenterLi">
                            <a usertype="2,4,5" class="current" href="${basePath }/user/owner/<%=response.encodeURL("list") %>"><li>企业管理</li></a>
                            <a usertype="1,2,4,5" href="${basePath }/user/favorites/<%=response.encodeURL("list") %>"><li>我的关注</li></a>
                            <a usertype="2,4,5" href="${basePath }/user/authorization/<%=response.encodeURL("list") %>"><li>消息管理</li></a>
                            <a usertype="1,2,4,5" href="${basePath }/user/myAccount.jsp" ><li>账号管理</li></a>
                            <%--    <a usertype="2,4" href="${basePath }/user/datum/<%=response.encodeURL("list") %>" ><li>资料管理</li></a>
                               <a usertype="2,4" href="${basePath }/user/authorization/<%=response.encodeURL("list") %>">	<li>管理授权</li></a> --%>
                            <a usertype="1,2,3,4,5" href="${basePath }/gov/exit"><li>退出</li></a>
		           		</ul>
			      	</div>
		      	<%--</c:if>--%>
<%--		      	<c:if test="${user.userType == 3 }">
		      		<div class="dropdown" id="userCenterDiv" style="display:none;">
						<s><b></b></s>
		      			<ul class="profile-navigation" id="userCenterLi">
		      				 <a href="${basePath }/gov/exit"><li>退出</li></a>
		      			</ul>
		      		</div>
		      	</c:if>--%>
		      	
	        	<%--<c:if test="${user.userName == null }">--%>
		            <ul class="header-login">
		            	<li><a href="${basePath }/gov/<%=response.encodeURL("toLogin") %>">登录</a></li>
					<%--   <li><a href="${basePath }/user/<%=response.encodeURL("toRegister") %>">注册</a></li> --%>
		            </ul>
	           <%-- </c:if>--%>
<%--	            <c:if test="${user.userName != null }">
	           		 <ul class="header-login">
		    			<li>
		    				<span id="userNameLabel" style="cursor: pointer;">欢迎：${user.userDigestedName}</span>
		    				<a href="javascript:void(0)"><img src="${basePath }/images/down-icon.png"></img></a>
		    			</li>	
		    		 </ul>
				</c:if>--%>
				</div>
	        </div>
	    </div>
	    <!--end header-->
	    <div class="nav">
	        <div class="layout">
		        <ul class="nav-ul" id="topNav">
		            <li data-nav="index"><a href="${basePath }/gov/index">首  页</a></li>
	            	<li data-nav="operate|supervise|credit|shop"><a href="${basePath}/gov/user/ec/operate">电商监管</a></li>
					<li data-nav="foreigntrade"><a href="${basePath}/gov/user/foreigntrade/list">外贸服务</a></li>
	            	<li data-nav="companysearch|foreigncapital"><a href="${basePath}/gov/user/companysearch">行业信用</a></li>
		            <li data-nav="platformbrandstat"><a href="${basePath}/gov/user/platformbrandstat/list">品牌保护</a></li>
		            <li data-nav="monitor/list"><a href="${basePath}/gov/user/monitor/list">企业监测</a></li>
		            <li data-nav="overview"><a href="${basePath}/gov/user/monitor/overview/list">监管概况</a></li>
		            <li data-nav="news|policy|chasten|honour|school|report"><a href="${basePath}/gov/news/list">信用文化</a></li>
		            <li data-nav="about_us|privacy"><a href="${basePath }/about/about_us.jsp">关于我们</a></li>
	            </ul>
	        </div>
	    </div>
	    <!--end nav-->

