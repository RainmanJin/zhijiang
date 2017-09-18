<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>特色专区</title>
	<base href="${basePath }/" />
	<%--<link href="${basePath }/style/new/trade_style.css" rel="stylesheet" type="text/css" />--%>
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/score.js" src="${basePath }/js/lib/require.js"></script>
  </head>
  <body data-attr="ecshop">
    <div class="n-header">
        <div class="n-navs">
            <div class="n-layout">
                <span>举报热线：12315</span>
           <span class="n-n1">
              <a href="${basePath }/user/<%=response.encodeURL("toLogin") %>" class="n-n1-dl">登录</a>
              <a href="${basePath }/user/<%=response.encodeURL("toRegister") %>">注册</a>
           </span>
           <span class="n-n2">
             <a href="${basePath }/gov/<%=response.encodeURL("index") %>">平台首页</a><i>|</i>
             <a href="${basePath }/help/help.jsp">帮助中心</a>
           </span>
            </div>
        </div>
        <div class="n-menus n-menus-c3">
            <div class="n-layout" style="position:relative;">
                <div class="dropdown" id="userCenterDiv" style="display:none;">
                    <s><b></b></s>
                    <ul class="profile-navigation" id="userCenterLi">
                        <a usertype="1,2,4" class="current" href="${basePath }/user/myAccount.jsp"><li>我的主页</li></a>
                        <a usertype="1,2,4" href="${basePath }/user/comment/<%=response.encodeURL("list")%>"><li>我的评论</li></a>
                        <a usertype="1,2,4" href="${basePath }/user/myClaim.jsp"><li>认领企业</li></a>
                        <a usertype="2,4" href="${basePath }/user/owner/<%=response.encodeURL("list") %>" ><li>我的企业</li></a>
                        <a usertype="2,4" href="${basePath }/user/datum/<%=response.encodeURL("list") %>" ><li>资料管理</li></a>
                        <a usertype="2,4" href="${basePath }/user/authorization/<%=response.encodeURL("list") %>">	<li>管理授权</li></a>
                        <a usertype="1,2,3,4" href="${basePath }/user/exit"><li>退出</li></a>
                    </ul>
                </div>
                <div class="n-logo">
                    <div class="n-logo-left"><a href=""><img src="${basePath}/images/new-images/logo.png" /></a></div>
                </div>
                <ul class="n-menus-ul n-menus-ubg">
                    <li><a data-nav="index" href="${basePath }/">首页</a></li>
                    <li><a data-nav="webshop" href="${basePath }/trade/webshop">网店信用</a></li>
                    <li><a data-nav="business_outtrade|business_haining|business_yiwu|business_keqiao|business_chuanhua|ecseed|score" href="${basePath }/trade/score.jsp" class="current">特色专区</a></li>
                    <li><a data-nav="finance" href="${basePath }/trade/finance.jsp">信用金融</a></li>
                    <li><a data-nav="excitation" href="${basePath }/trade/excitation.jsp">守信激励</a></li>
                    <li><a data-nav="train" href="${basePath }/about/report.jsp">失信举报</a></li>
                    <li><a data-nav="about_us|privacy|report|advise" href="${basePath }/about/about_us.jsp">关于我们</a></li>
                </ul>
            </div>
        </div>
    </div>



    <div id="banner_y10" class="w100">
        <%--<h2>企业热评榜</h2>--%>
    </div>
    <!--banner_y10-->
    <div class="n-layout">
        <div class="score_main">
            <div class="score_main_tit">
                <div class="score_tit_time">
                    <p>时间：<input type="datetime" value="2016-08-26"></p>
                </div>
                <h2>失信企业曝光台</h2>
            </div>
            <table cellpadding="0"cellspacing="0" border="0" class="dis_score">
                <tr>
                    <th class="or1">排名</th>
                    <th class="or2">企业 </th>
                    <th class="or3">风险信息</th>
                    <th class="or4">之江评分</th>
                </tr>
                <tr>
                    <td class="or1"><span class="span1">1</span></td>
                    <td class="or2">诸暨新益针织有限公司</td>
                    <td class="or3"><span>欠税信息<i>2</i></span><span>失信记录<i>2</i></span><span>诉讼记录<i>2</i></span><span>负面报道<i>2</i></span></td>
                    <td class="or4">
                        <div class="or4_star"><img src="${basePath}/images/trade-images/score_star.png"></div>
                        <span>302分</span>
                    </td>
                </tr>
                <tr>
                    <td class="or1"><span class="span2">2</span></td>
                    <td class="or2">诸暨新益针织有限公司</td>
                    <td class="or3"><span>欠税信息<i>2</i></span><span>失信记录<i>2</i></span><span>诉讼记录<i>2</i></span><span>负面报道<i>2</i></span></td>
                    <td class="or4">
                        <div class="or4_star"><img src="${basePath}/images/trade-images/score_star.png"></div>
                        <span>302分</span>
                    </td>
                </tr>
                <tr>
                    <td class="or1"><span class="span3">3</span></td>
                    <td class="or2">诸暨新益针织有限公司</td>
                    <td class="or3"><span>欠税信息<i>2</i></span><span>失信记录<i>2</i></span><span>诉讼记录<i>2</i></span><span>负面报道<i>2</i></span></td>
                    <td class="or4">
                        <div class="or4_star"><img src="${basePath}/images/trade-images/score_star.png"></div>
                        <span>302分</span>
                    </td>
                </tr>
                <tr>
                    <td class="or1"><span class="span4">4</span></td>
                    <td class="or2">诸暨新益针织有限公司</td>
                    <td class="or3"><span>欠税信息<i>2</i></span><span>失信记录<i>2</i></span><span>诉讼记录<i>2</i></span><span>负面报道<i>2</i></span></td>
                    <td class="or4">
                        <div class="or4_star"><img src="${basePath}/images/trade-images/score_star.png"></div>
                        <span>302分</span>
                    </td>
                </tr>
                <tr>
                    <td class="or1"><span class="span4">5</span></td>
                    <td class="or2">诸暨新益针织有限公司</td>
                    <td class="or3"><span>欠税信息<i>2</i></span><span>失信记录<i>2</i></span><span>诉讼记录<i>2</i></span></td>
                    <td class="or4">
                        <div class="or4_star"><img src="${basePath}/images/trade-images/score_star.png"></div>
                        <span>302分</span>
                    </td>
                </tr>
                <tr>
                    <td class="or1"><span class="span4">6</span></td>
                    <td class="or2">诸暨新益针织有限公司</td>
                    <td class="or3"><span>欠税信息<i>2</i></span><span>失信记录<i>2</i></span><span>诉讼记录<i>2</i></span></td>
                    <td class="or4">
                        <div class="or4_star"><img src="${basePath}/images/trade-images/score_star.png"></div>
                        <span>302分</span>
                    </td>
                </tr>
                <tr>
                    <td class="or1"><span class="span4">7</span></td>
                    <td class="or2">诸暨新益针织有限公司</td>
                    <td class="or3"><span>欠税信息<i>2</i></span><span>失信记录<i>2</i></span><span>诉讼记录<i>2</i></span></td>
                    <td class="or4">
                        <div class="or4_star"><img src="${basePath}/images/trade-images/score_star.png"></div>
                        <span>302分</span>
                    </td>
                </tr>
                <tr>
                    <td class="or1"><span class="span4">8</span></td>
                    <td class="or2">诸暨新益针织有限公司</td>
                    <td class="or3"><span>欠税信息<i>2</i></span><span>失信记录<i>2</i></span><span>诉讼记录<i>2</i></span></td>
                    <td class="or4">
                        <div class="or4_star"><img src="${basePath}/images/trade-images/score_star.png"></div>
                        <span>302分</span>
                    </td>
                </tr>
                <tr>
                    <td class="or1"><span class="span4">9</span></td>
                    <td class="or2">诸暨新益针织有限公司</td>
                    <td class="or3"><span>欠税信息<i>2</i></span><span>失信记录<i>2</i></span></td>
                    <td class="or4">
                        <div class="or4_star"><img src="${basePath}/images/trade-images/score_star.png"></div>
                        <span>302分</span>
                    </td>
                </tr>
                <tr>
                    <td class="or1"><span class="span4">10</span></td>
                    <td class="or2">诸暨新益针织有限公司</td>
                    <td class="or3"><span>欠税信息<i>2</i></span><span>失信记录<i>2</i></span></td>
                    <td class="or4">
                        <div class="or4_star"><img src="${basePath}/images/trade-images/score_star.png"></div>
                        <span>302分</span>
                    </td>
                </tr>
            </table>
        </div>
        <!--score_main-->
        <div class="score_adv">
            <img src="${basePath}/images/trade-images/score_adv.jpg">
        </div>
        <!--score_adv-->
        <div class="score_content">
            <div class="score_cleft">
                <div class="score_cleft_top">
                	<ul>                	
                    <a href="javascript:void(0)" class="current"><li class="score_top1">放心餐饮</li></a>
                    <a href="javascript:void(0)"><li class="score_top2">放心网购</li></a>
                    <a href="javascript:void(0)"><li class="score_top3">放心酒店</li></a>
                    <a href="javascript:void(0)"><li class="score_top4">放心老字号</li></a>
                </ul>
                </div>
                <div class="score_cleft_main">
                    <h3>值得信赖的餐饮十大品牌<span><img id="question_symbol" src="${basePath}/images/trade-images/score_ts.png"></span><i id="brand_advise_num" style="display:none;">排名根据餐饮品牌所属企业的信用等级和大众点评推荐指数加权所得</i></h3>
                    <div class="score_cleft_list">
                        <div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>1</span></div>
                        <div class="score_list_main">
                            <div class="score_list_ml">
                                <p>品牌：<span>外婆家</span></p>
                                <p>所属企业：<span>杭州外婆名家餐饮管理有限公司</span></p>
                                <p>信用等级：<span></span></p>
                            </div>
                            <div class="score_list_mr">
                                <a href="javascript:void(0)">评论</a>
                            </div>
                        </div>
                    </div>
                    <div class="score_cleft_list">
                        <div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>2</span></div>
                        <div class="score_list_main">
                            <div class="score_list_ml">
                                <p>品牌：<span>外婆家</span></p>
                                <p>所属企业：<span>杭州外婆名家餐饮管理有限公司</span></p>
                                <p>信用等级：</p>
                            </div>
                            <div class="score_list_mr">
                                <a href="javascript:void(0)">评论</a>
                            </div>
                        </div>
                    </div>
                    <div class="score_cleft_list">
                        <div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>3</span></div>
                        <div class="score_list_main">
                            <div class="score_list_ml">
                                <p>品牌：<span>外婆家</span></p>
                                <p>所属企业：<span>杭州外婆名家餐饮管理有限公司</span></p>
                                <p>信用等级：</p>
                            </div>
                            <div class="score_list_mr">
                                <a href="javascript:void(0)">评论</a>
                            </div>
                        </div>
                    </div>
                    <div class="score_cleft_list">
                        <div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>4</span></div>
                        <div class="score_list_main">
                            <div class="score_list_ml">
                                <p>品牌：<span>外婆家</span></p>
                                <p>所属企业：<span>杭州外婆名家餐饮管理有限公司</span></p>
                                <p>信用等级：</p>
                            </div>
                            <div class="score_list_mr">
                                <a href="javascript:void(0)">评论</a>
                            </div>
                        </div>
                    </div>
                    <div class="score_cleft_list">
                        <div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>5</span></div>
                        <div class="score_list_main">
                            <div class="score_list_ml">
                                <p>品牌：<span>外婆家</span></p>
                                <p>所属企业：<span>杭州外婆名家餐饮管理有限公司</span></p>
                                <p>信用等级：</p>
                            </div>
                            <div class="score_list_mr">
                                <a href="javascript:void(0)">评论</a>
                            </div>
                        </div>
                    </div>
                    <div class="score_cleft_list">
                        <div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>6</span></div>
                        <div class="score_list_main">
                            <div class="score_list_ml">
                                <p>品牌：<span>外婆家</span></p>
                                <p>所属企业：<span>杭州外婆名家餐饮管理有限公司</span></p>
                                <p>信用等级：</p>
                            </div>
                            <div class="score_list_mr">
                                <a href="javascript:void(0)">评论</a>
                            </div>
                        </div>
                    </div>
                    <div class="score_cleft_list">
                        <div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>7</span></div>
                        <div class="score_list_main">
                            <div class="score_list_ml">
                                <p>品牌：<span>外婆家</span></p>
                                <p>所属企业：<span>杭州外婆名家餐饮管理有限公司</span></p>
                                <p>信用等级：</p>
                            </div>
                            <div class="score_list_mr">
                                <a href="javascript:void(0)">评论</a>
                            </div>
                        </div>
                    </div>
                    <div class="score_cleft_list">
                        <div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>8</span></div>
                        <div class="score_list_main">
                            <div class="score_list_ml">
                                <p>品牌：<span>外婆家</span></p>
                                <p>所属企业：<span>杭州外婆名家餐饮管理有限公司</span></p>
                                <p>信用等级：</p>
                            </div>
                            <div class="score_list_mr">
                                <a href="javascript:void(0)">评论</a>
                            </div>
                        </div>
                    </div>
                    <div class="score_cleft_list">
                        <div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>9</span></div>
                        <div class="score_list_main">
                            <div class="score_list_ml">
                                <p>品牌：<span>外婆家</span></p>
                                <p>所属企业：<span>杭州外婆名家餐饮管理有限公司</span></p>
                                <p>信用等级：</p>
                            </div>
                            <div class="score_list_mr">
                                <a href="javascript:void(0)">评论</a>
                            </div>
                        </div>
                    </div>
                    <div class="score_cleft_list">
                        <div class="score_list_img"><img src="${basePath}/images/trade-images/score_pp1.png"><span>10</span></div>
                        <div class="score_list_main">
                            <div class="score_list_ml">
                                <p>品牌：<span>外婆家</span></p>
                                <p>所属企业：<span>杭州外婆名家餐饮管理有限公司</span></p>
                                <p>信用等级：</p>
                            </div>
                            <div class="score_list_mr">
                                <a href="javascript:void(0)">评论</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!--score_cleft-->
            <div class="score_cright">
                <h4>票选您感兴趣的领域<span> (最多可以票选三类)</span></h4>
                <div class="score_cright_main" id="industry_vote">
                    <p><span style="">酒类流通</span><input type="checkbox" value="1"></p>
                    <p><span style="">汽车流通</span><input type="checkbox" value="2"></p>
                    <p><span style="">食品安全</span><input type="checkbox" value="3"></p>
                    <p><span style="">医疗器械</span><input type="checkbox" value="4"></p>
                    <p><span style="">批发零售</span><input type="checkbox" value="5"></p>
                    <p><span style="">P2P</span><input type="checkbox" value="6"></p>
                    <p><span style="">物流</span><input type="checkbox" value="7"></p>
                    <p><span style="">第三方支付</span><input type="checkbox" value="8"></p>
                    <p><a href="javascript:void(0);" id="industry_vote_button">投 票</a></p>
                </div>
            </div>
        </div>
    </div>







    <jsp:include page="/footer.jsp" />
	</body>
</html>