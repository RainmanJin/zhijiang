<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>


<div class="sd_qua zsPop" style="display: none;top: 80px;" id="openReport">
	<div class="sd_qua_tit">
		<h4><a href="javascript:void(0);" id="closeReport"><img src="${basePath}/images/new/zs_close.png"></a><span>失信企业举报</span></h4>
	</div>
	<div class="zsPop_form">
		<form id="toReportForm" method="post"  action="${basePath }/report/add">
			<div style="display:none;margin-top: 40px; left:200px;  color: red; width: 310px; display: block;position: absolute;font-size: 13px;" id="errorMsg">
				<%-- <img src="${basePath }/images/wrong-icon.png"/>--%><label></label></div>

		<div class="zsPop_form_list">
			<p style="margin-bottom: 24px;"><span>举报企业<em style="color: #fff;">*</em></span>
				<i id="toReportCompanyName"></i>
				<input class="zs_in1" type="hidden" minlength="1" name="reportWebsite"  value="${bizCompany.companyName }">
			</p>
		</div>
		<div class="zsPop_form_list">
			<p><span>举报人姓名<em>*</em></span><input class="zs_in1" type="text" minlength="1" name="reportPerson" des="姓名" placeholder="请输入您的真实姓名" style="color: #444;"></p>
		</div>
		<div class="zsPop_form_list">
			<p><span>举报人联系方式<em>*</em></span><input class="zs_in1" type="mobile,email" minlength="5" name="contactNumber" des="联系方式" placeholder="请输入您的联系电话或邮箱地址" style="color: #444;"></p>
		</div>
		<div class="zsPop_form_list">
			<p><span style="vertical-align: top;">举报内容描述<em>*</em></span>
				<textarea name="reportDetail" minlength="20" des="内容" placeholder="几句话描述您要举报的内容，不少于20字！" style="color: #444;"></textarea>
			</p>
		</div>
		<div class="zsPop_form_list">
			<p style="margin-left:170px ;"><input class="zs_in2" id="confirmToReport" type="button" value="确 定"><input class="zs_in3" id="cancelToReport" type="button" value="取消"></p>
		</div>
		</form>
	</div>
	<div class="zsPop_infor">
		<h4>举报须知：</h4>
		<p><em>1.</em>请您保证所举报的内容与事实一致。</p>
		<p><em>2.</em>请您允许之江信用根据工作需要，在保护您个人信息不被泄漏的前提下，使用您的任何叙述。</p>
		<p><em>3.</em>请您尽可能填写详实内容，以利于您所举报问题的解决。</p>
	</div>
</div>

