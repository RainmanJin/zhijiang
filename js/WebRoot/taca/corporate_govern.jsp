<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>之江信用-商贸联活动</title>
    <base href="${basePath }/"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
    <meta http-equiv="description"
          content="商贸联活动">
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/js/uzj/taca/taca_corporate_govern.js" src="${basePath }/js/lib/require.js"></script>

</head>

<body style="background-color: #f2f4f8;">
<jsp:include page="../user/top.jsp"/>
<jsp:include page="top.jsp"/>
<div class="n-layout base">
    <div class="base-write">
        <h2><span>申报资料</span><i>浙江省商贸诚信示范企业评选</i></h2>
        <div class="baseCredit">
            <jsp:include page="left.jsp"/>
            <div class="bR-bg bR-bg1 bR-bg2" style="display: none;" id="repeat_model">
                <input type="hidden" name="userTacaManagers[0].id"/>
                <p><span>姓名</span><input style="width: 98px;" name="userTacaManagers[0].name" type="text" value=""></p>
                <p><span>年龄</span><input  style="width: 98px;" name="userTacaManagers[0].age" type="text" data-attr='age' value="">
                    <span style="width: 39px;">学历</span>
                    <select name="userTacaManagers[0].education">
                        <option value="">请选择</option>
                        <option value="1">硕士及以上</option>
                        <option value="2">本科</option>
                        <option value="3">大专</option>
                        <option value="4">高中</option>
                        <option value="5">中专及以下</option>
                    </select>
                    <span style="width: 39px;">职位</span>
                    <input   name="userTacaManagers[0].position"
                             type="text" value="" />
                </p>
                <p><span>分工</span><input style="width: 452px;" type="text" name="userTacaManagers[0].divisionLabor"
                                         value=""></p>
                <p><span style="vertical-align: top;">个人荣誉</span><textarea
                        name="userTacaManagers[0].personalHonor"></textarea></p>
                <p><span style="line-height: normal;vertical-align: top;">经营失信及<br>金融失信情况</span><textarea
                        name="userTacaManagers[0].operateFinanceUncredit"></textarea></p>
            </div>
            <div class="baseRight">
                <h3 class="baseRight-tit"><span>法人治理</span></h3>
                <form id="taca_step_two" action="${basePath}/taca/apply/corporate/govern" method="post">
                    <input type="hidden" name="token" value="${token}"/>
                    <input type="hidden" name="activityId" value="${param.activityId}"/>
                    <input type="hidden" name="id" value="${userTacaCorporate.id}"/>
                    <input type="hidden" id="baseArchitecture" value="${userTacaCorporate.baseArchitecture}"/>
                    <input type="hidden" id="meetingInstitution" value="${userTacaCorporate.meetingInstitution}"/>
                    <div id="errorMsg" style="color:red;"></div>

                    <div class="bR-line bR-choose">
                        <h3>1、是否具有完整的企业法人治理基本架构</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="baseArchitecture" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="baseArchitecture" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="baseArchitecture" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>2、是否具有股东会、董事会、监事会、高管会议及运行制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="meetingInstitution" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="meetingInstitution" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="meetingInstitution" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <h3 class="baseRight-tit"><span>股东会、董事会、监事会、高管人员组成及分工</span></h3>


                    <div class="bR-line">
                        <div class="bR-line-left bR-line-left1">人员信息</div>
                        <div class="bR-line-right">
                            <i style="margin: 0;">注：高管包括总经理、副总经理、财务总监、安全负责人等副总经理级别以上的公司领导。</i>
                            <div id="container_id">
                                <c:choose>
                                    <c:when test="${fn:length(userTacaManagers) == 0}">
                                        <div class="bR-bg bR-bg1 bR-bg2" data-attr="repeat_div">
                                            <input type="hidden" name="userTacaManagers[0].id"/>
                                            <p><span>姓名</span><input style="width: 98px;"
                                                                     name="userTacaManagers[0].name" type="text"
                                                                     value=""></p>
                                            <p><span>年龄</span><input data-attr='age' style="width: 98px;" name="userTacaManagers[0].age"
                                                                     type="text" value="">
                                                <span style="width: 39px;">学历</span>
                                                <select name="userTacaManagers[0].education">
                                                    <option value="">请选择</option>
                                                    <option value="1">硕士及以上</option>
                                                    <option value="2">本科</option>
                                                    <option value="3">大专</option>
                                                    <option value="4">高中</option>
                                                    <option value="5">中专及以下</option>
                                                </select>
                                                <span style="width: 39px;">职位</span>


                                                <input   name="userTacaManagers[0].position"
                                                         type="text" value="" />
                                            </p>
                                            <p><span>分工</span><input style="width: 452px;" type="text"
                                                                     name="userTacaManagers[0].divisionLabor" value="">
                                            </p>
                                            <p><span style="vertical-align: top;">个人荣誉</span><textarea
                                                    name="userTacaManagers[0].personalHonor"></textarea></p>
                                            <p><span
                                                    style="line-height: normal;vertical-align: top;">经营失信及<br>金融失信情况</span><textarea
                                                    name="userTacaManagers[0].operateFinanceUncredit"></textarea></p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${userTacaManagers}" var="utm" varStatus="status">

                                            <div class="bR-bg bR-bg1 bR-bg2" data-attr="repeat_div">
                                                <input type="hidden" name="userTacaManagers[${status.index}].id"
                                                       value="${utm.id}"/>
                                                <input type="hidden" id="education${status.index}"
                                                       value="${utm.education}"/>
                                                <input type="hidden" id="position${status.index}"
                                                       value="${utm.position}"/>

                                                <p><span>姓名</span><input style="width: 98px;"
                                                                         name="userTacaManagers[${status.index}].name"
                                                                         type="text" value="${utm.name}"></p>
                                                <p><span>年龄</span><input data-attr='age' style="width: 98px;"
                                                                         name="userTacaManagers[${status.index}].age"
                                                                         type="text" value="${utm.age}">
                                                    <span style="width: 39px;">学历</span>
                                                    <select data-attr="education${status.index}"
                                                            name="userTacaManagers[${status.index}].education">
                                                        <option value="">请选择</option>
                                                        <option value="1">硕士及以上</option>
                                                        <option value="2">本科</option>
                                                        <option value="3">大专</option>
                                                        <option value="4">高中</option>
                                                        <option value="5">中专及以下</option>
                                                    </select>
                                                    <span style="width: 39px;">职位</span>

                                                    <input   name="userTacaManagers[${status.index}].position"
                                                             type="text" value="${utm.position}" />
                                                </p>
                                                <p><span>分工</span><input style="width: 452px;" type="text"
                                                                         name="userTacaManagers[${status.index}].divisionLabor"
                                                                         value="${utm.divisionLabor}"></p>
                                                <p><span style="vertical-align: top;">个人荣誉</span><textarea
                                                        name="userTacaManagers[${status.index}].personalHonor">${utm.personalHonor}</textarea>
                                                </p>
                                                <p><span style="line-height: normal;vertical-align: top;">经营失信及<br>金融失信情况</span><textarea
                                                        name="userTacaManagers[${status.index}].operateFinanceUncredit">${utm.operateFinanceUncredit}</textarea>
                                                </p>
                                            </div>

                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                <div class="bR-link">
                                    <a href="javascript:void(0);" class="bR-green"></a>
                                    <a href="javascript:void(0);" class="bR-red"></a>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="bR-button">
                        <button class="bt2" type="button" >上一页</button>
                        <button type="submit" class="bt1">保存并进入下一页</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>