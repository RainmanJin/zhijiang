<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>之江信用-账号管理</title>
    <base href="${basePath }/" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/myStar.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
	<script>
		var userCfg = userCfg || {page : 'myAccount'};
		userCfg['phone'] = '${user.phone}';
		userCfg['email'] = '${user.email}';
		userCfg['userName'] = '${user.userName}';
		userCfg['toBinding'] = '<%=response.encodeURL("toBinding")%>';
		userCfg['toBindEmail'] = '<%=response.encodeURL("toBindEmail")%>';
		userCfg['updateNick'] = '<%=response.encodeURL("updateNick") %>';
		userCfg['validatePhoneCode'] = '<%=response.encodeURL("validatePhoneCode")%>';
		userCfg['binding'] = '<%=response.encodeURL("binding")%>';
	</script>
  </head>
  
  <body class="container-bg">
	<jsp:include page="../user/top.jsp" />
	<div class="layout new11-about">
	   <jsp:include page="/user/left.jsp"/>
	   <div class="new11-acc">
	        <div class="new11-accBlock">
    			<h2 class="new11-t1">个人信息</h2>
    			<form class="accBlock-form1">
    				<p>
    					<label>用户名：</label>
    					<span>${user.userDigestedName}</span>
    				</p>
    				<p>
    					<label>邮箱：</label>
    					<span>${user.email} </span>
    				</p>
    				<p>
    					<label>手机：</label>
    					<c:if test="${empty user.phone}">
    					   <span>暂未绑定</span>
    					   <a href="javascript:void(0)"  id="popButton1" >立即绑定</a>
    					</c:if>
    				    <c:if test="${!empty user.phone}">
    					   <span>${fn:substring(user.phone,0,3)}****${fn:substring(user.phone,7,11)}</span>
    					</c:if>
    				</p>
    			</form>
    		</div>
    		<div class="new11-accBlock">
    			<h2 class="new11-t2">修改密码</h2>
    			<form class="accBlock-form2" method="post" action="${basePath }/user/<%=response.encodeURL("updateUserInfo") %>" id="updatePwdForm">
    				<input type="hidden" name="updatePhone" value="false" />
    				<input type="hidden" name="updatePwd" value="true"/>
    				<p>
    					<label>原始密码：</label>
    					<input type="password" value="" name="oldPwd" minlength="6" maxlength="30" des="原始密码" msgtip="#oldPwdMsg" style="cursor:auto;"/>
    					<!-- <input type="password" name="oldPwd" minlength="6" maxlength="30" des="原始密码" msgtip="#oldPwdMsg" style="cursor:auto;" placeholder="" />    					 -->
    				   &nbsp;&nbsp;<em id="oldPwdMsg" style="color:red;"></em>
    				</p>
    				<p>
    					<label>新密码：</label>
    					<input type="password" value="" maxlength="20" name="newPwd" id="newPwd" class="inputxt" minlength="6" maxlength="30" des="新密码" msgtip="#newPwdMsg" style="cursor:auto;" />
