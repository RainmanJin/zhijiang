<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${basePath }/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户注册-之江信用</title>
    <link href="${basePath }/style/new-css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new-css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
    <script type="text/javascript">
        var userCfg = userCfg || {page: 'register'};
        userCfg['exist'] = '<%=response.encodeURL("exist")%>';
        userCfg['register'] = '<%=response.encodeURL("register")%>';
        userCfg['codeValidate'] = '<%=response.encodeURL("codeValidate")%>';
        userCfg['createPhoneCode'] = '<%=response.encodeURL("createPhoneCode")%>';
    </script>
</head>
<body class="container-bg">
<jsp:include page="/user/top.jsp" />

<div class="sef-container">
    <div class="n-banner01">
        <div class="n_login">
            <div class="n_login_main">
                <div class="n_login_tit">
                    <a href="javascript:void(0);" class="current">新用户注册</a>
                    <a href="${basePath }/user/<%=response.encodeURL("toLogin") %>">登录</a>
                </div>
                <div class="n_login_form">
                    <form id="registerform" method="post"
                          action="${basePath }/user/<%=response.encodeURL("register")%>">
                        <div style="display:none;margin-top: -19px;color: red; width: 310px; display: block;position: absolute;font-size: 13px;" id="errorMsg">
                           <%-- <img src="${basePath }/images/wrong-icon.png"/>--%><label></label></div>
                        <input type="hidden" id="count" name="count" value="0"/>
                        <%--<input type="hidden" name="code" id="code"/>--%>
                        <input type="hidden" name="usertype" id="usertype" value="1"/>

                        <div class="n_form1">
                            <div class="n_login_form_group">
                                <span class="n_gly n_gly_phone"></span>
                                <input class="n_group_input1" placeholder="邮箱" type="email" name="username" style="font-size: 15px;"
                                       id="username" minlength="6" maxlength="30" des="邮箱" msgtip="innerLeft"
                                       ajax="${basePath }/user/<%=response.encodeURL("exist") %>" ajaxmsg="用户已存在" des="用户名"  />
                            </div>
                            <%--<span class="n_lm">手机号码不正确</span>--%>
                        </div>
                        <div class="n_form1">
                            <div class="n_login_form_group">
                                <span class="n_gly n_gly_lock"></span>
                                <input class="n_group_input1" placeholder="密码" id="password" type="password" typemsg="密码格式必须为6-20位的数字和字母的组合"
                                       maxlength="20" name="password" minlength="6" des="密码" msgtip="bottom"/>
                            </div>
                            <%--<span class="n_lm">密码不正确</span>--%>

                        </div>
                        <div class="n_form1">
                            <div style="overflow:hidden;" id="eValidate">
                                <div class="n_login_form_group n_gw">
                                    <span class="n_gly n_gly_yzm01"></span>
                                    <%--<input class="n_group_input1" type="text" placeholder="请输入验证码" id="computerCode" name="code"  type="text" style="color:#656565;" minlength="4"  maxlength="4" des="验证码" msgtip="innerLeft">--%>
                                    <input class="n_group_input1" id="computerCode" name="code" type="text" style="font-size: 15px;" msgtip ="bottom"
                                           placeholder="验证码" minlength="4" maxlength="4" des="验证码" msgtip="bottom" ajax="${basePath}/user/<%=response.encodeURL("codeValidate")%>" ajaxmsg="验证码错误" />
                                </div>
                                <div class="">
                                    <%--<a class="get-mobile-code" href="#">获取验证码</a>--%>
                                    <img width="80" id="identifyingCode" height="35" src="${basePath }/kaptcha/code"
                                         style="vertical-align:middle;margin-top:2.5px;margin-left: 30.5px;"/>
                                </div>
                            </div>
                            <%--<span class="n_lm">验证码不正确</span>--%>
                        </div>
                        <div class="n_chekbox">
                            <span><input type="checkbox" ischeck="true" value="" class="input_check" id="license" name="license" typemsg="请先接受用户协议"/><label for="license" style="display: none;"></label></span>已阅读并同意<a
                                href="${basePath }/about/privacy.jsp" target="_blank">《隐私协议》</a>和<a
                                href="${basePath}/about/terms_service.jsp" target="_blank">《服务条款》</a>
                        </div>
                        <div>
                            <button style="outline: none;" class="btn btn-su m-t-n-xs btn-block btn-lg" id="submitBT" type="submit"
                                    tabindex="7" >
                                <strong>注 册</strong>
                            </button>
                        </div>
                        <%--<div class="col-sm-12 m-t-lg">第三方账户登录</div>
                        <div class="col-sm-12 m-b-lg">
                            <a href="${basePath }/user/third/login?type=sina&toUrl=${fromURL}" class="col-weibo"></a>
                            <a href="${basePath }/user/third/login?type=qq&toUrl=${fromURL}" class="col-qq"></a>
                            <a href="${basePath }/user/third/login?type=weixin&toUrl=${fromURL}" class="col-wexin"></a>
                        </div>--%>
                    </form>
                    <div class="station-info" style="display: none">
                        <div class="pwd-checklist-wrapper" style="position: absolute;margin-top: 50px;">
                            <ul class="pwd-checklist">
                                <li>长度为6～18个字符</li>
                                <li>支持数字和字母的组合</li>
                                <li>不允许有空格</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 </div>
    <!--注册-->


    <%--		<div id="page1" class="clearfix">
        <div class="layout login">
            <div class="login-main">
                <div class="login-pt"></div>
                <div class="login-form">
                    <h2><span>个人用户注册</span></h2>
                    <form id="registerform" method="post" action="${basePath }/user/<%=response.encodeURL("register")%>">
                        <div class="login-infor" style="display:none;" id="errorMsg"><img src="${basePath }/images/worng-icon.png" /><label></label></div>
                        <input type="hidden" id="count" name="count" value="0"/>
                        <input type="hidden" name="code" id="code">
                        <div class="form-item-wrap">
                            <div class="form-item">
                                <label></label>
                                   <input type="email" placeholder="邮箱" name="username" id="username" class="login-w4"  placeholder="邮箱" minlength="6" maxlength="30" des="邮箱" msgtip="innerLeft"/>
                            </div>
                             <div class="form-item">
                                <input id="password" type="password"  maxlength="20" placeholder="请输入您的密码" name="password"  class="login-w4"  minlength="6" maxlength="30" des="密码" msgtip="innerLeft"/>
                             </div>
                             <div class="form-item">
                                <input id="password2" type="password" maxlength="20" placeholder="重复密码" name="repassword"  class="login-w4" minlength="6" maxlength="30" des="重复密码" msgtip="innerLeft" compare="==,#password"/>
                             </div>
                            <div class="register-oneline" id="eValidate">
                                <div class="form-item3" >
                                    <input id="computerCode" name="code"  class="ipt1 ipt_phone gay_text" type="text" style="color:#656565;" placeholder="验证码" minlength="4"  maxlength="4" des="验证码" msgtip="innerLeft"/>
                                    <img width="80" id="identifyingCode" height="35" src="${basePath }/kaptcha/code" style="vertical-align:middle;"/>
                                </div>
                            </div>
                           <div class="register-oneline" style="display: none" id="mValidate">
                                <div class="form-item3">
                                    <input id="phoneCode" name="phoneCode" class="ipt1 ipt_phone gay_text" type="text" maxlength="4" style="color:#656565;" placeholder="短信验证码"/>
                                       <a href="javascript:void(0)" id="sendCode" >获取激活短信</a>
                                </div>
                                <div class="register-tips1"></div>
                            </div>
                            <p class="agree-login">
                                <input class="login-w3" name="" id="license" tabindex="6" type="checkbox" class="gay_text" value="1" datatype="*" sucmsg=" " />
                                <label for="license" class="cursor_pointer">阅读并接受</label>
                                <a class="r-link" href="${basePath }/about/privacy.jsp"  target="_blank" >《用户注册协议》</a>
                            </p>
                            <div class="register-tips1">
                                    <input type="radio" name="usertype" value="1" checked  class="login-w3"/><span class="radio_span cursor_pointer">个人用户</span>
                                    <input type="radio" name="usertype" value="2"  class="login-w3"/><span class="radio_span cursor_pointer">企业用户</span>
                                    <input type="radio" name="usertype" value="4"  class="login-w3"/><span class="radio_span cursor_pointer">协会用户</span>
                            </div>
                             <button  tabindex="7" class="login-z login-m" type="submit" id="submitBT" style="background:#F3B197;" disabled>注册</button>
                        </div>
                        <div class="login-reg">
                            <p class="form-pl">已有账号？<a href="${basePath }/user/toLogin">登录</a></p>
                        </div>
                    </form>
                    <div class="station-info" style="display: none">
                        <div class="pwd-checklist-wrapper" style="position: absolute;margin-top: 50px;">
                            <ul class="pwd-checklist">
                                <li>长度为6～18个字符</li>
                                <li>支持数字和字母的组合</li>
                                <li>不允许有空格</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!--end layout-->
        </div>--%>

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
