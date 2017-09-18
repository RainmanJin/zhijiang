<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<div style="background-color: #fff">
    <div class="n-header">
        <div class="n-layout n-navs">
        	 <span class="n-n3" id="messageSpan" style="display: none;">
	            <span><img src='${basePath }/images/new1-mail.png'><em id="messageCount">4</em></span>
	         </span>
	        
	        <span class="n-n1">
	            <a href="${basePath }/user/<%=response.encodeURL("toLogin") %>" class="n-log">登录</a>
	            <a href="${basePath }/user/<%=response.encodeURL("toRegister") %>" class="n-reg">注册</a>
	        </span>
	        
            <span class="n-n2">
	            <a href="${basePath }/gov/<%=response.encodeURL("index") %>">平台首页</a>
	            <a href="${basePath }/about/help.jsp">帮助中心</a>
	        </span>
        </div>
        <div class="n-layout" style="position:relative;">
            <input type="hidden" id="isLogin" value="0">
            <div class="dropdown" id="userCenterDiv" style="display:none;right:0px;">
                <s><b></b></s>
                <ul class="profile-navigation" id="userCenterLi">
                    <a usertype="2,4,5" class="current" href="${basePath }/user/owner/<%=response.encodeURL("list") %>"><li>企业管理</li></a>
                    <a usertype="1,2,4,5" href="${basePath }/user/favorites/<%=response.encodeURL("list") %>"><li>我的关注</li></a>
                    <a usertype="2,4,5" href="${basePath }/user/authorization/<%=response.encodeURL("list") %>"><li>消息管理</li></a>
                    <a usertype="1,2,4,5" href="${basePath }/user/myAccount.jsp" ><li>账号管理</li></a>
                 <%--    <a usertype="2,4" href="${basePath }/user/datum/<%=response.encodeURL("list") %>" ><li>资料管理</li></a>
                    <a usertype="2,4" href="${basePath }/user/authorization/<%=response.encodeURL("list") %>">	<li>管理授权</li></a> --%>
                    <a usertype="1,2,3,4,5" href="${basePath }/user/exit"><li>退出</li></a>
                </ul>
            </div>
            
           <div class="dropdown" id="messageCenterDiv" style="display:none;right:-46px;">
                <s><b></b></s>
                <ul class="profile-navigation" id="messageCenterLi">
                    <a usertype="1,2,4"  class="current" href="${basePath }/user/authorization/<%=response.encodeURL("list") %>"><li>授权申请&nbsp;&nbsp;<span id="authorizationCount"></span></li></a>
                    <a usertype="1,2,4" href="${basePath }/user/comment/<%=response.encodeURL("list")%>"><li>收到的评论&nbsp;&nbsp;<span id="commentCount"></span></li></a>
                </ul>
            </div>
            
            
            <div class="n-logo">
                <div class="n-logo-left">
                    <a href="${basePath}/">
                        <img src="${basePath }/images/new-images/logo-big.png" />
                    </a>
                </div>
                <ul class="n-menus-ul" id="topNav">
                    <%-- <li ><a data-nav="index" href="${basePath }/">首页</a></li> --%>
                    <li ><a data-nav="index" href="${basePath }">首页</a></li>
                    <li ><a data-nav="score|business_score|trade/zone/articles|trade/business_contributions|trade/zone" href="${basePath }/trade/zone">之江观点</a></li>
                    <li ><a data-nav="integrity|add_integrity" href="${basePath }/user/integrity/kitchen/search">诚信厨房</a></li>
                    <li ><a data-nav="financial|addInit" href="${basePath }/user/trade/financial/search">信用金融</a></li>
                    <li ><a data-nav="excitation" href="${basePath }/trade/excitation.jsp">守信激励</a></li>
                    <li ><a data-nav="about/report.jsp" href="${basePath }/about/report.jsp">失信举报</a></li>
                  <%--   <li ><a data-nav="about_us|privacy|report|advise" href="${basePath }/about/about_us.jsp">关于我们</a></li> --%>
                </ul>
                <div class="phone-icon">
                    <p>举报热线</p>
                    <h3><img src="${basePath }/images/new-images/h-number.png"></h3>
                </div>
            </div>
        </div>

    </div>

    <!-- 浮窗 -->
    <div class="sd_menu_side">
        <a href="${basePath}/about/help.jsp" id="tips_toggle_button">
            <div class="side-pic">
                <div class="pic"  ></div>
                <div class="back" id="tips_toggle_show" style="display: none;"></div>
            </div>
        </a>
        <a href="http://wpa.qq.com/msgrd?v=3&uin=3252136845&site=qq&menu=yes" target="_blank" id="qq_toggle_button">
            <div class="side-pic01">
                <div class="pic01"  ></div>
                <div class="back01" id="qq_toggle_show"  style="display: none;"></div>
            </div>
        </a>
        <a href="javascript:void(0)" >
            <div class="side-pic02"  id="qrcode_toggle_button">
                <div class="pic02" ></div>
                <div class="back02" id="qr_code_toggle_show" style="display: none;"></div>
            </div>
        </a>
        <a href="javascript:void(0)" id="returnTop" >
            <div class="side-pic03" ontouchstart="this.classList.toggle('hover03');" >
                <div class="pic03" ></div>
                <div class="back03" style="display: none;" id="return_top_toggle_show"></div>
            </div>
        </a>

        <%--   <a href="${basePath}/help/help.jsp">
               <div class="flip-container"ontouchstart="this.classList.toggle('hover');">
                   <div class="flipper">
                       <div class="front pic"></div>
                       <div class="back"></div>
                   </div>
               </div>
           </a>
           <a href="javascript:void(0)">
               <div class="flip-container01" ontouchstart="this.classList.toggle('hover01');">
                   <div class="flipper01">
                       <div class="front01 pic01"></div>
                       <div class="back01"></div>
                   </div>
               </div>
               <div class="eImg">
                   <img src="../images/ee120.png">
               </div>
           </a>


           <a href="http://wpa.qq.com/msgrd?v=3&uin=3252136845&site=qq&menu=yes" target="_blank">
               <div class="flip-container02" ontouchstart="this.classList.toggle('hover02');">
                   <div class="flipper02">
                       <div class="front02 pic02"></div>
                       <div class="back02"></div>
                   </div>
               </div>
           </a>
           <a href="javascript:void(0)" id="returnTop">
               <div class="flip-container03" ontouchstart="this.classList.toggle('hover03');">
                   <div class="flipper03">
                       <div class="front03 pic03"></div>
                       <div class="back03"></div>
                   </div>
               </div>
           </a>--%>


    </div>
    <!-- 浮窗 end -->
</div>



