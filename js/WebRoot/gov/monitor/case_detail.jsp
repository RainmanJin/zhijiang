<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>之江信用</title>
        <base href="${basePath}/"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta name="renderer" content="webkit" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="" />
		<meta http-equiv="description" content="" />
		<link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
		  <link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />
        <script data-main="${basePath }/gov/js/monitor/case.js" src="${basePath }/gov/js/lib/require.js"></script>
        <script type="text/javascript">

            var caseCfg = caseCfg || {
                        page:'detail',
                        clueContent : ${platformCaseInfo.clueContent}
                    };

        </script>
	</head>
	<body class="container" data-attr1="case" data-attr="clue">
	  <jsp:include page="/gov/gov_top.jsp" />
	  <jsp:include page="/gov/monitor/left.jsp" />
    <div class="right">
        <div class="content">
            <div class="content-infor">
            	<div class="content-title"><p>线索处理</p></div>
                <div class="main">
                	<div class="name">
                    	<img src="${basePath}/images/spvision_images/b-img10.png" />
                        <p>${platformCaseInfo.companyName}</p>
                    </div>
                	<div class="clue">
                    	<h3>主体信息</h3>
                        <ul class="clue-main">
                            <li>
                                <div class="lable">地区：</div><div class="clue-content">${platformCaseInfo.subjectArea }</div>
                            </li>
                            <li>
                                <div class="lable">详细地址：</div><div class="clue-content">${platformCaseInfo.subjectAddress}</div>
                            </li>
                        </ul>
                        <ul class="clue-main">
                            <li>
                                <div class="lable">联系人：</div><div class="clue-content">${platformCaseInfo.subjectContactor}</div>
                            </li>
                            <li>
                                <div class="lable">联系电话：</div><div class="clue-content">${platformCaseInfo.subjectPhone}</div>
                            </li>
                            <li>
                                <div class="lable">邮箱：</div><div class="clue-content">${platformCaseInfo.subjectEmail}</div>
                            </li>
                        </ul>
                    </div>
                    <div class="clue">
                    	<h3>线索信息</h3>
                        <ul class="clue-main">
                            <li>
                                <div class="lable">线索来源：</div><div class="clue-content">${platformCaseInfo.clueTypeShow}</div>
                            </li>
                            <li>
                                <div class="lable">线索类型：</div><div class="clue-content">${platformCaseInfo.clueTypeShow}</div>
                            </li>
                            <li>
                                <div class="lable">创建时间：</div><div class="clue-content"><fmt:formatDate value="${platformCaseInfo.createTime}" pattern="yyyy-MM-dd"/></div>
                            </li>
                        </ul>
                        <div class="nest">
                        	<h4>线索内容</h4>
                            <ul class="clue-main" id="clue_content">
                                <li>
                                    <div class="lable">举报人姓名：</div><div class="clue-content">李四</div>
                                </li>
                                <li>
                                    <div class="lable">联系电话：</div><div class="clue-content">17083096358</div>
                                </li>
                                <li>
                                    <div class="lable">联系邮箱：</div><div class="clue-content">lisi@163.com</div>
                                </li>
                                <li>
                                    <div class="lable">举报原因：</div><div class="clue-content"><input name="" type="checkbox" value="" />企业失信行为</div>
                                </li>
                                <li>
                                    <div class="lable">附件：</div><div class="clue-content"></div>
                                </li>
                                <li class="clue-width">
                                    <div class="lable">详情描述：</div><div class="clue-content">在58同城上发表招淘宝模特等信息，先收最低不低于5000现金为包装信用，后期不予理睬。 </div>
                                </li>
                        	</ul>
                        </div>
                    </div>
                    <div class="clue">
                        <div class="nest">
                        	<h4>线索处理结果</h4>
                            <ul class="clue-main" >
                                <li>
                                    <div class="lable">处理结果：</div><div class="clue-content">${platformCaseInfo.caseProcessTypeShow}</div>
                                </li>
                                <li>
                                    <div class="lable">处理方式：</div><div class="clue-content">${platformCaseInfo.casePunishTypeShow}</div>
                                </li>
                             </ul>
                             <ul class="clue-main">   
                                <li>
                                    <div class="lable">处理人：</div><div class="clue-content">${platformCaseInfo.adminName}</div>
                                </li>
                                <li>
                                    <div class="lable">处理时间：</div><div class="clue-content"><fmt:formatDate value="${platformCaseInfo.lastupdatetime}" pattern="yyyy-MM-dd"/></div>
                                </li>
                        	</ul>
                             <ul class="clue-main" >  
                                <li>
                                    <div class="lable">处理记录：</div><div class="clue-content">${platformCaseInfo.caseVerifyHistory}</div>
                                </li>
                             </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
      <jsp:include page="/gov/footer.jsp" />
</body>
</html>
