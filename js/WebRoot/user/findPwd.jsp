<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${basePath }/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>找回密码-之江信用</title>
    <%--<link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css" />--%>
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/new-css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new-css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
    <script type="text/javascript">
        var userCfg = userCfg || {page: 'findPwd'};
        userCfg['toFindPwd'] = '<%=response.encodeURL("toFindPwd") %>';
        userCfg['createPhoneCode'] = '<%=response.encodeURL("createPhoneCode")%>';
    </script>
</head>

<body class="container-bg">
<jsp:include page="/user/top.jsp"/>


<!--end n-banner01-->
<div class="n-banner01"  id="step1">
    <div class="n_login">
        <div class="n_login_main n_login_mb">
            <div class="n_login_tit">
                <p class="n_login_tit_p"><a href="javascript:void(0);" class="current" style="width:100%">找回密码</a></p>
            </div>
            <div class="n_login_form">
                <form id="toFindPwdform" method="post" action="${basePath }/user/<%=response.encodeURL("toFindPwd") %>">
                    <div class="" id="errorMsg" style="display:none;margin-top: -19px;color: red; width: 310px; display: block;position: absolute;font-size: 13px;">
                        <%--<img src="${basePath }/images/wrong-icon.png"/>--%><label></label>
                    </div>

                    <div class="n_form1">
                        <div class="n_login_form_group">
                            <span class="n_gly n_gly_phone"></span>
                            <%--<input class="n_group_input1" type="text" placeholder="请输入您注册的手机号">--%>
                            <input class="n_group_input1" type="phone,email" placeholder="请输入您注册的邮箱" minlength="6"
                                   maxlength="30" des="邮箱" msgtip="innerLeft" name="name" id="username"
                                   ajax="${basePath }/user/<%=response.encodeURL("notExist") %>" ajaxmsg="邮箱不存在"/>

                        </div>

                    </div>
                    <div class="n_form1">
                        <div style="overflow:hidden;">
                            <div class="n_login_form_group n_gw">
                                <span class="n_gly n_gly_yzm01"></span>
                                <%--<input class="n_group_input1" type="text" placeholder="请输动态密码">--%>
                               <%-- <input class="n_group_input1"  placeholder="请输验证码" type="text" id="code" name="code"
                                       minlength="4" maxlength="4" des="验证码" msgtip="bottom" class="inputxt"
                                       style="width: 60%;"/>--%>

                                <input class="n_group_input1" id="computerCode" name="code" type="text" style="font-size: 15px;" msgtip ="bottom"
                                       placeholder="请输验证码" minlength="4" maxlength="4" des="验证码" msgtip="bottom" ajax="${basePath}/user/<%=response.encodeURL("codeValidate")%>" ajaxmsg="验证码错误" />

                            </div>
                            <div class="">
                                <%--<a class="get-mobile-code" href="#">获取验证码</a>--%>
                                <img width="80" id="identifyingCode" height="35" src="${basePath }/kaptcha/code"
                                     style="margin-bottom:-11px;margin-top:2.5px;margin-left: 30.5px;"/>

                            </div>
                        </div>
                        <%--<span class="n_lm">验证码不正确</span>--%>
                    </div>
                    <div class="n_b n_b_top">
                        <button class="btn btn-su m-t-n-xs btn-block btn-lg" type="button" id="toFindPwd">
                            <strong>下一步</strong>
                        </button>
                    </div>
                    <div class="m-ts">
                        <p><img src="${basePath}/images/new-images/img16.png"/>为确保账号的安全性</p>
                        <p>系统会将验证链接发送至您的注册邮箱</p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--找回密码-->


