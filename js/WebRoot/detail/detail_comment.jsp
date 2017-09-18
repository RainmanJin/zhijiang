<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<style type="text/css">
.Validform_error{
	background-color:#ffe7e7;
}
</style>

<!-- 评论列表 -->
<div id="newCommentList">
	<h3 class="">最新评论<small id="searchbadge" class="searchbadge" data-content="">已有<span class="commentTotal netCommentTotal"  id="netCommentTotal" style="border: none">0</span>人参与点评</small></h3>
	<div id="comments" class="new-leftbg comments">
		<div class="comment" model>
			<div class="head-icon">
				<img src="${basePath }/images/new/zs_head.png">
			</div>
			<div class="head-ms">
				<div class="ms-top">
					<p>
						{0}<img src="${basePath }/images/id-icon.png" title="协会用户" style="display:{1};">
					</p>
					<p></p>
					<div class="new-star">
						<label class="istar star-inline" config='{n:{2}, s:50, size:12, img:"${basePath }/images/star2.png"}'></label>
					</div>
					<span>{3}</span>
				</div>
				<div class="ms-bottom">
					<img src="${basePath }/images/top-icon.png" style="display:{1}">{4}
				</div>
			</div>
			<div class="tagging"></div>
		</div>
	</div>
	<div class="d-page" config='{name: "newComment", url:"${basePath }/company/comment/ajax/list?companyId=${bizCompany.companyId}&commentType=1", npage:1, spage:${partnerPage.totalPages }, pin:2, isAjax:true}'></div>
</div>

      
<!-- 添加评论 -->
<div class="comment">
	<p class="mbc_title"><em class="mbc_line"> </em><span class="mbc_title_warp"><em class="txt1_1">我要评论</em></span></p>
	
	<div class="goods-comm">
		<div class="goods-comm-stars">
			<div id="rate-comm-1" class="rate-comm rate-comm-1"></div>
			<div id="error" style="float: right;color: red" class="commentError"></div>
			<span class="star_l">点击星星为公司打分</span>
		</div>
	</div>
	
	<c:if test="${user.userName == null }">
		<div class="comment-wz"><p>请<a href="${basePath }/user/toLogin">登录</a>/<a href="${basePath}/user/toRegister">注册</a>后发表</p></div>
	</c:if>

	<c:if test="${user.userName != null }">
		<form class="commentForm" id="commentForm" action="${basePath }/user/comment/<%=response.encodeURL("add") %>" method="POST">
			<input type="hidden" id="count" value="0"> 
			<input type="hidden" id="commentLevel" class="commentLevel" name="commentLevel" value="0">
			<input type="hidden" name="bizCompanyId" id="bizCompanyId" class="bizCompanyId" value=""> 
			<input type="hidden" name="bizCompanyName" id="bizCompanyName" class="bizCompanyName" value="">
			<input type="hidden" id="commentPageUniqueId" class="commentPageUniqueId" value="">
			<input type="hidden" id="userType" class="userType" value="${userType }">
			<div class="comment-wz" >
				<textarea name="commentContent" class="commentContent" id="commentContent" style="resize:none;overflow-y:auto;outline: none;" rows="3"  maxlength="500" placeholder="评论内容，500字以内"></textarea>
			</div>
			<a href="javascript:;" class="comment-btn submitComment" id="submitComment">提交评论</a>
		</form>
	</c:if>
</div>
