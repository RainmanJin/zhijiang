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
	<script data-main="${basePath }/js/uzj/taca/taca_dispute.js" src="${basePath }/js/lib/require.js"></script>
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
				   <h3 class="baseRight-tit"><span>企业信用记录</span></h3>
				   <form id="addDisputeForm" action="${basePath }/taca/apply/add/dispute" method="post">
					   <input type="hidden" name="token" value="${token}"/>
					   <input type="hidden" id="submitType" value="${sessionScope.user.customData.submitType}"/>
                       <input type="hidden" name="activityId" value="${activity.id}"/>
					   <div class="bR-line">
				         <table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-bot">
				                <input type="hidden" name="disputes[0].year" value="2015"/>
				                <input type="hidden" name="disputes[1].year" value="2015"/>
				                <input type="hidden" name="disputes[2].year" value="2016"/>
				                <input type="hidden" name="disputes[3].year" value="2016"/>
				                <input type="hidden" name="disputes[0].disputeType" value="1"/>
				                <input type="hidden" name="disputes[1].disputeType" value="2"/>
				                <input type="hidden" name="disputes[2].disputeType" value="1"/>
				                <input type="hidden" name="disputes[3].disputeType" value="2"/>
				                <input type="hidden" name="disputes[0].id" value="${year_2015_1.id }"/>
				                <input type="hidden" name="disputes[1].id" value="${year_2015_2.id }"/>
				                <input type="hidden" name="disputes[2].id" value="${year_2016_1.id }"/>
				                <input type="hidden" name="disputes[3].id" value="${year_2016_2.id }"/>
								<tr>
									<th class="bR-t8"></th>
									<th class="bR-t9"></th>
									<th class="bR-t10">2015年</th>
									<th class="bR-t10">2016年</th>
								</tr>
								<tr>
									<td class="bR-t8 bR-t8-bg" rowspan="3" >经济纠纷</td>
									<td class="bR-t9 bR-t8-bg">标的额</td>
									<td class="bR-t10"><input type="text" name="disputes[0].economicTargetAmount"  data-attr='number' value="${year_2015_1.economicTargetAmount}"/></td>
									<td class="bR-t10"><input type="text" name="disputes[2].economicTargetAmount"  data-attr='number' value="${year_2016_1.economicTargetAmount}"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">处理件数</td>
									<td class="bR-t10"><input type="text" name="disputes[0].economicDealNum"  data-attr='number' value="${year_2015_1.economicDealNum}"/></td>
									<td class="bR-t10"><input type="text" name="disputes[2].economicDealNum"  data-attr='number' value="${year_2016_1.economicDealNum}"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">性质</td>
									<td class="bR-t10">
									    <input type="hidden" id="economicProperty0" value="${year_2015_1.economicProperty}"/>
										<select data-attr="economicProperty0" name="disputes[0].economicProperty">
										 	<option value="">请选择</option>
										 	<option value="企业纠纷">企业纠纷</option>
										 	<option value="工资拖欠">工资拖欠</option>
										 	<option value="消费者投诉">消费者投诉</option>
										</select>
									</td>
									<td class="bR-t10">
									    <input type="hidden" id="economicProperty1" value="${year_2016_1.economicProperty}"/>
										<select data-attr="economicProperty1" name="disputes[2].economicProperty">
										 	<option value="">请选择</option>
										 	<option value="企业纠纷">企业纠纷</option>
										 	<option value="工资拖欠">工资拖欠</option>
										 	<option value="消费者投诉">消费者投诉</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="bR-t8 bR-t8-bg" rowspan="3" >司法纠纷</td>
									<td class="bR-t9 bR-t8-bg">标的额</td>
									<td class="bR-t10"><input type="text" name="disputes[1].economicTargetAmount"  data-attr='number' value="${year_2015_2.economicTargetAmount}"/></td>
									<td class="bR-t10"><input type="text" name="disputes[3].economicTargetAmount"  data-attr='number' value="${year_2016_2.economicTargetAmount}"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">处理件数</td>
									<td class="bR-t10"><input type="text" name="disputes[1].economicDealNum"  data-attr='number' value="${year_2015_2.economicDealNum}"/></td>
									<td class="bR-t10"><input type="text" name="disputes[3].economicDealNum"  data-attr='number' value="${year_2016_2.economicDealNum}"/></td>
								</tr>
								<tr>									
									<td class="bR-t9 bR-t8-bg">性质</td>
									<td class="bR-t10">
									    <input type="hidden" id="economicProperty2" value="${year_2015_2.economicProperty}"/>
									    <select data-attr="economicProperty2" name="disputes[1].economicProperty">
										 	<option value="">请选择</option>
										 	<option value="企业纠纷">企业纠纷</option>
										 	<option value="工资拖欠">工资拖欠</option>
										 	<option value="消费者投诉">消费者投诉</option>
										</select>
									</td>
									<td class="bR-t10">
									    <input type="hidden" id="economicProperty3" value="${year_2016_2.economicProperty}"/>
									    <select data-attr="economicProperty3" name="disputes[3].economicProperty">
										 	<option value="">请选择</option>
										 	<option value="企业纠纷">企业纠纷</option>
										 	<option value="工资拖欠">工资拖欠</option>
										 	<option value="消费者投诉">消费者投诉</option>
										</select>
									</td>
								</tr>
							</table>
							<h4 class="h4-note">注：纠纷涉及农民工工资拖欠、标的额超过10万元的不推荐参加本次诚信示范企业评选。</h4>
				      </div>
				      
				      <h3 class="baseRight-tit"><span>合同管理及履约统计</span></h3>
				      <input type="hidden" name="performance.id" value="${empty performances || empty performances[0].id ?'' : performances[0].id}"/>
				      <div class="bR-line bR-choose">
				         <h3 style="margin-top:15px;">企业合同管理情况</h3>
							<div class="bR-bg bR-bg5">
								<p>
									合同管理机构：
									<i>独立的合同信用管理部门</i>
									   <input type="hidden" id="contractOrgan" value="${empty performances || empty performances[0].contractOrgan ?'': performances[0].contractOrgan}"/>
									   <label class="jqWrap">
										  <input type="radio" attr="contractOrgan"  name="performance.contractOrgan" value="1" style="width: 13px;"/>
									   </label>
									<i>相关业务部门</i>
									   <label class="jqWrap">
										 <input type="radio" attr="contractOrgan" name="performance.contractOrgan" value="2" style="width: 13px;"/>
									  </label>
								</p>
								<p><span class="bR-bg5-s1">合同信用领导小组负责人</span><input type="text" name="performance.leadingGroupManager" value="${empty performances || performances[0].leadingGroupManager ?'' : performances[0].leadingGroupManager}" style="width: 250px;"/><span class="bR-bg5-s2">联系电话</span><input name="performance.leadingGroupManagerTel"  data-attr='number' value="${empty performances || performances[0].leadingGroupManagerTel ?'' : performances[0].leadingGroupManagerTel}" style="width: 250px;" type="text"/></p>
								<p><span class="bR-bg5-s1">信用管理部门负责人</span><input type="text" name="performance.creditManager" value="${empty performances || performances[0].creditManager ?'' : performances[0].creditManager}" style="width: 250px;"/><span class="bR-bg5-s2">联系电话</span><input name="performance.creditManagerTel"  data-attr='number' value="${empty performances || performances[0].creditManagerTel ?'' : performances[0].creditManagerTel}" style="width: 250px;" type="text"/></p>
							</div>
							<div class="bR-bg bR-bg5">
								<p><span class="bR-bg5-s1">合同管理人员配备情况：</span>									
									<i>专职</i>
									<input type="hidden" id="equipmentType" value="${empty performances || empty performances[0].equipmentType ?'' : performances[0].equipmentType}"/>
									<label class="jqWrap">
										<input type="radio" attr="equipmentType" name="performance.equipmentType" value="1" style="width: 13px;"/>
									</label>
									<i>兼职</i>
									<label class="jqWrap">
										<input type="radio" attr="equipmentType" name="performance.equipmentType" value="2"  style="width: 13px;"/>
									</label>
									<i>人数</i>
									<input type="text" name="performance.equipmentNum" data-attr='number' style="width: 150px;margin-left: 10px;" value="${empty performances || performances[0].equipmentNum ?'' : performances[0].equipmentNum }" />
								</p>
								<p><span class="bR-bg5-s1">学历水平：</span>
									<i>本科及以上</i>
									<input type="hidden" id="educationLevel" value="${empty performances || empty performances[0].educationLevel ?'' : performances[0].educationLevel}"/>
									<label class="jqWrap">
										<input type="radio" attr="educationLevel" name="performance.educationLevel" value="1" style="width: 13px;"/>
									</label>
									<i>高中及以上</i>
									<label class="jqWrap">
										<input type="radio" attr="educationLevel" name="performance.educationLevel" value="2" style="width: 13px;"/>
									</label>
									<i>初中及以上</i>
									<label class="jqWrap">
										<input type="radio" attr="educationLevel" name="performance.educationLevel" value="3" style="width: 13px;"/>
									</label>
								</p>
								<p><span class="bR-bg5-s1">职称水平：</span>
									<i>中级</i>
									 <input type="hidden" id="positionLevel" value="${empty performances || empty performances[0].positionLevel ?'' : performances[0].positionLevel}"/>
									 <label class="jqWrap">
										 <input type="radio" attr="positionLevel" name="performance.positionLevel" value="1" style="width: 13px;"/>
									 </label>
									<i>初级</i> 
									<label class="jqWrap">
										<input type="radio" attr="positionLevel" name="performance.positionLevel" value="2" style="width: 13px;" />
									</label>
								</p>
							</div>
							<div class="bR-bg bR-bg5">
								<p><span class="bR-bg5-s1">是否建立合同管理制度：</span>									
									<i>已建</i>
									  <input type="hidden" id="contractInstitute" value="${empty performances || empty performances[0].contractInstitute ?'' : performances[0].contractInstitute}"/>
									  <label class="jqWrap">
										 <input type="radio" attr="contractInstitute" name="performance.contractInstitute" value="1"  style="width: 13px;"/>
									  </label>
									<i>在建</i>
									  <label class="jqWrap">
										<input type="radio" attr="contractInstitute" name="performance.contractInstitute" value="2" style="width: 13px;"/>
									  </label>
									<i>无</i>
									  <label class="jqWrap">
										<input type="radio" attr="contractInstitute" name="performance.contractInstitute" value="0" style="width: 13px;"/>
									  </label>
								</p>
								<p><span class="bR-bg5-s1">是否建立合同管理台账：</span>
									<i>已建</i>
									   <input type="hidden" id="contractLedger" value="${empty performances || empty performances[0].contractLedger ?'' : performances[0].contractLedger}"/>
									   <label class="jqWrap">
										  <input type="radio" attr="contractLedger" name="performance.contractLedger" value="1" style="width: 13px;"/>
									   </label>
									<i>在建</i>
									   <label class="jqWrap">
										 <input type="radio" attr="contractLedger" name="performance.contractLedger" value="2" style="width: 13px;"/>
									   </label>
									<i>无</i>
										<label class="jqWrap">
											<input type="radio" attr="contractLedger" name="performance.contractLedger" value="0" style="width: 13px;"/>
										</label>
								</p>
								<p><span class="bR-bg5-s1">合同文本使用情况：</span>	
									   <input type="hidden" id="hemonstrationText" value="${empty performances || empty performances[0].hemonstrationText ?'' : performances[0].hemonstrationText}"/>
									   <label class="jqWrap jqWrap-left" style="background: url(${basePath }/images/base-check.png) no-repeat center top;padding-left: 0px;margin-right: 4px;width: 20px;height: 14px;">
										  <input type="checkbox" attr="hemonstrationText" name="performance.hemonstrationText" value="1" style="height: 0px;"/>
									   </label>
									<i>示范文本</i>
									<br>
									  <input type="hidden" id="homemadeText" value="${empty performances || empty performances[0].homemadeText ?'' : performances[0].homemadeText}"/>
									  <label class="jqWrap jqWrap-left jqM" style="background: url(${basePath }/images/base-check.png) no-repeat center top;padding-left: 338px;margin-right: -163px;width: 20px;height: 14px;">
										<input type="checkbox" attr="homemadeText" name="performance.homemadeText" value="2" style="height: 0px;"/>
									  </label>
									<i>自制文本</i>
									<br>
									 <input type="hidden" id="businessText" value="${empty performances || empty performances[0].businessText ?'' : performances[0].businessText}"/>
									 <label class="jqWrap jqWrap-left jqM" style="background: url(${basePath }/images/base-check.png) no-repeat center top;padding-left: 338px;margin-right: -163px;width: 20px;height: 14px;">
										<input type="checkbox" attr="businessText" name="performance.businessText" value="3"  style="height: 0px;"/>
									 </label>
									<i>经工商部门备案审查的文本</i>
								</p>
							</div>
				      </div>
				      
				      <div class="bR-line">
				         <h3>近三年企业合同履约情况统计</h3>
				         <table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top">
								<tr>
									<th class="bR-t11" colspan="2">合同采购数</th>
									<th class="bR-t11" colspan="2">合同纠纷数</th>
									<th class="bR-t11" colspan="2">合同履约数</th>
								</tr>
								<tr>
									<td class="bR-t11 bR-t8-bg">总数</td>
									<td class="bR-t11 bR-t8-bg">政府合同采购数</td>
									<td class="bR-t11 bR-t8-bg">总数</td>
									<td class="bR-t11 bR-t8-bg">政府合同采购数</td>
									<td class="bR-t11 bR-t8-bg">总数</td>
									<td class="bR-t11 bR-t8-bg">政府合同采购数</td>
								</tr>
								<tr>
									<td class="bR-t11"><input type="text" name="performance.purchaseTotal"  data-attr='number' value="${empty performances || performances[0].purchaseTotal ?'' : performances[0].purchaseTotal}"/></td>
									<td class="bR-t11"><input type="text" name="performance.purchaseGovNum"  data-attr='number' value="${empty performances || performances[0].purchaseGovNum ?'' : performances[0].purchaseGovNum}"/></td>
									<td class="bR-t11"><input type="text" name="performance.disputeTotal"  data-attr='number' value="${empty performances || performances[0].disputeTotal ?'' : performances[0].disputeTotal}"/></td>
									<td class="bR-t11"><input type="text" name="performance.disputeGovNum"  data-attr='number' value="${empty performances || performances[0].disputeGovNum ?'' : performances[0].disputeGovNum}"/></td>
									<td class="bR-t11"><input type="text" name="performance.performanceTotal"  data-attr='number' value="${empty performances || performances[0].performanceTotal ?'' : performances[0].performanceTotal}"/></td>
									<td class="bR-t11"><input type="text" name="performance.performanceGovNum"  data-attr='number' value="${empty performances || performances[0].performanceGovNum ?'' : performances[0].performanceGovNum}"/></td>
								</tr>
							</table>
				      </div>
				      <div class="bR-button">
							<button type="button" class="bt2" >上一页</button><button type="submit"  class="bt1" id="saveBtn">保存并进入下一页</button>
						</div>
				   </form>
				</div>
           </div>
       </div>
    </div>
<jsp:include page="/footer.jsp" /> 
</body>
</html>