<!-- 第一步 -->
<%--  <div class="layout login" id="step1">
      <div class="login-main">
          <div class="login-pt"></div>
          <div class="login-form">
              <h2><span>找回密码</span></h2>
              <form id="toFindPwdform" method="post" action="${basePath }/user/<%=response.encodeURL("toFindPwd") %>">
                  <div class="login-infor" id="errorMsg" style="display:none;"><img src="${basePath }/images/wrong-icon.png" /><label></label></div>
                  <div class="form-item-wrap">
                      <div class="form-item">
                          <input type="phone,email" placeholder="手机/邮箱：" minlength="6" maxlength="30" des="用户名" msgtip="innerLeft" name="username" id="username" ajax="${basePath }/user/<%=response.encodeURL("notExist") %>" ajaxmsg="用户名不存在" class="login-w4" />
                      </div>

                      <div class="register-oneline" id="eValidate">
                          <div class="float-left">
                              <input class="vercode-input" placeholder="验证码：" type="text" id="code" name="code" minlength="4"  maxlength="4" des="验证码" msgtip="innerLeft" class="inputxt"  style="width: 60%;"/>
                              <img width="80" id="identifyingCode" height="35" src="${basePath }/kaptcha/code" style="margin-bottom:-11px;" />
                          </div>
                      </div>
                         <div class="register-oneline" style="display: none" id="mValidate">
                          <div class="float-left">
                              <input class="vercode-input" placeholder="验证码：" type="text" maxlength="4" des="验证码" style="width: 130px;" id="phoneCode" name="phoneCode" class="login-w2" />
                              <a href="javascript:void(0)" id="sendCode" class="login-a">获取短信验证码</a>
                          </div>
                      </div>
                      <div class="find">
                          <input type="submit" id="toFindPwd" class="login-z" style="cursor:pointer;" value="下一步"/>
                      </div>
                  </div>
              </form>
          </div>
      </div>
  </div>--%>


<!-- 第二步 -->
<div class="n-banner01" id="step2" style="display:none;" >
<div class="n_login_f" style="width: 800px; margin: 0px auto; padding-top: 160px;" >
    <div class="content">
        <div class="findInfo-title">
            <h2>找回密码</h2>
            <img src="${basePath }/images/find2.png"/>
        </div>
        <div class="findInfo-content">
            <h3>邮箱验证<span>为了您的帐号安全，请完成身份验证</span></h3>
            <div class="findInfo-form">
                <div class="findInfo-register-oneline">
                    <div class="findInfo-register-text">邮箱：</div>
                    <div class="findInfo-register-yx"></div>
                </div>
                <div class="findInfo-register-oneline">
                    <div class="findInfo-register-have" style="margin-left: 8.5%; ">
                        <p style="color: #49A049;">{0}<a href="http://mail.{1}" target="_blank">点击登录邮箱</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    </div>
<!--end layout-->


<%--<jsp:include page="/footer.jsp" />--%>


<%-- <div class="n-footer">
    <div class="n-layout n-footer-main">
        <div class="n-logo n-footer-list1">
            <div class="n-logo-left"><img src="${basePath}/images/new-images/img01.png"/></div>
            <div class="n-logo-right">
                <h4>之江信用</h4>
                <h5>浙江省商务信用公众服务平台</h5>
                <p><a href="${basePath }/about/report.jsp">失信举报通道</a></p>
                <p><a href="${basePath }/trade/webshop">网店信用通道</a></p>
            </div>
        </div>
        <div class="n-footer-list1 n-footer-list2">
            <p><a href="${basePath }/help/help.jsp">关于我们</a></p>
            <p><a href="${basePath}/help/help.jsp">帮助中心</a></p>
            <p><a href="${basePath }/help/help_privacy.jsp">隐私协议</a></p>
            <p><a href="${basePath}/help/help_service.jsp">服务条款</a></p>
            <p>友情链接：<a href="http://www.shuidixy.com/">水滴信用</a><a href="http://www.laoniushuju.com/">老牛数据</a></p>
        </div>
        <div class="n-footer-list1 n-footer-list3">
            <p>输入需要订阅的邮箱号</p>
            <p class="n-footer-ip"><input name="" type="text" value="Email"/></p>
            <p class="n-footer-ib"><a href="#">订阅</a></p>
        </div>
    </div>
    <div class="n-copy">
        <p>Copyright © 2016 之江信用 zhijiangixinyong.com 保留所有权利 浙ICP备12039960号-5</p>
    </div>
</div> --%>

<jsp:include page="../footer.jsp" />
<!--end n-footer-->
</body>
</html>
