<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>举报中心-之江信用</title>
	<base href="${basePath }/" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="之江信用是在国家发改委指导下的大数据企业信用评价平台。之江信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<%--<link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />--%>
    <link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/js/uzj/about.js" src="${basePath }/js/lib/require.js"></script>
</head>

<body data-attr="report">
	<jsp:include page="/user/top.jsp"/>
	<div class="about-banner"></div>
	 <div class="ab-container">
		<div class="ab-main">	
			<jsp:include page="/about/left.jsp"/>
			<div class="list-right">
				<h2>失信举报<span>PROMISE REPORT</span></h2>				
				<div class="answer-one">					
					<p>如果您发现企业信用信息有误，欢迎您在这里进行举报，我们会及时核实处理，并将处理结果以邮件的形式反馈给您，感谢您的举报！</p>										
				</div>
				<div class="write">
                	<form method="post" id="addReport" action="${basePath }/report/add">
                	    <div class="form-msg" id="errorMsg" style="display: none; position: initial; color: red; margin-left: 95px;margin-top: -40px;"></div>
	                	<p><span><b>*</b>企业名称</span><input name="reportWebsite" id="reportWebsite" type="text" minlength="2" maxlength="30" des="公司名称" placeholder="公司名称" autocomplete="off" value="" style="color: #444;"/><em></em></p>
	                    <div class="type">
	                        <span title="必填项，选择举报类型"><b>*</b>举报类型</span>
	                        <ul title="必填项，选择举报类型">
	                            <li><input type="checkbox" id="reportTypeInfoerror" name="reportTypeInfoerror" value="1"/><label for="reportTypeInfoerror" style="display: inline;">企业基本信息有误</label></li>
	                            <li><input id="reportTypeFishwebsite" name="reportTypeFishwebsite" value="1" type="checkbox"/><label for="reportTypeFishwebsite" style="display: inline;">企业网站存在假冒、钓鱼内容</label></li><em id="report_type" style="display:none;color:red;">请选择举报类型！</em>
	                            <li><input id="reportTypeFakebusiness" name="reportTypeFakebusiness" type="checkbox" value="1" /><label for="reportTypeFakebusiness" style="display: inline;">企业运营状况造假</label></li>
	                            <li><input id="reportTypeIllegalcontent" name="reportTypeIllegalcontent" type="checkbox" value="1" /><label for="reportTypeIllegalcontent" style="display: inline;">企业网站有不合法内容</label></li>
	                            <li><input id="reportTypeFakehornor" name="reportTypeFakehornor" type="checkbox" value="1" /><label for="reportTypeFakehornor" style="display: inline;">企业资质荣誉造假</label></li>
	                            <li><input id="reportTypeVirus" name="reportTypeVirus" type="checkbox" value="1" /><label for="reportTypeVirus" style="display: inline;">企业网站有木马、病毒</label></li>
	                            <li><input id="reportTypeLosepromise" name="reportTypeLosepromise" type="checkbox" value="1" /><label for="reportTypeLosepromise" style="display: inline;">企业失信行为</label></li>
	                            <li><input id="reportTypeOther" name="reportTypeOther" type="checkbox" value="1" /><label for="reportTypeOther" style="display: inline;">其他原因</label></li>
	                        </ul>
	                    </div>
	                    <div class="details">
	                    	<p>
	                    		<span>详细描述</span>
	                    		<textarea name="reportDetail" cols="" rows="" class="details-wz" placeholder="举报内容的详细描述，500字以内！"></textarea>
	                    	</p>
	                    </div>
	                     <div class="aptitude">
		                	<p>附件上传</p>
		                    <div class="pop-img">
		                    	<input type="hidden" name="reportAttach" id="reportAttach"/>
		    					<div id="filePicker1" >
		    						<span style="float: none;">选择文件</span>
		    						<input type="button" value="上传">
		    					</div>
	    						<div id="reportAttachDiv" class="uploader-list"></div>
							</div>
							<div class="aptitude-wz">
								<h4>您可以上传您举报对象的截图或证据</h4>
								<h4>格式为jpg/png/gif</h4>
								<h4>大小不超过 5MB</h4>
							</div>
	    					<a style="clear: both;display:none;" href="javascript:void(0)">信用评估模型V0.53-颜色标注版(1).xlsx</a>
		                </div>                       
	                    <p>
	                    	<span><b>*</b>举报人姓名</span>
	                    	<input class="in01" id="reportPerson" name="reportPerson" type="text" minlength="2" maxlength="30" des="举报人姓名" placeholder="举报人姓名" autocomplete="off" style="color: #444;"/><em></em>
	                    </p>
	                    <p>
	                    	<span><b>*</b>联系电话</span>
	                    	<input class="in01" id="contactNumber" name="contactNumber" type="phone" minlength="11" maxlength="11" des="联系电话" placeholder="联系电话" autocomplete="off" style="color: #444;"/><em></em>
	                    </p>
	                    <p>
	                    	<span><b>*</b>验证码</span><input maxlength="4" id="code" name="code" type="text" minlength="4" maxlength="4" des="验证码"  placeholder="验证码" autocomplete="off" ajax="${basePath }/user/<%=response.encodeURL("codeValidate")%>" ajaxmsg="验证码错误" msgtip="#imgcodeMsg" style="color: #444;"/>
		                    <img style="vertical-align: middle;" width="123px;" height="35px;" id="ImageCode" src="${basePath }/images/new-images/ab-yzm.png" alt="验证码" /><span style="width:300px;margin-left: 30px;color: red;" id="imgcodeMsg"></span>
	                    </p>
	                    <p>
	                    	<span><b>*</b>联系邮箱</span><input class="in02" id="contactEmail" name="contactEmail" type="email" minlength="3" maxlength="30" des="邮箱" placeholder="邮箱" autocomplete="off" style="color: #444;"/><em></em></p>	                    
	                    <div class="report-btn" style="margin-left: 96px; text-align: left"><a href="javascript:void(0)" id="reportSubmitBtn">提 交</a></div>
                    </form>
               				
	                <div class="notice">
	                	<p>举报须知：</p>
		                <h5>1. 请您保证所举报的内容与事实一致。</h5>
		                <h5>2. 请您允许之江信用根据工作需要，在保护您个人信息不被泄漏的前提下，使用您的任何叙述。</h5>
		                <h5>3. 请您尽可能填写详实内容，以利于您所举报问题的解决。</h5>	                    
	                </div>                
				</div>								
			</div>
		</div>
	</div>   
    <!--end banner-->
   <%--  <div class="container-group">
        <div class="content content-group" user_left="2">
            <jsp:include page="/about/left.jsp"/>
            <div class="list-right list-bottom">
            	<h2>举报中心</h2>
                <div class="if"><p>如果您发现企业信用信息有误，欢迎您在这里进行举报，我们会及时核实处理，并将处理结果以邮件的形式反馈给您，感谢您的举报！</p></div>
                <div class="write">
                	<form method="post" id="addReport" action="${basePath }/report/add">
	                	<p><span><b>*</b>举报公司：</span><input name="reportWebsite" id="reportWebsite" type="text" minlength="3" maxlength="30" des="公司名称" placeholder="公司名称" autocomplete="off" value="${param.companyName}" /><em></em></p>
	                    <div class="type">
	                        <span title="必填项，选择举报类型"><b>*</b>举报类型：</span>
	                        <ul title="必填项，选择举报类型">
	                            <li><input type="checkbox" id="reportTypeInfoerror" name="reportTypeInfoerror" value="1"/><label for="reportTypeInfoerror" style="display: inline;">企业基本信息有误</label></li>
	                            <li><input id="reportTypeFishwebsite" name="reportTypeFishwebsite" value="1" type="checkbox"/><label for="reportTypeFishwebsite" style="display: inline;">企业网站存在假冒、钓鱼内容</label></li><em id="report_type" style="display:none;color:red;">请选择举报类型！</em>
	                            <li><input id="reportTypeFakebusiness" name="reportTypeFakebusiness" type="checkbox" value="1" /><label for="reportTypeFakebusiness" style="display: inline;">企业运营状况造假</label></li>
	                            <li><input id="reportTypeIllegalcontent" name="reportTypeIllegalcontent" type="checkbox" value="1" /><label for="reportTypeIllegalcontent" style="display: inline;">企业网站有不合法内容</label></li>
	                            <li><input id="reportTypeFakehornor" name="reportTypeFakehornor" type="checkbox" value="1" /><label for="reportTypeFakehornor" style="display: inline;">企业资质荣誉造假</label></li>
	                            <li><input id="reportTypeVirus" name="reportTypeVirus" type="checkbox" value="1" /><label for="reportTypeVirus" style="display: inline;">企业网站有木马、病毒</label></li>
	                            <li><input id="reportTypeLosepromise" name="reportTypeLosepromise" type="checkbox" value="1" /><label for="reportTypeLosepromise" style="display: inline;">企业失信行为</label></li>
	                            <li><input id="reportTypeOther" name="reportTypeOther" type="checkbox" value="1" /><label for="reportTypeOther" style="display: inline;">其他原因</label></li>
	                        </ul>
	                    </div>
	                    <div class="details"><p><span>详细描述：</span><textarea name="reportDetail" cols="" rows="" class="details-wz" placeholder="举报内容的详细描述，500字以内！"></textarea></p></div>
	                     <div class="aptitude">
		                	<p>附件上传：</p>
		                    <div class="pop-img">
	                    	<input type="hidden" name="reportAttach" id="reportAttach"/>
	    					<div id="filePicker1" style="margin-top: 40px; text-align: center;">选择文件</div>
    						<div id="reportAttachDiv" class="uploader-list"></div>
							</div>
	    						<a style="clear: both;display:none;" href="javascript:void(0)">信用评估模型V0.53-颜色标注版(1).xlsx</a>
		                </div>
                        <p style=" margin-left:91px;">您可以上传您举报对象的截图或证据。格式为jpg/png/gif或者zip/rar，大小不超过2M。</p>
	                    <p><span><b>*</b>举报人姓名：</span><input id="reportPerson" name="reportPerson" type="text" minlength="1" maxlength="30" des="举报人姓名" placeholder="举报人姓名" autocomplete="off"/><em></em></p>
	                    <p><span><b>*</b>联系电话：</span><input id="contactNumber" name="contactNumber" type="phone" minlength="6" maxlength="30" des="联系电话" placeholder="联系电话" autocomplete="off"/><em></em></p>
	                    <p><span><b>*</b>联系邮箱：</span><input id="contactEmail" name="contactEmail" type="email" minlength="3" maxlength="30" des="邮箱" placeholder="邮箱" autocomplete="off"/><em></em></p>
	                    <p>
	                    	<span><b>*</b>验证码：</span><input style="width: 100px; vertical-align: middle;" maxlength="4" id="code" name="code" type="text" minlength="4" maxlength="4" des="验证码" placeholder="验证码" autocomplete="off" ajax="${basePath }/user/<%=response.encodeURL("codeValidate")%>" ajaxmsg="验证码错误" msgtip="#imgcodeMsg"/>
		                    <img style="vertical-align: middle;" width="60px;" height="26px;" id="ImageCode" src="" alt="验证码" /><span style="width:300px;margin-left: 30px;color: red;" id="imgcodeMsg"></span>
	                    </p>
	                    <div class="report-btn" style="margin-left: 91px; text-align: left"><a href="javascript:void(0)" id="reportSubmitBtn">提 交</a></div>
                    </form>
                </div>
                <div class="notic-bottom">
	                <div class="notice">
	                	<ul>
		                    <p>举报须知：</p>
		                    <li>1. 请您保证所举报的内容与事实一致。</li>
		                    <li>2. 请您允许之江信用根据工作需要，在保护您个人信息不被泄漏的前提下，使用您的任何叙述。</li>
		                    <li>3. 请您尽可能填写详实内容，以利于您所举报问题的解决。</li>
	                    </ul>
	                </div>
                </div>
            </div>

            </div>
        </div> 
    </div>--%>
    <jsp:include page="/footer.jsp" />

</body>
</html>
