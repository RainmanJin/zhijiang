<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录/注册/修改密码-之江信用</title>
    <base href="${basePath}/"/>
    <link href="${basePath }/style/new-css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new-css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/js/uzj/combination.js" src="${basePath }/js/lib/require.js"></script>
    <script type="text/javascript">
        var CompanySchemaCfg = CompanySchemaCfg || {}
    </script>
</head>
<body class="container-bg">
<jsp:include page="/user/top.jsp"/>


<div class="n-banner01">
    <div class="n_login">
        <div class="n_login_main">
            <div class="n_login_tit">
                <a href="${basePath }/user/toRegister">新用户注册</a>
                <a href="javascript:void(0);" class="current">登录</a>
            </div>
            <div class="n_login_form">
                <input type="hidden" id="fromUrl" value="${sessionScope.fromURL}"/>
                <form id="loginForm" method="post" action="${basePath }/user/<%=response.encodeURL("ajaxLogin") %>">

                    <div style="display:none;margin-top: -19px;color: red; width: 310px; display: block;position: absolute;font-size: 13px;" id="errorMsg">
                        <%-- <img src="${basePath }/images/wrong-icon.png"/>--%><label></label></div>
                    <input type="hidden" name="from" value="${from }">
                    <div class="n_form1">
                        <div class="n_login_form_group">
                            <span class="n_gly n_gly_phone"></span>
                      <%--      <input class="n_group_input1" type="text" placeholder="请输入邮箱" name="name" style="font-size: 15px;"
                                   id="login_username" role des="邮箱" minlength="1" maxlength="30" msgtip="innerLeft"/>--%>

                            <input class="n_group_input1" placeholder="邮箱" type="text" name="name" style="font-size: 15px;"
                                   id="username"  maxlength="30" des="邮箱" msgtip="innerLeft"
                                   ajax="${basePath }/user/<%=response.encodeURL("notExist") %>" ajaxmsg="用户不存在" des="用户名"  />


                        </div>
                        <%--<span class="n_lm">手机号码不正确</span>--%>
                    </div>
                    <div class="n_form1">
                        <div class="n_login_form_group">
                            <span class="n_gly n_gly_lock"></span>
                       <%--     <input class="n_group_input1" type="password" placeholder="密码" id="login_password"
                                   type="password" role name="password" minlength="6" maxlength="30" des="密码"
                                   msgtip="innerLeft"/>--%>


                            <input class="n_group_input1" placeholder="密码" id="password" type="password" typemsg="密码格式必须为6-20位的数字和字母的组合"
                                   maxlength="20" name="password" minlength="6" des="密码" msgtip="bottom"/>

                        </div>
                        <%--<span class="n_lm">密码不正确</span>--%>
                    </div>
                    <div class="n_for">
                        <div class="n_chekbox n_chekbox_f">
                            <%--<span><input name="" type="checkbox" value="" class="input_check" id="check1"/><label
                                    for="check1"></label>
                            </span>记住我--%>
                        </div>
                        <a class="n_for_span" href="${basePath }/user/findPwd.jsp">忘记密码</a>
                    </div>
                    <div class="n_b">
                        <button style="outline: none;" class="btn btn-su m-t-n-xs btn-block btn-lg" id="loginBtn" type="button">
                            <strong>登 录</strong>
                        </button>
                    </div>
                    <%--<div class="col-sm-12 m-t-lg">第三方账户登录</div>
                    <div class="col-sm-12 m-b-lg">
                        <a href="${basePath }/user/third/login?type=sina&toUrl=${fromURL}" class="col-weibo"></a>
                        <a href="${basePath }/user/third/login?type=qq&toUrl=${fromURL}" class="col-qq"></a>
                        <a href="${basePath }/user/third/login?type=weixin&toUrl=${fromURL}" class="col-wexin"></a>
                    </div>--%>
                </form>
            </div>
        </div>
    </div>
</div>
<!--登录-->


<%-- <div class="layout login">
     <div class="login-main">
         <div class="login-pt"></div>
         <div class="login-form">
             <h2><span>用户登录</span></h2>
             <input type="hidden" id="fromUrl" value="${sessionScope.fromURL}"/>
             <form id="loginForm" method="post" action="${basePath }/user/<%=response.encodeURL("ajaxLogin") %>">
                 <div class="login-infor" id="errorMsg" style="display:none;"><img src="${basePath }/images/worng-icon.png" /><label></label></div>
                 <input type="hidden" name="from" value="${from }">
                  <div class="form-item-wrap">
                      <div class="form-item">
                            <input name="name" id="login_username" role type="text" placeholder="请输入您的邮箱" class="login-w1 login-m" minlength="1" maxlength="30" des="用户名" msgtip="innerLeft"/>
                     </div>
                      <div class="form-item">
                            <input id="login_password" type="password" role  placeholder="请输入您的密码" name="password"  class="login-w1  login-m" minlength="6" maxlength="30" des="密码" msgtip="innerLeft"/>
                     </div>
                        <p class="form-pr"><a href="${basePath }/user/findPwd.jsp">忘记密码</a></p>
                     <button class="login-z login-m"  id="loginBtn"  type="submit">登 录</button>
                     <h4>您还没有账号？ <a href="${basePath }/user/toRegister">立刻注册</a>&lt;%&ndash;或者使用以下方式登录&ndash;%&gt;</h4>
                      &lt;%&ndash;<p class="auto-login">
                         <h5>
                             <a href="${basePath }/user/third/login?type=qq&toUrl=${fromURL}"  style="font-size: 12px;"><img src="${basePath }/images/qq-icon.png" /></a>
                             <a href="${basePath }/user/third/login?type=weixin&toUrl=${fromURL}"  style="font-size: 12px;"><img src="${basePath }/images/wx-icon.png"></a>
                         </h5>
                     </p>&ndash;%&gt;
                 </div>
             </form>
         </div>
     </div>
 </div>--%>
<!--end layout-->
<%--<jsp:include page="/footer.jsp" />--%>


<jsp:include page="/footer.jsp"/>
</body>
</html>