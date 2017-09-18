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
    <script data-main="${basePath}/js/uzj/taca/audit_detaile.js" src="${basePath }/js/lib/require.js"></script>
    <script>
      var  activityCfg = activityCfg || {page : 'company_finance'};
      activityCfg['tacaDatums'] = '${tacaDatums}';
    </script>
</head>

<body style="background-color: #f2f4f8;">
<jsp:include page="../../user/top.jsp"/>
<jsp:include page="details_top.jsp" />
<div class="n-layout base">
    <div class="base-write">
        <h2><span>申报资料</span><i>浙江省商贸诚信示范企业评选</i></h2>
        <div class="baseCredit">
          	<jsp:include page="details_left.jsp"/>
            <div class="baseRight" id="container_id">
                <h3 class="baseRight-tit"><span>债权债务</span></h3>
                    <div class="bR-line">
                        <table cellpadding="0" cellspacing="0" border="0" class="base-tb3">
                            <tr>
                                <th class="bR-t6"></th>
                                <th class="bR-t7">2015年</th>
                                <th class="bR-t7">2016年</th>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>年末负债总额                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"   value="${year_2015.yearLiabilityAmount}" readonly="readonly"/></td> 
                              <td class="bR-t7"><input type="text"  value="${year_2016.yearLiabilityAmount}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>年末资产总额                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"   value="${year_2015.yearAssetsAmount}" readonly="readonly"/></td> 
                              <td class="bR-t7"><input type="text"   value="${year_2016.yearAssetsAmount}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>年经营现金净流量                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.yearManageCashNetFlow}" readonly="readonly" /></td>  
                              <td class="bR-t7"><input type="text"   value="${year_2016.yearManageCashNetFlow}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                               <td class="bR-t61"><span>年末流动负债                  (万元)</span></td>
                               <td class="bR-t7"><input type="text"  value="${year_2015.yearTurnoverLiability}" readonly="readonly" /></td>
                               <td class="bR-t7"><input type="text"   value="${year_2016.yearTurnoverLiability}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                               <td class="bR-t61"><span>流动资产                  (万元)</span></td>
                               <td class="bR-t7"><input type="text"   value="${year_2015.turnoverAssets}" readonly="readonly" /></td> 
                               <td class="bR-t7"><input type="text"   value="${year_2016.turnoverAssets}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                               <td class="bR-t61"><span>流动负债                  (万元)</span></td>
                               <td class="bR-t7"><input type="text"  value="${year_2015.turnoverLiability}" readonly="readonly" /></td>
                               <td class="bR-t7"><input type="text"   value="${year_2016.turnoverLiability}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>存货                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"   value="${year_2015.inventory}" readonly="readonly" /></td>
                              <td class="bR-t7"><input type="text"   value="${year_2016.inventory}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>利润总额                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"   value="${year_2015.profitAmount}" readonly="readonly" /></td>
                              <td class="bR-t7"><input type="text"   value="${year_2016.profitAmount}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                               <td class="bR-t61"><span>利息支出                  (万元)</span></td>
                               <td class="bR-t7"><input type="text"   value="${year_2015.interestExchange}" readonly="readonly" /></td>
                               <td class="bR-t7"><input type="text"   value="${year_2016.interestExchange}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>短期借款                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"   value="${year_2015.shortTermBorrowing}" readonly="readonly" /></td>
                              <td class="bR-t7"><input type="text"   value="${year_2016.shortTermBorrowing}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>长期贷款                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"   value="${year_2015.longTermLoan}" readonly="readonly" /></td>
                              <td class="bR-t7"><input type="text"   value="${year_2016.longTermLoan}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>一年内到期的非流动负债                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.yearNonCurrentDue}" readonly="readonly" /></td>
                              <td class="bR-t7"><input type="text"   value="${year_2016.yearNonCurrentDue}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>应付债券                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"   value="${year_2015.bondsPayable}" readonly="readonly" /></td>
                              <td class="bR-t7"><input type="text"   value="${year_2016.bondsPayable}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>应付利息                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"   value="${year_2015.interestPayable}" readonly="readonly" /></td>
                              <td class="bR-t7"><input type="text"  value="${year_2016.interestPayable}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>负债总额                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"   value="${year_2015.totalLiabilities}" readonly="readonly" /></td>
                              <td class="bR-t7"><input type="text"   value="${year_2016.totalLiabilities}" readonly="readonly"/></td>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="bR-line">
                        <table cellpadding="0" cellspacing="0" border="0" class="base-tb3">
                            <tr>
                                <th class="bR-t6"></th>
                                <th class="bR-t7">2015年</th>
                                <th class="bR-t7">2016年</th>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>资产负债率</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.assetsLiabilityRadio}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text"  value="${year_2016.assetsLiabilityRadio}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                               <td class="bR-t61"><span>现金流动负债比率</span>
                               </td><td class="bR-t7"><input type="text"   value="${year_2015.cashLiabilityRadio}" readonly="readonly"/></td> 
                               <td class="bR-t7"><input type="text"   value="${year_2016.cashLiabilityRadio}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                               <td class="bR-t61"><span>速动比率</span></td>
                               <td class="bR-t7"><input type="text"   value="${year_2015.quickRadio}" readonly="readonly" /></td>
                               <td class="bR-t7"><input type="text"   value="${year_2016.quickRadio}" readonly="readonly" /></td>
                             </tr>
                            <tr>
                               <td class="bR-t61"><span>利息保障倍数</span></td>
                               <td class="bR-t7"><input type="text"  value="${year_2015.interestEnsureTimes}" readonly="readonly" /></td>
                               <td class="bR-t7"><input type="text"  value="${year_2016.interestEnsureTimes}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                               <td class="bR-t61"><span>带息负债比率</span></td>
                               <td class="bR-t7"><input type="text"   value="${year_2015.interestLiabilityRadio}" readonly="readonly" /></td>
                               <td class="bR-t7"><input type="text"   value="${year_2016.interestLiabilityRadio}" readonly="readonly" /></td>
                            </tr>
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
                            <tr>
                              <td class="bR-t61"><span>主营业务收入                  (万元)</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.mainBusinessIncome}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text"  value="${year_2016.mainBusinessIncome}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                             <td class="bR-t61"><span>平均资产总额                  (万元)</span></td>
                             <td class="bR-t7"><input type="text"  value="${year_2015.totalAverageAssets}" readonly="readonly"/></td>
                             <td class="bR-t7"><input type="text"  value="${year_2016.totalAverageAssets}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>应收账款平均余额                  (万元)</span></td>
                              <td class="bR-t7"><input type="text" value="${year_2015.receivableAverageBalance}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text" value="${year_2016.receivableAverageBalance}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>平均流动资产总额                  (万元)</span></td>
                              <td class="bR-t7"><input type="text" value="${year_2015.averageTurnoverAssets}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text" value="${year_2016.averageTurnoverAssets}" readonly="readonly"/></td>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="bR-line" style="margin-top: 28px;">
                        <table cellpadding="0" cellspacing="0" border="0" class="base-tb3">
                            <tr>
                                <th class="bR-t6"></th>
                                <th class="bR-t7">2015年</th>
                                <th class="bR-t7">2016年</th>
                            </tr>
                            <tr>
                               <td class="bR-t61"><span>总资产周转率</span></td>
                               <td class="bR-t7"><input type="text"  value="${year_2015.assetsTurnoverRadio}" readonly="readonly"/></td>
                               <td class="bR-t7"><input type="text"  value="${year_2016.assetsTurnoverRadio}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>应收账款周转率</span></td>
                              <td class="bR-t7"><input type="text"   value="${year_2015.incomeTurnoverRadio}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text"  value="${year_2016.incomeTurnoverRadio}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>流动资产周转率</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.currentTurnoverRadio}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text"   value="${year_2016.currentTurnoverRadio}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>资产现金回收率</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.cashAssetsRecovery}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text"   value="${year_2016.cashAssetsRecovery}" readonly="readonly"/></td>
                            </tr>
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
                            <tr> 
                               <td class="bR-t61"><span>净利润(万元)</span></td>
                               <td class="bR-t7"><input type="text"  value="${year_2015.retainedProfits}" readonly="readonly"/></td>
                               <td class="bR-t7"><input type="text"  value="${year_2016.retainedProfits}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                               <td class="bR-t61"><span>平均净资产(万元)</span></td>
                               <td class="bR-t7"><input type="text"  value="${year_2015.averageNetAssets}" readonly="readonly"/></td>
                               <td class="bR-t7"><input type="text"  value="${year_2016.averageNetAssets}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>主营业务利润(万元)</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.mainOperationProfits}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text" value="${year_2016.mainOperationProfits}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>成本费用总额(万元)</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.totalCost}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text"  value="${year_2016.totalCost}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>平均资本(万元)</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.averageCapital}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text"  value="${year_2016.averageCapital}" readonly="readonly"/></td>
                            </tr>
                        </table>
                    </div>
                    
                     <div class="bR-line" style="margin-top: 28px;">
                        <table cellpadding="0" cellspacing="0" border="0" class="base-tb3">
                            <tr>
                                <th class="bR-t6"></th>
                                <th class="bR-t7">2015年</th>
                                <th class="bR-t7">2016年</th>
                            </tr>
                            <tr>
                               <td class="bR-t61"><span>净资产收益率</span></td>
                               <td class="bR-t7"><input type="text"  value="${year_2015.returnOnEquity}" readonly="readonly"/></td>
                               <td class="bR-t7"><input type="text"  value="${year_2016.returnOnEquity}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>总资产报酬率</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.returnOnAssets}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text"  value="${year_2016.returnOnAssets}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>主营业务利润率</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.mainProfitRadio}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text"  value="${year_2016.mainProfitRadio}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>盈余现金保障倍数</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.surplusCashTimes}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text" value="${year_2016.surplusCashTimes}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>成本费用利润率</span></td>
                              <td class="bR-t7"><input type="text"  value="${year_2015.costProfitRadio}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text"  value="${year_2016.costProfitRadio}" readonly="readonly"/></td>
                            </tr>
                            <tr>
                              <td class="bR-t61"><span>资本收益率</span></td>
                              <td class="bR-t7"><input type="text" value="${year_2015.capitalYield}" readonly="readonly"/></td>
                              <td class="bR-t7"><input type="text"  value="${year_2016.capitalYield}" readonly="readonly"/></td>
                           </tr>
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
                                        <div id="datumLink0Div" class="uploader-list"></div>
                                    </div>
                                   </span>

                                    <span data-attr="upload">
                                    	<input type="hidden" name="userTacaDatums[1].id"/>
                                   	 	<input type="hidden" id="datumLink1" name="userTacaDatums[1].datumLink"/>
                                    	<input type="hidden" id="datum1OriginalName" name="userTacaDatums[1].datumOriginalName"/>
                                    	<div class="baseUp-block baseUp-ul" id="filePicker2" style="background-color: #f8f8f8;padding: 0 !important;">
                                        	<div id="datumLink1Div" class="uploader-list"></div>
                                    	</div>
                                    </span>
                            </div>
                        </div>
                    </div>
                    <div class="bR-button">
                        <button type="button" class="bt2">上一页</button>
                        <button type="button" class="bt1">下一页</button>
                    </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../footer.jsp"/>
</body>
</html>