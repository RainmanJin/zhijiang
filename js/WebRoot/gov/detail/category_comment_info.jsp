<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/path.jsp"%>

<div class="zsBlock" id="commentInfo" style="display: none;">
	<div class="zsBlock_edit">
		<h3>累计评论<span id="totalCommentCount"></span></h3>
		<div class="zsReport">
			<div class="zsReport_ul" id="commentTab">
				<ul>
					<li class="current" data-mark="#netComment"      >网友评论<span class="zsReport_s1">(<small id="netCommentCount" >0</small>)</span><span class="zsReport_s2"><em></em></span></li>
					<li  			data-mark="#employeeComment" >员工评论<span class="zsReport_s1">(<small id="employeeCommentCount" >0</small>)</span></span><span class="zsReport_s2"><em></em></span></li>
					<li 			data-mark="#comityComment"   >协会评论<span class="zsReport_s1">(<small id="comityCommentCount" >0</small>)</span><span class="zsReport_s2"><em></em></span></li>

				</ul>
			</div>


			<!-- 网友评论 -->
			<div id="netComment" style="">
				<div id="nodataNetComment"  class="zsReport_list zsReport_h5" style="display: none;">
					<%--<h2 align="center" style="color:silver; margin-top:30px;display: none;">暂无评论!</h2>--%>
					<h5>暂无评论</h5>
				</div>
				<div id="netComment_list">
					<div class="comment" model>
						<div class="head-icon">
							<img src="${basePath }/images/new/zs_head.png">
						</div>
						<div class="head-ms head-ms01">
							<div class="ms-top">
								<p>{0}</p>
								<p></p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:{1}, s:50, size:12, img:"${basePath }/images/star.png"}'></label>
								</div>
								<span>{2}</span>
							</div>
							<div class="ms-bottom">{3}</div>
						</div>
						<div class="tagging"></div>
					</div>
				</div>
				<div class="d-page" config='{name: "netComment", url:"${basePath }/company/comment/ajax/list?companyId=${bizCompany.companyId}&commentType=2", npage:1, spage:${partnerPage.totalPages }, pin:2, isAjax:true, nodata:"#nodataNetComment"}'></div>
			</div>

			<!-- 协会评分 -->
			<div id="comityComment" style="display: none">
				<div id="nodataComityComment" class="zsReport_list zsReport_h5">
					<%--<h2 align="center" style="color:silver; margin-top:30px;">暂无评论!</h2>--%>
					<h5>暂无评论</h5>

				</div>
				<div id="comityComment_list">
					<div class="comment" model>
						<div class="head-icon">
							<img src="${basePath }/images/new/zs_head.png">
						</div>
						<div class="head-ms">
							<div class="ms-top">
								<p>
									{0}<img src="${basePath }/images/id-icon.png">
								</p>
								<p></p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:{1}, s:50, size:12, img:"${basePath }/images/star.png"}'></label>
								</div>
								<span>{2}</span>
							</div>
							<div class="ms-bottom">
								<img src="${basePath }/images/top-icon.png">{3}
							</div>
						</div>
						<div class="tagging"></div>
					</div>
				</div>
				<div class="d-page" config='{name: "comityComment", url:"${basePath }/company/comment/ajax/list?companyId=${bizCompany.companyId}&commentType=3", npage:1, spage:${partnerPage.totalPages }, pin:2, isAjax:true, nodata:"#nodataComityComment"}'></div>
			</div>

			<!-- 员工评分 -->
			<div  id="employeeComment" style="display: none;">
				<div id="employeeCommentNoData" class="zsReport_list zsReport_h5" style="display: none">
					<%--<h2 align="center" style="color:silver; margin-top:30px;">暂无评论!</h2>--%>
					<h5>暂无评论</h5>

				</div>
			<div class="detail-pad detail-list" id="employeeBody" style="display: none;border: 0px solid #e7e7e7;">

				<div class="detail-star companyScore" style="display: none">
					<h3 class="" style="border-left: 3px solid #00bb9c;">
						<span style="border: 0px solid #eaeaea;font-size: 14px;">公司评分</span>
					</h3>
					<div class="detail-star01">
						<span id="aveScore" style="font-size: 48px;"></span>
					</div>
					<div class="detail-star02">
						<p>
							<span>职业成长：</span><b scoreType="positionScore"></b>
						</p>
						<p>
							<span>工作氛围：</span><b scoreType="workAtmosphereScore"></b>
						</p>
						<p>
							<span>公司前景：</span><b scoreType="foregroundScore"></b>
						</p>
					</div>
					<div class="detail-star02">
						<p>
							<span>技能成长：</span><b scoreType="skillScore"></b>
						</p>
						<p>
							<span>工作压力：</span><b scoreType="pressureScore"></b>
						</p>
					</div>
				</div>
				<em class="commentTotal" id="dajieCommentTotal" style=""></em>

				<div class="comment" id="dajieComment" style="display: none">
					<p class="mbc_title">
						<em class="mbc_line"> </em> <span class="mbc_title_warp"><em
							class="txt1_1">全部点评</em></span>
					</p>

					<div id="dajieComment_list">
						<div class="comment-write" model>
							<p class="comment-w1">{0}</p>
							<p class="comment-w2">——<span>{1}</span><span>来源：大街网</span></p>
						</div>
					</div>
				</div>

				<div class="d-page" config='{name: "dajieComment", url:"${basePath }/company/comment/commentsdajie/list?companyId=${bizCompany.companyId}", npage:1, pin:2, isAjax:true, nodata:"#employeeCommentNoData"}'></div>
			</div>
			</div>

		</div>
	</div>
	<%--<div class="zs_page">
		<p><span>1</span><span>2</span><span>下一页</span>跳到<input type="text" class="zs_page_in1" value="1">页<input type="button" value="确定" class="zs_page_in2"></p>
	</div>--%>
</div>