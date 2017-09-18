<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>之江信用-我的企业</title>
	<base href="${basePath }/" />
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询"/>
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。"/>
    <link href="${basePath}/style/new-css/inCreditUpload.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js" defer></script>
	<script type="text/javascript">
		var ownerTypeMap={};
		<c:forEach items="${ownerTypeMap}" var="map">
		ownerTypeMap["${map.key}"]=${map.value};
		</c:forEach>
		var userCfg = userCfg || {page : 'myCompany'};
		userCfg['encodeDelete'] = '<%=response.encodeURL("delete")%>';
		userCfg['encodeAddInit'] = '<%=response.encodeURL("add_init")%>';
		userCfg['encodeToSubmitDatum'] = '<%=response.encodeURL("toSubmitDatum")%>';
		userCfg['encodeToAdd'] = '<%=response.encodeURL("toAdd")%>';
		userCfg['upload'] =  '<%=response.encodeURL("upload")%>';
		userCfg['ownerTypeMap'] = ownerTypeMap;
		userCfg['companyNameDigest'] = '${bizCompany.companyNameDigest}';
		userCfg['companyLogo'] = '${empty userCompany ? '' : userCompany[0].companyLogo}';
		userCfg['companyPhone'] = '${empty userCompany ? '' : userCompany[0].companyPhone}';
		userCfg['companyEmail'] = '${empty userCompany ? '' : userCompany[0].companyEmail}';
		userCfg['companyOfficialWebsite'] = '${empty userCompany ? '' : userCompany[0].companyOfficialWebsite}';
		userCfg['ownerId'] = '${userOwner.ownerId}';
		userCfg['list'] =  '<%=response.encodeURL("owner/list")%>';
	</script>
</head>

