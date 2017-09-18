<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<div class="pop-content" style="display: none; height: 300px;"
	id="popDiv1">
	<div class="pop-close" id="closeButton1">
		<a href="javascript:void(0)">
			<img src="${basePath }/images/close.png" />
		</a>
	</div>
	<h2>绑定手机号码</h2>
	<div class="register-oneline" style="padding-top: 40px;">
		<div class="register-text1">手机号码：</div>
		<input class="register-input" type="text" id="phone" style="width: 190px;" placeholder="手机号">
		<div class="register-tips1" ><a class="bt" href="javascript:void(0)" id="sendCode" >发送验证码</a></div>
	</div>
	<div class="register-oneline" style="height:50px;">
		<div class="register-text1">验证码：</div>
		<input class="register-input" type="text" value="" id="code" maxlength="4" style="width: 80px;" placeholder="验证码"/>
		<div class="register-tips1" ><a href="javascript:void(0)" class="bt" id="bindingBT" >提交</a></div>
	</div>
	<h4 id="msg1" style="color: red; font-size: 1.0em"></h4>
</div>
<div class="pop-content" style="display: none; height: 200px"
	id="popDiv">
	<div class="pop-close" id="closeButton">
		<a href="javascript:void(0)">
			<img src="${basePath }/images/close.png" />
		</a>
	</div>
	<h2 class="alert_t">绑定邮箱</h2>
	<div class="alert" id="correctionDetail">
		<p>
			<label class="t">邮箱地址：</label><input type="text" id="email"  placeholder="邮箱"/>
			<span>
				<a class="bt" href="javascript:void(0)" id="sendEmail">发送邮件</a>
			</span>
		</p>
	</div>
	<h4 id="msg" style="color: red; font-size: 1.0em"></h4>
</div>
<div class="pop-content" style="display: none; height: 200px"
	id="popDiv2">
	<div class="pop-close" id="closeButton2">
		<a href="javascript:void(0)">
			<img src="${basePath }/images/close.png" />
		</a>
	</div>
	<h2 class="alert_n">修改昵称</h2>
	<div class="alert" id="correctionDetail">
		<p>
			<label class="t">新昵称：</label><input type="text" id="nick" placeholder="昵称"/>
			<span>
				<a class="bt" href="javascript:void(0)" id="updateNick">确定</a>
			</span>
		</p>
	</div>
	<h4 id="msg2" style="color: red; font-size: 1.0em"></h4>
</div>
<%-- rqs<script type="text/javascript" src="${basePath }/js/uzj/user/binding_pop.js"></script> --%>


