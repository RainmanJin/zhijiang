<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/path.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>之江观点-之江信用</title>
<base href="${basePath }/" />
<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
<script data-main="${basePath }/js/uzj/business_score.js" src="${basePath }/js/lib/require.js"></script>
</head>
<body style="background-color: inherit;">
	<jsp:include page="/user/top.jsp" />
	<div class="n-layout">
		<div class="fea">
			<div class="fea_left" id="zhijiang_views" >
				<div style="border-bottom: 1px solid #eaeaea;">
					<h4 class="view_tit" style="margin-bottom: 14px;">之江观点</h4>
				</div>
				<div  id="articleTable" >
					<div class="view_list" model>
					   <div class="view_list_img">
					      <img src="${basePath}/{1}">
					   </div>
					   <a href="${basePath }/trade/zone/article?id={0}" class="view_list_ct">
					      <p class="view_list_p1"><span><i></i>{2}</span>{3}</p>
					      <p class="view_list_p2">{4}</p>
					      <p class="view_list_p3">{5}</p>
					   </a>
					</div>
				</div>
				<div class="d-page" config='{name: "articleTable", url:"${basePath }/trade/zone/ajax/list", npage:1, pin:2, isAjax:true}'></div>
			</div>
			<!--end fea_left-->
			<div class="fea_right">
				<a href="javascript:void(0);" class="fea_vote">
					<img id="to_contributions" src="images/trade-images/1219_vote.png">
				</a>
				<div class="fea_time">
					<%--<div class="fea_time_year"><img src="images/trade-images/1219_t1.png"></div>--%>
					<span class="fea_time_year_span" style="background: url(images/trade-images/mon02.png) no-repeat center;"><em style=" padding: 0 11px;"><fmt:formatDate value="${todayDate}" pattern="yyyy" /></em></span>
						年
						<span class="fea_time_year_span" style="background: url(images/trade-images/mon01.png) no-repeat center;"><em style=" padding: 0 6px 0 6px;"><fmt:formatDate value="${todayDate}" pattern="MM" /></em></span>
						月
						<span class="fea_time_year_span" style="background: url(images/trade-images/mon01.png) no-repeat center;"><em style=" padding: 0 6px 0 6px;"><fmt:formatDate value="${todayDate}" pattern="dd" /></em></span>


					<%--<div class="fea_time_year"><img src="images/trade-images/1219_t2.png"></div>--%>
					<%--<span>月</span>--%>
					<%--<div class="fea_time_year"><img src="images/trade-images/1219_t3.png"></div>--%>
				</div>
				<div class="fea_inc">
					<p><i class="fea_inc_i1"></i>已收录浙江企业<span><fmt:formatNumber value="${platformCompanyStat.companyTotal}" pattern="#,###"/></span> 家</p>
					<p><i class="fea_inc_i2"></i>已发现失信企业<span>202</span> 家</p>
				</div>
                <a href="${basePath}/trade/business_outtrade.jsp" class=" zs_newb" target="_blank">之江特色专区</a>
            </div>
		</div>
		<!--end fea-->
		<div class="score_adv" style="display: none;">
			<a href="javascript:void(0);"><img id="to_company_uncredit_report" src="images/trade-images/1219_a1.png"></a>
		</div>
		<div class="fea" style="display: none;">
			<div class="fea_left">
				<h4 class="view_tit"><%--<p><input type="datetime" value="2016-08-26"></p>--%>失信企业曝光台</h4>
				<div class="score_main">
					<table cellpadding="0"cellspacing="0" border="0" class="dis_score">
						<tr>
							<th class="or1">排名</th>
							<th class="or2">企业 </th>
							<%--<th class="or4">之江评分</th>--%>
							<th class="or3">风险信息</th>
						</tr>
						<tr>
							<td class="or1"><span class="span1">1</span></td>
							<td class="or2"><span>浙江加兰节能科技股份有限公司</span></td>
							<%--<td class="or4">--%>
								<%--<div class="or4_star"><img src="images/star-icon.png"></div>--%>
								<%--<span>302分</span>--%>
							<%--</td>--%>
							<td class="or3">发现<span>340</span>条风险信息</td>
						</tr>
						<tr>
							<td class="or1"><span class="span2">2</span></td>
							<td class="or2"><span>晟元集团有限公司</span></td>
							<%--<td class="or4">--%>
								<%--<div class="or4_star"><img src="images/star-icon.png"></div>--%>
								<%--<span>302分</span>--%>
							<%--</td>--%>
							<td class="or3">发现<span>312</span>条风险信息</td>
						</tr>
						<tr>
							<td class="or1"><span class="span3">3</span></td>
							<td class="or2"><span>浙江华泽针织有限公司</span></td>
							<%--<td class="or4">--%>
								<%--<div class="or4_star"><img src="images/star-icon.png"></div>--%>
								<%--<span>302分</span>--%>
							<%--</td>--%>
							<td class="or3">发现<span>146</span>条风险信息</td>
						</tr>
						<tr>
							<td class="or1"><span class="span4">4</span></td>
							<td class="or2"><span>浙江汇强快递有限公司</span></td>
							<%--<td class="or4">--%>
								<%--<div class="or4_star"><img src="images/star-icon.png"></div>--%>
								<%--<span>302分</span>--%>
							<%--</td>--%>
							<td class="or3">发现<span>53</span>条风险信息</td>
						</tr>
						<tr>
							<td class="or1"><span class="span4">5</span></td>
							<td class="or2"><span>杭州琦川食品有限公司</span></td>
							<%--<td class="or4">
								<div class="or4_star"><img src="images/star-icon.png"></div>
								<span>302分</span>
							</td>--%>
							<td class="or3">发现<span>45</span>条风险信息</td>
						</tr>
						<tr>
							<td class="or1"><span class="span4">6</span></td>
							<td class="or2"><span>湖州汇源石化有限公司</span></td>
						<%--	<td class="or4">
								<div class="or4_star"><img src="images/star-icon.png"></div>
								<span>302分</span>
							</td>--%>
							<td class="or3">发现<span>40</span>条风险信息</td>
						</tr>
						<tr>
							<td class="or1"><span class="span4">7</span></td>
							<td class="or2"><span>浙江华冶矿建集团有限公司</span></td>
							<%--<td class="or4">--%>
								<%--<div class="or4_star"><img src="images/star-icon.png"></div>--%>
								<%--<span>302分</span>--%>
							<%--</td>--%>
							<td class="or3">发现<span>16</span>条风险信息</td>
						</tr>
						<tr>
							<td class="or1"><span class="span4">8</span></td>
							<td class="or2"><span>桐乡美吉臣服饰有限公司</span></td>
							<%--<td class="or4">
								<div class="or4_star"><img src="images/star-icon.png"></div>
								<span>302分</span>
							</td>--%>
							<td class="or3">发现<span>13</span>条风险信息</td>
						</tr>
						<tr>
							<td class="or1"><span class="span4">9</span></td>
							<td class="or2"><span>杭州翠凯酒店有限公司</span></td>
							<%--<td class="or4">
								<div class="or4_star"><img src="images/star-icon.png"></div>
								<span>302分</span>
							</td>--%>
							<td class="or3">发现<span>11</span>条风险信息</td>
						</tr>
						<tr>
							<td class="or1"><span class="span4">10</span></td>
							<td class="or2"><span>浙江点金饰品有限公司</span></td>
						<%--	<td class="or4">
								<div class="or4_star"><img src="images/star-icon.png"></div>
								<span>302分</span>
							</td>--%>
							<td class="or3">发现<span>9</span>条风险信息</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="score_cright fea_right" style="border-bottom: 0;">
				<h4>失信黑名单</h4>
				<div class="fea_alink">
					<a href="javascript:void(0);">重大税收违法黑名单</a>
					<a href="javascript:void(0);">行贿犯罪失信黑名单</a>
					<a href="javascript:void(0);">拒不支付劳动报酬罪黑名单</a>
					<a href="javascript:void(0);">保险代理人失信黑名单</a>
					<a href="javascript:void(0);">旅行社业务经营失信黑名单</a>
					<a href="javascript:void(0);">餐饮服务单位失信黑名单</a>
					<a href="javascript:void(0);">安全生产失信黑名单</a>
					<a href="javascript:void(0);">社会组织失信黑名单</a>
					<a href="javascript:void(0);">产品质量失信黑名单</a>
					<a href="javascript:void(0);">重点建设工程招标投标失信黑</a>
					<a href="javascript:void(0);">消防安全失信黑名单</a>
				</div>
			</div>


		</div>
		<!--end fea-->
		<div class="score_adv" style="display: none;">
			<img id="to_company_elect"  style="cursor: pointer;" src="images/trade-images/score_adv.jpg">
		</div>
		<!--score_adv-->
		<div class="score_content" style="display: none;">
			<div class="fea_left">
				<div class="score_cleft_top">
					<ul>
						<a href="javascript:void(0);" class="current"><li class="score_top1">放心餐饮</li></a>
						<a href="javascript:void(0);"><li class="score_top2">放心网购</li></a>
						<a href="javascript:void(0);"><li class="score_top3">放心酒店</li></a>
						<a href="javascript:void(0);"><li class="score_top4">放心老字号</li></a>
					</ul>
				</div>
				<div class="score_cleft_main">
					<h3>值得信赖的餐饮十大品牌<span><img id="question_symbol"  src="${basePath}/images/trade-images/score_ts.png"></span><i id="brand_advise_num" style="display:none;">排名根据餐饮品牌所属企业的信用等级和大众点评推荐指数加权所得</i></h3>
					<div class="score_cleft_list">
						<div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>1</span></div>
						<div class="score_list_main">
							<div class="score_list_ml">
								<p>品牌：<span>九品火锅餐厅</span></p>
								<p>所属企业：<span>浙江歌山品悦旅业有限公司</span></p>
								<p style="float: left;">信用等级：</p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:45, s:50, size:20, img:"${basePath }/images/star4.png"}'></label>
								</div>
							</div>
						</div>
					</div>
					<div class="score_cleft_list">
						<div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>2</span></div>
						<div class="score_list_main">
							<div class="score_list_ml">
								<p>品牌：<span>千岛湖开元度假村.凝香苑</span></p>
								<p>所属企业：<span>浙江开元酒店管理有限公司</span></p>
								<p style="float: left;">信用等级：</p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:45, s:50, size:20, img:"${basePath }/images/star4.png"}'></label>
								</div>
							</div>
						</div>
					</div>
					<div class="score_cleft_list">
						<div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>3</span></div>
						<div class="score_list_main">
							<div class="score_list_ml">
								<p>品牌：<span>华侨豪生中餐厅</span></p>
								<p>所属企业：<span>宁波华侨饭店有限公司</span></p>
								<p style="float: left;">信用等级：</p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:45, s:50, size:20, img:"${basePath }/images/star4.png"}'></label>
								</div>
							</div>
						</div>
					</div>
					<div class="score_cleft_list">
						<div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>4</span></div>
						<div class="score_list_main">
							<div class="score_list_ml">
								<p>品牌：<span>星都宾馆星樂自助餐厅</span></p>
								<p>所属企业：<span>杭州星都宾馆有限公司</span></p>
								<p style="float: left;">信用等级：</p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:45, s:50, size:20, img:"${basePath }/images/star4.png"}'></label>
								</div>
							</div>
						</div>
					</div>
					<div class="score_cleft_list">
						<div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>5</span></div>
						<div class="score_list_main">
							<div class="score_list_ml">
								<p>品牌：<span>虾佬圣汤</span></p>
								<p>所属企业：<span>杭州虾佬圣汤餐饮有限公司</span></p>
								<p style="float: left;">信用等级：</p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:40, s:50, size:20, img:"${basePath }/images/star4.png"}'></label>
								</div>
							</div>
						</div>
					</div>
					<div class="score_cleft_list">
						<div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>6</span></div>
						<div class="score_list_main">
							<div class="score_list_ml">
								<p>品牌：<span>潮牛海记(绍兴投醪河店)</span></p>
								<p>所属企业：<span>杭州鸣晨餐饮管理有限公司</span></p>
								<p style="float: left;">信用等级：</p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:40, s:50, size:20, img:"${basePath }/images/star4.png"}'></label>
								</div>
							</div>
						</div>
					</div>
					<div class="score_cleft_list">
						<div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>7</span></div>
						<div class="score_list_main">
							<div class="score_list_ml">
								<p>品牌：<span>臻货</span></p>
								<p>所属企业：<span>浙江臻货餐饮有限公司</span></p>
								<p style="float: left;">信用等级：</p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:40, s:50, size:20, img:"${basePath }/images/star4.png"}'></label>
								</div>
							</div>
						</div>
					</div>
					<div class="score_cleft_list">
						<div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>8</span></div>
						<div class="score_list_main">
							<div class="score_list_ml">
								<p>品牌：<span>山葵家精致料理</span></p>
								<p>所属企业：<span>杭州山葵家餐饮管理有限公司</span></p>
								<p style="float: left;">信用等级：</p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:40, s:50, size:20, img:"${basePath }/images/star4.png"}'></label>
								</div>
							</div>
						</div>
					</div>
					<div class="score_cleft_list">
						<div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>9</span></div>
						<div class="score_list_main">
							<div class="score_list_ml">
								<p>品牌：<span>麦田工坊</span></p>
								<p>所属企业：<span>宁波麦田餐饮管理有限公司</span></p>
								<p style="float: left;">信用等级：</p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:40, s:50, size:20, img:"${basePath }/images/star4.png"}'></label>
								</div>
							</div>
						</div>
					</div>
					<div class="score_cleft_list">
						<div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>10</span></div>
						<div class="score_list_main">
							<div class="score_list_ml">
								<p>品牌：<span>牛约潮汕鲜牛肉火锅</span></p>
								<p>所属企业：<span>杭州牛约餐饮有限公司</span></p>
								<p style="float: left;">信用等级：</p>
								<div class="new-star">
									<label class="istar star-inline" config='{n:35, s:50, size:20, img:"${basePath }/images/star4.png"}'></label>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!--fea_left-->
			<div class="score_cright fea_right">
				<h4>票选您感兴趣的领域<span> (最多可以票选三类)</span></h4>
				<div class="score_cright_main" id="industry_vote">
					<p><span>酒类流通</span><input type="checkbox" value="1"></p>
					<p><span>汽车流通</span><input type="checkbox" value="2"></p>
					<p><span>食品安全</span><input type="checkbox" value="3"></p>
					<p><span>医疗器械</span><input type="checkbox" value="4"></p>
					<p><span>批发零售</span><input type="checkbox" value="5"></p>
					<p><span>P2P</span><input type="checkbox" value="6"></p>
					<p><span>物流</span><input type="checkbox" value="7"></p>
					<p><span>第三方支付</span><input type="checkbox" value="8"></p>
					<p><a href="javascript:void(0);" id="industry_vote_button">投 票</a></p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>