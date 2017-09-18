<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>之江信用-我的纠错</title>
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
	   var userCfg = userCfg || {page:'myCorrection'};
	     userCfg['url'] = '<%=response.encodeURL("company/list")%>';
	</script>
  </head>
  <body>
	<jsp:include page="../user/top.jsp" />
    <!--end banner-->
    <div class="container-group">
        <div class="content" user_left="2">
        	<jsp:include page="/user/left.jsp"/>
        	<div class="pop-content" style="display: none" id="popDiv">
				<div id="companyInfo"></div>     
			  	<div id="searchMsg"></div>
			   	<div class="pop-close" id="closeButton"><a href="javascript:void(0)"><img src="${basePath }/images/close.png" /></a></div>
			   	<h2>纠错详情</h2>
				<div class="error" id="correctionDetail">
			           <p style="font-size: 14px; color: gray">
			           	<span>纠错企业：</span>
			           	<label></label><br>
			           	<span>纠错栏目：</span>
			           	<label></label><br>
			           	<span>联系方式：</span>
			           	<label></label><br>
			           	<span>纠错说明：</span>
			           	<label></label>
			           </p>
			       </div>
			</div>
            <div class="drop-right">
            	<h2>我的纠错</h2>
                <div class="error-title1">
                	<ul>
                        <li><a href="javascript:void(0)" id="showPass" class="current" data-show >已通过纠错</a></li>
                        <li class="error-t1"><a href="javascript:void(0)" id="showNew" data-show >待审核纠错</a></li>
                        <li><a href="javascript:void(0)" id="showNotPass" data-show >未通过纠错</a></li>
                    </ul>
                </div>
                <div class="drop-name" id="showNotPassDiv" style="display: none">
                <table cellpadding="0" cellspacing="0" border="0">
                	<tr>
                        <th class="name4">纠错企业</th>
                        <th class="name5" style="width:170px;">纠错栏目</th>
                        <th class="name6" style="width:100px;">提交时间</th>
                        <th class="name7" style="width:100px;">未通过时间</th>
                        <th class="name8">操作</th>
                    </tr>
                    <c:if test="${empty notPassList}">
                    	<tr>
                    		<td colspan="5" align="center" style="color: gray">暂无数据</td>
                    	</tr>
                    </c:if>
                    <c:forEach items="${notPassList }" var="data">
	                    <tr>
	                        <td class="name4"><a href="javascript:void(0)" target="_blank">${data.companyName }</a></td>
	                        <td class="name5" style="width:170px;">${correctionMap[data.correctionType]}</td>
	                        <td class="name6" style="width:100px;"><fmt:formatDate value="${data.createTime}" pattern="yyyy/MM/dd"/></td>
	                        <td class="name7" style="width:100px;"><fmt:formatDate value="${data.lastUpdateTime}" pattern="yyyy/MM/dd"/></td>
	                        <td class="name8"><a href="javascript:void(0)" class="popButton" contact="${data.contact }" correctionContent="${data.correctionContent  }">查看</a></td>
	                    </tr>
	               </c:forEach>
                </table>
                </div>
                <div class="drop-name" id="showPassDiv">
                <table cellpadding="0" cellspacing="0" border="0">
                	<tr>
                        <th class="name4">纠错企业</th>
                        <th class="name5" style="width:170px;">纠错栏目</th>
                        <th class="name6" style="width:100px;">提交时间</th>
                        <th class="name7" style="width:100px;">通过时间</th>
                        <th class="name8">操作</th>
                    </tr>
                    <c:if test="${empty passList}">
                    	<tr>
                    		<td colspan="5" align="center" style="color: gray">暂无数据</td>
                    	</tr>
                    </c:if>
                   <c:forEach items="${passList }" var="data">
	                    <tr>
	                        <td class="name4"><a href="javascript:void(0)" class="popButton" target="_blank">${data.companyName }</a></td>
	                        <td class="name5" style="width:170px;" >${correctionMap[data.correctionType]}</td>
	                        <td class="name6" style="width:100px;"><fmt:formatDate value="${data.createTime}" pattern="yyyy/MM/dd"/></td>
	                        <td class="name7" style="width:100px;"><fmt:formatDate value="${data.lastUpdateTime}" pattern="yyyy/MM/dd"/></td>
	                        <td class="name8"><a href="javascript:void(0)" class="popButton" contact="${data.contact }" correctionContent="${data.correctionContent  }">查看</a></td>
	                    </tr>
	               </c:forEach>
                </table>
                </div>
                <div class="drop-name" id="showNewDiv" style="display: none">
	                <table cellpadding="0" cellspacing="0" border="0">
	                	<tr>
	                        <th class="name4" >纠错企业</th>
	                        <th class="name10" style="width:170px;">纠错栏目</th>
	                        <th class="name9" style="width:100px;">提交时间</th>
	                        <th class="name8">操作</th>
	                    </tr>
	                    <c:if test="${empty newList}">
	                    	<tr>
	                    		<td colspan="4" align="center" style="color: gray">暂无数据</td>
	                    	</tr>
                    	</c:if>
	                    <c:forEach items="${newList }" var="data">
		                    <tr>
		                        <td class="name4"><a href="javascript:void(0)" class="popButton" show_length="13" target="_blank">${data.companyName }</a></td>
		                        <td class="name10" show_length="13">${correctionMap[data.correctionType]}</td>
		                        <td class="name9"><fmt:formatDate value="${data.createTime}" pattern="yyyy/MM/dd"/></td>
		                        <td class="name8"><a href="javascript:void(0)" class="popButton" contact="${data.contact }" correctionContent="${data.correctionContent  }">查看</a></td>
		                    </tr>
	                    </c:forEach>
	                </table>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>
