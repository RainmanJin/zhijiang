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
	<script data-main="${basePath}/js/uzj/taca/audit_detaile.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript" src="${basePath}/js/lib/laydate/laydate.js"></script>
	<script>
      var  activityCfg = activityCfg || {page : 'labor'};
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
					<h3 class="baseRight-tit"><span>劳动用工信用记录</span></h3>
						<div class="bR-line bR-choose bR-one">
							<input type="hidden" id="peopleSocietyCode" value="${empty tacaLabors || empty tacaLabors[0].peopleSocietyCode ?'' :tacaLabors[0].peopleSocietyCode}"/>
							<p style="margin-top:15px;">
								<label class="jqWrap">
									<input type="radio" attr="peopleSocietyCode" name="userTacaLabor.peopleSocietyCode" value="1"/>
								</label>
								省（市）人社厅（局）《浙江省劳动保障信用定级证书》
							</p>
							<p>
								<label class="jqWrap">
									<input type="radio" attr="peopleSocietyCode" name="userTacaLabor.peopleSocietyCode" value="2"/>
								</label>
								省（市）人社厅（局）《用人单位劳动和社会保障年度书面审查表》
							</p>
							<p>
								<label class="jqWrap">
									<input type="radio" attr="peopleSocietyCode" name="userTacaLabor.peopleSocietyCode" value="3"/>
								</label>
								《劳动保障年度书面审查及履行劳动保障社会责任评价表》
							</p>
						</div>
						<div class="bR-line">
						    <input type="hidden" name="userTacaLabor.id" value="${empty tacaLabors || empty tacaLabors[0].id ?'' :tacaLabors[0].id}"/>
							<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
								<tbody><tr>
									<th class="bR-t12">名称</th>
									<th class="bR-t13">级别</th>
									<th class="bR-t14">认定单位</th>
									<th class="bR-t15">证件编号</th>
									<th class="bR-t16">发证日期</th>
									<th class="bR-t16">有效期至</th>
								</tr>
								<tr>
									<td class="bR-t12"><input type="text" name="userTacaLabor.certificateName" value="${empty tacaLabors || empty tacaLabors[0].certificateName ?'' :tacaLabors[0].certificateName}" readonly="readonly"/></td>
									<td class="bR-t13"><input type="text" name="userTacaLabor.certificateLevel" value="${empty tacaLabors || empty tacaLabors[0].certificateLevel ?'' :tacaLabors[0].certificateLevel}" readonly="readonly"/></td>
									<td class="bR-t14"><input type="text" name="userTacaLabor.identifyUnits" value="${empty tacaLabors || empty tacaLabors[0].identifyUnits ?'' :tacaLabors[0].identifyUnits}" readonly="readonly"/></td>
									<td class="bR-t15"><input type="text" name="userTacaLabor.credentialsNum" value="${empty tacaLabors || empty tacaLabors[0].credentialsNum ?'' :tacaLabors[0].credentialsNum}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text" name="userTacaLabor.certificationDate" value="${empty tacaLabors || empty tacaLabors[0].certificationDate ?'' :tacaLabors[0].certificationDate}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text" name="userTacaLabor.validity" value="${empty tacaLabors || empty tacaLabors[0].validity ?'' :tacaLabors[0].validity}" readonly="readonly"/></td>
								</tr>
							</tbody></table>
						</div>
						<h3 class="baseRight-tit"><span>企业年末用工及员工工资发放情况及各项社会统筹金缴纳情况统计<i>(金额单位：人民币万元)</i></span></h3>

						<div class="bR-line">
							<input type="hidden" name="userTacaWagesStats[0].id" value="${year_2015.id}"/>
							<input type="hidden" name="userTacaWagesStats[1].id" value="${year_2016.id}"/>
							<input type="hidden" name="userTacaWagesStats[0].statYear" value="2015"/>
							<input type="hidden" name="userTacaWagesStats[1].statYear" value="2016"/>
							<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-bot">
								<tr>
									<th class="bR-t8"></th>
									<th class="bR-t9"></th>
									<th class="bR-t10">2015年</th>
									<th class="bR-t10">2016年</th>
								</tr>
								<tr>
									<td class="bR-t8 bR-t8-bg" rowspan="3">劳动用工情况</td>
									<td class="bR-t9 bR-t8-bg">员工人数</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].employeeNum" value="${year_2015.employeeNum}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].employeeNum" value="${year_2016.employeeNum}" readonly="readonly"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">签约人数</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].signedNum" value="${year_2015.signedNum}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].signedNum" value="${year_2016.signedNum}" readonly="readonly"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">签约率</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].signedRatio" value="${year_2015.signedRatio}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].signedRatio" value="${year_2016.signedRatio}" readonly="readonly"/></td>
								</tr>
								<tr>
									<td class="bR-t8 bR-t8-bg" rowspan="4">工资发放情况</td>
									<td class="bR-t9 bR-t8-bg">应发工资</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].deseveWages" value="${year_2015.deseveWages}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].deseveWages" value="${year_2016.deseveWages}" readonly="readonly"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">实发工资</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].realityWages" value="${year_2015.realityWages}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].realityWages" value="${year_2016.realityWages}" readonly="readonly"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">拖欠金额</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].arrearsWages" value="${year_2015.arrearsWages}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].arrearsWages" value="${year_2016.arrearsWages}" readonly="readonly"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">拖欠日期</td>
									<td class="bR-t10"><input class="date_picker" type="text" name="userTacaWagesStats[0].arrearsTime" value="${year_2015.arrearsTime}" readonly="readonly"/></td>
									<td class="bR-t10"><input class="date_picker" type="text" name="userTacaWagesStats[1].arrearsTime" value="${year_2016.arrearsTime}" readonly="readonly"/></td>
								</tr>
								<tr>
									<td class="bR-t8 bR-t8-bg" rowspan="7">社会统筹金缴纳情况</td>
									<td class="bR-t9 bR-t8-bg">养老保险应缴</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].endowmentInsurancePayable" value="${year_2015.endowmentInsurancePayable}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].endowmentInsurancePayable" value="${year_2016.endowmentInsurancePayable}" readonly="readonly"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">失业保险应缴</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].unemploymentInsurancePayable" value="${year_2015.unemploymentInsurancePayable}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].unemploymentInsurancePayable" value="${year_2016.unemploymentInsurancePayable}" readonly="readonly"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">医疗保险应缴</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].medicalInsurancePayable" value="${year_2015.medicalInsurancePayable}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].medicalInsurancePayable" value="${year_2016.medicalInsurancePayable}" readonly="readonly"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">工伤保险应缴</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].injuryInsurancePayable" value="${year_2015.injuryInsurancePayable}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].injuryInsurancePayable" value="${year_2016.injuryInsurancePayable}" readonly="readonly"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">生育保险应缴</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].childbirthInsurancePayable" value="${year_2015.childbirthInsurancePayable}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].childbirthInsurancePayable" value="${year_2016.childbirthInsurancePayable}" readonly="readonly"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">住房公积金应缴</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].housingFundPayable" value="${year_2015.housingFundPayable}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].housingFundPayable" value="${year_2016.housingFundPayable}" readonly="readonly"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">合计应缴</td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[0].totalPayable" value="${year_2015.totalPayable}" readonly="readonly"/></td>
									<td class="bR-t10"><input type="text" name="userTacaWagesStats[1].totalPayable" value="${year_2016.totalPayable}" readonly="readonly"/></td>
								</tr>
							</table>
						</div>
						<div class="bR-button">
							<button type="button" class="bt2"  >上一页</button><button type="button"  class="bt1" >下一页</button>
						</div>
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
