<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>${key }-企业信用查询-之江信用</title>
    <base href="${basePath}/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="keywords" content="企业查询,中小企业,三资企业,民营企业,私营企业,黄页大全"/>
	<meta http-equiv="description" content="之江信用提供中小企业,民营企业信息查询,私营企业信用查询服务。"/>
	<link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css" />
	  <link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/gov/js/monitor/clue.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">

        var clueCfg = clueCfg || {
                    page:'detail',
                    clueContent : ${clue.clueContent}
                };

    </script>

</head>

<body class="container" data-attr1="clueIndex" data-attr="clue">
   <jsp:include page="/gov/gov_top.jsp" />
	<jsp:include page="/gov/monitor/left.jsp" />
   	 <div class="right">
        <div class="content">
            <div class="content-infor">
            	<div class="content-title"><p>线索处理</p></div>
                <div class="main">
                	<div class="name">
                    	<img src="${basePath}/images/spvision_images/b-img10.png" />
                        <p>${clue.companyName }</p>
                    </div>
                	<div class="clue">
                    	<h3>主体信息</h3>
                        <ul class="clue-main">
                            <li>
                                <div class="lable">地区：</div><div class="clue-content">${clue.subjectArea }</div>
                            </li>
                            <li>
                                <div class="lable">详细地址：</div><div class="clue-content">${clue.subjectAddress }</div>
                            </li>
                        </ul>
                        <ul class="clue-main" >
                            <li>
                                <div class="lable">联系人：</div><div class="clue-content">${clue.subjectContactor }</div>
                            </li>
                            <li>
                                <div class="lable">联系电话：</div><div class="clue-content">${clue.subjectPhone }</div>
                            </li>
                            <li>
                                <div class="lable">邮箱：</div><div class="clue-content">${clue.subjectEmail }</div>
                            </li>
                        </ul>
                    </div>
                    <div class="clue">
                    	<h3>线索信息</h3>
                        <ul class="clue-main">
                            <li>
                                <div class="lable">线索来源：</div><div class="clue-content">公众举报</div>
                            </li>
                            <li>
                                <div class="lable">线索类型：</div><div class="clue-content">${clue.clueTypeShow}</div>
                            </li>
                            <li>
                                <div class="lable">创建时间：</div><div class="clue-content"><fmt:formatDate value="${clue.createTime }" pattern="yyyy-MM-dd"/></div>
                            </li>
                        </ul>
                        <div class="nest">
                        	<h4>线索内容</h4>
                            <ul class="clue-main" id="clue_content">
                              
                        	</ul>
                        </div>
                    </div>
                    <div class="clue">
                        <ul class="clue-main" >
                            <li>
                                <div class="lable">处理方式：</div><div class="clue-content">${clue.clueProcessTypeShow }</div>
                            </li>
                            <li>
                                <div class="lable">处理记录：</div><div class="clue-content">${clue.clueVerifyHistory }</div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
      <jsp:include page="/gov/footer.jsp" />
</body>

</html>
