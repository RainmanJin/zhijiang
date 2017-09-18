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
    <meta http-equiv="description" content="商贸联活动">
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/js/uzj/taca/taca_company_responsibility.js" src="${basePath }/js/lib/require.js"></script>
    <script type="text/javascript" src="${basePath}/js/lib/laydate/laydate.js"></script>
</head>

<body style="background-color: #f2f4f8;">
<jsp:include page="../user/top.jsp"/>
<jsp:include page="top.jsp"/>
<div class="n-layout base">
    <div class="base-write">
        <h2><span>申报资料</span><i>浙江省商贸诚信示范企业评选</i></h2>
        <div class="baseCredit">
            <jsp:include page="left.jsp"/>

            <div class="baseRight">

                <div class="bR-bg bR-bg2 bR-bg4" style="display: none;" id="repeat_div">
                    <p><span>时间</span><input onclick="laydate()" style="width: 295px;" type="text" name="userTacaCommonweals[0].time"></p>
                    <p><span>单位名称</span><input style="width: 295px;" type="text" name="userTacaCommonweals[0].organ" placeholder="受捐助单位/活动组织单位/颁奖单位（全称）"></p>
                    <p><span style="vertical-align: top;float: left;">主要内容</span>
                        <textarea name="userTacaCommonweals[0].mainContent"></textarea>
                    </p>
                </div>

                <h3 class="baseRight-tit"><span>企业责任</span></h3>
                <input id="ensureEmployeeRights" type="hidden" value="${userTacaResponsibility.ensureEmployeeRights}"/>
                <input id="congressInstitute" type="hidden" value="${userTacaResponsibility.congressInstitute}"/>
                <input id="publicWelfare" type="hidden" value="${userTacaResponsibility.publicWelfare}"/>
                <form id="taca_step_seven" action="${basePath}/taca/apply/company/responsibility" method="post">
                    <input type="hidden" name="token" value="${token}"/>
                    <input type="hidden" name="id" value="${userTacaResponsibility.id}"/>
                    <input type="hidden" name="activityId" value="${activity.id}"/>
                    <div class="bR-line bR-choose">
                        <h3>1、企业是否有保障职工权益的相关措施或制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
									<input type="radio" name="ensureEmployeeRights" value="2" class="">
								</label>
                            <i>在建</i>
                            <label class="jqWrap">
									<input type="radio" name="ensureEmployeeRights" value="1" class="">
								</label>
                            <i>未建</i>
                            <label class="jqWrap">
									<input type="radio" name="ensureEmployeeRights" value="0" class="">
								</label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>2、企业是否建有职工代表大会制度和建立工资集体协商制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
									<input type="radio" name="congressInstitute" value="2" class="">
								</label>
                            <i>在建</i>
                            <label class="jqWrap">
									<input type="radio" name="congressInstitute" value="1" class="">
								</label>
                            <i>未建</i>
                            <label class="jqWrap">
									<input type="radio" name="congressInstitute" value="0" class="">
								</label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>3、企业是否有积极参与公益事业</h3>
                        <h4>
                            <i>是</i>
                            <label class="jqWrap">
									<input type="radio" name="publicWelfare" value="1" class="">
								</label>
                            <i>否</i>
                            <label class="jqWrap">
									<input type="radio" name="publicWelfare" value="0" class="">
								</label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>公益事业概述（近三年）</h3>
                        <c:choose>
                            <c:when test="${fn:length(userTacaCommonweals) == 0}">
                                <div class="bR-bg bR-bg2 bR-bg4" data-attr="repeat_div">
                                    <p><span>时间</span><input onclick="laydate()" style="width: 295px;" type="text" name="userTacaCommonweals[0].time"></p>
                                    <p><span>单位名称</span><input style="width: 295px;" type="text" name="userTacaCommonweals[0].organ" placeholder="受捐助单位/活动组织单位/颁奖单位（全称）"></p>
                                    <p><span style="vertical-align: top;float: left;">主要内容</span>
                                        <textarea name="userTacaCommonweals[0].mainContent"></textarea>
                                    </p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${userTacaCommonweals}" var="utc" varStatus="status" >
                                    <div class="bR-bg bR-bg2 bR-bg4" data-attr="repeat_div">
                                        <p><span>时间</span><input onclick="laydate()" style="width: 295px;" type="text" name="userTacaCommonweals[${status.index}].time" value="${utc.time}"></p>
                                        <p><span>单位名称</span><input style="width: 295px;" type="text" name="userTacaCommonweals[${status.index}].organ" placeholder="受捐助单位/活动组织单位/颁奖单位（全称）"  value="${utc.organ}"></p>
                                        <p><span style="vertical-align: top;float: left;">主要内容</span>
                                            <textarea name="userTacaCommonweals[${status.index}].mainContent">${utc.mainContent}</textarea>
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
                    <div class="bR-button">
                        <button  type="button"  class="bt2">上一页</button>
                        <button type="submit" class="bt1">保存并进入下一页</button>
                    </div>
                </form>

            </div>


        </div>
    </div>
</div>
<script type="text/javascript">
    laydate.skin('molv'); //danlan ,dahong,molv
</script>
<jsp:include page="../footer.jsp"/>
</body>
</html>