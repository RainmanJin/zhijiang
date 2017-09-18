<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<div class="pop-content" id="popDiv" style="display:none; font-size:16px;color:#757171;line-height:25px;padding-bottom:30px;">
   	<div class="pop-close"><img src="${basePath}/images/close.png" class="closeImg" style="cursor:pointer;"  /></div>
   	<h2 fail>审核未通过</h2>
   	<h2 on>审核中</h2>
   	<h2 new>待审核</h2>
   	<h2 no>未认领</h2>
   	<h2 yes>已认领</h2>
   	<h2 delete>已删除</h2>
   	<div fail class="msg_t">很抱歉，该企业的认领申请未通过审核！</div>
   	<div on class="msg_t">该企业的认领申请正在审核中...</div>
   	<div yes class="msg_t">您已完成该企业的认领申请！</div>
   	<div delete class="msg_t">该企业已被删除！</div>
   	<div new class="msg_t">您认领的企业处于待审核状态！</div>
   	<div fail class="base_msg">未通过原因如下：<font f_msg></font></div>
   	<div no class="base_msg">该企业的认领申请信息尚未完善。</div>
   	<div no class="apply-btn"><a href="javascript:void(0)" id="new_completeInfo" class="continueOwner">立即完善信息</a></div>
   	<div on class="base_msg">认领申请通常会在两个工作日内完成，<br/>请您耐心等待，谢谢配合！</div>
       <div fail class="apply-btn"><a href="javascript:void(0)" id="del_completeInfo">修改信息重新提交</a></div>
       <div on yes new class="apply-btn" style="padding-left:50px;"><a href="javascript:void(0)" id="addDatum">马上提交企业资质，开启企业信用成长</a></div>
       <div no class="c_info">
	       	<font style="font-size:21px;">企业基本信息</font><br/>
	       	<label>企业名称：</label><font no_name>上海凭安网络科技有限公司</font><br/>
	       	<label>企业注册号：</label><font no_code>31211110</font>
       </div>
</div>