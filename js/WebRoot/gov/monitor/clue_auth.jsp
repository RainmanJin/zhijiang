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
                    page:'auth',
                    modifyUrl : "${basePath}/gov/user/clue/<%=response.encodeURL("modify")%>",
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
                    <div class="clue clue-bottom">
                    	<form id="clueAuthForm" action="${basePath}/gov/user/clue/<%=response.encodeURL("modify")%>">
                    	<h3>线索处理</h3>
                    	<input type="hidden" name="clueId" value="${clue.clueId }">
                        <h4>处理方式：<select name="clueProcessType">
				                		<option value="" selected='selected'></option>
				                		<c:forEach items="${clueProcessTypeMap }" var="processType">
				                			<option value="${processType.key}">${processType.value}</option>
				                		</c:forEach>
			                		</select>
                		</h4>
                		<h4 style="display:none;">部门邮箱：<input  type="text" name="transprotDepMail" style="width:128px;height:29px;line-height:32px;border: 1px solid #cfd6da;padding-left: 20px;font-size: 14px;vertical-align: middle;display:inline-block;" ></h4>
                     	 <h4>处理类型：<select name=""><option>请选择</option></select></h4>
                         <h4>处理记录：<textarea name="clueVerifyHistory" cols="" rows=""></textarea></h4>
                        <h4><button  id="clueAuthFormBtn" type="submit">提交</button></h4>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
      <jsp:include page="/gov/footer.jsp" />
</body>
</html>