<!--     					<input  type="password" maxlength="20" name="newPwd" id="newPwd" class="inputxt" minlength="6" maxlength="30" des="新密码" msgtip="#newPwdMsg" style="cursor:auto;" placeholder="" /> -->
    				    &nbsp;&nbsp;<em id="newPwdMsg"  style="color:red;"></em>
    				</p>
    				<p>
    					<label>确认密码：</label>
    					<input type="password" value="" name="repassword" class="inputxt"  minlength="6" maxlength="30" des="确认密码" compare="==,#newPwd" msgtip="#repasswordMsg" style="cursor:auto;" />
    					<!-- <input  type="password" name="repassword" minlength="6" maxlength="30" des="确认密码" compare="==,#newPwd" msgtip="#repasswordMsg" style="cursor:auto;" placeholder="" />   					 -->
    					&nbsp;&nbsp;<em  id="repasswordMsg"  style="color:red;"></em>
    				</p>
    				<p class="accBlock-btn">
    					<label>&nbsp;</label>
    					<input class="label-btn label-b01" type="submit" id="toSubmit" value="提 交" style="cursor: pointer;" />
    					<input class="label-btn label-b02" type="reset" id="toReset" value="重 置"   style="cursor: pointer;"/>   					
    				</p>
    			</form>
    		</div>
	   </div>
	</div>
	
   <div class="myaccount-pop" style="display: none;" id="popDiv1">
      	<h2>绑定手机<a href="javascript:void(0)" id="closeButton1"><img src="${basePath}/images/close.png" /></a></h2>
      	<form>
	   		<p>
	   			<label><em>*</em>联系电话</label>
	   			<input type="text" id="phone" placeholder="手机号" style="width: 180px;display:inline-block;float: left; "/>
	   			<input class="fina-in3" type="button" id="sendCode" num="1" value="获取验证码" style="width: 130px;margin-left: 288px;background-color: #1cba9b;color: #fff; margin-top: -34px;cursor: pointer;"/>
	   			<span style="display: none;" id="errorPhone">请输入正确格式的手机号</span>
	   		</p>
	   		<p>
	   			<label><em>*</em>验证码</label>
	   			<input class="myaccountin1" type="text" id="code" maxlength="4" placeholder="验证码"/>
	   			<span style="display: none;" id="errorCode">请输入正确的验证码</span>
	   		</p>
	   		<p style="margin-top: 35px;">
	    		<label>&nbsp;</label>
	    		<input class="label-btn label-b01" type="button" id="bindingBT" value="提 交" style="cursor: pointer;"/>
	    		<input class="label-btn label-b02" type="button" id="bindingCencer" value="取 消"  style="cursor: pointer;"/>   					
	    	</p>
   	   </form>
   </div>
	
   <%--  <!--end banner-->
    <div class="layout content" user_left="0">
    <div id="infoMessage" style="left: 50%"></div>
    <jsp:include page="/user/binding_pop.jsp"/>

    <jsp:include page="/user/left.jsp"/>

    	<div class="main">
        	<h2>账号管理</h2>
            <div class="personal">
            	<div class="personal-ul">
                    <ul>
                     	<li class="current" id="showMyInfo">个人信息</li>
                        <li id="showChangePWD">修改密码</li>
                    </ul>
                </div>
                <div  id="myInfo">
	               	<form method="post" class="changePwdForm" action="">
                		<input type="hidden" name="updatePhone" value="false">
    					<input type="hidden" name="updateNick" value="true">
    					 <table cellpadding="0" cellspacing="0" border="0" class="personal-border">
	                        <tr>
	                            <td class="drop-mes1">昵称：</td>
	                            <c:if test="${user.nick == null}">
	                            <td><a href="javascript:void(0)" id ="popButton2" class="r1">修改昵称</a></td>
	                            <td ></td>
	                            </c:if>
	                            <c:if test="${user.nick != null}">
	                            <td class="drop-mes2" id="userNick">${user.nick}</td>
	                            <td><a href="javascript:void(0)" id ="popButton2" class="r1">修改昵称</a></td>
	                            </c:if>
	                        </tr>
	                        <tr>
	                            <td class="drop-mes1">手机：</td>
	                        	<c:if test="${user.phoneValidate == 1 }">
		                        <td class="drop-mes2"><p class="phone" style="margin-bottom:0px; height:0px; line-height:0px;"></p></td>
		                        <td><a href='javascript:void(0)' id="popButton1"  class='r1' style="margin-top:-10px;">修改绑定手机</a></td>
	                            </c:if>
	                        	<c:if test="${user.phoneValidate == 0 }">
	                        	<td class="drop-mes2"></td>
		                        <td><a href="javascript:void(0)" id="popButton1" class="r1">去填写手机并绑定</a></td>
	                        	<td></td>
	                            </c:if>
	                        </tr>
	                        <tr>
	                            <td class="drop-mes1">邮箱：</td>
	                        	<c:if test="${user.emailValidate == 1}">
		                        <td class="drop-mes2"><p class="email" style="margin-bottom:0px; height:0px; line-height:0px;"></p></td>
		                        <td></td>
	                            </c:if>
	                        	<c:if test="${user.emailValidate == 0 }">
		                        <td><a href="javascript:void(0)" id="popButton" class="r1">去填写邮箱并绑定</a></td>
		                        <td></td>
	                            </c:if>
	                        </tr>
	                    </table>
	                </form>
                </div>
                <div id="changePWD" style="display:none;">
	               	<form method="post" class="changePwdForm" action="${basePath }/user/<%=response.encodeURL("updateUserInfo") %>" id="updatePwdForm">
                		<input type="hidden" name="updatePhone" value="false">
    					<input type="hidden" name="updatePwd" value="true">
	                    <table cellpadding="0" cellspacing="0" border="0" class="personal-border">
	                        <tr>
	                            <td class="drop-mes1">原始密码：</td>
	                            <td class="drop-mes2"><input type="password" value="" name="oldPwd" minlength="6" maxlength="30" des="原始密码" msgtip="#oldPwdMsg" style="cursor:auto;"/></td>
								<td><label class="Validform_checktip" id="oldPwdMsg" style="color:red;"></label></td>
	                        </tr>
	                        <tr>
	                            <td class="drop-mes1">新&nbsp;&nbsp;密&nbsp;&nbsp;码：</td>
	                            <td class="drop-mes2"><input type="password" value="" maxlength="20" name="newPwd" id="newPwd" class="inputxt" minlength="6" maxlength="30" des="新密码" msgtip="#newPwdMsg" style="cursor:auto;" /></td>
	                            <td><label class="Validform_checktip" id="newPwdMsg"  style="color:red;"></label></td>
	                        </tr>
	                        <tr>
	                            <td class="drop-mes1">确认密码：</td>
	                            <td class="drop-mes2"><input type="password" value="" name="repassword" class="inputxt"  minlength="6" maxlength="30" des="确认密码" compare="==,#newPwd" msgtip="#repasswordMsg" style="cursor:auto;" /></td>
    							<td><label class="Validform_checktip"  id="repasswordMsg"  style="color:red;"></label></td> 
	                        </tr>
	                        <tr>
	                        	<td></td>
	                        	<td style="line-height: 24px; padding-top: 10px;">
	                        		<input type="submit" id="toSubmit" value="提交" class="s-button" />	
	                        		<input type="reset" id="toReset" value="重置" class="s-button" />
	                        	</td>
	                        	<td></td>
	                        </tr>
	                    </table>
                    </form>
                </div>
            </div>
     	</div>
     </div> --%>
	<jsp:include page="../footer.jsp" />
</body>
</html>
