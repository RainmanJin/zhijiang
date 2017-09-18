<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>认领企业-之江信用</title>
<base href="${basePath }/" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/style/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
<script type="text/javascript">
var userCfg = userCfg || {page : 'userOwner'};
userCfg['url'] = '<%=response.encodeURL("company/list")%>';
</script>
</head>

<body style="background:#f9f9f9">
	
	<jsp:include page="../user/top.jsp" />
    <jsp:include page="user_search.jsp"/>
    <!--end banner-->
    <div class="container-group">
        <div class="content">
        <div id="infoMessage" style="left: 42%"></div>
    	<jsp:include page="owner_pop.jsp" />
            <div class="find-title">
            	<h2>认领企业</h2>
                <img src="${basePath }/images/claim1.png"/>
            </div>
            <div class="find-content">
            	<h3>填写企业名称</h3>
            	<div id="searchMsg"></div>
            	<div id="companyInfo"></div>
                <div class="find-form">
                	<div class="register-oneline">
                        <div class="register-text">企业名称：</div>
                        <input class="register-input" id="searchCompanyName" type="text" value=""  name="registerVO.userId">
                    </div>
                    <div class="register-oneline">
                	<div id="citySelect" >
                		<div class="register-text">
							<label id="pro_now" >选择省份</label>
							<img src="${basePath }/images/spirit1-icon.png" />
                		</div>
					</div>
					<input class="register-input" id="province" name="province" type="text" readonly="readonly"/>
					<div class="city-menu" style="left: 60px; width: 430px; top: 50px;">
						<span class="closebtn"></span>
						<ul class="map"></ul>
					</div>
                </div>
				<div class="register-oneline">
					<input type="button" class="sub-bottom" id="ownerButton" style="height: 44px;" value="马上认领"/>
					<input type="button" id="popOwner" style="display: none;"/>
				</div>
                </div>
            </div>
        </div>
        <div style="bottom:0; width:100%; margin:0 auto;">
        <jsp:include page="../footer.jsp" />
        </div>
    </div>
</body>
</html>
