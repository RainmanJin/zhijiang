<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="layout score">
	<div class="score-left">
		<div class="score-tit">
			<p>${bizCompany.companyName}</p>
			<div class="score-bl">
				<span>档案完整度:</span>
				<div class="score-bl-line">
					<b style="width: ${fileIntegrity}%;"></b>
					<i>${fileIntegrity}%</i>
				</div>
			</div>
		</div>
		<div class="score-label">
            <span class="score-s1">${bizCompany.companyStatus}</span>
			<c:if test="${tagList != null && fn:length(tagList) > 0}">
			<c:forEach items="${tagList}" var="tag">
				<span> ${tag.tagName}</span>
			</c:forEach>
			</c:if>
			<%--<span class="score-s1">存续</span>
			<span class="score-s2">食品/饮料制造业</span>
			<span class="score-s3">浙江省名牌产品</span>
			<span class="score-s4">AAA级信贷企业</span>
			<span class="score-s5">AAA级“守合同重信用”单位</span>--%>
		</div>
		<div class="score-infor">
			<p>法人代表：<span>${bizCompany.legalPerson}</span></p>
			<p>注册资金：<span>${bizCompany.capital}</span></p>
			<p>成立日期：<span>${bizCompany.establishDate}</span></p>
		</div>
	</div>
    <div style="position: relative">


	<div id="credit_level_id" style="width:250px;height:250px;position: absolute;margin-left: 78.5%;margin-top: -2%;/*top:6.6%;*/z-index:3;"></div>

	<div class="score-right" style="position: absolute;margin-top: 14.5%;margin-left: 22.1%;z-index:4;">
		<%--<div class="score-right-bg">
			<p>AAA</p>
			<span>信用等级</span>
		</div>--%>
		<%--<div id="credit_level_id" style="width:100%;height:300px;"></div>--%>
		<h5>超过了全省<span> —% </span>的企业</h5>
		<h5>超过了同行业<span> —% </span>的企业</h5>
	</div>
    </div>
</div>