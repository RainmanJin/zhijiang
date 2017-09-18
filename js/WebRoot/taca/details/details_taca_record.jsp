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
      var  activityCfg = activityCfg || {page : 'record'};
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
					<h3 class="baseRight-tit"><span>工商信用记录</span></h3>
						<input type="hidden" name="userTacaBiz.id" value="${empty tacaBizs || empty tacaBizs[0].id ?'' : tacaBizs[0].id}" />
						<input type="hidden" id="accessInstitute" value="${empty tacaBizs || empty tacaBizs[0].accessInstitute ?'' : tacaBizs[0].accessInstitute}" />
						<div class="bR-line">
							<h3>工商行政管理局<i>《重合同守信用证书》</i></h3>
							<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
								<tr>
									<th class="bR-t12">名称</th>
									<th class="bR-t13">级别</th>
									<th class="bR-t14">认定单位</th>
									<th class="bR-t15">证件编号</th>
									<th class="bR-t16">发证日期</th>
									<th class="bR-t16">有效期至</th>
								</tr>
								<tr>
								    <input type="hidden" name="tacaBizRecords[0].id" value="${empty recordMap['1']  ?'' : recordMap['1'].id }"/>
									<input type="hidden" name="tacaBizRecords[0].type" value="1"/>
									<td class="bR-t12"><input type="text"  name="tacaBizRecords[0].name" value="${empty recordMap['1']  ?'' : recordMap['1'].name}" readonly="readonly"/></td>
									<td class="bR-t13"><input type="text"  name="tacaBizRecords[0].level" value="${empty recordMap['1']  ?'' : recordMap['1'].level}" readonly="readonly"/></td>
									<td class="bR-t14"><input type="text"  name="tacaBizRecords[0].authOrgan" value="${empty recordMap['1']  ?'' : recordMap['1'].authOrgan}" readonly="readonly"/></td>
									<td class="bR-t15"><input type="text"  name="tacaBizRecords[0].certificateCode" value="${empty recordMap['1']  ?'' :recordMap['1'].certificateCode}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text"  name="tacaBizRecords[0].issuingDate" value="${empty recordMap['1']  ?'' : recordMap['1'].issuingDate}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text"  name="tacaBizRecords[0].validDate" value="${empty recordMap['1']  ?'' : recordMap['1'].validDate}" readonly="readonly"/></td>
								</tr>
							</table>
						</div>
						<div class="bR-line">
							<h3>消费者保护委员会<i>《消费者信得过单位》</i></h3>
							<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
								<tr>
									<th class="bR-t12">名称</th>
									<th class="bR-t13">级别</th>
									<th class="bR-t14">认定单位</th>
									<th class="bR-t15">证件编号</th>
									<th class="bR-t16">发证日期</th>
									<th class="bR-t16">有效期至</th>
								</tr>
								<tr>
								 	<input type="hidden" name="tacaBizRecords[1].id" value="${empty recordMap['2']  ?'' : recordMap['2'].id }"/>
									<input type="hidden" name="tacaBizRecords[1].type" value="2"/>
									<td class="bR-t12"><input type="text"  name="tacaBizRecords[1].name" value="${empty recordMap['2']  ?'' : recordMap['2'].name}" readonly="readonly"/></td>
									<td class="bR-t13"><input type="text"  name="tacaBizRecords[1].level" value="${empty recordMap['2']  ?'' : recordMap['2'].level}" readonly="readonly"/></td>
									<td class="bR-t14"><input type="text"  name="tacaBizRecords[1].authOrgan" value="${empty recordMap['2']  ?'' : recordMap['2'].authOrgan}" readonly="readonly"/></td>
									<td class="bR-t15"><input type="text"  name="tacaBizRecords[1].certificateCode" value="${empty recordMap['2']  ?'' : recordMap['2'].certificateCode}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text"  name="tacaBizRecords[1].issuingDate" value="${empty recordMap['2']  ?'' : recordMap['2'].issuingDate}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text"  name="tacaBizRecords[1].validDate" value="${empty recordMap['2']  ?'' : recordMap['2'].validDate}" readonly="readonly"/></td>
								</tr>
							</table>
						</div>
						<div class="bR-line">
							<h3>拥有县/市/省/国家商品准入制度荣誉情况<i>（以最高级别填写）</i></h3>
							<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
								<tr>
									<th class="bR-t12">名称</th>
									<th class="bR-t13">级别</th>
									<th class="bR-t14">认定单位</th>
									<th class="bR-t15">证件编号</th>
									<th class="bR-t16">发证日期</th>
									<th class="bR-t16">有效期至</th>
								</tr>
								<tr>
									<input type="hidden" name="tacaBizRecords[2].id" value="${empty recordMap['3']  ?'' : recordMap['3'].id }"/>
									<input type="hidden" name="tacaBizRecords[2].type" value="3"/>
									<td class="bR-t12"><input type="text"  name="tacaBizRecords[2].name" value="${empty recordMap['3']  ?'' : recordMap['3'].name}" readonly="readonly"/></td>
									<td class="bR-t13"><input type="text"  name="tacaBizRecords[2].level" value="${empty recordMap['3']  ?'' : recordMap['3'].level}" readonly="readonly"/></td>
									<td class="bR-t14"><input type="text"  name="tacaBizRecords[2].authOrgan" value="${empty recordMap['3']  ?'' : recordMap['3'].authOrgan}" readonly="readonly"/></td>
									<td class="bR-t15"><input type="text"  name="tacaBizRecords[2].certificateCode" value="${empty recordMap['3']  ?'' : recordMap['3'].certificateCode}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text"  name="tacaBizRecords[2].issuingDate" value="${empty recordMap['3']  ?'' : recordMap['3'].issuingDate}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text"  name="tacaBizRecords[2].validDate" value="${empty recordMap['3']  ?'' : recordMap['3'].validDate}" readonly="readonly"/></td>
								</tr>
							</table>
						</div>
						<div class="bR-line">
							<h3>获得政府扶持成为县/市/省/国家级重点骨干企业<i>（以最高级别填写）</i></h3>
							<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
								<tr>
									<th class="bR-t12">名称</th>
									<th class="bR-t13">级别</th>
									<th class="bR-t14">认定单位</th>
									<th class="bR-t15">证件编号</th>
									<th class="bR-t16">发证日期</th>
									<th class="bR-t16">有效期至</th>
								</tr>
								<tr>
									<input type="hidden" name="tacaBizRecords[3].id" value="${empty recordMap['4']  ?'' : recordMap['4'].id }"/>
									<input type="hidden" name="tacaBizRecords[3].type" value="4"/>
									<td class="bR-t12"><input type="text"  name="tacaBizRecords[3].name" value="${empty recordMap['4']  ?'' : recordMap['4'].name}" readonly="readonly"/></td>
									<td class="bR-t13"><input type="text"  name="tacaBizRecords[3].level" value="${empty recordMap['4']  ?'' : recordMap['4'].level}" readonly="readonly"/></td>
									<td class="bR-t14"><input type="text"  name="tacaBizRecords[3].authOrgan" value="${empty recordMap['4']  ?'' : recordMap['4'].authOrgan}" readonly="readonly"/></td>
									<td class="bR-t15"><input type="text"  name="tacaBizRecords[3].certificateCode" value="${empty recordMap['4']  ?'' : recordMap['4'].certificateCode}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text"  name="tacaBizRecords[3].issuingDate" value="${empty recordMap['4']  ?'' :recordMap['4'].issuingDate}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text"  name="tacaBizRecords[3].validDate" value="${empty recordMap['4']  ?'' : recordMap['4'].validDate}" readonly="readonly"/></td>
								</tr>
							</table>
						</div>
						<div class="bR-line">
							<h3>认定为行业县/市/省/国家级优强企业<i>（以最高级别填写）</i></h3>
							<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
								<tr>
									<th class="bR-t12">名称</th>
									<th class="bR-t13">级别</th>
									<th class="bR-t14">认定单位</th>
									<th class="bR-t15">证件编号</th>
									<th class="bR-t16">发证日期</th>
									<th class="bR-t16">有效期至</th>
								</tr>
								<tr>
									<input type="hidden" name="tacaBizRecords[4].id" value="${empty recordMap['5']  ?'' : recordMap['5'].id }"/>
									<input type="hidden" name="tacaBizRecords[4].type" value="5"/>
									<td class="bR-t12"><input type="text"  name="tacaBizRecords[4].name" value="${empty recordMap['5']  ?'' : recordMap['5'].name}" readonly="readonly"/></td>
									<td class="bR-t13"><input type="text"  name="tacaBizRecords[4].level" value="${empty recordMap['5']  ?'' : recordMap['5'].level}" readonly="readonly"/></td>
									<td class="bR-t14"><input type="text"  name="tacaBizRecords[4].authOrgan" value="${empty recordMap['5']  ?'' : recordMap['5'].authOrgan}" readonly="readonly"/></td>
									<td class="bR-t15"><input type="text"  name="tacaBizRecords[4].certificateCode" value="${empty recordMap['5']  ?'' : recordMap['5'].certificateCode}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text"  name="tacaBizRecords[4].issuingDate" value="${empty recordMap['5'] ?'' : recordMap['5'].issuingDate}" readonly="readonly"/></td>
									<td class="bR-t16"><input class="date_picker" type="text"  name="tacaBizRecords[4].validDate" value="${empty recordMap['5']  ?'' : recordMap['5'].validDate}" readonly="readonly"/></td>
								</tr>
							</table>
						</div>
						<div class="bR-line bR-choose">													
							<i style="margin: 0;">执行商品准入制度：</i>
							<i style="margin: 0;">一般</i>
							<label class="jqWrap">						
								<input type="radio" attr="accessInstitute" name="userTacaBiz.accessInstitute" value="1" />
							</label>
							<i style="margin: 0;">好</i>
							<label class="jqWrap">						
								<input type="radio" attr="accessInstitute" name="userTacaBiz.accessInstitute" value="2" />
							</label>
							<i style="margin: 0;">较好</i>
							<label class="jqWrap">						
								<input type="radio" attr="accessInstitute" name="userTacaBiz.accessInstitute" value="3" />
							</label>						
						</div>
						<div class="bR-line">
							<h3>现有的行业资质等级水平</h3>
							<div class="bRlevel ">
								<textarea name="userTacaBiz.level" readonly="readonly">${empty tacaBizs || empty tacaBizs[0].level ?'' : tacaBizs[0].level}</textarea>
							</div>
						</div>
					
					<h3 class="baseRight-tit"><span>工商信用流失纪录指标及投诉或失信事件统计</span></h3>
					<div class="bR-line bRstat ">
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td class="bR-s1"></td>
								<td class="bR-s2">2015</td>
								<td class="bR-s3">2016</td>
							</tr>
							<tr>
								<td class="bR-s1">工商警告</td>
								<td class="bR-s2">									
									<label class="jqWrap jqWrap-left bRcheck" style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[0].id" value="${year_2015_1.id}"/>
										<input type="hidden" name="tacaDishonesties[0].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[0].eventType" value="1"/>
										<input type="checkbox" attr="eventResult0"  name="tacaDishonesties[0].eventResult" value="1"/>
										<input type="hidden" id="eventResult0" value="${year_2015_1.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[25].id" value="${year_2016_1.id}"/>
										<input type="hidden" name="tacaDishonesties[25].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[25].eventType" value="1"/>
										<input type="checkbox" attr="eventResult1"  name="tacaDishonesties[25].eventResult" value="1"/>
										<input type="hidden" id="eventResult1" value="${year_2016_1.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">工商责令改正</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[1].id" value="${year_2015_2.id}"/>
										<input type="hidden" name="tacaDishonesties[1].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[1].eventType" value="2"/>
										<input type="checkbox" attr="eventResult2"  name="tacaDishonesties[1].eventResult" value="1"/>
										<input type="hidden" id="eventResult2" value="${year_2015_2.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[26].id" value="${year_2016_2.id}"/>
										<input type="hidden" name="tacaDishonesties[26].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[26].eventType" value="2"/>
										<input type="checkbox" attr="eventResult3"  name="tacaDishonesties[26].eventResult" value="1"/>
										<input type="hidden" id="eventResult3" value="${year_2016_2.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">罚款、没收财物</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[2].id" value="${year_2015_3.id}"/>
										<input type="hidden" name="tacaDishonesties[2].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[2].eventType" value="3"/>
										<input type="checkbox" attr="eventResult4"  name="tacaDishonesties[2].eventResult" value="1"/>
										<input type="hidden" id="eventResult4" value="${year_2015_3.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[27].id" value="${year_2016_3.id}"/>
										<input type="hidden" name="tacaDishonesties[27].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[27].eventType" value="3"/>
										<input type="checkbox" attr="eventResult5"  name="tacaDishonesties[27].eventResult" value="1"/>
										<input type="hidden" id="eventResult5" value="${year_2016_3.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">停业整顿</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[3].id" value="${year_2015_4.id}"/>
										<input type="hidden" name="tacaDishonesties[3].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[3].eventType" value="4"/>
										<input type="checkbox" attr="eventResult6"  name="tacaDishonesties[3].eventResult" value="1"/>
										<input type="hidden" id="eventResult6" value="${year_2015_4.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[28].id" value="${year_2016_4.id}"/>
										<input type="hidden" name="tacaDishonesties[28].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[28].eventType" value="4"/>
										<input type="checkbox" attr="eventResult7"  name="tacaDishonesties[28].eventResult" value="1"/>
										<input type="hidden" id="eventResult7" value="${year_2016_4.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">暂扣证照</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[4].id" value="${year_2015_5.id}"/>
										<input type="hidden" name="tacaDishonesties[4].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[4].eventType" value="5"/>
										<input type="checkbox" attr="eventResult8"  name="tacaDishonesties[4].eventResult" value="1"/>
										<input type="hidden" id="eventResult8" value="${year_2015_5.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[29].id" value="${year_2016_5.id}"/>
										<input type="hidden" name="tacaDishonesties[29].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[29].eventType" value="5"/>
										<input type="checkbox" attr="eventResult9"  name="tacaDishonesties[29].eventResult" value="1"/>
										<input type="hidden" id="eventResult9" value="${year_2016_5.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">吊销证照</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[5].id" value="${year_2015_6.id}"/>
										<input type="hidden" name="tacaDishonesties[5].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[5].eventType" value="6"/>
										<input type="checkbox" attr="eventResult10"  name="tacaDishonesties[5].eventResult" value="1"/>
										<input type="hidden" id="eventResult10" value="${year_2015_6.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[30].id" value="${year_2016_6.id}"/>
										<input type="hidden" name="tacaDishonesties[30].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[30].eventType" value="6"/>
										<input type="checkbox" attr="eventResult11"  name="tacaDishonesties[30].eventResult" value="1"/>
										<input type="hidden" id="eventResult11" value="${year_2016_6.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">法定代表人或经理人违反治安管理条例</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[6].id" value="${year_2015_7.id}"/>
										<input type="hidden" name="tacaDishonesties[6].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[6].eventType" value="7"/>
										<input type="checkbox" attr="eventResult12"  name="tacaDishonesties[6].eventResult" value="1"/>
										<input type="hidden" id="eventResult12" value="${year_2015_7.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[31].id" value="${year_2016_7.id}"/>
										<input type="hidden" name="tacaDishonesties[31].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[31].eventType" value="7"/>
										<input type="checkbox" attr="eventResult13"  name="tacaDishonesties[31].eventResult" value="1"/>
										<input type="hidden" id="eventResult13" value="${year_2016_7.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">法定代表人或经理人被移送或追究刑事责任</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[7].id" value="${year_2015_8.id}"/>
										<input type="hidden" name="tacaDishonesties[7].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[7].eventType" value="8"/>
										<input type="checkbox" attr="eventResult14"  name="tacaDishonesties[7].eventResult" value="1"/>
										<input type="hidden" id="eventResult14" value="${year_2015_8.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[32].id" value="${year_2016_8.id}"/>
										<input type="hidden" name="tacaDishonesties[32].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[32].eventType" value="8"/>
										<input type="checkbox" attr="eventResult15"  name="tacaDishonesties[32].eventResult" value="1"/>
										<input type="hidden" id="eventResult15" value="${year_2016_8.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">行政告诫</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[8].id" value="${year_2015_9.id}"/>
										<input type="hidden" name="tacaDishonesties[8].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[8].eventType" value="9"/>
										<input type="checkbox" attr="eventResult16"  name="tacaDishonesties[8].eventResult" value="1"/>
										<input type="hidden" id="eventResult16" value="${year_2015_9.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[33].id" value="${year_2016_9.id}"/>
										<input type="hidden" name="tacaDishonesties[33].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[33].eventType" value="9"/>
										<input type="checkbox" attr="eventResult17"  name="tacaDishonesties[33].eventResult" value="1"/>
										<input type="hidden" id="eventResult17" value="${year_2016_9.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">企业工商信用等级降级</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[9].id" value="${year_2015_10.id}"/>
										<input type="hidden" name="tacaDishonesties[9].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[9].eventType" value="10"/>
										<input type="checkbox" attr="eventResult18"  name="tacaDishonesties[9].eventResult" value="1"/>
										<input type="hidden" id="eventResult18" value="${year_2015_10.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[34].id" value="${year_2016_10.id}"/>
										<input type="hidden" name="tacaDishonesties[34].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[34].eventType" value="10"/>
										<input type="checkbox" attr="eventResult19"  name="tacaDishonesties[34].eventResult" value="1"/>
										<input type="hidden" id="eventResult19" value="${year_2016_10.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">企业受到行业自律处分</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[10].id" value="${year_2015_11.id}"/>
										<input type="hidden" name="tacaDishonesties[10].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[10].eventType" value="11"/>
										<input type="checkbox" attr="eventResult20"  name="tacaDishonesties[10].eventResult" value="1"/>
										<input type="hidden" id="eventResult20" value="${year_2015_11.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[35].id" value="${year_2016_11.id}"/>
										<input type="hidden" name="tacaDishonesties[35].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[35].eventType" value="11"/>
										<input type="checkbox" attr="eventResult21"  name="tacaDishonesties[35].eventResult" value="1"/>
										<input type="hidden" id="eventResult21" value="${year_2016_11.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">资质等级下降或认证被取消</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[11].id" value="${year_2015_12.id}"/>
										<input type="hidden" name="tacaDishonesties[11].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[11].eventType" value="12"/>
										<input type="checkbox" attr="eventResult22"  name="tacaDishonesties[11].eventResult" value="1"/>
										<input type="hidden" id="eventResult22" value="${year_2015_12.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[36].id" value="${year_2016_12.id}"/>
										<input type="hidden" name="tacaDishonesties[36].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[36].eventType" value="12"/>
										<input type="checkbox" attr="eventResult23"  name="tacaDishonesties[36].eventResult" value="1"/>
										<input type="hidden" id="eventResult23" value="${year_2016_12.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">发生重大负面事件或伤亡事故</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[12].id" value="${year_2015_13.id}"/>
										<input type="hidden" name="tacaDishonesties[12].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[12].eventType" value="13"/>
										<input type="checkbox" attr="eventResult24"  name="tacaDishonesties[12].eventResult" value="1"/>
										<input type="hidden" id="eventResult24" value="${year_2015_13.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[37].id" value="${year_2016_13.id}"/>
										<input type="hidden" name="tacaDishonesties[37].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[37].eventType" value="13"/>
										<input type="checkbox" attr="eventResult25"  name="tacaDishonesties[37].eventResult" value="1"/>
										<input type="hidden" id="eventResult25" value="${year_2016_13.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">不履行对社会公益捐赠的承诺</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[13].id" value="${year_2015_14.id}"/>
										<input type="hidden" name="tacaDishonesties[13].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[13].eventType" value="14"/>
										<input type="checkbox" attr="eventResult26"  name="tacaDishonesties[13].eventResult" value="1"/>
										<input type="hidden" id="eventResult26" value="${year_2015_14.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[38].id" value="${year_2016_14.id}"/>
										<input type="hidden" name="tacaDishonesties[38].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[38].eventType" value="14"/>
										<input type="checkbox" attr="eventResult27"  name="tacaDishonesties[38].eventResult" value="1"/>
										<input type="hidden" id="eventResult27" value="${year_2016_14.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">不如期执行行政处罚决定</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[14].id" value="${year_2015_15.id}"/>
										<input type="hidden" name="tacaDishonesties[14].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[14].eventType" value="15"/>
										<input type="checkbox" attr="eventResult28"  name="tacaDishonesties[14].eventResult" value="1"/>
										<input type="hidden" id="eventResult28" value="${year_2015_15.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[39].id" value="${year_2016_15.id}"/>
										<input type="hidden" name="tacaDishonesties[39].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[39].eventType" value="15"/>
										<input type="checkbox" attr="eventResult29"  name="tacaDishonesties[39].eventResult" value="1"/>
										<input type="hidden" id="eventResult29" value="${year_2016_15.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">不签订有关责任书</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[15].id" value="${year_2015_16.id}"/>
										<input type="hidden" name="tacaDishonesties[15].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[15].eventType" value="16"/>
										<input type="checkbox" attr="eventResult30"  name="tacaDishonesties[15].eventResult" value="1"/>
										<input type="hidden" id="eventResult30" value="${year_2015_16.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[40].id" value="${year_2016_16.id}"/>
										<input type="hidden" name="tacaDishonesties[40].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[40].eventType" value="16"/>
										<input type="checkbox" attr="eventResult31"  name="tacaDishonesties[40].eventResult" value="1"/>
										<input type="hidden" id="eventResult31" value="${year_2016_16.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">不按规定执行重要商品进货索证（票）</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[16].id" value="${year_2015_17.id}"/>
										<input type="hidden" name="tacaDishonesties[16].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[16].eventType" value="17"/>
										<input type="checkbox" attr="eventResult32"  name="tacaDishonesties[16].eventResult" value="1"/>
										<input type="hidden" id="eventResult32" value="${year_2015_17.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[41].id" value="${year_2016_17.id}"/>
										<input type="hidden" name="tacaDishonesties[41].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[41].eventType" value="17"/>
										<input type="checkbox" attr="eventResult33"  name="tacaDishonesties[41].eventResult" value="1"/>
										<input type="hidden" id="eventResult33" value="${year_2016_17.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">不按规定明码标价</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[17].id" value="${year_2015_18.id}"/>
										<input type="hidden" name="tacaDishonesties[17].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[17].eventType" value="18"/>
										<input type="checkbox" attr="eventResult34"  name="tacaDishonesties[17].eventResult" value="1"/>
										<input type="hidden" id="eventResult34" value="${year_2015_18.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[42].id" value="${year_2016_18.id}"/>
										<input type="hidden" name="tacaDishonesties[42].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[42].eventType" value="18"/>
										<input type="checkbox" attr="eventResult35"  name="tacaDishonesties[42].eventResult" value="1"/>
										<input type="hidden" id="eventResult35" value="${year_2016_18.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">占道经营、擅自扩摊、摊外设摊、流动经营</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[18].id" value="${year_2015_19.id}"/>
										<input type="hidden" name="tacaDishonesties[18].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[18].eventType" value="19"/>
										<input type="checkbox" attr="eventResult36"  name="tacaDishonesties[18].eventResult" value="1"/>
										<input type="hidden" id="eventResult36" value="${year_2015_19.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[43].id" value="${year_2016_19.id}"/>
										<input type="hidden" name="tacaDishonesties[43].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[43].eventType" value="19"/>
										<input type="checkbox" attr="eventResult37"  name="tacaDishonesties[43].eventResult" value="1"/>
										<input type="hidden" id="eventResult37" value="${year_2016_19.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">食品、农副产品经检测为不合格</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[19].id" value="${year_2015_20.id}"/>
										<input type="hidden" name="tacaDishonesties[19].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[19].eventType" value="20"/>
										<input type="checkbox" attr="eventResult38"  name="tacaDishonesties[19].eventResult" value="1"/>
										<input type="hidden" id="eventResult38" value="${year_2015_20.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[44].id" value="${year_2016_20.id}"/>
										<input type="hidden" name="tacaDishonesties[44].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[44].eventType" value="20"/>
										<input type="checkbox" attr="eventResult39"  name="tacaDishonesties[44].eventResult" value="1"/>
										<input type="hidden" id="eventResult39" value="${year_2016_20.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">经销 “三无”商品或标识不符合规定的商品</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[20].id" value="${year_2015_21.id}"/>
										<input type="hidden" name="tacaDishonesties[20].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[20].eventType" value="21"/>
										<input type="checkbox" attr="eventResult40"  name="tacaDishonesties[20].eventResult" value="1"/>
										<input type="hidden" id="eventResult40" value="${year_2015_21.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[45].id" value="${year_2016_21.id}"/>
										<input type="hidden" name="tacaDishonesties[45].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[45].eventType" value="21"/>
										<input type="checkbox" attr="eventResult41"  name="tacaDishonesties[45].eventResult" value="1"/>
										<input type="hidden" id="eventResult41" value="${year_2016_21.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">侵害消费者、客商人格尊严</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[21].id" value="${year_2015_22.id}"/>
										<input type="hidden" name="tacaDishonesties[21].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[21].eventType" value="22"/>
										<input type="checkbox" attr="eventResult42"  name="tacaDishonesties[21].eventResult" value="1"/>
										<input type="hidden" id="eventResult42" value="${year_2015_22.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[46].id" value="${year_2016_22.id}"/>
										<input type="hidden" name="tacaDishonesties[46].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[46].eventType" value="22"/>
										<input type="checkbox" attr="eventResult43"  name="tacaDishonesties[46].eventResult" value="1"/>
										<input type="hidden" id="eventResult43" value="${year_2016_22.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">经营者拒不出具购货凭证、发票或要求加价</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[22].id" value="${year_2015_23.id}"/>
										<input type="hidden" name="tacaDishonesties[22].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[22].eventType" value="23"/>
										<input type="checkbox" attr="eventResult44"  name="tacaDishonesties[22].eventResult" value="1"/>
										<input type="hidden" id="eventResult44" value="${year_2015_23.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[47].id" value="${year_2016_23.id}"/>
										<input type="hidden" name="tacaDishonesties[47].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[47].eventType" value="23"/>
										<input type="checkbox" attr="eventResult45"  name="tacaDishonesties[47].eventResult" value="1"/>
										<input type="hidden" id="eventResult45" value="${year_2016_23.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">不文明经营，不认真处理消费者、客商投诉</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[23].id" value="${year_2015_24.id}"/>
										<input type="hidden" name="tacaDishonesties[23].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[23].eventType" value="24"/>
										<input type="checkbox" attr="eventResult46"  name="tacaDishonesties[23].eventResult" value="1"/>
										<input type="hidden" id="eventResult46" value="${year_2015_24.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[48].id" value="${year_2016_24.id}"/>
										<input type="hidden" name="tacaDishonesties[48].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[48].eventType" value="24"/>
										<input type="checkbox" attr="eventResult47"  name="tacaDishonesties[48].eventResult" value="1"/>
										<input type="hidden" id="eventResult47" value="${year_2016_24.eventResult}"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="bR-s1">其它违反工商法律法规，但情节轻微，不予行政处罚的</td>
								<td class="bR-s2">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[24].id" value="${year_2015_25.id}"/>
										<input type="hidden" name="tacaDishonesties[24].year" value="2015" />
										<input type="hidden" name="tacaDishonesties[24].eventType" value="25"/>
										<input type="checkbox" attr="eventResult48"  name="tacaDishonesties[24].eventResult" value="1"/>
										<input type="hidden" id="eventResult48" value="${year_2015_25.eventResult}"/>
									</label>
								</td>
								<td class="bR-s3">
									<label class="jqWrap jqWrap-left bRcheck " style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 5px;width: 20px;">									
										<input type="hidden" name="tacaDishonesties[49].id" value="${year_2016_25.id}"/>
										<input type="hidden" name="tacaDishonesties[49].year" value="2016" />
										<input type="hidden" name="tacaDishonesties[49].eventType" value="25"/>
										<input type="checkbox" attr="eventResult49"  name="tacaDishonesties[49].eventResult" value="1"/>
										<input type="hidden" id="eventResult49" value="${year_2016_25.eventResult}"/>
									</label>
								</td>
							</tr>
						</table>
					</div>
					<h3 class="baseRight-tit"><span>企业近年来各类消费者投诉处理结果统计</span></h3>
					<div class="bR-line bR-mp">
						<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
							<tr>
								<th class="bR-t11" colspan="2">消费者投诉总件数</th>
								<th class="bR-t11" colspan="2">由部门层面解决件数</th>
								<th class="bR-t11" colspan="2">上报到公司层面解决件数</th>									
							</tr>
							<tr>
								<td class="bR-t11 bR-t8-bg">2015年</td>
								<td class="bR-t11 bR-t8-bg">2016年</td>
								<td class="bR-t11 bR-t8-bg">2015年</td>
								<td class="bR-t11 bR-t8-bg">2016年</td>
								<td class="bR-t11 bR-t8-bg">2015年</td>
								<td class="bR-t11 bR-t8-bg">2016年</td>
							</tr>
							<tr>
								<td class="bR-t11">
								  <input type="hidden" name="tacaComplaints[0].id" value="${empty dishonestyMap['2015_1']  ?'' : dishonestyMap['2015_1'].id}"/>
								  <input type="hidden" name="tacaComplaints[0].year" value="2015"/>
								  <input type="hidden" name="tacaComplaints[0].eventType" value="1"/>
								  <input type="text" name="tacaComplaints[0].number" value="${empty dishonestyMap['2015_1']  ?'' : dishonestyMap['2015_1'].number}" readonly="readonly"/>
								</td>
								<td class="bR-t11">
								   <input type="hidden" name="tacaComplaints[1].id" value="${empty dishonestyMap['2016_1']  ?'' : dishonestyMap['2016_1'].id}"/>
								   <input type="hidden" name="tacaComplaints[1].year" value="2016"/>
								   <input type="hidden" name="tacaComplaints[1].eventType" value="1"/>
								   <input type="text" name="tacaComplaints[1].number" value="${empty dishonestyMap['2016_1']  ?'' : dishonestyMap['2016_1'].number}" readonly="readonly"/>
								</td>
								<td class="bR-t11">
								   <input type="hidden" name="tacaComplaints[2].id" value="${empty dishonestyMap['2015_2']  ?'' : dishonestyMap['2015_2'].id}"/>
								   <input type="hidden" name="tacaComplaints[2].year" value="2015"/>
								   <input type="hidden" name="tacaComplaints[2].eventType" value="2"/>
								   <input type="text" name="tacaComplaints[2].number" value="${empty dishonestyMap['2015_2']  ?'' : dishonestyMap['2015_2'].number}" readonly="readonly"/>
								</td>
								<td class="bR-t11">
								   <input type="hidden" name="tacaComplaints[3].id" value="${empty dishonestyMap['2016_2']  ?'' : dishonestyMap['2016_2'].id}"/>
								   <input type="hidden" name="tacaComplaints[3].year" value="2016"/>
								   <input type="hidden" name="tacaComplaints[3].eventType" value="2"/>
								   <input type="text" name="tacaComplaints[3].number" value="${empty dishonestyMap['2016_2']  ?'' : dishonestyMap['2016_2'].number}" readonly="readonly"/>
								</td>
								<td class="bR-t11">
								   <input type="hidden" name="tacaComplaints[4].id" value="${empty dishonestyMap['2015_3']  ?'' : dishonestyMap['2015_3'].id}"/>
								   <input type="hidden" name="tacaComplaints[4].year" value="2015"/>
								   <input type="hidden" name="tacaComplaints[4].eventType" value="3"/>
								   <input type="text" name="tacaComplaints[4].number" value="${empty dishonestyMap['2015_3']  ?'' : dishonestyMap['2015_3'].number}" readonly="readonly"/>
								</td>
								<td class="bR-t11">
								   <input type="hidden" name="tacaComplaints[5].id" value="${empty dishonestyMap['2016_3']  ?'' : dishonestyMap['2016_3'].id}"/>
								   <input type="hidden" name="tacaComplaints[5].year" value="2016"/>
								   <input type="hidden" name="tacaComplaints[5].eventType" value="3"/>
								   <input type="text" name="tacaComplaints[5].number" value="${empty dishonestyMap['2016_3']  ?'' : dishonestyMap['2016_3'].number}" readonly="readonly"/>
								</td>
							</tr>
						</table>
					</div>
					<div class="bR-line">
						<h3>其它消费者投诉未处理事件</h3>
						<div class="bRlevel">
							<textarea name="userTacaBiz.otherUntreated" readonly="readonly">${empty tacaBizs || empty tacaBizs[0].otherUntreated ?'' : tacaBizs[0].otherUntreated}</textarea>
						</div>
					</div>
					<div class="bR-button">
						<button type="button" class="bt2"  >上一页</button><button type="button" class="bt1">下一页</button>
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
