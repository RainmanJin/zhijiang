<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>隐私保护-之江信用</title>
	<base href="${basePath }/" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<%--<link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />--%>
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/js/uzj/about.js" src="${basePath }/js/lib/require.js"></script>
</head>

<body data-attr="about">
	<jsp:include page="/user/top.jsp"/>
	<div class="about-banner"></div>
    <!--end banner-->
   <div class="ab-container">
		<div class="ab-main">	
			<jsp:include page="/about/left.jsp" />
			<div class="list-right">
				<h2>隐私协议<span>PRIVACY AGREEMENT</span></h2>				
				 <div class="help-privacy">
	            	<p>亲爱的用户，您好：</p>
	                <p>之江企业信用服务（浙江）有限公司（以下简称“之江信用”）非常重视您的企业数据和隐私安全。在您仔细阅读、了解并同意本政
策之前，请不要向之江信用提交任何企业数据或隐私数据。 </p>
					<p>通过本隐私政策，之江信用希望您明白以下内容：</p>
					<p>1. 之江信用如何使用您的个人信息或企业数据；</p>
					<p>2. 之江信用如何披露您的个人信息或企业数据；</p>
					<p>3. 之江信用如何保护您的个人信息或企业数据；</p>
					<p>4. 免责申明；</p>
					<p>5. 本隐私政策的更新；</p>
					<p>本协议阐述之江信用针对个人信息以企业数据的隐私保护策略，但是一个简单的策略无法解决有关数据处理的所有疑虑，因此之江信
用可能会另外提供客户产品或服务专用的信息作为本策略的补充，以便在基于特殊目的处理个人信息或企业数据时通知客户，请您在
使用之江信用产品或服务时，注意其他形式的此类通知。</p>
	            </div>
	            <div class="help-privacy">
	                <div class="help-cj-tit help-cj-tit-b">
	                    <p><span>如何使用您的个人信息或企业数据？</span></p>
	                </div>
	                <p>1. 针对个人信息</p>
	                <p>当您在线注册、提交举报信息时，我们会要求您提交所需的数据，例如举报人姓名、联系方式、身份信息等相关数据，以便我们完成举报数据的审核工作；</p>
	                <p>2. 针对企业数据</p>
	                <p>当您在线注册、提交申请建立企业信用账户时，我们会要求您提交所需的数据，例如申请人姓名、联系方式、公司网站地址、财务数据及其他相关企业数据等，以便我们完成您企业信用评级的审核工作。</p>
	            </div>
	            <div class="help-privacy">
	                <div class="help-cj-tit help-cj-tit-b">
	                    <p><span>如何披露您的个人信息与企业数据？</span></p>
	                </div>
	                <p>只有符合下列情况时，之江信用才会披露您的个人信息或企业数据：</p>
	                <p>1. 在获得您的授权后，之江信用才会将您的个人信息或企业数据透露给其他公司；</p>
	                <p>2. 将您的个人信息或企业数据披露给授权合作的第三方：</p>
	                <div class="help-privacy-pl">
	                    <p>1. 针对个人信息：之江信用需要通过某些合作方来确保举报等相关信息的真实性、可用性，因此需要将您的部分信息共享给合作方，例如公安机关，以便完成数据的核实；</p>
	                    <p>2. 针对企业数据：之江信用可能需要通过某些合作方为您提供某些服务，因此需要将您的部分企业数据共享给合作方，以便丰富我们的服务以及满足您的需求</p>
	                </div>
	                <p>3. 依法律要求，披露您个人信息或企业数据：依法律、诉讼、司法机关或政府机关的要求，之江信用可能会提供您的个人信息或企业数据。在之江信用  涉及重组、合并或清算的情况下，您的个人信息或企业数据可能也会提供给交易方。</p>
	            </div>
	            <div class="help-privacy help-pr-te">
	                <div class="help-cj-tit help-cj-tit-b">
	                    <p><span>如何保护您的个人信息或企业数据？</span></p>
	                </div>
	                <p>之江信用采取合理的预防措施，包括但不限于物理上、技术及制度等方面，以保护您的企业信息不会遭受未经授权的浏览、披露、滥用、变更、破坏以及损失。例如，在技术方面，之江信用使用防病毒软件、加密保护、监控我们的系统，以及增强我们数据中心的攻击防护；物理方面，之江信用设定门禁措施及访问控制，仅允许需要这类信息的业务人员浏览；在制度方面，则通过对之江信用员工进行安全与隐私保护知识培训，确保员工了解保护数据的重要性。虽然我们采用合理的措施来保护您的个人数据，但没有任何安全措施能够百分之百完美或牢不可破。</p>
	            </div>
	            <div class="help-privacy">
	                <div class="help-cj-tit help-cj-tit-b">
	                    <p><span>免责申明</span></p>
	                </div>
	                <p>就下列相关事宜的发生，之江信用不承担任何法律责任：</p>
	                <p>1. 由于您将用户密码告知他人或与他人共享注册账户，由此导致的个人信息泄露和其他后果，或其他非因之江信用原因导致的个人信息泄露和其他后果；</p>
	                <p>2. 之江信用根据法律规定或政府相关政策要求提供您的个人信息；</p>
	                <p>3. 任何第三方根据之江信用服务条款及声明中所列明的情况使用您的个人信息，由此产生的纠纷；</p>
	                <p>4. 任何由于黑客攻击、计算机病毒侵入或发作、因政府管制而造成的暂时性关闭等影响网络正常经营之不可抗力而造成的个人资料泄露、丢失、被盗用或被篡改等；</p>
	            </div>
	            										
			</div>
		</div>
	</div>   
	<jsp:include page="/footer.jsp" />
</body>
</html>
