<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>意见反馈-之江信用</title>
	<base href="${basePath }/" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="之江信用是在国家发改委指导下的大数据企业信用评价平台。之江信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<%--<link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />--%>
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/js/uzj/about.js" src="${basePath }/js/lib/require.js"></script>
</head>

<body data-attr="about">
	
	<jsp:include page="/user/top.jsp"/>
	<!--end banner-->
	 <div class="container-group">
	 	<div class="content content-group" user_left="3">
			<jsp:include page="/about/left.jsp" />
            <div class="list-right list-bottom">
            	<h2>用户反馈调查</h2>
            	<form method="post" id="adviseForm" action="${basePath}/feedback/<%=response.encodeURL("add")%>">
                <div class="answer-one answer-top"  id="q1">
                	<p style="text-indent:0;">亲爱的用户，您好：</p>
					<p>您好！为了给您提供更好的服务，我们希望收集您使用之江信用时的看法或建议。对您的配合和支持表示衷心感谢！</p>
                    <p>如果您在使用之江信用时，有什么好或不好的地方，请大声说出来！</p>
                    <div class="claim-oneline-tp1">
                        <div class="claim-text"><b style="color: red">*</b>纠错说明：</div>
                        <div class="pop-img1">
                        	<textarea name="feedbackContent" minlength="6" maxlength="200" des="纠错说明" placeholder="纠错说明" autocomplete="off"></textarea>
                        </div>
                    </div>
                    <div class="claim-oneline-tp1 claim-oneline-tp3">
                        <div class="claim-text">上传文件：</div>
                        <div class="pop-img">
                        	<input type="hidden" name="feedbackAttach" id="feedbackAttach"/>
	    					<div id="filePicker1" style="margin-top: 40px; text-align: center;">选择文件</div>
    						<div id="feedbackAttachDiv" class="uploader-list"></div>
                        </div>
                    </div>
                    <div class="register-oneline">
                        <div class="register-text1"><b style="color: red">*</b>联系方式：</div>
                        <input class="register-input" type="text" size="30" name="feedbackEmail" minlength="6" maxlength="30" des="联系方式" placeholder="联系方式" autocomplete="off"/><em></em>
                    </div>
                    <div class="register-oneline">
                        <div class="register-text1"><b style="color: red">*</b>验证码：</div>
                        <div class="float-left">
                        	<input class="vercode-input1" type="text" maxlength="4" id="code" name="code" minlength="4" maxlength="4" des="验证码" placeholder="验证码" autocomplete="off" ajax="${basePath }/user/<%=response.encodeURL("codeValidate")%>" ajaxmsg="验证码错误" msgtip="#imgcodeMsg"/>
                        	<img id="ImageCode" src="" style="height:28px; line-height: 28px;" /><span style="width:300px;margin-left: 30px;color: red;" id="imgcodeMsg"></span>
                        </div>
                    </div>

                    <div class="register-oneline"><a id="adviceBtn" class="sub-bottom sub-bottom2" href="javascript:void(0);">提交反馈</a></div>
                </div>
				</form>	
            </div>
        </div>
    </div>
	<jsp:include page="/footer.jsp" />
</body>
</html>
