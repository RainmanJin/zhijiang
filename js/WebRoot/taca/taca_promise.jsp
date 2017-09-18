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
	<script data-main="${basePath }/js/uzj/taca/taca_promise.js" src="${basePath }/js/lib/require.js"></script>
	
</head>
<body id="body" style="background-color: #f2f4f8;">
 <jsp:include page="/user/top.jsp"/>
 	<div class="n-layout base">
		<div class="base-top">
			<img src="${basePath}/images/base-step01.png">
			<p><span class="base-top-c1">填写基础信息</span><span class="base-top-c2">上传申报材料</span><span class="base-top-c2" style="margin-right: 0;">等待评选结果</span></p>
		</div>
	 </div> 
     <div class="n-layout base">
		<div class="promise-main">
			<h2>浙江省商贸流通业诚信示范企业申报材料真实性承诺书</h2>
			<h3>浙江省商贸业联合会：</h3>
			<h4>本企业申报用于“2017年度浙江省商贸流通业诚信示范企业”的所有材料（包括工商、税务、银行、劳动保障、海关、司法、企业财务、企业管理等）均真实、准确。如有不实，本公司愿承担相应的法律责任。</h4>
			   <h5>
					<label class="jqWrap01" style="margin-right: 9px;">														
				       <input type="radio"  id="isPromise" value="1"/>
					</label>
					<i style="vertical-align: middle;display: inline-block;">本公司承诺提交的所有材料均真实、准确。</i>
			   </h5>
			   <div class="bR-button" style="margin-top: 25px;">
					<button  type="button" id="upPage"  class="bt4">上一页</button>
					<button  type="submit" id="mconfirmBtn"  class="bt3">提交材料</button>
				</div>

		</div>
	</div>



         <div class="base-write-main" style="display:none;background:white;padding: 35px 50px;" id="auditConfirm">
             <div style="    text-align: center;margin-bottom: 28px;">
            <h3>请选择动员组织方</h3>
             <h4 style="color:#868686">您提交的申报材料将交由动员组织方初审</h4>
             </div>
             <form id="addPromiseForm" action="${basePath }/taca/apply/add/promise" method="post">
                 <input type="hidden" name="token" value="${token}"/>
                 <input type="hidden" name="activityId" value="${activity.id}"/>
                 <i  style="color:red;display: none;" id="errorMsg"></i>
                 <p>
                     <label class="jqWrap02 jqChecked" >
                     <input type="radio" name="auditType" checked   value="1"/>
                 </label>
                     <label style="width: 100px;">市县区商务局(含市商贸联)</label>
                     <select data-attr="cityCode_id" id="citySelect" name="cityRoleId">
                         <option value="">请选择</option>
                         <c:forEach items="${cityList}" var="city">
                             <option value="${city.id}">${city.aliasName}</option>
                         </c:forEach>
                     </select>
                     <select data-attr="districtCode_id" id="districtSelect" name="distRoleId" style="width: 91px;">
                         <option value="">请选择</option>
                     </select>
                 </p>

                 <p>
                     <label class="jqWrap02" >
                         <input type="radio" name="auditType"   value="2"/>
                     </label>
                     <label style="width: 100px;">省级行业协会</label>
                     <select data-attr="industry_id" id="s1" name="assoRoleId">
                         <option value="">请选择</option>
                         <c:forEach items="${associationList}" var="asso">
                             <option value="${asso.id}">${asso.roleName}</option>
                         </c:forEach>
                     </select>

                 </p>
                 <div class="bR-button" style="margin-top: 25px;">
                     <button  type="submit"  class="bt5">确定</button>
                     <button style="background-color: #fff; color: #00bb9c;"  type="button" id="btnCancle" class="bt5">取消</button>
                 </div>
             </form>
         </div>

<jsp:include page="/footer.jsp" /> 
</body>
</html>
