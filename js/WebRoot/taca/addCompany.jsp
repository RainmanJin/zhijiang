<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>


<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>之江信用-认领企业</title>
    <base href="${basePath }/" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
 	<link href="${basePath}/style/myStar.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new/trade_style.css" rel="stylesheet" type="text/css" />
	
	<script data-main="${basePath }/js/uzj/taca/taca_add_company.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
	var userCfg = userCfg || {page:'addCompany'};
	   userCfg['url'] ='<%=response.encodeURL("/user/owner/getCtag")%>';
	   userCfg['upload'] =  '<%=response.encodeURL("upload")%>';
	   userCfg['tagNoShow'] = '${userOwner.tagNoShow}';
	   userCfg['codeValidate'] = '<%=response.encodeURL("codeValidate")%>';
	</script>
  </head>
  
  <body>
   <jsp:include page="../user/top.jsp" />
<%--   <div class="layout new_lc">
  	<span>1.选择您要认领的企业</span>
  	<span class="current">2.提交认领资料</span>
  	<span>3.等待审核</span>
  </div>--%>
  <div class="layout admit-lc">
  	<div class="adv-lc"><img src="${basePath}/images/adv-lc.jpg" /></div>
  	<div class="input-lc">
  		<div class="fina-main fina-write">
  		   <form action="${basePath }<%=response.encodeURL("/user/owner/add_step2")%>" id="ownerForm" method="post">
            		<%-- <input type="hidden" value="${userOwner.ownerId}" name="ownerId"/> --%>
            		<input type="hidden" value="" name="attachEnterpriseCard"/>
					<input type="hidden" value="" name="attachOrgfile"/>
                    <input  id="companyNameDigest"  type="hidden" value="${param.companyNameDigest}" name="companyNameDigest"/>
				   <c:choose>
					    <c:when test="${not empty userOwner.companyName }">
					        <h4 style="padding-top: 45px;">
						       <i style="display: none;top:15px;" id="errorMsg"></i>
						       <span><em>*</em>企业名称</span> 
						       <input class="fina-in1" name="companyName" value="${userOwner.companyName}" type="text" title="${userOwner.companyName }" style="color: #444;" readonly />
						    </h4>
					    </c:when>
					    <c:otherwise>
						    <h4 style="padding-top: 45px;" autocomplete="fill_without_href">
						       <i style="display: none;top:15px;" id="errorMsg"></i>
						       <span><em>*</em>企业名称</span> 
						       <input class="fina-in1" name="companyName"  id="searchKey"  minlength="1" des="企业名称" msgtip="right"  value="${userOwner.companyName ? '' : userOwner.companyName}" type="text" title="${userOwner.companyName }"  placeholder="请输入企业名称" style="color: #444;"/>
						    </h4>
					    </c:otherwise> 
				  </c:choose>
                        <h4>
                            <span><em>*</em>所在地</span>
                            <select  id="citySelect" name="cityCode" type="select" typemsg="请选择市">
                                <option value="">选择市</option>
                            </select>
                            <select id="districtSelect" name="districtCode" type="select" typemsg="请选择区">
                                <option value="">选择区</option>
                            </select>
                            <input type="hidden" name="city" id="city"/>
                            <input type="hidden" name="district" id="district"/>
                        </h4>
				<h4>
				  <span><em>*</em>真实姓名</span>
				  <input class="fina-in2" name="userRealname" id="userRealname" type="text" minlength="2" maxlength="26" des="姓名" msgtip="right" value="${empty userOwner.userRealname ? '' : userOwner.userRealname }"  placeholder="真实姓名" style="color: #444;"/>
				</h4>
				<h4>
				  <span><em>*</em>手机号码</span>
				  <input class="fina-in2" name="phone" id="phone" type="mobile" des="手机号" msgtip="bottom" maxlength="11" minlength="11" placeholder="手机号"  style="color: #444;"/>
				</h4>
				<h4>
					<span><em>*</em>验证码</span>
					<input class="fina-in2"  name="code" id="smsCode" type="text" ajaxotherparam="phone" maxlength="4" minlength="4" ajax="${basePath }/user/<%=response.encodeURL("phoneValidate") %>" ajaxmsg="验证码错误" msgtip="right" des="验证码" placeholder="验证码"  style="color: #444;"/>
					<input class="fina-in3" type="button" id="sendPhoneCode" num="1" value="获取验证码" />
					<!-- <i>请输入系统发送给您的验证码</i> -->
				</h4>
				<h4>
					<span><em>*</em>企业邮箱</span>
					<input class="fina-in1" id="email" name="email" type="email" des="邮箱" minlength="1" msgtip="innerLeft" value="" placeholder="请尽量选择企业邮箱"  style="color: #444;"/>						
				</h4>
				<h4 style="overflow: hidden;">
					<span><em>*</em>上传证件</span>
					<div class="upload-lc">
						<div class="upblock" style="padding: 0 !important;width: 100px !important;" >
							<div id="filePicker3">
							   <strong>营业执照</strong>
							   <input  type="button" value="上传" />
							 </div>
							<div id="attachOrgfileDiv"></div>
						</div>
						<div class="upblock" style="padding: 0 !important;width: 100px !important;">
							<div id="filePicker4">
							   <strong>企业名片</strong>
							   <input  type="button" value="上传" />
							 </div>
							<div id="attachEnterpriseCardDiv" ></div>
						</div>
					</div>
					<div class="infor-lc">
						<strong>格式为JPG、JPEG、PNG，大小不超过5MB</strong>
						<strong>上传营业执照（办理过三证合一的企业，请上传最新的营业执照）</strong>
						<strong>原件、及印有您真实姓名与企业名称的名片，或法人身份证正面的扫描件或照片。</strong>
					</div>
				</h4>
				<h5 class="h5-lc"><input type="submit"  value="申请" style="cursor: pointer;" /></h5>
			  </form>
		   </div>
	   </div>
  </div>
 <jsp:include page="../footer.jsp" />
</body>
</html>
