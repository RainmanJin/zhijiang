
<%@ page language="java" pageEncoding="UTF-8" %>
<div class="govHeader">
    <h1 class="gov_logo">
        <a href="${basePath}/"></a>
    </h1>
    <div class="gov_mTitle">
        <div class="gov_width gov_width1"></div>
        <h2>浙江省商务信用公众服务平台</h2>
        <div class="gov_width gov_width2"></div>
        <div class="gov_mLogin" style="position: relative;">
            <p><em><img src="${basePath}/images/gov-images/zs_Ghead.png"></em></p>
            <a href="${basePath}/gov/index">平台首页</a>
            <div class="dropdown" id="userCenterDiv" style="display:none;">
                <s><b></b></s>
                <ul class="profile-navigation" id="userCenterLi">
                    <a usertype="1,2,4" class="current" href="${basePath }/user/myAccount.jsp"><li>我的主页</li></a>
                    <a usertype="1,2,4" href="${basePath }/user/comment/<%=response.encodeURL("list")%>"><li>我的评论</li></a>
                    <a usertype="1,2,4" href="${basePath }/user/myClaim.jsp"><li>认领企业</li></a>
                    <%--<c:if test="${user.userType == 2 }">--%>
                    <a usertype="2,4" href="${basePath }/user/owner/<%=response.encodeURL("list") %>" ><li>我的企业</li></a>
                    <a usertype="2,4" href="${basePath }/user/datum/<%=response.encodeURL("list") %>" ><li>资料管理</li></a>
                    <a usertype="2,4" href="${basePath }/user/authorization/<%=response.encodeURL("list") %>">	<li>管理授权</li></a>
                    <%--</c:if>--%>
                    <a usertype="1,2,3,4" href="${basePath }/gov/exit"><li>退出</li></a>
                </ul>
            </div>
        </div>
    </div>
</div>

