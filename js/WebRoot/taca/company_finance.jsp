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
    <link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/js/uzj/taca/taca_company_finance.js" src="${basePath }/js/lib/require.js"></script>
    <script type="text/javascript">
        var company_finance_cfg = {};
        company_finance_cfg['tacaDatums'] = '${tacaDatums}';
    </script>
</head>

<body style="background-color: #f2f4f8;">
<jsp:include page="../user/top.jsp"/>
<jsp:include page="top.jsp"/>
<div class="n-layout base">
    <div class="base-write">
        <h2><span>申报资料</span><i>浙江省商贸诚信示范企业评选</i></h2>
        <div class="baseCredit">
            <jsp:include page="left.jsp"/>

            <div class="baseRight" id="container_id">
                <h3 class="baseRight-tit"><span>债权债务</span></h3>
                  <input type="hidden" id="submitType" value="${sessionScope.user.customData.submitType}"/>
                <form id="taca_step_six" action="${basePath}/taca/apply/company/finance" method="post">
                    <input type="hidden" name="token" value="${token}"/>
                    <input type="hidden" name="activityId" value="${activity.id}"/>
                    <div class="bR-line">
                        <table cellpadding="0" cellspacing="0" border="0" class="base-tb3">
                            <input type="hidden" name="userTacaDebts[0].id" value="${year_2015.id}">
                            <input type="hidden" name="userTacaDebts[1].id" value="${year_2016.id}">
                            <input type="hidden" name="userTacaDebts[0].year" value="2015">
                            <input type="hidden" name="userTacaDebts[1].year" value="2016">
                            <tr>
                                <th class="bR-t6"></th>
                                <th class="bR-t7">2015年</th>
                                <th class="bR-t7">2016年</th>
                            </tr>
                            <tr><td class="bR-t61"><span>年末负债总额                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].yearLiabilityAmount" value="${year_2015.yearLiabilityAmount}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].yearLiabilityAmount" value="${year_2016.yearLiabilityAmount}"></td></tr>
                            <tr><td class="bR-t61"><span>年末资产总额                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].yearAssetsAmount" value="${year_2015.yearAssetsAmount}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].yearAssetsAmount" value="${year_2016.yearAssetsAmount}"></td></tr>
                            <tr><td class="bR-t61"><span>年经营现金净流量                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].yearManageCashNetFlow" value="${year_2015.yearManageCashNetFlow}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].yearManageCashNetFlow" value="${year_2016.yearManageCashNetFlow}"></td></tr>
                            <tr><td class="bR-t61"><span>年末流动负债                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].yearTurnoverLiability" value="${year_2015.yearTurnoverLiability}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].yearTurnoverLiability" value="${year_2016.yearTurnoverLiability}"></td></tr>
                            <tr><td class="bR-t61"><span>流动资产                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].turnoverAssets" value="${year_2015.turnoverAssets}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].turnoverAssets" value="${year_2016.turnoverAssets}"></td></tr>
                            <tr><td class="bR-t61"><span>流动负债                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].turnoverLiability" value="${year_2015.turnoverLiability}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].turnoverLiability" value="${year_2016.turnoverLiability}"></td></tr>
                            <tr><td class="bR-t61"><span>存货                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].inventory" value="${year_2015.inventory}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].inventory" value="${year_2016.inventory}"></td></tr>
                            <tr><td class="bR-t61"><span>利润总额                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].profitAmount" value="${year_2015.profitAmount}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].profitAmount" value="${year_2016.profitAmount}"></td></tr>
                            <tr><td class="bR-t61"><span>利息支出                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].interestExchange" value="${year_2015.interestExchange}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].interestExchange" value="${year_2016.interestExchange}"></td></tr>
                            <tr><td class="bR-t61"><span>短期借款                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].shortTermBorrowing" value="${year_2015.shortTermBorrowing}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].shortTermBorrowing" value="${year_2016.shortTermBorrowing}"></td></tr>
                            <tr><td class="bR-t61"><span>长期贷款                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].longTermLoan" value="${year_2015.longTermLoan}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].longTermLoan" value="${year_2016.longTermLoan}"></td></tr>
                            <tr><td class="bR-t61"><span>一年内到期的非流动负债                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].yearNonCurrentDue" value="${year_2015.yearNonCurrentDue}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].yearNonCurrentDue" value="${year_2016.yearNonCurrentDue}"></td></tr>
                            <tr><td class="bR-t61"><span>应付债券                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].bondsPayable" value="${year_2015.bondsPayable}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].bondsPayable" value="${year_2016.bondsPayable}"></td></tr>
                            <tr><td class="bR-t61"><span>应付利息                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].interestPayable" value="${year_2015.interestPayable}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].interestPayable" value="${year_2016.interestPayable}"></td></tr>
                            <tr><td class="bR-t61"><span>负债总额                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].totalLiabilities" value="${year_2015.totalLiabilities}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].totalLiabilities" value="${year_2016.totalLiabilities}"></td></tr>
                        </table>
                    </div>



                <h3 class="baseRight-tit"><span>营运能力</span></h3>

                    <div class="bR-line" style="margin-top: 28px;">
                        <table cellpadding="0" cellspacing="0" border="0" class="base-tb3">
                            <tr>
                                <th class="bR-t6"></th>
                                <th class="bR-t7">2015年</th>
                                <th class="bR-t7">2016年</th>
                            </tr>

                            <tr><td class="bR-t61"><span>主营业务收入                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].mainBusinessIncome" value="${year_2015.mainBusinessIncome}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].mainBusinessIncome" value="${year_2016.mainBusinessIncome}"></td></tr>
                            <tr><td class="bR-t61"><span>平均资产总额                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].totalAverageAssets" value="${year_2015.totalAverageAssets}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].totalAverageAssets" value="${year_2016.totalAverageAssets}"></td></tr>
                            <tr><td class="bR-t61"><span>应收账款平均余额                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].receivableAverageBalance" value="${year_2015.receivableAverageBalance}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].receivableAverageBalance" value="${year_2016.receivableAverageBalance}"></td></tr>
                            <tr><td class="bR-t61"><span>平均流动资产总额                  (万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].averageTurnoverAssets" value="${year_2015.averageTurnoverAssets}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].averageTurnoverAssets" value="${year_2016.averageTurnoverAssets}"></td></tr>
                        </table>
                    </div>

                <h3 class="baseRight-tit"><span>盈利能力</span></h3>

                    <div class="bR-line" style="margin-top: 28px;">
                        <table cellpadding="0" cellspacing="0" border="0" class="base-tb3">
                            <tr>
                                <th class="bR-t6"></th>
                                <th class="bR-t7">2015年</th>
                                <th class="bR-t7">2016年</th>
                            </tr>

                            <tr><td class="bR-t61"><span>净利润(万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].retainedProfits" value="${year_2015.retainedProfits}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].retainedProfits" value="${year_2016.retainedProfits}"></td></tr>
                            <tr><td class="bR-t61"><span>平均净资产(万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].averageNetAssets" value="${year_2015.averageNetAssets}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].averageNetAssets" value="${year_2016.averageNetAssets}"></td></tr>
                            <tr><td class="bR-t61"><span>主营业务利润(万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].mainOperationProfits" value="${year_2015.mainOperationProfits}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].mainOperationProfits" value="${year_2016.mainOperationProfits}"></td></tr>
                            <tr><td class="bR-t61"><span>成本费用总额(万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].totalCost" value="${year_2015.totalCost}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].totalCost" value="${year_2016.totalCost}"></td></tr>
                            <tr><td class="bR-t61"><span>平均资本(万元)</span></td><td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[0].averageCapital" value="${year_2015.averageCapital}"></td>                                <td class="bR-t7"><input type="text" data-attr='number' name="userTacaDebts[1].averageCapital" value="${year_2016.averageCapital}"></td></tr>

                        </table>
                    </div>

                <h3 class="baseRight-tit"><span>财务报告</span></h3>

                    <div class="bR-line" style="margin-top: 28px;">
                        <div class="bR-line-right">
                            <i style="margin: 0; display: block;">2015年度及2016年度财务报告或财务审计报告（含报告结论及审计单位资质）</i>
                            <i style="margin: 0;">请上传电子文档，格式为DOC、PDF，小于 10MB，最多可上传 2 份</i>
                            <div class="baseUp">
                                    <span data-attr="upload">
                                    <input type="hidden" name="userTacaDatums[0].id"/>
                                    <input type="hidden" id="datumLink0" name="userTacaDatums[0].datumLink"/>
                                    <input type="hidden" id="datum0OriginalName" name="userTacaDatums[0].datumOriginalName"/>
                                    <div class="baseUp-block baseUp-ul" id="filePicker1" style="background-color: #f8f8f8;padding: 0 !important;">
                                        <input type="button"/>
                                        <img src="${basePath }/images/base-upload.png"/>
                                        <div id="datumLink0Div" class="uploader-list"></div>
                                    </div>
                                    </span>

                                    <span data-attr="upload">
                                    <input type="hidden" name="userTacaDatums[1].id"/>
                                    <input type="hidden" id="datumLink1" name="userTacaDatums[1].datumLink"/>
                                    <input type="hidden" id="datum1OriginalName" name="userTacaDatums[1].datumOriginalName"/>
                                    <div class="baseUp-block baseUp-ul" id="filePicker2" style="background-color: #f8f8f8;padding: 0 !important;">
                                        <input type="button"/>
                                        <img src="${basePath }/images/base-upload.png"/>
                                        <div id="datumLink1Div" class="uploader-list"></div>
                                    </div>
                                    </span>
                            </div>
                        </div>
                    </div>
                    <div class="bR-button">
                        <button type="button" class="bt2">上一页</button>
                        <button type="submit"  class="bt1">保存并进入下一页</button>
                    </div>
                </form>
            </div>


        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>