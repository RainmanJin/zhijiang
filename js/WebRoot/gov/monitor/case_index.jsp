<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>${key }-企业信用查询-之江信用</title>
        <base href="${basePath}/"/>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="keywords" content="企业查询,中小企业,三资企业,民营企业,私营企业,黄页大全"/>
		<meta http-equiv="description" content="之江信用提供中小企业,民营企业信息查询,私营企业信用查询服务。"/>
		<link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css" />
		  <link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />
        <script data-main="${basePath }/gov/js/monitor/case.js" src="${basePath }/gov/js/lib/require.js"></script>
        <script type="text/javascript">

            var caseCfg = caseCfg || {
                        page:'list'
                    };

        </script>
	</head>
<body class="container container-jg" data-attr1="case" data-attr="clue">
	   <jsp:include page="/gov/gov_top.jsp" />
	   <jsp:include page="/gov/monitor/left.jsp" />
	   
    <div class="right">
      <div class="right-banner">
        	<p class="banner-s">
				<input name="" type="text"  placeholder="请输入企业名或企业名包含的关键词"/>
                <a href="#"></a>
            </p>
        </div>
        <div class="content">
            <div class="content-infor">
                <div class="main main-fs">
                <form>
                <input name="caseStatus" type="hidden" value="${spcase.caseStatus}" />
                <input name="pageSize" type="hidden" value="${pageSize}" />
                <p>公司名称<input name="companyName" value="${spcase.companyName }" type="text"/></p>
                <!-- <p>违法行为<input name="clueIllegalType" type="text" readonly="readonly"/></p> -->
                <p>处置方式
                	<select name="clueProcessType">
                		<option value="" selected='selected'></option>
                		<c:forEach items="${clueProcessTypeMap }" var="processType">
                			<option value="${processType.key}" ${processType.key == spcase.clueProcessType ? 'selected' :'' }>${processType.value}</option>
                			<%-- <option value="${processType.key}" ${processType.key == clue.clueProcessType ? 'selected' :'' }>${processType.value}</option> --%>
                		</c:forEach>
                	</select>
                </p>
                <p><a href="javascript:void(0)" id="search">查询</a></p>
                </form>
                </div>
            </div>
            <div class="content-infor" id="caseIndex">
	            	<div class="content-title">
	                	<ul>
	                        <li><a href="javascript:void(0)" data_attr='0' class="${caseStatus == 0 ? 'current':''}" >未处理线索</a></li>
	                        <li><a href="javascript:void(0)" data_attr='1' class="${caseStatus == 1 ? 'current':''}" >已处理线索</a></li>
	                    </ul>
	                     <div class="toppage">
	                    	<h4>每页显示
	                            <select id="pageSizeChoose" name="">
	                            	<option ${pageSize == 5 ? 'selected' : '' }  data_attr="5"><a href="javascript:void(0);">5</a></option>
	                            	<option ${pageSize == 10 ? 'selected' : '' }  data_attr="10"><a href="javascript:void(0);">10</a></option>
	                            </select>条记录</h4>
	                        <h4>共${pageAll.total }条记录  [1/1]</h4>
	                    </div>
	                </div>
	               <div class="main" >
	               	<table cellpadding="0" cellspacing="0" border="0" class="case">
           			<c:if test="${caseStatus == 0}">
	                   <tr>
	                       <td class="t3">公司名称</th>
	                       <td class="t3">线索类型</th>
	                       <td class="t4">主管机构</th>
	                       <td class="t9">处置方式</th>
	                       <td class="t5">创建时间</th>
	                       <td class="t6">操作</th>
	                   </tr>
	                    <c:if test="${not empty pageAll.content }">
		                    <c:forEach items="${pageAll.content}" var="caseInfo">
		                    <tr>
		                    	<td class="t3">${caseInfo.companyName}</td>
		                        <td class="t3">${caseInfo.clueTypeShow}</td>
		                        <td class="t4">杭州下城区商务局</td>
		                        <td class="t9">${caseInfo.clueProcessTypeShow}</td>
		                        <td class="t5"><fmt:formatDate value="${caseInfo.createTime}" pattern="yyyy-MM-dd"/></td>
		                        <td class="t6"><a href="${basePath}/gov/user/case/audit?id=${caseInfo.id}">审核</a></td>
		                    </tr>
		                    </c:forEach>
	              		</c:if>
	             	</c:if>
	             	<c:if test="${caseStatus == 1}">
		             	<tr>
		                    <td class="t7">公司名称</th>
		                    <td class="t8">线索类型</th>
		                    <td class="t11">主管机构</th>
		                    <td class="t9">处置方式</th>
		                    <td class="t10">创建时间</th>
		                    <td class="t8">处理结果</th>
		                    <td class="t10">处理时间</th>
		                    <td class="t6">操作</th>
		                </tr>
		                <c:if test="${not empty pageAll.content }">
		                    <c:forEach items="${pageAll.content}" var="caseInfo">
			                <tr>
			                	<td class="t7">${caseInfo.companyName}</td>
			                    <td class="t8">${caseInfo.clueTypeShow}</td>
			                    <td class="t11">杭州下城区商务局</td>
			                    <td class="t9">${caseInfo.clueProcessTypeShow}</td>
			                    <td class="t10"><fmt:formatDate value="${caseInfo.createTime}" pattern="yyyy-MM-dd"/></td>
			                    <td class="t8">${caseInfo.caseProcessTypeShow}</td>
			                    <td class="t10"><fmt:formatDate value="${caseInfo.lastupdatetime}" pattern="yyyy-MM-dd"/></td>
			                    <td class="t6"><a href="${basePath}/gov/user/case/detail?id=${caseInfo.id}">详情</a></td>
			                </tr>
			                </c:forEach>
	                	</c:if>
	               	</c:if>
	                </table>	
                	<c:if test="${empty pageAll.content }">
	                  	<div class="detail_nodata">未查询到相关信息</div>
                	</c:if>
	               </div>
                <div class="page" config='{name: "caseIndex",url:"${basePath }/gov/user/case/list?caseStatus=${empty param.caseStatus?'':param.caseStatus}&companyName=${empty param.companyName?'':param.companyName}&clueProcessType=${empty param.clueProcessType?'':param.clueProcessType}&pageSize=${empty param.pageSize?'':param.pageSize}",
                 nodata:".data-no-tip",
                 npage:${empty param.npage ? '1' : param.npage}, spage:${pageAll.totalPages }, total:${pageAll.total }, pin:5, isAjax:false}'></div>

            </div>
        </div>
    </div>
    <jsp:include page="/gov/footer.jsp" />
</body>
</html>