<body class="container-bg" style="margin-top: 0px;">
	<jsp:include page="../user/top.jsp" />
	
   <c:if test="${!empty userOwner}">
	<div class="layout new11-about">
	   <jsp:include page="/user/left.jsp" />
	   <div class="new11-fav">
			<div class="new11-block">
				<h2>${bizCompany.companyName} <span>您正在管理的企业</span></h2>
				
				<div class="new11-comp" id="view_data_div">
					<div class="new11-comp-left">
						<a href="javascript:void(0)">
							<div class="new11-comp-logo">
								<img src="${basePath }/${(empty userCompany || userCompany[0].companyLogo=='') ? 'images/logo0502.jpg':userCompany[0].companyLogo}"/>
							</div>
						</a>
					 </div>
					<div class="new11-comp-right" >
						<p>
							<span>联系电话</span>
							<c:if test="${!empty userCompany || !empty userCompany[0].companyPhone }">
								<c:forEach items = "${fn:split(userCompany[0].companyPhone,',') }" var="phone">
								   <c:if test="${phone!=''}">
								     <input class="comp-in" type="text" value="${phone}" readonly="readonly" style="background-color: #f6f6f7;"/>
								   </c:if>
								</c:forEach>
							</c:if>
							<c:if test="${empty userCompany || empty userCompany[0].companyPhone }">
								<input class="comp-in" type="text" value="" readonly="readonly" style="background-color: #f6f6f7;"/>
							</c:if>
						</p>
						<p>
							<span>联系邮箱</span>
							<c:if test="${!empty userCompany || !empty userCompany[0].companyEmail}">
							   <c:forEach items = "${fn:split(userCompany[0].companyEmail,',') }" var="email">
								   <c:if test="${email!=''}">
								     <input class="comp-in" type="text" value="${email}" readonly="readonly" style="background-color: #f6f6f7;"/>
								   </c:if>
								</c:forEach>
							</c:if>
							<c:if test="${empty userCompany || empty userCompany[0].companyEmail}">
							   <input class="comp-in" type="text"  readonly="readonly" style="background-color: #f6f6f7;"/>
							</c:if>
						</p>
						<p>
							<span>官方网址</span>
							<c:if test="${!empty userCompany || !empty userCompany[0].companyOfficialWebsite}">
							   <c:if test="${fn:length(userCompany[0].companyOfficialWebsite) > 2 }">
							    <c:forEach items = "${fn:split(userCompany[0].companyOfficialWebsite,',') }" var="officialWebsite">
								   <c:if test="${officialWebsite!=''}">
								     <input class="comp-in" type="text" value="${officialWebsite}" readonly="readonly" style="background-color: #f6f6f7;"/>
								   </c:if>
								</c:forEach>
							   </c:if>
							   <c:if test="${fn:length(userCompany[0].companyOfficialWebsite) == 1 || fn:length(userCompany[0].companyOfficialWebsite) == 2}">
							  	 <input class="comp-in" type="text"  readonly="readonly" style="background-color: #f6f6f7;"/>
							   </c:if>
							</c:if>
							<c:if test="${empty userCompany || empty userCompany[0].companyOfficialWebsite}">
							     <input class="comp-in" type="text"  readonly="readonly" style="background-color: #f6f6f7;"/>
							</c:if>
						</p>
						<p class="comp-p">
							<span>&nbsp;</span>
							<input type="button" value="编辑" class="comp-p1" id="edit_data" style="cursor: pointer;"/>
							<c:if test="${!empty userCompany}">
							    <c:if test="${userCompany[0].auditStatus == 100 }">
							       <h1 style="margin-left: 160px;margin-top: -38px;color: red;font-size: 14px;">等待审核</h1>
							    </c:if>
							     <c:if test="${userCompany[0].auditStatus == 301 }">
							       <h1 style="margin-left: 160px;margin-top: -38px;color: red;font-size: 14px;">审核未通过</h1>
							    </c:if>
							</c:if>
						</p>
					</div>
				</div>
				
				<div class="new11-comp" id="edit_data_div" style="display: none;">
					<div class="new11-comp-left">
						<div class="logo-upblock" style="padding: 0 !important;width: 157px !important;" >
							<a href="javascript:void(0)" id="logoFilePicker"></a>
							<div id="companyLogoDiv"></div>
						</div>
					 </div>
					<form method="post" action="${basePath }/user/owner/<%=response.encodeURL("company/add") %>" id="updateCompanyForm" >
						<input type="hidden" id="companyNameDigest" name="companyNameDigest" value="${bizCompany.companyNameDigest}"/>
						<input type="hidden" id="companyName" name="companyName" value="${bizCompany.companyName}"/>
						<input type="hidden" id="companyLogo" name="companyLogo" value="${empty userCompany ?'': userCompany[0].companyLogo}"/>
						<div class="new11-comp-right"  >
							<p id="phone_p">
								<span>联系电话</span>
							</p>
							<p id="email_p">
								<span>联系邮箱</span>
							</p>
							<p id="officialWeb_p">
								<span>官方网址</span>
							</p>
							<p class="comp-p">
								<span>&nbsp;</span>
								<input type="button" value="保存" class="comp-p2" id="saveData" style="cursor: pointer;"/>
								<input type="reset" value="取消" class="comp-p1" id="cencelEdit" style="cursor: pointer;"/>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class="new11-fav">
    		<div class="new11-block">    			
    			<h2>当前信用数据</h2>
    			<div class="new11-cur">
                    <a target="_blank" href="${basePath}/company/professionalInfo?s=${bizCompany.companyNo}&tab=operationTab">
    				<div class="new11-cur-m new11-cur-m1">
    					<h3>${empty companyCountModel.operateCount ? 0 : companyCountModel.operateCount }</h3>
    					<h4>企业经营状况</h4>
    				</div>
                    </a>
                    <a target="_blank" href="${basePath}/company/professionalInfo?s=${bizCompany.companyNo}&tab=riskTab">
    				<div class="new11-cur-m new11-cur-m2">
    					<h3>${empty companyCountModel.riskCount ? 0 : companyCountModel.riskCount }</h3>
    					<h4>企业风险信息</h4>
    				</div>
                    </a>
                    <a target="_blank" href="${basePath}/company/professionalInfo?s=${bizCompany.companyNo}&tab=knowledgeTab">
    				<div class="new11-cur-m new11-cur-m3">
    					<h3>${empty companyCountModel.knowledgeCount ? 0 : companyCountModel.knowledgeCount }</h3>
    					<h4>企业知识产权</h4>
    				</div>
                    </a>
                    <a target="_blank" href="${basePath}/company/professionalInfo?s=${bizCompany.companyNo}&tab=mediaReportTab">
    				<div class="new11-cur-m new11-cur-m4">
    					<h3>${empty companyCountModel.mediaCount ? 0 : companyCountModel.mediaCount}</h3>
    					<h4>媒体报道</h4>
    				</div>
                    </a>
    			</div>
    		</div>	    		    	
    	</div>
    	
    	<div class="new11-fav-w" id="immediately_div">
    		<div class="new11-block">    			
    			<h2>企业当前信用等级：
    			   <span> 
    			     <i  id="credit_span"></i><em>信用</em>
					   <b id="credit_b"></b><b>，</b>建议提交企业增信资料，开启企业信用成长，提升企业信用等级
    			   </span>
    			</h2>
    			
    			<div class="new11-warn new11-w1">
    				<h4><i>针对以下信息，您可选择性上传。上传越多，越有助于提升企业信用等级</i></h4>
    			</div>
    			<div class="new11-level">
    				<div class="new11-level-block">
    					<img src="${basePath }/images/new1-tp1.png">
    					<span>行政许可资质</span>
    					<input data-attr="行政许可资质" type="button" value="上传">
    				</div>
    				<div class="new11-level-block">
    					<img src="${basePath }/images/new1-tp2.png">
    					<span>产品/行业体系<br>认证证书</span>
    					<input data-attr="产品/行业体系认证证书" type="button" value="上传">
    				</div>
    				<div class="new11-level-block">
    					<img src="${basePath }/images/new1-tp3.png">
    					<span>房租租赁合同</span>
    					<input data-attr="房租租赁合同" type="button" value="上传">
    				</div>
    				<div class="new11-level-block">
    					<img src="${basePath }/images/new1-tp4.png">
    					<span>行业协会证书</span>
    					<input data-attr="行业协会证书" type="button" value="上传">
    				</div>    				
    			</div>
    		</div>
    	</div>
    	
    	 <div class="new11-fav" id="fileUploadDiv" style="display: none;">
			<div class="new11-block">
			   <h2>上传增信资料</h2>
				<input type="hidden" id="language"/>
			   <form id="addDatumForm" action="${basePath }/user/datum/<%=response.encodeURL("list/add") %>" method="post">		
				 <div class="new11-comp" style="padding: 20px 0;"></div>
				<div class="new11-upload">
					<div class="wu-example" id="uploader1" style="	padding: 15px 0px;margin: 15px 20px;width: 1026px;background-color: #fff;">
							<div class="queueList">
								<div class="placeholder" style="padding-top: 86px;">
									<div id="filePicker1" class="webuploader-container">
										<div class="webuploader-pick">点击选择图片</div>
										<div style="position: absolute; top: 0px; left: 448px; width: 168px; height: 44px; overflow: hidden; bottom: auto; right: auto;">
											<input type="file" name="file" class="webuploader-element-invisible" multiple="multiple" accept="image/*" /> 
											<label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;"></label>
										</div>
									</div>
								</div>
								<ul class="filelist"></ul>
							</div>
							<div style="display: none;" class="statusBar">
								<div class="progress" style="display: none;">
									<span class="text">0%</span> 
									<span class="percentage" style="width: 0%;"></span>
								</div>
								<div class="info">共0张（0B），已上传0张</div>
								<div class="btns">
									<div id="filePicker_add_button1" class="webuploader-containe">
										<div class="webuploader-pick">继续添加</div>
										<div style="position: absolute; top: 0px; left: 0px; width: 1px; height: 1px; overflow: hidden;">
											<input type="file" name="file" class="webuploader-element-invisible" multiple="multiple" accept="image/*" />
											<label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;"></label>
										</div>
									</div>
									<div class="uploadBtn state-pedding">开始上传</div>
								</div>
							</div>
						</div>
						<li><font class="c888" style="margin-left: 20px;">格式为JPG、JPEG、PNG，小于2MB，最多可上传5张</font></li>
				 </div>	
				<div class="newup-button">
					<input type="button" id="submitDatum" value="提交" class="newup-button1" style="cursor: pointer;"/>
					<input type="button" id="blackUpload" value="返回" class="newup-button2" style="cursor: pointer;" />
				</div>
			</form>
		   </div>
		</div>
    
	</div>
   </c:if>
   
   <c:if test="${empty userOwner}">
	   <div class="layout new11-about">
		   <jsp:include page="/user/left.jsp" />
			<div class="new11-tab">
				<div class="new11-warn"style="margin-left: 55px;">
					<h4>
						<i>您还未认领过企业，暂无企业相关信息</i>
					</h4>
				</div>
			</div>
			<div class="new11-claim">
				<h2>
					认领流程<span>CLAIM PROCESS</span>
				</h2>
				<div class="new11-step">
					<img src="${basePath}/images/new1-step.png" />
				</div>
				<div class="new11-search">
					<div class="new11-search-pad">
						<div class="new11-search-text" autocomplete="owner">
							<input type="text" name="companyNameDigest" id="searchKey" placeholder="可以按照企业名称、注册号、法人、股东、高管、品牌查询" />
						</div>
					</div>
				</div>
			</div>
	   </div>
    </c:if>

	<div class="newup-pop" id="datumPop" style="position: fixed;display: none;">
		<a href="javascript:void(0)" id="closePop"><img src="${basePath}/images/new1-close.png"/></a>
		<h2>恭喜您提交成功！</h2>
		<h4>我们会在15个工作日内审核完毕，请您耐心等待</h4>
		<h5><span id="timeOutSpan">3</span>秒钟后自动返回企业管理</h5>
	</div>

	<%--  <jsp:include page="user_search.jsp"/> --%>
	<!--end banner-->
	<!-- <div id="infoMessage" style="left: 50%;"></div> -->
	<%-- <div class="layout content" user_left="3">
		<jsp:include page="/user/left.jsp" />
		<jsp:include page="/user/company_pop.jsp" />
		<jsp:include page="owner_pop.jsp" />
		<div class="main">
			<!--<h2>我的企业</h2>-->
			<div class="zj-myqy" >
				<p id="statusTab">
                    <a class="current" href="javascript:void(0)" data-attr="ALL">全部<em>${page==null?0:fn:length(page)}</em></a>
                    <a href="javascript:void(0)" data-attr="INIT">待认领<em>${initList==null?0:fn:length(initList)}</em></a>
                    <a href="javascript:void(0)" data-attr="REQUEST">待审核<em>${requestList==null?0:fn:length(requestList)}</em></a>
                    <a href="javascript:void(0)" data-attr="SECONDPASS">已认领<em>${secondPassList==null?0:fn:length(secondPassList)}</em></a>
                    <a href="javascript:void(0)" data-attr="SECONDNOTPASS">未通过<em>${secondNotPassList==null?0:fn:length(secondNotPassList)}</em></a>
                </p>
			</div>
			<div class="personal">
				<table cellpadding="0" cellspacing="0" border="0" id="companyTable"
					style="position:relative;font-size:14px;">
					<c:if test="${!empty page }">
						<tr>
							<th class="p6">公司名称</th>
							<th class="p7">信用状况</th>
							<th class="p8">认领状态</th>
							<th class="p9">操作</th>
						</tr>
					</c:if>
					<c:if test="${empty page}">
						<tr style="height: 200px">暂无认领企业
						</tr>
					</c:if>
                    <tr class="nodata" style="display: none;"><td>暂无企业</td>
                    </tr>
					<c:forEach items="${page }" var="data">
						<tr>
							<c:if test="${data.ownerAccountValid == 2 }">
								<td class="p6"><a class="company" href="javascript:void(0)"
									companyNo="${data.company.companyNo}" to_h>${data.companyName
										}</a><em><img src="${basePath}/images/card-icon1.png" />
								</em>
								</td>
							</c:if>
							<c:if test="${empty data.ownerAccountValid ||data.ownerAccountValid != 2 }">
								<td class="p6"><a class="company" href="javascript:void(0)"
									companyNo="${data.company.companyNo}" to_h>${data.companyName
										}</a><em><img src="${basePath}/images/card-icon1.png" />
								</em>
								</td>
							</c:if>
							<c:if test="${not empty data.company }">
								<td class="p7">
								    <div class='istar' config='{"n":${empty data.company.curCreditLevel ? 0 : data.company.curCreditLevel },"s":50,"size":12,"img":"${basePath}/images/star.png"}'></div>
								</td>
							</c:if>
							<c:if test="${empty data.company }">
								<td class="p7">
							  	  <div class='istar' config='{"n":0,"s":50,"size":12,"img":"${basePath}/images/star.png"}'></div>
								</td>
							</c:if>
							<c:if test="${data.auditStatus == ownerTypeMap['INIT'] }">
								<td class="p8">未认领</td>
								<td class="p9">
                                    <a href="${basePath}/user/owner/<%=response.encodeURL("toAdd") %>&id=${data.ownerId}" class="continueOwner" ownerId="${data.ownerId }" name="${data.companyName }" legalperson="${data.legalPerson }" provinceCode="${data.provinceCode }">继续认领</a>
                                    <a auditStatus="${data.auditStatus }" ownerId="${data.ownerId }"
									companyCode="${data.companyCode }" href="javascript:void(0)">查看</a>
									<a href="javascript:void(0)" data-ownerId="${data.ownerId }" class="delOwner">删除</a>
								</td>
							</c:if>
							<c:if test="${data.auditStatus == ownerTypeMap['REQUEST']}">
								<td class="p8">待审核</td>
								<c:if
									test="${empty data.ownerAccountValid ||data.ownerAccountValid == 0 }">
									<td class="p9"><a
										href="${basePath }/user/owner/<%=response.encodeURL("toSubmitDatum") %>&id=${data.ownerId}">提交资料</a><a
										auditStatus="${data.auditStatus }" ownerId="${data.ownerId }"
										name="${data.companyName }" legalperson="${data.legalPerson }"
										provinceCode="${data.provinceCode }" href="javascript:void(0)">查看</a>
									</td>
								</c:if>
								<c:if test="${data.ownerAccountValid == 1 }">
									<td class="p9"><a
										href="${basePath }/user/owner/<%=response.encodeURL("toSubmitDatum") %>&id=${data.ownerId}">提交资料</a>
									</td>
								</c:if>
							</c:if>
							<c:if
								test="${data.auditStatus == ownerTypeMap['FIRSTPASS'] || data.auditStatus == ownerTypeMap['FIRSTNOTPASS'] }">
								<td class="p8">审核中</td>
								<c:if
									test="${empty data.ownerAccountValid ||data.ownerAccountValid == 0 }">
									<td class="p9"><a
										href="${basePath }/user/owner/<%=response.encodeURL("toSubmitDatum") %>&id=${data.ownerId}">提交资料</a><a
										auditStatus="${data.auditStatus }" ownerId="${data.ownerId }"
										name="${data.companyName }" legalperson="${data.legalPerson }"
										provinceCode="${data.provinceCode }" href="javascript:void(0)">查看</a>
									</td>
								</c:if>
								<c:if test="${data.ownerAccountValid == 1 }">
									<td class="p9"><a
										href="${basePath }/user/owner/<%=response.encodeURL("toSubmitDatum") %>&id=${data.ownerId}">提交资料</a>
									</td>
								</c:if>
							</c:if>
							<c:if test="${data.auditStatus == ownerTypeMap['SECONDPASS'] }">
								<c:if test="${empty data.ownerAccountValid ||data.ownerAccountValid == 0 }">
									<td class="p8">对公账户验证</td>
									<td class="p9"><a
										href="${basePath }/user/owner/<%=response.encodeURL("toSubmitDatum") %>&id=${data.ownerId}">提交资料</a>
										<a auditStatus="${data.auditStatus }"
										ownerId="${data.ownerId }" name="${data.companyName }"
										legalperson="${data.legalPerson }"
										provinceCode="${data.provinceCode }" href="javascript:void(0)">查看</a>
										<a href="${basePath }/user/owner/<%=response.encodeURL("validaccount") %>&id=${data.ownerId}" >验证对公</a>
										<a style="white-space: nowrap;display: inline-table;" href="javascript:sendReport(${data.ownerId},'${data.companyName }','${data.companyCode }')">获取信用报告</a>
									</td>
								</c:if>
								<c:if test="${data.ownerAccountValid == 1 }">
									<td class="p8">对公账户验证已提交</td>
									<td class="p9">
										<a auditStatus="${data.auditStatus }"
										ownerId="${data.ownerId }" name="${data.companyName }"
										legalperson="${data.legalPerson }"
										provinceCode="${data.provinceCode }" href="javascript:void(0)">查看</a>
										<a href="${basePath }/user/owner/<%=response.encodeURL("toSubmitDatum") %>&id=${data.ownerId}">提交资料</a>
									</td>
								</c:if>
								<c:if test="${data.ownerAccountValid == 2 }">
									<td class="p8">审核已完成</td>
									<td class="p9">
										<a auditStatus="${data.auditStatus }"
										ownerId="${data.ownerId }" name="${data.companyName }"
										legalperson="${data.legalPerson }"
										provinceCode="${data.provinceCode }" href="javascript:void(0)">查看</a>
										<a href="${basePath }/user/owner/<%=response.encodeURL("toSubmitDatum") %>&id=${data.ownerId}">提交资料</a>
									</td>
								</c:if>
								<c:if test="${data.ownerAccountValid == 3 }">
									<td class="p8">对公验证失败</td>
									<td class="p9">
										<a href="${basePath }/user/owner/<%=response.encodeURL("validaccount") %>&id=${data.ownerId}&reValid=1" >重新验证对公</a>
										<a href="javascript:void(0)" data-ownerId="${data.ownerId }" class="delOwner">删除</a>
									</td>
								</c:if>
							</c:if>
							<c:if
								test="${data.auditStatus == ownerTypeMap['SECONDNOTPASS'] }">
								<td class="name32">复审未通过</td>
								<td class="p9"><a
									href="${basePath }/user/owner/<%=response.encodeURL("toSubmitDatum") %>&id=${data.ownerId}">提交资料</a><a
									auditStatus="${data.auditStatus }" ownerId="${data.ownerId }"
									name="${data.companyName }" legalperson="${data.legalPerson }"
									provinceCode="${data.provinceCode }"
									auditInfo="${empty data.auditInfo ? '' : data.auditInfo }"
									href="javascript:void(0)">查看</a>
									<a href="javascript:void(0)" data-ownerId="${data.ownerId }" class="delOwner">删除</a>
								</td>
							</c:if>
							<c:if test="${data.auditStatus == ownerTypeMap['DELETE'] }">
								<td class="name32">已删除</td>
								<td class="p9"><a auditStatus="${data.auditStatus }"
									ownerId="${data.ownerId }" name="${data.companyName }"
									legalperson="${data.legalPerson }"
									provinceCode="${data.provinceCode }" href="javascript:void(0)">查看</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>


				</table>
				<div class="myclaim">
					<h4>认领我的企业</h4>
					<div class="mywrite">
						<p>请输入您的企业名称：</p>
						<div class="select-box" autocomplete="owner">
							<input type="text"  class="tag-select" name="companyNameDigest" id="searchKey"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> --%>
	<!-- layout content -->
	<!-- 对公账户验证 -->
	<jsp:include page="../footer.jsp" />
</body>
</html>