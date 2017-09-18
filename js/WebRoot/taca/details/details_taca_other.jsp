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
	<script>
      var  activityCfg = activityCfg || {page : 'other'};
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
					<h3 class="baseRight-tit"><span>海关及司法信用记录</span></h3>
						<input type="hidden" name="userTacaCustomsJudiciary.id" value="${empty tacaCustomsJudiciaries || empty tacaCustomsJudiciaries[0].id ?'' : tacaCustomsJudiciaries[0].id}"/>
						<input type="hidden" name="userTacaLegalPerson.id" value="${empty tacaLegalPersons || empty tacaLegalPersons[0].id ?'' : tacaLegalPersons[0].id}"/>
						<div class="bRtarget">							
							<p style="margin-top: 0;">								
								<label class="jqWrap bRcheck" style="margin-right: 0px;width: 20px;height: 14px;">		
									<input type="hidden" id="illegalRecord" value="${empty tacaCustomsJudiciaries || empty tacaCustomsJudiciaries[0].illegalRecord ?'' : tacaCustomsJudiciaries[0].illegalRecord}" />							
									<input type="checkbox" attr="illegalRecord" name="userTacaCustomsJudiciary.illegalRecord" value="0" />
								</label>
								无违法违纪记录
							</p>							
						</div>
						<div class="bR-line">							
							<div class="bRlevel">
								<textarea placeholder="若有违法记录，请说明" style="height: 90px;" name="userTacaCustomsJudiciary.illegalInfo" readonly="readonly">${empty tacaCustomsJudiciaries || empty tacaCustomsJudiciaries[0].illegalInfo ?'' : tacaCustomsJudiciaries[0].illegalInfo}</textarea>
							</div>
						</div>
					    <h3 class="baseRight-tit"><span>企业法人信用记录</span></h3>
						<div class="bR-line">
							<div class="bRrecord" style="margin-top: 12px;">
								<p><span>企业名称</span><input type="text" name="userTacaLegalPerson.tacaCompanyName" value="${empty tacaLegalPersons || empty tacaLegalPersons[0].tacaCompanyName ?'' : tacaLegalPersons[0].tacaCompanyName}" style="width: 220px;" readonly="readonly"/></p>
								<p><span>企业地址</span><input type="text" name="userTacaLegalPerson.companyAddress" value="${empty tacaLegalPersons || empty tacaLegalPersons[0].companyAddress ?'' : tacaLegalPersons[0].companyAddress}" style="width: 220px;" readonly="readonly"/></p>
							</div>
							<div class="bRrecord">
								<p><span>姓名</span><input type="text" name="userTacaLegalPerson.personName" value="${empty tacaLegalPersons || empty tacaLegalPersons[0].personName ?'' : tacaLegalPersons[0].personName}" style="width: 130px;" readonly="readonly"/></p>
								<p style="margin-top: 10px;"><span>性别</span>
								<input type="hidden" id="personSex" value="${empty tacaLegalPersons || empty tacaLegalPersons[0].personSex ?'' : tacaLegalPersons[0].personSex}"/>
								<label class="jqWrap">														
									<i style="vertical-align: middle;margin-left: 20px;">男</i>									
									<input type="radio" attr="personSex" name="userTacaLegalPerson.personSex" value="1"/>
								</label>
								<label class="jqWrap">
									<i style="vertical-align: middle;margin-left: 20px;">女</i>
									<input type="radio" attr="personSex" name="userTacaLegalPerson.personSex" value="2" />
								</label>
								</p>
							</div>
							<div class="bRrecord">
								<p><span>年龄</span><input type="text" name="userTacaLegalPerson.personAge" value="${empty tacaLegalPersons || empty tacaLegalPersons[0].personAge ?'' : tacaLegalPersons[0].personAge}"  style="width: 120px;" readonly="readonly"/></p>
								<p><span>民族</span><input type="text" name="userTacaLegalPerson.famousFamily" value="${empty tacaLegalPersons || empty tacaLegalPersons[0].famousFamily ?'' : tacaLegalPersons[0].famousFamily}" style="width: 120px;" readonly="readonly"/></p>
							</div>
							<div class="bRrecord">
								<p>
									<span style="float: left;line-height: 35px;">职务</span>
									<input type="hidden" id="position"  value="${empty tacaLegalPersons || empty tacaLegalPersons[0].position ?'' : tacaLegalPersons[0].position}"/>
									<select data-attr="position"  name="userTacaLegalPerson.position" disabled="disabled">
										<option data-attr="" value="">请选择</option>
				                        <option data-attr="1" value="1">总经理</option>
				                        <option data-attr="2" value="2">副总经理</option>
				                        <option data-attr="3" value="3">总监</option>
				                        <option data-attr="4" value="4">其他</option>
									</select>
								</p>
								<p>
									<span style="float: left;line-height: 35px;">文化程度</span>
									<input type="hidden" id="culturalLevel"  value="${empty tacaLegalPersons || empty tacaLegalPersons[0].culturalLevel ?'' : tacaLegalPersons[0].culturalLevel}"/>
									<select data-attr="culturalLevel" name="userTacaLegalPerson.culturalLevel" disabled="disabled">
										 <option data-attr="" value="">请选择</option>
				                         <option data-attr="1" value="1">硕士及以上</option>
				                         <option data-attr="2" value="2">本科</option>
				                         <option data-attr="3" value="3">大专</option>
				                         <option data-attr="4" value="4">高中</option>
				                         <option data-attr="5" value="5">中专及以下</option>
									</select>
								</p>
							</div>
							<div class="bRrecord">
								<p>
									<span style="float: left;line-height: 35px;">政治面貌</span>
									<input type="hidden" id="politicalStatus"  value="${empty tacaLegalPersons || empty tacaLegalPersons[0].politicalStatus ?'' : tacaLegalPersons[0].politicalStatus}"/>
									<select data-attr="politicalStatus" name="userTacaLegalPerson.politicalStatus" disabled="disabled">
										<option data-attr="" value="">请选择</option>
										<option data-attr="1" value="1">党员</option>
										<option data-attr="2" value="2">群众</option>
										<option data-attr="3" value="3">其他</option>
									</select>
								</p>
								<p><span>身份证号</span><input type="text" name="userTacaLegalPerson.cardNumber" value="${empty tacaLegalPersons || empty tacaLegalPersons[0].cardNumber ?'' : tacaLegalPersons[0].cardNumber}" style="width: 220px;" readonly="readonly" /></p>
							</div>
							<div class="bRrecord">
								<p><span>办公室电话</span><input type="text" name="userTacaLegalPerson.officePhone" value="${empty tacaLegalPersons || empty tacaLegalPersons[0].officePhone ?'' : tacaLegalPersons[0].officePhone}" style="width: 220px;" readonly="readonly"/></p>
								<p><span>手机号码</span><input type="text"  name="userTacaLegalPerson.phoneNumber" value="${empty tacaLegalPersons || empty tacaLegalPersons[0].phoneNumber ?'' : tacaLegalPersons[0].phoneNumber}" style="width: 220px;" readonly="readonly"/></p>
							</div>
							<div class="bRtarget bRt4">
								<p style="margin-left: 76px;">	
									<label class="jqWrap bRcheck" style="margin-right: 0px;width: 20px;height: 14px;">	
										<input type="hidden" id="criminalOffenceRecord"  value="${empty tacaLegalPersons || empty tacaLegalPersons[0].criminalOffenceRecord ?'' : tacaLegalPersons[0].criminalOffenceRecord}"/>								
										<input type="checkbox" attr="criminalOffenceRecord" name="userTacaLegalPerson.criminalOffenceRecord" value="0" />
									</label>
									<i>无刑事犯罪记录</i>
								</p>
								<p style="margin-left: 76px;">									
									<label class="jqWrap bRcheck" style="margin-right: 0px;width: 20px;height: 14px;">									
										<input type="hidden" id="uncreditBardRecord"  value="${empty tacaLegalPersons || empty tacaLegalPersons[0].uncreditBardRecord ?'' : tacaLegalPersons[0].uncreditBardRecord}"/>	
										<input type="checkbox" attr="uncreditBardRecord" name="userTacaLegalPerson.uncreditBardRecord" value="0" />
									</label>
									<i>无重大失信行为和社会不良记录</i>									
								</p>
								<p style="margin-left: 76px;">	
									<label class="jqWrap bRcheck" style="margin-right: 0px;width: 20px;height: 14px;">									
										<input type="hidden" id="onceLeadBankruptRecord"  value="${empty tacaLegalPersons || empty tacaLegalPersons[0].onceLeadBankruptRecord ?'' : tacaLegalPersons[0].onceLeadBankruptRecord}"/>	
										<input type="checkbox" attr="onceLeadBankruptRecord" name="userTacaLegalPerson.onceLeadBankruptRecord" value="0" />
									</label>
									<i>曾领导的企业无破产纪录</i>
								</p>
								<p style="margin-left: 76px;">									
									<label class="jqWrap bRcheck" style="margin-right: 0px;width: 20px;height: 14px;">									
										<input type="hidden" id="onceLeadMajorSafetyAccident"  value="${empty tacaLegalPersons || empty tacaLegalPersons[0].onceLeadMajorSafetyAccident ?'' : tacaLegalPersons[0].onceLeadMajorSafetyAccident}"/>	
										<input type="checkbox" attr="onceLeadMajorSafetyAccident" name="userTacaLegalPerson.onceLeadMajorSafetyAccident" value="0" />
									</label>
									<i>曾领导的企业未发生重大安全责任事故</i>									
								</p>
							</div>
						</div>
						<div class="bR-line">
							<h3>所获荣誉及社会职务</h3>
							<div class="bRlevel" style="margin: 10px 0 0;">
								<textarea name="userTacaLegalPerson.honorarySocialDuties" readonly="readonly">${empty tacaLegalPersons || empty tacaLegalPersons[0].honorarySocialDuties ?'' : tacaLegalPersons[0].honorarySocialDuties}</textarea>
							</div>
						</div>
						<div class="bR-line">
							<h3>个人银行信用情况说明</h3>
							<div class="bRlevel" style="margin: 10px 0 0;">
								<textarea name="userTacaLegalPerson.bankCreditStatement" readonly="readonly">${empty tacaLegalPersons || empty tacaLegalPersons[0].bankCreditStatement ?'' : tacaLegalPersons[0].bankCreditStatement}</textarea>
							</div>
						</div>
						<div class="bR-button">
							<button type="button" class="bt2" >上一页</button>
						</div>
				</div>
           </div>
       </div>
    </div>
<jsp:include page="../../footer.jsp" /> 
</body>
</html>
