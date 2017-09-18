<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>


<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>之江信用-管理授权</title>
	<base href="${basePath }/" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/myStar.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
		var userCfg = userCfg || {page : 'myAuthorization'};
		userCfg['authDataType'] = JSON.parse('${authDataType}');
		userCfg['companyNameDigest'] = '${companyNameDigest}';
		userCfg['encodeUpdate'] = '<%=response.encodeURL("update")%>';
        userCfg['encodeAddInit'] = '<%=response.encodeURL("add_init")%>';
	</script>
  </head>

  <body class="container-bg">
   <jsp:include page="../user/top.jsp" />
   <div class="layout new11-about">
      <jsp:include page="/user/left.jsp"/>
      <div class="new11-fav">
         <div class="new11-tab">
    			<p id="message_p">
    				<a href="${basePath }/user/authorization/<%=response.encodeURL("list")%>" data-nav="authorizeA"  class="current">授权申请</a>
    				<a href="${basePath }/user/comment/<%=response.encodeURL("list")%>" data-nav="commentA">收到的评论</a>
    			</p>
    		  <c:if test="${empty userOwners}">
    			<div class="new11-warn">
    				<h4><i>您还未认领过企业，暂无企业相关信息</i></h4>
    			</div>
    		  </c:if>
    	  </div>
    	<c:if test="${!empty userOwners}">  
	      <table cellpadding="0" cellspacing="0" border="0" id="authorizationTable" >
	    	  <tr>
	    		<th class="fav-t4">申请授权时间</th>
	    		<th class="fav-t5">申请用户</th>
	    		<th class="fav-t5">授权数据项</th>    				
	    		<th class="fav-t6">操作</th>
	    	  </tr>
	    	  <tbody id="auth_tr">
	    		 <tr model>
	    			<td class="fav-t4">{1}</td>
	    			<td class="fav-t5">{2}</td>
	    			<td class="fav-t5">{3}</td>    				
	    			<td class="fav-t6">
	    				<a data-id="{0}"  data-type="1" >授权</a>
	    				<span>/</span>
	                    <a data-id="{0}" data-type="2">拒绝</a>
	    			</td>
	    		</tr>
	    	 </tbody>
	     </table>
	     <table cellpadding="0" cellspacing="0" border="0" id="auth_nodata" style="display: none;margin-top: 0px;">
    	    <tr><td class="fav-t4" colspan='4' style="text-align:center;">未查询到相关信息</td></tr>
    	 </table>
	     <div class="new-page" config='{name: "authInfo", url:"${basePath}/user/authorization/ajax/list?companyNameDigest=${companyNameDigest}", nodata:"#auth_nodata", pin:5, isAjax:true,isShowRedict:false}'></div>	
		</c:if>
		
    	<c:if test="${empty userOwners}"> 
	    	<div class="new11-claim">
	    		<h2>认领流程<span>CLAIM PROCESS</span></h2>
	    		<div class="new11-step">
	    			<img src="${basePath}/images/new1-step.png" />
	    		</div>
	    		<div class="new11-search">
	    			<div class="new11-search-pad">
		    			<div class="new11-search-text" autocomplete="owner">
							<input type="text" name="companyNameDigest" id="searchKey" placeholder="可以按照企业名称、注册号、法人、股东、高管、品牌查询" />
		    			</div>
	    			</div>
	    		</div>
	        </div> 
	     </c:if>
      </div>
   </div>
    
    
   <%--  <!--end banner-->
    <div class="layout content" user_left="5">
    <div id="infoMessage" style="left: 50%"></div>
    <jsp:include page="/user/left.jsp"/>
        <div class="main">
        	<!--<h2>管理授权</h2>-->
          <div class="personal">
          	<div class="m-typ">
							<p>
								<span>当前企业：</span>
							</p>
						<div class="select-box">
							<div id="companySelect" class="tag-select02">

							</div>
							<ul class="tag-options02" style=" display: none;" id="companyLi">
                                <c:forEach items="${userOwners }" var="data">
                                    <li value="${data.ownerId }" companyNameDigest="${data.company.companyNameDigest}">${data.companyName}</li>
                                </c:forEach>
							</ul>
						</div>
					</div>
          <div class="data">
          <div class="myclaim" id="authList">
          <h4>未处理授权项</h4>
					<input  type="hidden" id="authPageId" value="0"/>
          <table cellpadding="0" cellspacing="0" border="0">
	          <tr>
		         	<th class="p10">申请授权时间</th>
		          <th class="p11">用户</th>
		          <th class="p12">授权数据项</th>
		          <th class="p13">操作</th>
	          </tr>
          	<tbody id="auth_tr">
			        <tr model>
				        <td class="p10">{1}</td>
								<td class="p11">{2}</td>
								<td class="p12">{3}</td>
								<td class="p13">
                                    <a data-id="{0}"  data-type="1" >授权</a>
                                    <a data-id="{0}" data-type="2">拒绝</a>
								</td>
							</tr>
						</tbody>
          </table>
          <div class="new-page" config='{name: "authInfo", url:"${basePath}/user/authorization/ajax/list?companyNameDigest=${companyNameDigest}", nodata:"#auth_nodata", pin:5, isAjax:true,isShowRedict:false}'></div>
				  	<div class="detail_nodata j-container" id="auth_nodata" style="display:none;width:75.5%;" >未查询到相关信息</div>
          </div>
          <div class="myclaim" id="authHistoryList">
	          <h4>授权历史</h4>
	         	<input  type="hidden" id="authHistoryPageId" value="0"/>
	          <table cellpadding="0" cellspacing="0" border="0">
		          <tr>
			          <th class="p10">申请授权时间</th>
			          <th class="p11">用户</th>
			          <th class="p12">授权数据项</th>
			          <th class="p16">操作</th>
			          <th class="p15">操作用户</th>
			          <th class="p18">操作时间</th>
		          </tr>
		          <tbody id="authHistory_tr">
				        <tr model>
					        <td class="p10">{0}</td>
									<td class="p11">{1}</td>
									<td class="p12">{2}</td>
									<td class="p16">{3}</td>
									<td class="p15">{4}</td>
									<td class="p18">{5}</td>
								</tr>
							</tbody>
	          </table>
	          <div class="new-page" config='{name: "authHistoryInfo", url:"${basePath}/user/authorization/history/ajax/list?companyNameDigest=${companyNameDigest}", nodata:"#authHistory_nodata", pin:5, isAjax:true,isShowRedict:false}'></div>
					  	<div class="detail_nodata j-container" id="authHistory_nodata" style="display:none;width:80.9%;" >未查询到相关信息</div>
	          </div>
          </div>
          </div>
        </div>
    </div> --%>
    <jsp:include page="../footer.jsp" />
</body>
</html>
