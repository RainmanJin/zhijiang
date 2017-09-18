<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp"%>
<c:if test="${not empty financeMap }">
	<div class="dynamic">
	    <div class="title"><h2>资本动态</h2></div>
	   	<div id="scrollBarContent-1" style="height:300px;overflow-y:hidden;">
	   		<c:forEach var="item" items="${financeMap}">
		 		<ul>
		 			<c:forEach var="finance" items = "${item.value }">
				         <li>
				            <div class="dynamicMain"> 
				             <div><span class="titleStyle">${finance.investedRound}</span> <span class="date">${finance.investedDate}</span></div>
				             <div><p>${empty finance.investor ? '投资方未透露' : finance.investor} </p><span class="money">${empty finance.investedTotalBalance ? '投资金额未透露' : finance.investedTotalBalance}</span></div>
				            </div>
				            <c:set var="onlineDate" value="${finance.onlineDate }" />
				         </li>
			         </c:forEach>
			         <li class="dynamicLast">
			            <div class="dynamicMain"> 
			             <div><span class="titleStyle">${item.key}上线</span> <span class="date">${onlineDate }</span></div>
			            </div>
			         </li>
			     </ul>
			</c:forEach>
	   	</div>
	</div>
</c:if>
