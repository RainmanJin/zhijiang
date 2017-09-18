<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<div class="fixed029">
<div class="n-header">
    <div class="n-navs">
       <div class="n-layout">
           <span>举报热线：12315</span>
           <span class="n-n1">
              <a href="${basePath }/user/<%=response.encodeURL("toLogin") %>" class="n-n1-dl">登录</a>
              <a href="${basePath }/user/<%=response.encodeURL("toRegister") %>">注册</a>
           </span>
           <span class="n-n2">
             <a href="${basePath }/gov/<%=response.encodeURL("index") %>">平台首页</a><i>|</i>
             <a href="${basePath }/help/help.jsp">帮助中心</a>
           </span>
       </div>
    </div>
    <div class="n-menus n-menus-c1">
        <div class="n-layout" style="position:relative;">
            <div class="dropdown" id="userCenterDiv" style="display:none;">
                <s><b></b></s>
                <ul class="profile-navigation" id="userCenterLi">
                    <a usertype="1,2,4" class="current" href="${basePath }/user/myAccount.jsp"><li>我的主页</li></a>
                    <a usertype="1,2,4" href="${basePath }/user/comment/<%=response.encodeURL("list")%>"><li>我的评论</li></a>
                    <a usertype="1,2,4" href="${basePath }/user/myClaim.jsp"><li>认领企业</li></a>
                    <a usertype="2,4" href="${basePath }/user/owner/<%=response.encodeURL("list") %>" ><li>我的企业</li></a>
                    <a usertype="2,4" href="${basePath }/user/datum/<%=response.encodeURL("list") %>" ><li>资料管理</li></a>
                    <a usertype="2,4" href="${basePath }/user/authorization/<%=response.encodeURL("list") %>">	<li>管理授权</li></a>
                    <a usertype="1,2,3,4" href="${basePath }/user/exit"><li>退出</li></a>
                </ul>
            </div>
            <div class="n-logo">
                <div class="n-logo-left"><a href="${basePath}/"><img src="${basePath}/images/new-images/logo.png" /></a><img style="margin-left: 10px;" src="${basePath}/images/new-images/logo_infor.png"></div>
            </div>

       <ul class="n-menus-ul" id="topNav">
          <li ><a data-nav="index" href="${basePath }/">首页</a></li>
          <%--<li ><a data-nav="webshop" href="${basePath }/trade/webshop">网店信用</a></li>--%>
          <li ><a data-nav="business_outtrade|business_haining|business_yiwu|business_keqiao|business_chuanhua|ecseed|score|business_score|trade/zone/articles|trade/business_contributions|trade/zone" href="${basePath }/trade/zone">特色专区</a></li>
          <li ><a data-nav="finance" href="${basePath }/trade/finance.jsp">信用金融</a></li>
          <li ><a data-nav="excitation" href="${basePath }/trade/excitation.jsp">守信激励</a></li>
          <li ><a data-nav="train" href="${basePath }/about/report.jsp">失信举报</a></li>
          <li ><a data-nav="about_us|privacy|report|advise" href="${basePath }/about/about_us.jsp">关于我们</a></li>
        </ul>
    </div>
        </div>
</div>
</div>
<!-- 浮窗 -->
<div class="sd_menu_side">
    <a href="${basePath}/help/help.jsp">
        <div class="flip-container" ontouchstart="this.classList.toggle('hover');">
            <div class="flipper">
                <div class="front pic"></div>
                <div class="back"></div>
            </div>
        </div>
    </a>
    <a href="javascript:void(0)" >
        <div class="flip-container01" ontouchstart="this.classList.toggle('hover01');">
            <div class="flipper01" id="qrcode_toggle_button">
                <div class="front01 pic01"></div>
                <div class="back01"></div>
            </div>
        </div>
        <div class="eImg" >
        	<img style="display: none;" id="qr_code_toggle_show" src="${basePath}/images/ee120.png">
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
    </a>
</div>
<!-- 浮窗 end -->