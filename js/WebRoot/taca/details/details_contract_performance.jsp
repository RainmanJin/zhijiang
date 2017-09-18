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
    <script data-main="${basePath}/js/uzj/taca/audit_detaile.js" src="${basePath }/js/lib/require.js"></script>
    <script>
      var  activityCfg = activityCfg || {page : 'company_performance'};
    </script>
</head>

<body style="background-color: #f2f4f8;">
<jsp:include page="../../user/top.jsp" />
<jsp:include page="details_top.jsp" />
<div class="n-layout base">
    <div class="base-write">
        <h2><span>申报资料</span><i>浙江省商贸诚信示范企业评选</i></h2>
        <div class="baseCredit">
           <jsp:include page="details_left.jsp"/>
            <div class="baseRight">
                <h3 class="baseRight-tit"><span>合同履约</span></h3>
                <input type="hidden" id="promiseInstitution" value="${userTacaContract.promiseInstitution}"/>
                <input type="hidden" id="fairCompetitionInstitution" value="${userTacaContract.fairCompetitionInstitution}"/>
                <input type="hidden" name="id" value="${userTacaContract.id}"/>
                    <div class="bR-line bR-choose">
                        <h3>1、是否建有及时还贷、及时付款、足额交税、信守合同和承诺的工作机制和制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="promiseInstitution" name="promiseInstitution" value="2" class=""/>
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="promiseInstitution" name="promiseInstitution" value="1" class=""/>
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="promiseInstitution" name="promiseInstitution" value="0" class=""/>
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>2、是否建有诚实守信、公平竞争制度与章程</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="fairCompetitionInstitution" name="fairCompetitionInstitution" value="2" class=""/>
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="fairCompetitionInstitution" name="fairCompetitionInstitution" value="1" class=""/>
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="fairCompetitionInstitution" name="fairCompetitionInstitution" value="0" class=""/>
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <div class="bR-line-left bR-line-left1">案件纠纷</div>
                        <div class="bR-line-right">
                            <i style="margin: 0;">近三年已履行合同发生的纠纷案件或近三个月以内未履行已生效裁判的案件</i>
                            <div class="bR-new">
                                <textarea name="caseDispute" readonly="readonly">${userTacaContract.caseDispute}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="bR-button" style="margin-top: 40px;">
                        <button type="button"  class="bt2">上一页</button>
                        <button type="button" class="bt1" >下一页</button>
                    </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../footer.jsp"/>
</body>
</html>