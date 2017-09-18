<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/path.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>${empty result.bizCompany.companyName ? '' : result.bizCompany.companyName}-企业图谱-水滴信用</title>
    <base href="${basePath}/" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta http-equiv="keywords" content="企业查询,中小企业,三资企业,民营企业,私营企业,黄页大全" />
	<meta http-equiv="description" content="水滴信用提供中小企业,民营企业信息查询,私营企业信用查询服务。" />
	<link href="${basePath}/style/new/style.src.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/gov/js/combination.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">
		var CompanySchemaCfg = CompanySchemaCfg || {
			 result:JSON.parse('${result}'),
			 nodeResult: JSON.parse('${nodeResult}'),
			 linkResult :JSON.parse('${linkResult}'),
			 level:'${level}',
			 dateLimit:'${dateLimit}',
			 companyDetailUrl:'${companyDetailUrl}'
		 }
	 </script>
</head>
<%-- <jsp:include page="/header.jsp"/> --%>
<body style="overflow:hidden; background-color:#f6f6f6;">
	   <div style="position:absolute; margin-top: 20px; right: 15%; color: #AAAAAA;z-index: 100">
	   		<span class="circle"></span>
	   		<span style="color: #333; margin-right: 25px;">点击公司名称可以查看详细信息</span>
	   		<label for="level">关系层数</label>&nbsp;&nbsp;
	   		<select id="level" name="level" style="font-family: '微软雅黑';">
   				<option value="1" >一层</option>
	   			<option value="2" selected="selected">两层</option>
	   			<option value="3" >三层</option>
	   			<option value="4" >四层</option>
	   		</select>
	   		<select id="dateLimit" name="dateLimit" style="font-family:'微软雅黑';">
	   			<option value="1">半年以内</option>
	   			<option value="2">一年内</option>
	   			<option value="3">两年内</option>
	   			<option value="4" selected='selected'>全部时间</option>
	   		</select>
<%--	   		<div class="bdsharebuttonbox" data-tag="share_1">
            	<a href="#" id="share" class="c-s" data-cmd="more" style="margin:1px 0 0 5px;background-image: url(${basePath }/images/icon-bg1.png); background-position:1px 3px;"></a>
            </div>--%>
	   </div>
       <div style="position:absolute; margin-top: 20px; right: 13%; color: #AAAAAA;z-index: 100" class="bdsharebuttonbox" data-tag="share_1">
           <a href="javascript:void(0)" id="share" class="c-s" data-cmd="more" style="margin:1px 0 0 5px;background-image: url(${basePath }/images/icon-bg1.png); background-position:1px 3px;"></a>
       </div>
	   <form id="search_form" method="post">
	   		<input type="hidden" value="${param.companyId }" name="companyId"/>
	   		<input type="hidden" value="${param.bizCompanyId }" name="bizCompanyId"/>
	   		<input type="hidden" value="${requestScope.level }" name="level" />
	   		<input type="hidden" value="${requestScope.dateLimit }" name="dateLimit"/>
	   </form>
	   <div id="infoMessage" style="width: 220px; left: 45%"></div>
	   <div id="echa" style="min-height: 380px;height:100%; width:100%;" ></div>
		<div class="side-position" id="detail_div" style="display: none; overflow:hidden; min-height: 550px;">
    		<button id="btnClose" class="close" type="button">×</button>
            <div class="s-sub">
            	<div class="s-subinfor">
                	<div class="s-subborder"></div>
                    <div class="s-subtitle"><span>公司信息</span></div>
                </div>
                <div class="s-mc">
                    <div id="company_status" class="left-list" style="float: right; border-bottom:none; padding:6px 7px 0 0;"></div>
                	<div class="s-mc-title" id="company_name" style="width: 240px;"></div>
                </div>
                <div class="s-detail">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="s-detail01">法定代表：</td>
                            <td class="s-detail02" id="legal_person"></td>
                        </tr>
                        <tr>
                            <td class="s-detail01">注册资本：</td>
                            <td class="s-detail02" id="capital"></td>
                        </tr>
                        <tr>
                            <td class="s-detail01">成立日期：</td>
                            <td class="s-detail02" id="establish_date"></td>
                        </tr>
                    </table>
                </div>
                <div class="s-choose">
                    <a href="javascript:void(0)" class="s-choose02" id="search_company_schema">查看图谱</a>
                    <a href="javascript:void(0)" class="s-choose01" id="search_company_detail">公司详情</a>
                </div>
                <div class="s-message" id="detail_list">
                	<ul class="s-message-ul">
                        <li><a class="current" href="javascript:void(0)" attr="partner_list">股东</a></li>
                        <li><a href="javascript:void(0)" attr="outinvest_list">对外投资</a></li>
                        <li><a href="javascript:void(0)" attr="employee_list">主要成员</a></li>
                    </ul>
                    <div id="scrollBarContent-1" style="height:271px; width:290px;">
                    	<table cellpadding="0" cellspacing="0" border="0" id="partner_list"></table>
	                    <table cellpadding="0" cellspacing="0" border="0" id="outinvest_list" style="display: none"></table>
	                    <table cellpadding="0" cellspacing="0" border="0" id="employee_list" style="display: none"></table>
                    </div>
                </div>
            </div>
        </div>
</body>

</html>





