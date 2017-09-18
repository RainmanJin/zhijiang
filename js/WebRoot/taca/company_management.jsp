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
    <script data-main="${basePath }/js/uzj/taca/taca_company_management.js" src="${basePath }/js/lib/require.js"></script>

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
                <input type="hidden" id="ensureAccountabilitySystem" value="${userTacaManage.ensureAccountabilitySystem}"/>
                <input type="hidden" id="tracingSystem" value="${userTacaManage.tracingSystem}"/>
                <input type="hidden" id="qualitySafetyWorkingMechanism" value="${userTacaManage.qualitySafetyWorkingMechanism}"/>
                <input type="hidden" id="brandManagementSystem" value="${userTacaManage.brandManagementSystem}"/>
                <input type="hidden" id="infringementLawsuitSystem" value="${userTacaManage.infringementLawsuitSystem}"/>
                <input type="hidden" id="standardPriceSystem" value="${userTacaManage.standardPriceSystem}"/>
                <input type="hidden" id="againstInfringementMechanism" value="${userTacaManage.againstInfringementMechanism}"/>
                <input type="hidden" id="supplierJointAgainstInfringement" value="${userTacaManage.supplierJointAgainstInfringement}"/>

                <form id="taca_step_three" action="${basePath}/taca/apply/company/management" method="post">
                    <input type="hidden" name="token" value="${token}"/>
                    <input type="hidden" name="id" value="${userTacaManage.id}"/>
                    <input type="hidden" name="activityId" value="${activity.id}"/>
                    <div class="bR-line bR-choose">
                        <h3>1、是否建有现代化管理系统（OA管理系统/供销存业务系统）</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="modernInstitution" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="modernInstitution" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="modernInstitution" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>2、贸易零售批发行业结算是否受理银行卡（非零售批发行业勿选）</h3>
                        <h4>
                            <i>是</i>
                            <label class="jqWrap">
                                <input type="radio" name="acceptBankCard" value="1" class="">
                            </label>
                            <i>否</i>
                            <label class="jqWrap">
                                <input type="radio" name="acceptBankCard" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>3、零售企业是否拥有非接银行卡免密免签授权</h3>
                        <h4>
                            <i>是</i>
                            <label class="jqWrap">
                                <input type="radio" name="authorization" value="1" class="">
                            </label>
                            <i>否</i>
                            <label class="jqWrap">
                                <input type="radio" name="authorization" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>4、是否建立完整的内部管理制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="insideManagement" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="insideManagement" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="insideManagement" value="0" class="">
                            </label>
                        </h4>
                    </div>

                <h3 class="baseRight-tit"><span>信用管理</span></h3>

                    <div class="bR-line bR-choose" style="margin-top: 28px;">
                        <h3>1、是否建立商品经营过程质量控制制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="qualityControl" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="qualityControl" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="qualityControl" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>2、是否建立供应商资质认定、档案制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="fileInstitution" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="fileInstitution" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="fileInstitution" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>3、是否建立索证索票管理制度，保存相关证、票存档制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="ticketFilingInstitution" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="ticketFilingInstitution" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="ticketFilingInstitution" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>4、是否建立员工职业培训制度和员工诚信营业教育惩戒制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="trainInstitution" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="trainInstitution" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="trainInstitution" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>5、是否建立使消费者感到“宾至如归”的服务和工作规范</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="workSpecification" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="workSpecification" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="workSpecification" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>6、是否建立“先行赔付”、“无理由退换货”等增信机制和制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="creditMechanism" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="creditMechanism" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="creditMechanism" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>7、是否建立公示服务承诺，自觉遵守优质服务承诺工作规范</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="serviceCommitment" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="serviceCommitment" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="serviceCommitment" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose">
                        <h3>8、是否建立企业自身的知识产权保护，特别是品牌维护工作制度</h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="intellectualPropertyRight" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="intellectualPropertyRight" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="intellectualPropertyRight" value="0" class="">
                            </label>
                        </h4>
                    </div>


                    <div class="bR-line bR-choose"><h3>9、是否建立商品经营过是否建立货源可追溯，保障追责制度<c:if test="${portionRequired}"><span name="requiredChoose" style="color:red">*</span></c:if></h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="ensureAccountabilitySystem" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="ensureAccountabilitySystem" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="ensureAccountabilitySystem" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose"><h3>10、是否建立肉菜、中药材流通追溯体系工作机制和制度<c:if test="${portionRequired}"><span name="requiredChoose" style="color:red">*</span></c:if></h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="tracingSystem" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="tracingSystem" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="tracingSystem" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose"><h3>11、是否建立流通领域商品特别是食品、药品的质量安全工作机制等管理制度与工作规范<c:if test="${portionRequired}"><span name="requiredChoose" style="color:red">*</span></c:if></h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="qualitySafetyWorkingMechanism" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="qualitySafetyWorkingMechanism" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="qualitySafetyWorkingMechanism" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose"><h3>12、是否建立“商品一流、服务一流、信誉一流”的品牌管理制度<c:if test="${portionRequired}"><span name="requiredChoose" style="color:red">*</span></c:if></h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="brandManagementSystem" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="brandManagementSystem" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="brandManagementSystem" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose"><h3>13、是否建立“品牌商品”和“品牌服务”侵权打假制度和工作机制<c:if test="${portionRequired}"><span name="requiredChoose" style="color:red">*</span></c:if></h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="infringementLawsuitSystem" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="infringementLawsuitSystem" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="infringementLawsuitSystem" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose"><h3>14、是否建立“货真价实”明示收费价格标准的管理制度和工作规范<c:if test="${portionRequired}"><span name="requiredChoose" style="color:red">*</span></c:if></h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="standardPriceSystem" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="standardPriceSystem" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="standardPriceSystem" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose"><h3>15、是否建立配合政府部门开展打击侵权假冒工作的工作机制<c:if test="${portionRequired}"><span name="requiredChoose" style="color:red">*</span></c:if></h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="againstInfringementMechanism" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="againstInfringementMechanism" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="againstInfringementMechanism" value="0" class="">
                            </label>
                        </h4>
                    </div>
                    <div class="bR-line bR-choose"><h3>16、是否建立与供应商共同抵制侵权假冒行为和销售伪劣商品的工作机制和制度<c:if test="${portionRequired}"><span name="requiredChoose" style="color:red">*</span></c:if></h3>
                        <h4>
                            <i>已建</i>
                            <label class="jqWrap">
                                <input type="radio" name="supplierJointAgainstInfringement" value="2" class="">
                            </label>
                            <i>在建</i>
                            <label class="jqWrap">
                                <input type="radio" name="supplierJointAgainstInfringement" value="1" class="">
                            </label>
                            <i>未建</i>
                            <label class="jqWrap">
                                <input type="radio" name="supplierJointAgainstInfringement" value="0" class="">
                            </label>
                        </h4>
                    </div>




                    <div class="bR-line bR-choose">
                        <h3><i>其他信用制度</i><textarea style="width:714px;" name="otherCreditInstitution">${userTacaManage.otherCreditInstitution}</textarea></h3>
                    </div>
                    <div class="bR-button" style="margin-top: 40px;">
                        <button type="button" class="bt2">上一页</button>
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