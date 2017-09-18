<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>之江信用-资料管理</title>
    <base href="${basePath }/" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
		var userCfg = userCfg || {page:'myDatum'};
		userCfg['ownerId'] = '${requestScope.ownerId}';
		userCfg['encodeList'] = '<%=response.encodeURL("list")%>';
		userCfg['encodeToSubmitDatum'] = '<%=response.encodeURL("toSubmitDatum")%>';
	</script>
  </head>
  
  <body class="container-bg">
	<jsp:include page="../user/top.jsp" />
    <jsp:include page="user_search.jsp"/>
	<div class="layout content" user_left="4">
    	<div id="infoMessage" style="left: 50%"></div>
    	<jsp:include page="/user/left.jsp"/>
        <div class="main">        	
        	<div class="zj-myqy">
						<p><a href="${basePath }/user/datum/<%=response.encodeURL("list") %>" class="current">资质审核记录</a><a href="${basePath }/user/comment/<%=response.encodeURL("list")%>">我的评论记录</a></p>
					</div>
        	<div class="personal">
						<c:if test="${empty requestScope.ownerList }">
            	<div class="m-typ">
		            <table cellpadding="0" cellspacing="0" border="0">
		              <tr>
			              <th class="name13">资质名称</th>
			              <th class="name14">提交时间</th>
			             	<th pass class="name14">收录时间</th>
			             	<th fail class="name14">未通过时间</th>
			              <th class="name16">操作</th>
		              </tr>
		            </table>
		            <div style="line-height:30px;text-align:center;color: gray">暂无数据</div>
		          </div>
            </c:if>
            <c:if test="${not empty requestScope.ownerList }">
            		<div class="m-typ">
		              <p><span>当前企业：</span></p>
                  <div class="select-box">
                 		<div class="tag-select02" id="currentCompany">请选择</div>
	                  <ul class="tag-options02" style="display: none;" >
			              	<c:forEach items="${requestScope.ownerList }" var="owner" varStatus="i">
			              	<li ownerId="${owner.ownerId }">${owner.companyName }</li>
			              	</c:forEach>
			              </ul>
                  </div>
		            </div>
		            <div class="error-title1">
		            	<!--<h3>资质记录</h3>-->
			            <ul id = "myDatumRecord">
				            <li><a href="javascript:void(0)" class="current" data-click = "300" ><input type="radio" checked value="aaaaa"/>已通过资质</a></li>
				            <li class="error-t1"><a href="javascript:void(0)" data-click = "100,200" ><input type="radio"  />待审核资质</a></li>
				            <li><a href="javascript:void(0)" id="notPassDatum" data-click = "201,301" ><input type="radio" />未通过资质</a></li>
			            </ul>
		            </div>
		            <div class="m-typ" id="DatumDiv">
		              <table cellpadding="0" cellspacing="0" border="0" class="new-hl">
		                <tr>
		                  <th class="name13">资质名称</th>
		                 	<th class="name14">提交时间</th>
		                  <th pass class="name14">收录时间</th>
		                  <th fail class="name14">未通过时间</th>
		                  <th class="name16">操作</th>
		                </tr>		                    
		                <c:forEach items="${requestScope.udatumList }" var="udatum" varStatus="i">
			              <tr row="${i}" auditStatus="${udatum.auditStatus }">
			                <td class="name13">${datumSubtypeMap[udatum.datumSubtype]}</td>
			                <td class="name14"><fmt:formatDate value="${udatum.createTime }" pattern="yyyy/MM/dd"/></td>
			                <td class="name14" pass fail><fmt:formatDate value="${udatum.auditTime }" pattern="yyyy/MM/dd"/></td>
			                <td class="name16"><a href="http://${domain }/${ udatum.datumLink }" target="_blank">查看</a></td>
			              </tr>
		                </c:forEach>
		              </table>
		              <div id="nodata" style="line-height:30px;text-align:center;display:none;">暂无数据</div>
		              <%--<div class="linkButton" style="height:27px"><a href="javascript:void(0)" style="padding: 5px 15px;"  id="addDatum">+添加资料</a></div>--%>
		            </div>
            	</c:if>
          </div>
        </div>
   </div>
	<div class="pop-content" id="hon_detail" style="display:none;">
    	<div class="pop-close"><a href="javascript:void(0)"><img src="${basePath}/images/close.png" class="closeImg"></a></div>
    	<h2 class="tit">未通过原因</h2>
        <ul></ul>
   	</div>
   	<jsp:include page="../footer.jsp" />
</body>
</html>
