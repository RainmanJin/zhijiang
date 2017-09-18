<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
	<div id="infoMessage" ></div>

<div class="top_edit">
    <div class="topCompany">
        <div class="top-border zs_logo">
            <i></i>
            <c:choose>
                <c:when test="${empty dbCompany || empty dbCompany.companyLogo || dbCompany.companyLogo == null}">
                    <img src="${basePath }/images/com-logo.png" style="width:58px;height:66px;position: inherit;"/>
                </c:when>
                <c:otherwise>
                    <img src="${basePath }/${dbCompany.companyLogo}" />
                </c:otherwise>
            </c:choose>
             <span>存续</span>
        </div>
        <div class="zs_name">
            <input type="hidden" value="${dbCompany.claimStatus}" id="isClaimed">
            <h3>${mongoCompany.companyName }<span class="zs_c1" id="toClaim">我要认领</span></h3>
            <h4>
                <c:forEach items="${tagList}" var="tag">
                    <span> ${tag.tagName }</span>
                </c:forEach>
            </h4>
            <%--<h4><span>行业类型${tag.tagName }</span><span>上市公司${tag.tagName }</span><span>浙江省著名商标${tag.tagName }</span><span>驰名商标${tag.tagName }</span><span>AAA级“守合同重信用”单位${tag.tagName }</span><span>安全生产标准化二级达标企业${tag.tagName }</span><span>国家A级纳税人${tag.tagName }</span></h4>--%>


            <c:if test="${not empty officialPhones}">
                    <%--<b class="phone" style="margin-right: 10px">${phone}</b>--%>
                <h5><i class="zs_i1"></i><span>${officialPhones[0].phoneNumber}</span></h5>


            </c:if>

            <input type="hidden" value="${officialWebistes[0].officialWebsite}" id="officialWebsiteUrl">
            <c:if test="${not empty officialWebistes}">
                <h5><i class="zs_i2"></i><span id="officialWebsite"><a href="${officialWebistes[0].officialWebsite}" style="color:black;" target="_blank">${officialWebistes[0].officialWebsite}</a></span></h5>
            </c:if>

            <c:if test="${not empty mongoCompany.companyAddress }">
                <h5><i class="zs_i3"></i><span  data-map="${mongoCompany.companyAddress}"><b class="address"></b>${fn:replace(mongoCompany.companyAddress,"查看地图附近公司","")}</span></h5>
            </c:if>
        </div>
        
       <!--  <div class="sd_company_action" id="companyLevel" style="display: none;">			
			<div class="creditBg creditBg_light" style="position: relative;">
				<div id="score-holder" score="0">					 
				</div>
				<div class="sss" style="position: absolute; left: 115px;top: 0;">
					<span class="credit_b1" style="font-size: 36px;" id="credit_span"></span>
					<span class="credit_b4">信用等级</span>
				</div>
				<p style="margin-top: 10px;color: #888;">信用等级来源：<i>水滴信用</i></p>
			</div>				
		</div> -->
		
    </div>
    <div class="topdata">
        <p>数据更新时间：<span class="topspan1"><fmt:formatDate value="${mongoCompany.lastupdatetime}"  pattern="yyyy年M月d日H时"/></span><%--更新不够及时？点击<span class="topspan2">提醒更新</span>--%></p>
        <div class="topdata_right" style="position:relative">
		   	<span class="topspan3" id="follow" >关注</span>
            <span class=" topspan4">分享</span>
            <div class="share-popup" id="shareDiv" style="display:none;">
                <s><b></b></s>
                <div class="bdsharebuttonbox" style="padding: 10px 24px;">

                    <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">分享到微博</a>
                    <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信">分享到微信</a>
                </div>
            </div>
            <span class="topspan5" id="iWantReport">我要举报</span>
        </div>
    </div>
</div>
<!--end top_edit-->
