<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="table" id="romptDiv" style="display: none;">
	<div class="table-left">
		<a href="#" class="current">省公安厅【1】</a>
		<a href="#">省人力社保局【1】</a>
		<a href="#">省工商局【1】</a>
		<a href="#">省质监局【1】</a>
		<a href="#">省外管局【1】</a>
	</div>
	<div style="width: 652px;float:left;display: inline-block;">
	<%--<div class="table-right">
		<h3>1.年度交通违法信息</h3>
		<table class="table-a2" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<th class="t3">所有人</th>
				<th class="t4">组织机构代码</th>
				<th class="t5">涉及车辆</th>
				<th class="t6">一般违章<span>（不扣分）</span></th>
				<th class="t6">较重违章<span>（扣1-3分）</span></th>
				<th class="t6">严重违章<span>（扣6分以上）</span></th>
				<th class="t7">年份</th>
			</tr>
			<tr>
				<td class="t3">浙江哇哈哈视野股份有限公司</td>
				<td class="t4">140302442</td>
				<td class="t5">14辆</td>
				<td class="t6">13次</td>
				<td class="t6">13次</td>
				<td class="t6">13次</td>
				<td class="t7">2016年</td>
			</tr>
		</table>
	</div>--%>

	<%--37826798225443000328409457600631--%>
		<c:choose>
			<c:when test="${not empty dataXyzjPjryBaseinfos && fn:length(dataXyzjPjryBaseinfos.content) > 0}">
				<div class="table-right">
					<h3>信用服务机构评价人员基本信息</h3>
					<table class="table-a2" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th class="t18">姓名</th>
							<th class="t18">身份证号码</th>
							<th class="t18">性别</th>
							<th class="t18">出生日期</th>
							<th class="t18">政治面貌</th>
							<th class="t18">学位</th>
							<th class="t18">现任岗位职务</th>
							<th class="t18">电话号码</th>
						</tr>
						<tbody id="pjry_page_id">
						<tr style="display: none;" model>
							<td class="t18">{0}</td>
							<td class="t18">{1}</td>
							<td class="t18">{2}</td>
							<td class="t18">{3}</td>
							<td class="t18">{4}</td>
							<td class="t18">{5}</td>
							<td class="t18">{6}</td>
							<td class="t18">{7}</td>
						</tr>
						<c:forEach items="${dataXyzjPjryBaseinfos.content}" var="pjry" varStatus="status">
							<tr>
								<td class="t18">${pjry.name}</td>
								<td class="t18">${pjry.idCard}</td>
								<td class="t18">${pjry.sex}</td>
								<td class="t18">${pjry.birth}</td>
								<td class="t18">${pjry.political}</td>
								<td class="t18">${pjry.academy}</td>
								<td class="t18">${pjry.position}</td>
								<td class="t18">${pjry.telnumber}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="d-page" config='{name: "pjry", url:"${basePath }/xyzj/tips/pdrc?companyNameDigest=${bizCompany.companyNameDigest}", nodata:"#nodataPjry", npage:${empty param.npage ? '1' : param.npage}, spage:${dataXyzjPjryBaseinfos.totalPages }, total:${dataXyzjPjryBaseinfos.total }, pin:2, isAjax:true, autoLoad:false}'></div>

			</c:when>
			<c:otherwise>
				<div id="nodataPjry">暂无数据</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>