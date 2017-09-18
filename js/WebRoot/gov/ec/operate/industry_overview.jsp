<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="protect" name="operate2" style="display:none" mark="operate">
    <div class="protect-distrib">
        <div class="protect-pad">
            <div class="gk-line">
                <p class="mbc_title">
                    <em class="mbc_line"></em>
                    <span class="mbc_title_warp"><em class="font_f_1">网店行业概况分析<i></i></em></span>
                </p>
            </div>
            <div class="analysis  analysis-bottom">
                <h4>占比前三的畅销行业</h4>
                <div class="analysis-num" id="activeIndustry">
                </div>
            </div>
        </div>
    </div>
    <div class="protect-distrib">
        <div class="analysis analysis-bottom" style="overflow:visible; ">
            <h4>本省B店、C店行业分布情况:</h4>
            <div class="analysis-choose">
                <p><span>行业</span></p>
                <ul id="analysis_ul">
                    <c:forEach items="${industryList}" var="industry" begin="0" end="11">
                            <li data-nav="${industry.code}">${industry.name}</li>
                    </c:forEach>
                    <c:if test="${fn:length(industryList)>12}">
                        <li data-nav="-1" style="position:relative;">
                            <span id="nameLabel" style="cursor: pointer;">更多</span>
                            <div class="dropdown_hangye" id="enterDiv" style="display:none;">
                                <ul class="profile-navigation">
                                    <c:forEach items="${industryList}" var="industry" begin="12">
                                            <li data-nav="${industry.code}">${industry.name}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="protect-pad">
            <div class="analysis-num">
                <div class="analysis-fb">
                    <div class="num-tit">
                        <h5 style="font-size: 16px;">行业交易额累计分布指数</h5>
                        <div class="turn-bg">
                            <div id="container1_div" style="width:490px;height:400px"></div>
                        </div>
                    </div>
                    <div class="num-tit-right" style="float:left;">
                        <h5 style="font-size: 16px;">行业数量累计分布指数</h5>
                        <div class="turn-bg">
                            <div id="container2_div" style="width:490px;height:400px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>