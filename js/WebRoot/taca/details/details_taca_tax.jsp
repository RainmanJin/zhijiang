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
    <link href="${basePath}/style/new-css/lightbox.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css" />
	<meta property="qc:admins" content="1453276267425345466727" />
	<script data-main="${basePath}/js/uzj/taca/audit_detaile.js" src="${basePath }/js/lib/require.js"></script>
	<script>
      var  activityCfg = activityCfg || {page : 'tax'};
    </script>
</head>
<body id="body" style="background-color: #f2f4f8;">
<jsp:include page="../../user/top.jsp" />
<jsp:include page="details_top.jsp" />
    <div class="n-layout base">
       <div class="base-write">
           <h2><span>申报资料</span><i>浙江省商贸诚信示范企业评选</i></h2>
           <div class="baseCredit">
                <jsp:include page="details_left.jsp"/>
                <div class="baseRight">
					<h3 class="baseRight-tit"><span>纳税信用记录</span></h3>
						<div class="bR-line">							
							<div class="bR-line-right">
								《纳税信用等级证书》(县级以上税务局)
								<i style="margin: 0;">请上传照片或扫描件，格式为 JPG、JPEG、PNG，小于 2MB，最多可上传 5 张</i>
								<div class="baseUp" style="margin-top: 10px;">
									<c:forEach items="${tacaDatums}" var="datums">
										<div class="baseUp-block baseUp-ul"  style="background-color: #f8f8f8;padding: 0 !important;">
											 <a class="example-image-link" href="${basePath}/${datums.datumLink}" data-lightbox="example-set" >
												<img src="${basePath }/${datums.datumLink}" style="width: 108px;height: 98px;margin-top: -10px;"/>	
											</a>
										</div>
									</c:forEach>
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
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[0].payableAmount" value="${year_2015.payableAmount }" readonly="readonly"/></td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[1].payableAmount" value="${year_2016.payableAmount }" readonly="readonly"/></td>
								</tr>
								<tr>
									<td class="bR-t17 bR-t8-bg">已缴数额</td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[0].prepaidAmount" value="${year_2015.prepaidAmount }" readonly="readonly"/></td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[1].prepaidAmount" value="${year_2016.prepaidAmount }" readonly="readonly"/></td>
								</tr>
								<tr>
									<td class="bR-t17 bR-t8-bg">欠缴数额</td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[0].arrearsAmount" value="${year_2015.arrearsAmount }" readonly="readonly"/></td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[1].arrearsAmount" value="${year_2016.arrearsAmount }" readonly="readonly"/></td>
								</tr>
								<tr>
									<td class="bR-t17 bR-t8-bg">欠缴日期</td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[0].arrearsTime" value="${year_2015.arrearsTime }" readonly="readonly"/></td>
									<td class="bR-t18"><input type="text" name="userTacaTaxFees[1].arrearsTime" value="${year_2016.arrearsTime }" readonly="readonly"/></td>
								</tr>
							</table>
						</div>
						<div class="bR-line">
							<h3>概况阐述</h3>
							<div class="bRlevel">
								<textarea name="userTacaTax.profileDesc" readonly="readonly">${empty tacaTaxs || empty tacaTaxs[0].profileDesc ?'' : tacaTaxs[0].profileDesc}</textarea>
							</div>
						</div>
						<div class="bR-line">
							<h3>截止2016年底企业纳税水平及同业相对贡献概述</h3>
							<div class="bRlevel">
								<textarea name="userTacaTax.lastContributionDesc" style="height: 132px;" readonly="readonly">${empty tacaTaxs || empty tacaTaxs[0].lastContributionDesc ?'' : tacaTaxs[0].lastContributionDesc}</textarea>
							</div>
						</div>
						<div class="bR-button">
							<button type="button" class="bt2" >上一页</button><button type="button" class="bt1" >下一页</button>
						</div>
				</div>
           </div>
       </div>
    </div>
<jsp:include page="../../footer.jsp" /> 
</body>
</html>
