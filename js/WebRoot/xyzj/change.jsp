<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/path.jsp" %>
<div class="table"  id="changeDiv"  style="display: none;">
	<h2>历史变更信息信息</h2>
	<c:if test="${empty changepage.content}">
		<div class="detail_nodata">暂未收录该企业相关信息</div>
	</c:if>
	<c:if test="${!(empty changepage.content)}">
	<table class="table-a1" cellpadding="0" cellspacing="0" border="0" id="change_list">
		<tr>
			<th class="t12">变更日期</th>
			<th class="t13">变更项目</th>
			<th class="t14">变更前</th>
			<th class="t14">变更后</th>
		</tr>
		<c:forEach items="${changepage.content}" var="change">
		<tr>
			<td class="t12"><fmt:formatDate value="${change.changeDate}" pattern="yyyy-MM-dd"/></td>
			<td class="t13">${empty change.changeField?"":change.changeField}</td>
			<td class="t14" data-attr="${empty change.contentBefore?"":change.contentBefore}" maxlength="20">${empty change.contentBefore?"":change.contentBefore}</td>
			<td class="t14" data-attr="${empty change.contentAfter?"":change.contentAfter}" maxlength="20">${empty change.contentAfter?"":change.contentAfter}</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
	<c:if test="${not empty changepage.content &&  fn:length(changepage.content) ==5 }">
		<div id="to_show_more" class="tb-more">加载更多....</div>
	</c:if>
</div>