<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>资料管理-之江信用</title>
    <base href="${basePath }/" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
		var userCfg = userCfg || {page : 'addDatum'};
		userCfg['typData'] = JSON.parse('${not empty datumType ? datumType : ""}');
		userCfg['datumData'] = JSON.parse('${not empty userDatums ? userDatums : ""}');
		userCfg['encodeUploaddatum'] = '<%=response.encodeURL("uploaddatum")%>';
	</script>
  </head>
  <body class="container-bg">
	<jsp:include page="../user/top.jsp" />
    <jsp:include page="user_search.jsp"/>
    <!--end banner-->
     <div class="layout content" user_left="4">
    <div id="infoMessage" style="left: 50%"></div>
    <jsp:include page="/user/left.jsp"/>
           <div class="main">
        	<h2>资料管理</h2>
            <div class="personal">
            	<form id="addDatumForm" action="${basePath }/user/datum/<%=response.encodeURL("add") %>" method="post">
            	<div class="data">
            	<div class="m-typ">
            	<div style="width:100%" class="select-box">
                	<h3>${userOwner.companyName}</h3>
                	<input type="hidden"  value="${userOwner.companyName}" name="address" />
                	<input type="hidden" value="${userOwner.ownerId}" name="ownerId" id="ownerId" />
						<input type="hidden" value="" name="datumLink" id="datumLink" />
						<input type="hidden" value="" name="attachOrgfile" />
                	    <ul class="tag-options02" style="display: none" id="companyLi">
	                    	<c:forEach items="${lists }" var="data">
		                        <li value="${data.ownerId }">${data.companyName}</li>
	                    	</c:forEach>
	                    </ul>
	                    </div>
	                    </div>
                    <div class="m-data">
                    
                        <div class="m-typ">
                        	<p><span>资料类型：</span></p>
                        	<div class="select-box">
                                <div class="tag-select02" id="datumType">请选择<img src='${basePath}/images/small-icon.png'  style='margin-left:10px'/></div>
                                <input type="hidden" name="datumType" value="" id="auditDatumId"/>
		                        <ul class="tag-options02" style="display: none; *margin-left: 0;" id="datumTypeLi"></ul>
                    		</div>
                            <div class="select-box">
                                <div class="tag-select02" id="datumSubtype">请选择<img src='${basePath}/images/small-icon.png'  style='margin-left:10px'/></div>
                                <input type="hidden" value="" name="datumSubtype" />
	                        	<ul class="tag-options02" style="display: none;*left:-30px;" id="datumSubTypeLi"></ul>
                    		</div>
                    	</div>
                    	<div class="m-typ">
                    	 <p><span>资料证明：</span><!-- <a href="#" class="p-up" >选择图片或文件</a> -->
             
                        </p>
                        <div class="pop-img">
		    				<div id="filePicker1" style="margin-top: 40px; text-align: center;">选择图片</div>
	    					<div id="attachOrgfileDiv" class="uploader-list"></div>
						</div>
                    	</div>
          
                     <div class="m-typ">
                        <p><span>查验网址：</span><input name="checkUrl" type="text" style="line-height:33px;" /></p>
                        </div>
                        <p><span>&nbsp;</span><input name="" type="submit" id="toSubmit" value="提 交" class="n-button" />
                        <a href="javascript:void(0)" id="resetButton" style="display: none"></a>
	                	<label id="errorMsg" style="color: red; margin-left: 10px;"></label></p>
                        
                    </div>
                </div>
                 </form>
            </div>
           
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>
