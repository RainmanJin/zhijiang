<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<div class="n_login" id="login_div" style="display: none;">
   <div class="n_login_main state-login" >
      <div class="n_login_tit" id="to_reg_log_tab">
          <a href="${basePath }/user/toRegister" >新用户注册</a>
          <a href="javascript:void(0);"  class="current">登录</a>
       </div>
       <div class="n_login_form" id="toLogin">
          <input type="hidden" id="fromUrl" value="${sessionScope.fromURL}"/>
          <form id="loginForm" method="post" action="${basePath }/user/<%=response.encodeURL("ajaxLogin") %>">
                    <div style="margin-top: -19px;color: red; width: 310px;position: absolute;font-size: 13px;" id="loginErrorMsg"><label></label></div>
                    <input type="hidden" name="from" value="${from }">
                    <div class="n_form1">
                        <div class="n_login_form_group">
                            <span class="n_gly n_gly_phone"></span>
                          <input class="n_group_input1" placeholder="邮箱" type="text" name="name" style="font-size: 15px;"
                                   id="username" minlength="6" maxlength="30" des="邮箱" msgtip="innerLeft"
                                   ajax="${basePath }/user/<%=response.encodeURL("notExist") %>" ajaxmsg="用户不存在" des="用户名"  />

                        </div>
                    </div>
                    <div class="n_form1">
                        <div class="n_login_form_group">
                            <span class="n_gly n_gly_lock"></span>
                            <input class="n_group_input1" placeholder="密码" id="password" type="password" typemsg="密码格式必须为6-20位的数字和字母的组合"
                                   maxlength="20" name="password" minlength="6" des="密码" msgtip="bottom"/>
                        </div>
                    </div>
                    <div class="n_for">
                        <div class="n_chekbox n_chekbox_f">
                        </div>
                        <a class="n_for_span" href="${basePath }/user/findPwd.jsp">忘记密码</a>
                    </div>
                    <div class="n_b">
                        <button style="outline: none;cursor: pointer;" class="btn btn-su m-t-n-xs btn-block btn-lg" id="loginBtn" type="button">
                            <strong>登 录</strong>
                        </button>
                    </div>
          </form>
       </div>
	</div>
</div>