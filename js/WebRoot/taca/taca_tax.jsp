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
	<link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css" />
	<meta property="qc:admins" content="1453276267425345466727" />
	<script data-main="${basePath }/js/uzj/taca/taca_tax.js" src="${basePath }/js/lib/require.js"></script>
	 <script type="text/javascript" src="${basePath}/js/lib/laydate/laydate.js"></script>
</head>
<body id="body" style="background-color: #f2f4f8;">
 <jsp:include page="/user/top.jsp"/>
 <jsp:include page="/taca/top.jsp"/>
    <div class="n-layout base">
       <div class="base-write">
           <h2><span>申报资料</span><i>浙江省商贸诚信示范企业评选</i></h2>
           <div class="baseCredit">
                <jsp:include page="/taca/left.jsp" />
                <div class="baseRight" id="container_id">
					<h3 class="baseRight-tit"><span>纳税信用记录</span></h3>
					<form id="addTaxForm" action="${basePath }/taca/apply/add/tax" method="post">
						<input type="hidden" name="token" value="${token}"/>
                        <input type="hidden" name="activityId" value="${activity.id}"/>
						<div class="bR-line">							
							<div class="bR-line-right">
								《纳税信用等级证书》(县级以上税务局)
								<i style="margin: 0;">请上传照片或扫描件，格式为 JPG、JPEG、PNG，小于 2MB，最多可上传 5 张</i>
								<div class="baseUp" style="margin-top: 10px;">
									<input type="hidden" name="userTacaDatums[0].id" value="${empty tacaDatums || empty tacaDatums[0].id ?'' :  tacaDatums[0].id}"/>
									<input type="hidden" id="datumLink0" name="userTacaDatums[0].datumLink" value="${empty tacaDatums || empty tacaDatums[0].datumLink ?'' : tacaDatums[0].datumLink}"/>
									<div class="baseUp-block baseUp-ul" id="filePicker1" style="background-color: #f8f8f8;padding: 0 !important;">
										 <input type="button"/>
										<img src="${basePath }/images/base-upload.png"/>	
										<div id="datumLink0Div" class="uploader-list"></div>							
									</div>
									
									<input type="hidden" name="userTacaDatums[1].id" value="${empty tacaDatums || empty tacaDatums[1].id ?'' :  tacaDatums[1].id}"/>
									<input type="hidden" id="datumLink1" name="userTacaDatums[1].datumLink" value="${empty tacaDatums || empty tacaDatums[1].datumLink ?'' : tacaDatums[1].datumLink}"/>
									<div class="baseUp-block baseUp-ul" id="filePicker2" style="background-color: #f8f8f8;padding: 0 !important;">
										<input type="button"/>
										<img src="${basePath }/images/base-upload.png"/>
										<div id="datumLink1Div" class="uploader-list"></div>								
									</div>
									
									<input type="hidden" name="userTacaDatums[2].id" value="${empty tacaDatums || empty tacaDatums[2].id ?'' :  tacaDatums[2].id}"/>
									<input type="hidden" id="datumLink2" name="userTacaDatums[2].datumLink" value="${empty tacaDatums || empty tacaDatums[2].datumLink ?'' : tacaDatums[2].datumLink}"/>
									<div class="baseUp-block baseUp-ul" id="filePicker3" style="background-color: #f8f8f8;padding: 0 !important;">
										<input type="button"/>
										<img src="${basePath }/images/base-upload.png"/>		
										<div id="datumLink2Div" class="uploader-list"></div>						
									</div>
									
									<input type="hidden" name="userTacaDatums[3].id" value="${empty tacaDatums || empty tacaDatums[3].id ?'' :  tacaDatums[3].id}"/>
									<input type="hidden" id="datumLink3" name="userTacaDatums[3].datumLink" value="${empty tacaDatums || empty tacaDatums[3].datumLink ?'' : tacaDatums[3].datumLink}"/>
									<div class="baseUp-block baseUp-ul" id="filePicker4" style="background-color: #f8f8f8;padding: 0 !important;">
										<input type="button"/>
										<img src="${basePath }/images/base-upload.png" />	
										<div id="datumLink3Div" class="uploader-list"></div>							
									</div>
									
									<input type="hidden" name="userTacaDatums[4].id" value="${empty tacaDatums || empty tacaDatums[4].id ?'' :  tacaDatums[4].id}"/>
									<input type="hidden" id="datumLink4" name="userTacaDatums[4].datumLink" value="${empty tacaDatums || empty tacaDatums[4].datumLink ?'' : tacaDatums[4].datumLink}"/>
									<div class="baseUp-block baseUp-ul" id="filePicker5" style="background-color: #f8f8f8;padding: 0 !important;">
										<input type="button"/>
										<img src="${basePath }/images/base-upload.png"/>
										<div id="datumLink4Div" class="uploader-list"></div>								
									</div>
									
								</div>							
							</div>
							<div class="bRtarget">
							   <input type="hidden" name="userTacaTax.id" value="${empty tacaTaxs || empty tacaTaxs[0].id ?'' : tacaTaxs[0].id}"/>
								<p>	
									<label class="jqWrap bRcheck" style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 0px;width: 20px;height: 14px;">									
										<input type="hidden" id="nationalTaxPunish" value="${empty tacaTaxs || empty tacaTaxs[0].nationalTaxPunish ?'' : tacaTaxs[0].nationalTaxPunish}"/>
										<input type="checkbox" attr="nationalTaxPunish" name="userTacaTax.nationalTaxPunish" value="1"/>
									</label>
									<i>国税无查补税款、无行政处罚</i>
								</p>
								<p>									
									<label class="jqWrap bRcheck" style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 0px;width: 20px;height: 14px;">									
										<input type="hidden" id="landTaxPunish" value="${empty tacaTaxs || empty tacaTaxs[0].landTaxPunish ?'' : tacaTaxs[0].landTaxPunish}"/>
										<input type="checkbox" attr="landTaxPunish" name="userTacaTax.landTaxPunish" value="1" />
									</label>	
									<i>地税无查补税款、无行政处罚</i>									
								</p>
							</div>
						</div>
						<h3 class="baseRight-tit"><span>企业税务信用记录情况统计</span></h3>
						<div class="bR-line">
							<h3 style="margin-top:15px;">注：应交税费包括：营业税、城建税、教育费附加、交通费附加、增值税、企业所得税、其他个税等。<i>（金额单位：人民币万元）</i></h3>
							<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
								<input type="hidden" name="userTacaTaxFees[0].id" value="${year_2015.id }" />
								<input type="hidden" name="userTacaTaxFees[1].id" value="${year_2016.id }" />
								<input type="hidden" name="userTacaTaxFees[0].feeYear" value="2015"/>
								<input type="hidden" name="userTacaTaxFees[1].feeYear" value="2016"/>
								<tr>
									<th class="bR-t17"></th>
									<th class="bR-t18">2015年</th>
									<th class="bR-t18">2016年</th>
								</tr>
								<tr>
									<td class="bR-t17 bR-t8-bg">应缴数额</td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[0].payableAmount" data-attr='number' value="${year_2015.payableAmount }"/></td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[1].payableAmount" data-attr='number' value="${year_2016.payableAmount }"/></td>
								</tr>
								<tr>
									<td class="bR-t17 bR-t8-bg">已缴数额</td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[0].prepaidAmount" data-attr='number' value="${year_2015.prepaidAmount }"/></td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[1].prepaidAmount" data-attr='number' value="${year_2016.prepaidAmount }"/></td>
								</tr>
								<tr>
									<td class="bR-t17 bR-t8-bg">欠缴数额</td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[0].arrearsAmount" data-attr='number' value="${year_2015.arrearsAmount }"/></td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[1].arrearsAmount" data-attr='number' value="${year_2016.arrearsAmount }"/></td>
								</tr>
								<tr>
									<td class="bR-t17 bR-t8-bg">欠缴日期</td>
									<td class="bR-t18"><input type="text" class="date_picker" name="userTacaTaxFees[0].arrearsTime" value="${year_2015.arrearsTime }"/></td>
									<td class="bR-t18"><input type="text" class="date_picker" name="userTacaTaxFees[1].arrearsTime" value="${year_2016.arrearsTime }"/></td>
								</tr>
							</table>
						</div>
						<div class="bR-line">
							<h3>概况阐述</h3>
							<div class="bRlevel">
								<textarea name="userTacaTax.profileDesc">${empty tacaTaxs || empty tacaTaxs[0].profileDesc ?'' : tacaTaxs[0].profileDesc}</textarea>
							</div>
						</div>
						<div class="bR-line">
							<h3>截止2016年底企业纳税水平及同业相对贡献概述</h3>
							<div class="bRlevel">
								<textarea name="userTacaTax.lastContributionDesc" style="height: 132px;">${empty tacaTaxs || empty tacaTaxs[0].lastContributionDesc ?'' : tacaTaxs[0].lastContributionDesc}</textarea>
							</div>
						</div>
						<div class="bR-button">
							<button type="button" class="bt2" >上一页</button><button type="submit" value="" class="bt1" >保存并进入下一页</button>
						</div>
					</form>
				</div>
           </div>
       </div>
    </div>
<script type="text/javascript">
    laydate({
        elem: "#body .date_picker", //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        event: 'focus',//响应事件。如果没有传入event，则按照默认的click
    });
    laydate.skin('molv'); //danlan ,dahong,molv
</script>
<jsp:include page="/footer.jsp" /> 
</body>
</html>
