<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${basePath }/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>找回密码-之江信用</title>
    <link href="${basePath }/style/new-css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new-css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
    <script type="text/javascript">
        var userCfg = userCfg || {page: 'passWord'};
    </script>
</head>


<body>

<jsp:include page="../user/top.jsp" />
<!--end banner-->

<div class="n-banner01">
    <div class="n_login">
        <div class="n_login_main n_login_mb">
            <div class="n_login_tit">
                <p class="n_login_tit_p"><a href="#" class="current" style="width:100%">重置密码</a></p>
            </div>
            <div class="n_login_form" id="mainDiv">
                <form id="findPwdForm" action="${basePath }/user/<%=response.encodeURL("updateFindPwd") %>"
                      method="post">
                    <div class="" id="errorMsg" style="display:none;margin-top: -19px;color: red; width: 310px; display: block;position: absolute;font-size: 13px;">
                        <%--<img src="${basePath }/images/wrong-icon.png"/>--%><label></label>
                    </div>
                    <input type="hidden" name="userName" value="${param.username }${account }">
                    <div class="n_form1">
                        <div class="n_login_form_group">
                            <span class="n_gly n_gly_lock"></span>
                            <input class="n_group_input1" placeholder="请设置您的新密码" id="password" type="password" typemsg="密码格式必须为6-20位的数字和字母的组合"
                                   maxlength="20" name="password" minlength="6" des="密码1" msgtip="innerLeft"/>

                            <%--<span class="Validform_checktip" id="userNameValidate" style="line-height: 44px;"></span>--%>
                        </div>

                    </div>
                    <div class="n_form1">
                        <div class="n_login_form_group">
                            <span class="n_gly n_gly_lock"></span>
                            <input class="n_group_input1" placeholder="请重复您的新密码" type="password"  maxlength="20" minlength="6" name="repassword" id="password2" <%--typemsg="密码格式必须为6-20位的数字和字母的组合"--%>
                                   compare="==,#password" datatype="*" des="密码2">
                            <%--<span class="Validform_checktip" id="userNameValidate" style="line-height: 44px;"></span>--%>
                        </div>
                    </div>
                    <div class="n_b n_b_top1">
                        <button class="btn btn-su m-t-n-xs btn-block btn-lg" type="submit" id="toSubmit">
                            <strong>确&nbsp;&nbsp;认</strong>
                        </button>
                    </div>
                </form>
            </div>
            <div style="display: none" id="infoDiv">
                <h4><img src="${basePath }/images/correct.png"/>恭喜您,重置密码成功！</h4>
                <h4>帐号:<span></span></h4>
                <div class="findInfo-login"><a href="${basePath }/user/toLogin">直接登录</a></div>
            </div>
        </div>
    </div>
</div>
<!--重置密码-->

<%--
 <div class="container-group">
    <div class="content">
        <div class="findInfo-title">
            <h2>找回密码</h2>
            <img src="${basePath }/images/find3.png"/>
        </div>
        <div class="findInfo-content">
            <div id="mainDiv">
                <form id="findPwdForm" action="${basePath }/user/<%=response.encodeURL("updateFindPwd") %>" method="post">
                    <input type="hidden" name="userName" value="${param.username }${account }">
                    <div class="findInfo-register-oneline">
                        <div class="findInfo-register-text">新密码:</div>
                        <input class="findInfo-register-input" type="password" name="password" id="password" datatype="n_a6" nullmsg="请输入密码！" />
                        <span class="Validform_checktip" id="userNameValidate" style="line-height: 44px;"></span>
                    </div>
                    <div class="findInfo-register-oneline">
                        <div class="findInfo-register-text">确认密码：</div>
                        <input class="findInfo-register-input" type="password" name="repassword" recheck="password" datatype="*" />
                        <span class="Validform_checktip" id="userNameValidate" style="line-height: 44px;"></span>
                    </div>
                    <button class="sub-bottom" type="submit" id="toSubmit" >提交</button>
                </form>
            </div>
            <div style="display: none" id="infoDiv">
                <h2><img src="${basePath }/images/correct.png" />恭喜您，帐号<span></span>重置密码成功！</h2>
                <div class="findInfo-login"><a href="${basePath }/user/toLogin">直接登录</a></div>
            </div>
        </div>
    </div>
    &lt;%&ndash;<jsp:include page="/footer.jsp" />&ndash;%&gt;
</div>
--%>

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
