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
      var  activityCfg = activityCfg || {page : 'company_management'};
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
                <h3 class="baseRight-tit"><span>企业管理</span></h3>
                <input type="hidden" id="modernInstitution" value="${userTacaManage.modernInstitution}"/>
                <input type="hidden" id="acceptBankCard" value="${userTacaManage.acceptBankCard}"/>
                <input type="hidden" id="authorization" value="${userTacaManage.authorization}"/>
                <input type="hidden" id="insideManagement" value="${userTacaManage.insideManagement}"/>
                <input type="hidden" id="qualityControl" value="${userTacaManage.qualityControl}"/>
                <input type="hidden" id="fileInstitution" value="${userTacaManage.fileInstitution}"/>
                <input type="hidden" id="ticketFilingInstitution" value="${userTacaManage.ticketFilingInstitution}"/>
                <input type="hidden" id="trainInstitution" value="${userTacaManage.trainInstitution}"/>
                <input type="hidden" id="workSpecification" value="${userTacaManage.workSpecification}"/>
                <input type="hidden" id="creditMechanism" value="${userTacaManage.creditMechanism}"/>
                <input type="hidden" id="serviceCommitment" value="${userTacaManage.serviceCommitment}"/>
                <input type="hidden" id="intellectualPropertyRight" value="${userTacaManage.intellectualPropertyRight}"/>
                <input type="hidden" name="id" value="${userTacaManage.id}"/>
                    <div class="bR-line bR-choose">
                        <h3>1、是否建有现代化管理系统（OA管理系统/供销存业务系统）</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="modernInstitution" name="modernInstitution" value="2" class="" />
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="modernInstitution" name="modernInstitution" value="1" class="" />
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="modernInstitution" name="modernInstitution" value="0" class="" />
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>2、贸易零售批发行业结算是否受理银行卡（非零售批发行业勿选）</h3>
                        <h4>
                            <i>是</i>
                            <label class="jqWrap">
                                <input type="radio" attr="acceptBankCard" name="acceptBankCard" value="1" class="" />
                            </label>
                            <i>否</i>
                            <label class="jqWrap">
                                <input type="radio" attr="acceptBankCard" name="acceptBankCard" value="0" class="" />
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>3、零售企业是否拥有非接银行卡免密免签授权</h3>
                        <h4>
                            <i>是</i>
                            <label class="jqWrap">
                                <input type="radio" attr="authorization" name="authorization" value="1" class="" />
                            </label>
                            <i>否</i>
                            <label class="jqWrap">
                                <input type="radio" attr="authorization" name="authorization" value="0" class="" />
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>4、是否建立完整的内部管理制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="insideManagement" name="insideManagement" value="2" class="" />
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="insideManagement" name="insideManagement" value="1" class="" />
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="insideManagement" name="insideManagement" value="0" class="" />
                            </label>
                        </h4>
                    </div>

                <h3 class="baseRight-tit"><span>信用管理</span></h3>

                    <div class="bR-line bR-choose" style="margin-top: 28px;">
                        <h3>1、是否建有现代化管理系统（OA管理系统/供销存业务系统）</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="qualityControl" name="qualityControl" value="2" class="" />
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="qualityControl" name="qualityControl" value="1" class="" />
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="qualityControl" name="qualityControl" value="0" class="" />
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>2、是否建立供应商资质认定、档案制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="fileInstitution" name="fileInstitution" value="2" class="" />
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="fileInstitution" name="fileInstitution" value="1" class="" />
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="fileInstitution" name="fileInstitution" value="0" class="" />
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>3、是否建立索证索票管理制度，保存相关证、票存档制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio"  attr="ticketFilingInstitution" name="ticketFilingInstitution" value="2" class="" />
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio"  attr="ticketFilingInstitution" name="ticketFilingInstitution" value="1" class="" />
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio"  attr="ticketFilingInstitution" name="ticketFilingInstitution" value="0" class="" />
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>4、是否建立员工职业培训制度和员工诚信营业教育惩戒制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="trainInstitution" name="trainInstitution" value="2" class="" />
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="trainInstitution" name="trainInstitution" value="1" class="" />
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="trainInstitution" name="trainInstitution" value="0" class="" />
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>5、是否建立使消费者感到“宾至如归”的服务和工作规范</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="workSpecification" name="workSpecification" value="2" class="" />
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="workSpecification" name="workSpecification" value="1" class="" />
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="workSpecification" name="workSpecification" value="0" class="" />
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>6、是否建立“先行赔付”、“无理由退换货”等增信机制和制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="creditMechanism" name="creditMechanism" value="2" class="" />
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="creditMechanism" name="creditMechanism" value="1" class="" />
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="creditMechanism" name="creditMechanism" value="0" class="" />
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>7、是否建立公示服务承诺，自觉遵守优质服务承诺工作规范</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="serviceCommitment" name="serviceCommitment" value="2" class=""/>
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="serviceCommitment" name="serviceCommitment" value="1" class=""/>
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="serviceCommitment" name="serviceCommitment" value="0" class=""/>
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>8、是否建立企业自身的知识产权保护，特别是品牌维护工作制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="intellectualPropertyRight" name="intellectualPropertyRight" value="2" class=""/>
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="intellectualPropertyRight" name="intellectualPropertyRight" value="1" class=""/>
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" attr="intellectualPropertyRight" name="intellectualPropertyRight" value="0" class=""/>
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3><i>其他信用制度</i><textarea style="width:714px;" name="otherCreditInstitution" readonly="readonly">${userTacaManage.otherCreditInstitution}</textarea></h3>
                    </div>
                    <div class="bR-button" style="margin-top: 40px;">
                        <button type="button"  class="bt2">上一页</button>
                        <button type="button"   class="bt1">下一页</button>
                    </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../footer.jsp"/>
</body>
</html>