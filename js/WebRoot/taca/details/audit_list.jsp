<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>之江信用-商贸联活动</title>
	<base href="${basePath }/" data-detailUrl="${companyDetailUrl }"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
	<meta property="qc:admins" content="1453276267425345466727" />
	<script data-main="${basePath}/js/uzj/taca/audit_list.js" src="${basePath }/js/lib/require.js"></script>
	<script>
      var  activityCfg = activityCfg || {page : 'index'};
    </script>
</head>
<body id="body" style="background-color: #f2f4f8;">
<jsp:include page="../../user/top.jsp" />
	 <div class="layout layout-tm">
        <div class="j-container" style="padding-bottom: 0;">
        	<h2 class="choose67">筛选条件</h2>
           	<div class="s-category  s-category-bg" id="industryTab">
                <div class="sl-key sl-key-color"><span class="sl-span">行业</span></div>
                <div class="sl-key-all sl-key-color1"><a tab="" class="current" href="javascript:void(0)">全部</a></div>
                <div class="sl-value">
                    <c:forEach items="${industryList}" var="industry">
                        <a tab="${industry}" href="javascript:void(0)">${industry}</a>
                    </c:forEach>
                </div>
            </div>           
            <div class="s-category  s-category-bg" id="statusTab">
                <div class="sl-key sl-key-color"><span class="sl-span">状态</span></div>
                <div class="sl-key-all sl-key-color1"><a tab="" class="current" href="javascript:void(0)">全部</a></div>
                <div class="sl-value sl-value-m" >
                    <a tab="submit" href="javascript:void(0)">待审核</a>
                    <a tab="approved" href="javascript:void(0)">审核已通过</a>
                    <a tab="unapproved" href="javascript:void(0)">审核未通过</a>
                </div>
            </div>            
        </div>
    </div>
    
    <div class="layout">
		<div class="audit-tit">
			<h3>截止目前共收到<span> ${submittedCount} </span>份参评材料，您已审核<span> ${auditedCount} </span>份</h3>
		</div>
	</div>
	
		<div class="layout layout-tm" id="auditList" style="margin-bottom: 25px;">
		<div class="audit-tb" style="min-height: 216px;" >

			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<th class="au1"><span>企业名称</span></th>
					<th class="au2">申报时间</th>
					<th class="au2">行政处罚</th>
					<th class="au2">欠税信息</th>
					<th class="au2">失信记录</th>
					<th class="au2">诉讼记录</th>
					<th class="au3">状态</th>
				</tr>
                <tbody id="auditBody">
                <tr model style="display: none;">
                    <td class="au1"><i><a style="color:black;" href="${basePath}/taca/audit/operate?auditId={9}">{0} {7}</a></i></td>
                    <td class="au2">{1}</td>
                    <td class="au2">{2} 条</td>
                    <td class="au2">{3} 条</td>
                    <td class="au2">{4} 条</td>
                    <td class="au2">{5} 条</td>
                    <td class="au3"><span class="{8}">{6}</span></td>
                </tr>
                </tbody>
			</table>

            <div class="detail_nodata" style="display:none;background-color:white;    width: auto;">暂无数据</div>
		</div>
		<div class="new-page" style="text-align: center;    margin: 0 0 35px;" config='{name:"auditList", url:"${basePath}/taca/audit/ajax/list", pin:3, isAjax:true,nodata:".detail_nodata"}'></div>
	</div>
<jsp:include page="../../footer.jsp" /> 
</body>
</html>
