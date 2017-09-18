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
	<script data-main="${basePath }/js/uzj/taca/taca_bank.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript" src="${basePath}/js/lib/laydate/laydate.js"></script>
</head>
<body id="body" style="background-color: #f2f4f8;">
 <jsp:include page="/user/top.jsp"/>
 <jsp:include page="/taca/top.jsp"/>
    <div class="n-layout base">
       <div class="base-write">
           <h2><span>申报资料</span><i>浙江省商贸诚信示范企业评选</i></h2>
           <div class="baseCredit" id="container_id">
               <jsp:include page="/taca/left.jsp" />
               	<div class="bR-line" style="margin-bottom: 0px;display: none;" id="abnormality_model">
	                <table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot" >
							<tr>
							  <th class="bR-t20">开户行</th>
							  <th class="bR-t21">账户性质</th>
							  <th class="bR-t22">五级分类</th>
							  <th class="bR-t22">星级信用单位</th>
							</tr>
							<tr>
								<td class="bR-t20"><input type="text" name="userTacaLoanAbnormalities[0].businessBank" /></td>
								<td class="bR-t21"><input type="text" name="userTacaLoanAbnormalities[0].accountProperty" /></td>
								<td class="bR-t22">
								<select name="userTacaLoanAbnormalities[0].fiveClassIficationCode">
									 <option value="">请选择</option>
								   <c:forEach items="${fiveClassIficationMap}" var="map">
								      <option data-attr="${map.key}" value="${map.key}">${map.value}</option>
								   </c:forEach>
							    </select> 
								</td>
								<td class="bR-t22">
									<label class="jqWrap bRcheck" style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 0px;width: 20px;height: 14px;">									
										<input type="checkbox" name="userTacaLoanAbnormalities[0].starUnit" value="1" />
									</label>
								</td>
							</tr>
					 </table>
				 </div>
				 <div class="bR-line" style="display: none;" id="overdue_model">
						<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
							<tr>
							  <th class="bR-t23">贷款银行</th>
							  <th class="bR-t24">贷款日期</th>
							  <th class="bR-t24">贷款金额</th>
							  <th class="bR-t24">应还贷日期</th>
							  <th class="bR-t24">应还款金额</th>
							  <th class="bR-t24">拖欠日期</th>
							  <th class="bR-t24">拖欠金额</th>
							</tr>
							<tr>
							  <td class="bR-t23"><input type="text"  name="userTacaOverdueLoans[0].loanBank" value="" /></td>
							  <td class="bR-t24"><input onclick="laydate()" type="text"  name="userTacaOverdueLoans[0].loanDate" value="" /></td>
							  <td class="bR-t24"><input type="text"data-attr='number'  name="userTacaOverdueLoans[0].loanAmount" value="" /></td>
							  <td class="bR-t24"><input onclick="laydate()" type="text"  name="userTacaOverdueLoans[0].repaymentDate" value="" /></td>
							  <td class="bR-t24"><input type="text" data-attr='number'  name="userTacaOverdueLoans[0].repaymentAmount" value="" /></td>
							  <td class="bR-t24"><input onclick="laydate()" type="text"  name="userTacaOverdueLoans[0].arrearsDate" value="" /></td>
							  <td class="bR-t24"><input type="text"  data-attr='number' name="userTacaOverdueLoans[0].arrearsAmount" value="" /></td>
							</tr>
						</table>
				</div>
				 <div class="baseRight">
					<h3 class="baseRight-tit"><span>中国人民银行征信中心企业信用报告（自助查询版)</span></h3>
					<form id="addBankForm" action="${basePath }/taca/apply/add/bank" method="post">
						<input type="hidden" name="token" value="${token}"/>
						<input type="hidden" name="userTacaBank.id" value="${empty tacaBanks || empty tacaBanks[0].id ?'' : tacaBanks[0].id}"/>
                        <input type="hidden" name="activityId" value="${activity.id}"/>
						<div class="bR-line" style="margin-bottom: 10px;">
							<div class="bR-line-right">
								报告文档
								<i style="margin: 0;">请上传电子档案，格式为 PDF，小于 10MB；并根据报告情况填写本页剩余信息。</i>
								<input type="hidden" id="fileName" name="userTacaBank.fileName" value="${empty tacaBanks || empty tacaBanks[0].fileName ?'' : tacaBanks[0].fileName}"/>
								<input type="hidden" id="reportDocumentUrl" name="userTacaBank.reportDocumentUrl" value="${empty tacaBanks || empty tacaBanks[0].reportDocumentUrl ?'' : tacaBanks[0].reportDocumentUrl}"/>
								<div class="baseUp" style="margin-top: 10px;">
									<%-- <div class="baseUp-block baseUp-ul" id="filePicker1" style="border: 0px solid;height: 43px;width: 115px;background:#FFFFFF !important;">
										<strong>上传附件</strong>
										<img src="${basePath }/images/icon015.png" style="padding-top: 0px;cursor: pointer;">							
									</div>
									<div id="reportDocumentUrlDiv"></div> --%>
									<div class="baseUp-block baseUp-ul" id="filePicker1" style="background-color: #f8f8f8;padding: 0 !importan">
										<input type="button"/>
                                        <img src="${basePath }/images/base-upload.png"/>	
                                        <div id="reportDocumentUrlDiv"></div>					
									</div>
								</div>							
							</div>
						</div>
						<div class="bR-line">
							<div class="bR-line-left" style="width: auto;color: #666;">机构信用代码</div>
							<div class="bR-line-right">                                                                                    
								 <input style="width: 210px" class="t-text" type="text" name="userTacaBank.creditInstitutionsCode" value="${empty tacaBanks || empty tacaBanks[0].creditInstitutionsCode ?'' : tacaBanks[0].creditInstitutionsCode}" /> 
							</div>
						</div>
						<div class="bR-line bR-mp">
							<h3 style="color: #666;">当前负债信息摘要</h3>
							<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
								<tr>
									<th class="bR-t11" colspan="2">正常类汇总</th>
									<th class="bR-t11" colspan="2">关注类汇总</th>
									<th class="bR-t11" colspan="2">不良类汇总</th>									
								</tr>
								<tr>
									<td class="bR-t11 bR-t8-bg">笔数</td>
									<td class="bR-t11 bR-t8-bg">余额</td>
									<td class="bR-t11 bR-t8-bg">笔数</td>
									<td class="bR-t11 bR-t8-bg">余额</td>
									<td class="bR-t11 bR-t8-bg">笔数</td>
									<td class="bR-t11 bR-t8-bg">余额</td>
								</tr>
								<tr>
								    <td class="bR-t11"><input type="text" data-attr='number' name="userTacaBank.normalItems" value="${empty tacaBanks || empty tacaBanks[0].normalItems ?'' : tacaBanks[0].normalItems}" /></td>
									<td class="bR-t11"><input type="text" data-attr='number' name="userTacaBank.normalBalance" value="${empty tacaBanks || empty tacaBanks[0].normalItems ?'' : tacaBanks[0].normalBalance}" /></td>
									<td class="bR-t11"><input type="text" data-attr='number' name="userTacaBank.focusItems" value="${empty tacaBanks || empty tacaBanks[0].normalItems ?'' : tacaBanks[0].focusItems}" /></td>
									<td class="bR-t11"><input type="text" data-attr='number' name="userTacaBank.focusBalance" value="${empty tacaBanks || empty tacaBanks[0].normalItems ?'' : tacaBanks[0].focusBalance}" /></td>
									<td class="bR-t11"><input type="text" data-attr='number' name="userTacaBank.defectiveItems" value="${empty tacaBanks || empty tacaBanks[0].normalItems ?'' : tacaBanks[0].defectiveItems}" /></td>
									<td class="bR-t11"><input type="text" data-attr='number' name="userTacaBank.defectiveBalance" value="${empty tacaBanks || empty tacaBanks[0].normalItems ?'' : tacaBanks[0].defectiveBalance}" /></td>
								</tr>
							</table>
						</div>
					   <h3 class="baseRight-tit"><span>企业开户银行、授信及企业未还贷款履约情况统计</span></h3>
					   <div class="bRtarget">							
							<p style="margin-top: 15px;">
								企业开户银行及授信情况统计
								<label class="jqWrap bRcheck" style="margin-right: 0px;width: 20px;height: 14px;">									
									<input type="hidden" id="loanCardStatus" value="${empty tacaBanks || empty tacaBanks[0].loanCardStatus ?'' : tacaBanks[0].loanCardStatus}"/> 
									<input type="checkbox" attr="loanCardStatus" name="userTacaBank.loanCardStatus" value="0">
								</label>
								<i>贷款卡状态正常</i>
							</p>							
						</div>
					  
					  <div id="abnormality_id">
					   <c:choose>
					       <c:when test="${fn:length(tacaLoanAbnormalities) == 0}">
					        <div class="bR-line" data-attr="abnormality_tab">
								<table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot" >
									<tr>
										<th class="bR-t20">开户行</th>
										<th class="bR-t21">账户性质</th>
										<th class="bR-t22">五级分类</th>
										<th class="bR-t22">星级信用单位</th>
									</tr>
									<tr>
										<td class="bR-t20"><input type="text" name="userTacaLoanAbnormalities[0].businessBank"/></td>
										<td class="bR-t21"><input type="text" name="userTacaLoanAbnormalities[0].accountProperty"/></td>
										<td class="bR-t22">
											<select name="userTacaLoanAbnormalities[0].fiveClassIficationCode">
											   <option value="">请选择</option>
											   <c:forEach items="${fiveClassIficationMap}" var="map">
											      <option data-attr="${map.key}" value="${map.key}">${map.value}</option>
											   </c:forEach>
										    </select> 
										</td>
										<td class="bR-t22">
											<label class="jqWrap bRcheck" style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 0px;width: 20px;height: 14px;">									
												<input type="checkbox" name="userTacaLoanAbnormalities[0].starUnit" value="1">
											</label>
										</td>
									</tr>
								</table>
						    </div>
					       </c:when>
					       <c:otherwise> 
					         <c:forEach items="${tacaLoanAbnormalities}" var="abnormal" varStatus="status">
					           <div class="bR-line" data-attr="abnormality_tab">
					          	  <input type="hidden" name="userTacaLoanAbnormalities[${status.index}].id" value="${abnormal.id }" />
					          	  <input type="hidden" id="fiveClassIficationCode${status.index}"  value="${abnormal.fiveClassIficationCode}"/>
					          	  <input type="hidden" id="starUnit${status.index}"  value="${abnormal.starUnit}"/>
								 <table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot" >
									<tr>
										<th class="bR-t20">开户行</th>
										<th class="bR-t21">账户性质</th>
										<th class="bR-t22">五级分类</th>
										<th class="bR-t22">星级信用单位</th>
									</tr>
									<tr>
										<td class="bR-t20"><input type="text" name="userTacaLoanAbnormalities[${status.index}].businessBank" value="${abnormal.businessBank }"/></td>
										<td class="bR-t21"><input type="text" name="userTacaLoanAbnormalities[${status.index}].accountProperty" value="${abnormal.accountProperty}"/></td>
										<td class="bR-t22">
											<select data-attr="fiveClassIficationCode${status.index}" name="userTacaLoanAbnormalities[${status.index}].fiveClassIficationCode">
											   <option value="">请选择</option>
											   <c:forEach items="${fiveClassIficationMap}" var="map">
											      <option data-attr="${map.key}" value="${map.key}">${map.value}</option>
											   </c:forEach>
										    </select> 
										</td>
										<td class="bR-t22">
											<label class="jqWrap bRcheck" style="background: url(${basePath }/images/base-check.png) no-repeat center top;margin-right: 0px;width: 20px;height: 14px;">									
												<input type="hidden" id="starUnit${status.index}" value="${abnormal.starUnit}"/>
												<input type="checkbox" attr="starUnit${status.index}" name="userTacaLoanAbnormalities[${status.index}].starUnit" value="1">
											</label>
										</td>
									</tr>
								 </table>
						       </div>
						      </c:forEach> 
					       </c:otherwise>
					   </c:choose>
						<div class="bR-link">
							<a href="javascript:void(0);" class="bR-green" id="abnormality_green"></a><a href="javascript:void(0);" class="bR-red" id="abnormality_red"></a>
						</div>
					 </div>
						<div class="bRtarget">							
							<p style="margin-top: 0;">
								企业未还贷款履约情况统计单位：人民币万元
								<label class="jqWrap bRcheck" style="margin-right: 0px;width: 20px;height: 14px;">	
								    <input type="hidden" id="overdueLoanStatus" value="${empty tacaBanks || empty tacaBanks[0].overdueLoanStatus ?'': tacaBanks[0].overdueLoanStatus}"/> 
									<input type="checkbox" attr="overdueLoanStatus" name="userTacaBank.overdueLoanStatus" value="0" />
								</label>
								<i>无逾期未还贷款</i>
							</p>							
						</div>
					  <div id="overdue_id">
					       <c:choose>
					          <c:when test="${fn:length(tacaOverdueLoans) == 0 }">
					           <div class="bR-line" data-attr="overdue_tab">
								 <table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
									<tr>
										<th class="bR-t23">贷款银行</th>
										<th class="bR-t24">贷款日期</th>
										<th class="bR-t24">贷款金额</th>
										<th class="bR-t24">应还贷日期</th>
										<th class="bR-t24">应还款金额</th>
										<th class="bR-t24">拖欠日期</th>
										<th class="bR-t24">拖欠金额</th>
									</tr>
									<tr>
										<td class="bR-t23"><input type="text"  name="userTacaOverdueLoans[0].loanBank" value="" /></td>
										<td class="bR-t24"><input onclick="laydate()" type="text"  name="userTacaOverdueLoans[0].loanDate" value="" /></td>
										<td class="bR-t24"><input type="text" data-attr='number'  name="userTacaOverdueLoans[0].loanAmount" value="" /></td>
										<td class="bR-t24"><input onclick="laydate()" type="text"  name="userTacaOverdueLoans[0].repaymentDate" value="" /></td>
										<td class="bR-t24"><input type="text" data-attr='number'  name="userTacaOverdueLoans[0].repaymentAmount" value="" /></td>
										<td class="bR-t24"><input onclick="laydate()" type="text"  name="userTacaOverdueLoans[0].arrearsDate" value="" /></td>
										<td class="bR-t24"><input type="text" data-attr='number'  name="userTacaOverdueLoans[0].arrearsAmount" value="" /></td>
									</tr>
								 </table>
							   </div>
					          </c:when>
					          <c:otherwise>
					              <c:forEach items="${tacaOverdueLoans}" var="overdue" varStatus="status">
					                  <div class="bR-line" data-attr="overdue_tab">
					                    <input type="hidden" name="userTacaOverdueLoans[${status.index}].id" value="${overdue.id}"/>
										 <table cellpadding="0" cellspacing="0" border="0" class="base-tb3 base-tb3-top base-tb3-bot">
											<tr>
												<th class="bR-t23">贷款银行</th>
												<th class="bR-t24">贷款日期</th>
												<th class="bR-t24">贷款金额</th>
												<th class="bR-t24">应还贷日期</th>
												<th class="bR-t24">应还款金额</th>
												<th class="bR-t24">拖欠日期</th>
												<th class="bR-t24">拖欠金额</th>
											</tr>
											<tr>
												<td class="bR-t23"><input type="text"  name="userTacaOverdueLoans[${status.index}].loanBank" value="${overdue.loanBank}" /></td>
												<td class="bR-t24"><input onclick="laydate()" type="text"  name="userTacaOverdueLoans[${status.index}].loanDate" value="${overdue.loanDate}" /></td>
												<td class="bR-t24"><input type="text" data-attr='number'  name="userTacaOverdueLoans[${status.index}].loanAmount" value="${overdue.loanAmount}" /></td>
												<td class="bR-t24"><input onclick="laydate()" type="text"  name="userTacaOverdueLoans[${status.index}].repaymentDate" value="${overdue.repaymentDate}" /></td>
												<td class="bR-t24"><input type="text" data-attr='number'  name="userTacaOverdueLoans[${status.index}].repaymentAmount" value="${overdue.repaymentAmount}" /></td>
												<td class="bR-t24"><input onclick="laydate()" type="text"  name="userTacaOverdueLoans[${status.index}].arrearsDate" value="${overdue.arrearsDate}" /></td>
												<td class="bR-t24"><input type="text" data-attr='number'  name="userTacaOverdueLoans[${status.index}].arrearsAmount" value="${overdue.arrearsAmount}" /></td>
											</tr>
										 </table>
							          </div>
					              </c:forEach>
					          </c:otherwise>
					       </c:choose>
							<div class="bR-link">
								<a href="javascript:void(0);" class="bR-green" id="overdue_green"></a><a href="javascript:void(0);" class="bR-red" id="overdue_red"></a>
							</div>
						</div>
						<div class="bR-button">
							<button type="button" class="bt2">上一页</button><button type="submit" class="bt1" >保存并进入下一页</button>
						</div>
					</form>
				</div>
           </div>
       </div>
    </div>
 <script type="text/javascript">
     laydate.skin('molv'); //danlan ,dahong,molv
 </script>
<jsp:include page="/footer.jsp" /> 
</body>
</html>
