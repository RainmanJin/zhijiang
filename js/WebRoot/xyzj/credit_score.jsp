<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<div class="layout score">
    <div class="warn-infor">
        <a id="scoreHelpBtn" href="javascript:void(0)"><img src="${basePath}/xyzj/images/score_ts.png"></a>
        <div id="scoreHelp" class="warn-main" style="display: none">
            <p>问：综合信用分是什么？</p>
            <p>答：综合信用分是衡量企业守信与否的重要标准，以分数高低设有5个区间，以350分为初始值，950分为满分。</p>
            <p>问：综合信用分的由来？</p>
            <p>答：综合信用分是由下设的5个二级指标分数：基本情况、金融财税、质量安全、遵纪守法、社会责任相加而来。</p>
            <p>问：二级信用分的由来？</p>
            <p>答：根据每项二级信用分的特点，二级指标下还细分了4-5个三级指标，每项二级指标的分数是由下设的三级指标分数相加而来。</p>
        </div>
    </div>

    <h2 class="s-h2">企业信用评价体系结构示意图</h2>
    <div class="score-fb">
        <div id="symbol_id" style="display: none;width: 100%;">
            <img src="${basePath}/xyzj/images/s1.png" style="left:44.72%;position: absolute;margin-top: 0.2%;">
            <img src="${basePath}/xyzj/images/s2.png" style="left: 30.2%;position: absolute;margin-top: 8.7%;">
            <img src="${basePath}/xyzj/images/s5.png" style="left: 34.5%;position: absolute;margin-top: 21.6%;">
            <img src="${basePath}/xyzj/images/s4.png" style="left: 55.1%;position: absolute;margin-top: 21.6%;">
            <img src="${basePath}/xyzj/images/s3.png" style="left: 59.4%;position: absolute;margin-top: 8.7%;">
        </div>

        <div id="graph_id" style="width: 100%;height: 300px;padding-top: 10px;"></div>
    </div>
    <div class="score-rb">
        <div id="sub_credit_score_id">
            <c:if test="${dataItemMap != null && fn:length(dataItemMap) > 0}">
                <c:forEach var="dataItem" items="${dataItemMap}" varStatus="status">
                    <c:set var="title" value="${status.index ==0?'基本情况':status.index ==1?'金融财税':status.index ==2?'质量安全':status.index ==3?'遵纪守法':'社会责任'}"/>
                    <div class="score-rb-block">
                        <div id="circle_id_${status.index+1}" class="r-infor"></div>
                        <p>${title}</p>
                        <c:if test="${dataItem.value != null && fn:length(dataItem.value) > 0}">
                            <div class="score-posi score-w${status.index+1}" style="display: none;">
                                <c:forEach var="data" items="${dataItem.value}" varStatus="st">
                                    <div style="clear:both;">
                                        <div class="score-bl">
                                            <span>${data.itemName}</span>
                                            <div class="score-bl-line col-c${st.index+1}"
                                                 style="width:${data.width}px;">
                                                <b style="width: ${data.percent}%;"></b>
                                            </div>
                                        </div>
                                        <i class="item-i col-i-c${st.index+1}">${data.itemScore}</i>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>