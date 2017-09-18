<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>之江信用-我的评论</title>
	<base href="${basePath }/" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
    <meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css"/>
     <link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/myStar.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
		var userCfg = userCfg || {page:'myComment'};
		userCfg['encodeDel'] = '<%=response.encodeURL("del")%>';
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
    				<a href="${basePath }/user/authorization/<%=response.encodeURL("list")%>" data-nav="authorizeA" >授权申请</a>
    				<a href="${basePath }/user/comment/<%=response.encodeURL("list")%>" data-nav="commentA" class="current">收到的评论</a>
    			</p>
    		  <c:if test="${empty userOwners}">
    		    <div class="new11-warn">
    				<h4><i>您还未认领过企业，暂无企业相关评论记录</i></h4>
    		   </div>
    		 </c:if>
    	  </div>
    	  
      <c:if test="${!empty userOwners}">
          <c:if test="${empty page}">
    	     <div class="new11-con">
    	        <div class="comment">暂无评论</div>
    	     </div>
    	  </c:if>
    	 <div class="new11-con">
    	   <c:forEach items="${page}" var="data">
    	      <div class="comment">
				  <div class="head-icon">
					 <img src="${basePath }/images/new/zs_head.png"/>
				  </div>
				  <div class="head-ms">
					  <div class="ms-top">
						 <p>${data.userName }</p>
						 <p></p>
						 <div class="new-star">
							 <label class='istar star-inline' style="display: inline-inline-block;" config='{"n":${data.commentLevel },"s":50,"size":12,"img":"${basePath}/images/star.png"}'></label>
						 </div>
						 <span><fmt:formatDate value="${data.commentTime}" pattern="yyyy/MM/dd"/></span>
					  </div>
					 <div class="ms-bottom">${data.commentContent }</div>
				</div>
				<div class="tagging"></div>
			 </div>
		   </c:forEach>
    	</div>
      </c:if> 
      
      <c:if test="${empty userOwners}"> 
    	<div class="new11-claim">
    		<h2>认领流程<span>CLAIM PROCESS</span></h2>
    		<div class="new11-step">
    			<img src="${basePath}/images/new1-step.png">
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
   
<%-- <jsp:include page="user_search.jsp"/>
<!--end banner-->
<div class="layout content" user_left="1">
    <div id="infoMessage" style="left: 50%"></div>
    <jsp:include page="/user/left.jsp"/>
    <div class="main">
        <div class="zj-myqy">
            <p><a href="${basePath }/user/datum/<%=response.encodeURL("list") %>" >资质审核记录</a><a class="current" href="${basePath }/user/comment/<%=response.encodeURL("list")%>">我的评论记录</a></p>
        </div>

        <div class="personal">
            <c:if test="${empty page}">
                <div class="new-com">
                    暂无评论
                </div>
            </c:if>
<c:forEach items="${page}" var="data">
            <div class="new-com">
                <p>${data.commentContent }</p>
                <div class="new-com-in">
                    <div class="new-com-delete"><a href="javascript:void(0)" code="${data.commentId}" >删除</a></div>
                    <div class="new-com-span"><span>评论“${data.bizCompanyName }”</span></div>
                    <div class="new-com-in-star">       <label class='istar star-inline' style="display: inline-inline-block;" config='{"n":${data.commentLevel },"s":50,"size":12,"img":"${basePath}/images/star.png"}'></label>
                        <i>${data.commentLevel }</i></div>
                    <div class="new-com-time"><fmt:formatDate value="${data.commentTime}" pattern="yyyy/MM/dd"/></div>
                </div>
            </div>
</c:forEach>
        </div>
    </div>
</div> --%>
<jsp:include page="../footer.jsp" />
</body>
</html>
