<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>${key }-企业信用查询-之江信用</title>
    <base href="${basePath}/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="keywords" content="企业查询,中小企业,三资企业,民营企业,私营企业,黄页大全"/>
	<meta http-equiv="description" content="之江信用提供中小企业,民营企业信息查询,私营企业信用查询服务。"/>
	<link href="${basePath}/style/new/gov_monitor_style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/gov/js/monitor/regulatory_effect.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript" src="${basePath }/gov/js/monitor/select2css.js"></script>

    <script>
        var clueCfg = clueCfg || {
                page:'auth',
                modifyUrl : "${basePath}/gov/user/clue/<%=response.encodeURL("modify")%>",
                clueContent : ${clue.clueContent}
            };
    </script>

</head>

<body class="gov_bg" data-attr="regulatory_effect">

<jsp:include page="monitor_top.jsp"/>
<jsp:include page="monitor_left.jsp"/>

<div class="govMain">
    <div class="govList">
        <div class="govList_main_tit">
            <div class="gov_width gov_width3"></div>
            <div class="govList_h3">线索处理</div>
        </div>
        <div class="govList_gk">
            <div class="gov_width gov_width3"></div>
            <div class="govAudit">
                <div class="govAudit_logo">
                    <img src="${basePath}/images/gov-images/zs_img05.jpg">
                </div>
                <span>${clue.companyName }</span>
            </div>
            <div class="gov_width gov_width3"></div>
        </div>
        <!--end govList_gk -->
        <div class="govList_gk">
            <div class="gov_width gov_width3"></div>
            <div class="govAudit_main">
                <div class="govAudit_list">
                    <h4>主体信息</h4>
                    <div class="govAudit_body govAudit_br">
                        <div class="govAudit_body_w1 govAudit_width06">
                            <span>地区：</span><em>${clue.subjectArea }</em>
                            <%--<input type="text" value="${clue.subjectArea }" />--%>
                        </div>
                        <div class="govAudit_body_w1 govAudit_width07">
                            <span>详细地址：</span><em>${clue.subjectAddress }</em>
                            <%--<input type="text" value="${clue.subjectAddress }" />--%>
                        </div>
                        <div class="govAudit_body_w1 govAudit_width08">
                            <span>联系人：</span><em>${clue.subjectContactor }</em>
                            <%--<input type="text" value="${clue.subjectContactor }" />--%>
                        </div>
                        <div class="govAudit_body_w1 govAudit_width09">
                            <span>联系电话： </span><em>${clue.subjectPhone }</em>
                            <%--<input type="text" value="${clue.subjectPhone }" />--%>
                        </div>
                        <div class="govAudit_body_w1 govAudit_width10">
                            <span>邮箱：</span><em>${clue.subjectEmail }</em>
                            <%--<input type="text" value="${clue.subjectEmail }" />--%>
                        </div>
                    </div>
                </div>
                <div class="govAudit_list">
                    <h4>线索信息</h4>
                    <div class="govAudit_body">
                        <div class="govAudit_xs_tit">
                            <p>线索来源：<span>公众举报</span></p>
                            <p>线索类型：<span>${clue.clueTypeShow}</span></p>
                            <p>创建时间：<span><fmt:formatDate value="${clue.createTime }" pattern="yyyy-MM-dd"/></span></p>
                        </div>
                        <div class="govAudit_xs_main">
                            <h5>线索内容</h5>
                            <div class="govAudit_xs_p" id="clue_content">


                              <%--  <ul class="clue-main" id="clue_content">

                                </ul>--%>
                             <%--   <p class="govAudit_xs_p1">举报人姓名：<span>李四</span></p>
                                <p class="govAudit_xs_p2">联系电话：<span>13600158666</span></p>
                                <p class="govAudit_xs_p3">联系邮箱：<span>list@163.com</span></p>
                                <p class="govAudit_xs_p4">举报类型：
                                    <span><input type="checkbox">企业失信行为</span>
                                    <span><input type="checkbox">企业荣誉资质造假</span>
                                    <span><input type="checkbox">企业失信行为</span>
                                    <span><input type="checkbox">企业运营状况造假</span></p>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="govAudit_list">
                    <form id="clueAuthForm" action="${basePath}/gov/user/new/clue/<%=response.encodeURL("modify")%>">
                    <h4>处理结果</h4>
                        <input type="hidden" name="clueId" value="${clue.clueId }">
                        <div id="uboxstyle" class="govUb">
                            处理方式：
                        <select name="clueProcessType" id="clueProcessType" style="">
                            <option value="" selected='selected'>请选择</option>

                            <%--<option value="English" selected="selected"><font>请选择</font></option>--%>
                            <%--<option value="第三方监测"><font>第三方监测</font></option>--%>
                            <c:forEach items="${clueProcessTypeMap }" var="processType">
                                <option value="${processType.key}">${processType.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div id="uboxstyle01" class="govUb">
                        处理类型：
                        <select name="language01" id="language01" style="">
                            <option value="" selected="selected01"><font>请选择</font></option>
                            <%--<option value=""><font>平台公示</font></option>--%>
                        </select>
                    </div>
                    <div id="uboxstyle01" class="govUb">
                        处理记录：
                        <textarea name="clueVerifyHistory" cols="" rows=""></textarea>
                    </div>
                    <div class="govUb_button govUb_button_left">
                        <a href="javascript:void(0);" id="clueAuthFormBtn" class="govUb_button01">提 交</a>
                        <a href="javascript:history.back();" class="govUb_button02">返 回</a>
                    </div>
                    </form>
                </div>
            </div>
            <div class="gov_width gov_width3"></div>
        </div>
        <!--end govList_gk -->

    </div>
    <!--end gov_govList-->
</div>
</body>

</html>
