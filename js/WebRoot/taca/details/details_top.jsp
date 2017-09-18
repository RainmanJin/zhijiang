<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
   <div class="layout aDetail">
        <input  type="hidden" id="activityId" value="${userTacaActivity.id}"/>
        <input  type="hidden" id="auditId" value="${param.auditId}"/>
        <input  type="hidden" id="companyNameDigest" value="${userTacaActivity.companyNameDigest}"/>
        <div class="aDetail-top">
        	<div class="aTop-left">
        		<h2>${userTacaActivity.companyName}</h2>
        		<div class="aTop-message">
	        		<div class="aTop-m1 aTop-m2">
	        			<p>联系人姓名：<span>${userTacaActivity.userRealname}</span></p>
	        			<p>联系人电话：<span>${userTacaActivity.phone}</span></p>
	        		</div>
	        		<div class="aTop-m1">
	        			<p>企业地址：<span>${userTacaActivity.companyAddress}</span></p>
	        			<p>提交时间：<span><fmt:formatDate value="${userTacaActivity.submitTime }" pattern="yyyy年MM月dd日" /></span></p>
	        		</div>
        		</div>
        	</div>	
        	<div class="aTop-right" >
                <c:if test="${audit.status == 'submit'}">
                <div  id="auditBtn" >
                    <a data="approved" text="审核通过"  href="javascript:void (0)" class="aTop-right-a1">通过</a>
                    <a data="unapproved" text="审核未通过" href="javascript:void (0)" class="aTop-right-a2">未通过</a>
                </div>
                </c:if>
            <c:if test="${audit.status != 'submit'}">
                <div class="aTop-right-div">
                    <span class="${audit.statusClass}">${audit.statusName}</span>
                </div>
            </c:if>
        	</div>
        </div>
        <div class="aDetail-tab">
        	<ul>
        		<li>行政处罚<span>${empty userTacaActivity.punishCount?'0' :userTacaActivity.punishCount}</span></li>
        		<li>欠税记录<span>${empty userTacaActivity.uncreditCount?'0' :userTacaActivity.uncreditCount}</span></li>
        		<li>失信记录<span>${empty userTacaActivity.owedTaxCount?'0' :userTacaActivity.owedTaxCount}</span></li>
        		<li>诉讼记录<span>${empty userTacaActivity.judgmentCount?'0' :userTacaActivity.judgmentCount}</span></li>
        		<li style="border-right: none;width: 236px;" id="more_li">更多企业信息</li>
        	</ul>
        </div>
    </div>

<div class="base-write-main" style="display:none;background:white;padding: 35px 50px;" id="auditConfirm">
    <div style="    text-align: center;margin-bottom: 28px;">
        <input id="auditStatus" type="hidden">
        <h3>确定将“${userTacaActivity.companyName}”设为“<span id="auditTip"></span>”吗？</h3>
        <h4 style="color:#868686;margin-top: 30px;">设置后不可撤销</h4>
        <h4 id="deleteShow" style="color:#868686;margin-top: 20px;display: none">您也可以<a id="btnDelete" style="color:#85D8FF">授权企业修改材料</a>后，再次审核</h4>
    </div>
        <div class="bR-button" style="margin-top: 25px;">
            <button  id="btnConfirm"  class="bt5">确定</button>
            <button style="background-color: #fff; color: #00bb9c;"  type="button" id="btnCancel" class="bt5">取消</button>
        </div>
</div>