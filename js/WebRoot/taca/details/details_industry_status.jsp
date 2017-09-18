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
    <link href="${basePath}/style/new-css/lightbox.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath}/js/uzj/taca/audit_detaile.js" src="${basePath }/js/lib/require.js"></script>
    <script type="text/javascript" src="${basePath}/js/lib/laydate/laydate.js"></script>
    <script>
      var  activityCfg = activityCfg || {page : 'industry_status'};
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
                <h3 class="baseRight-tit"><span>企业规模及行业地位（2016年度）</span></h3>
                <input type="hidden" id="companyScale" value="${userTacaIndustry.companyScale}"/>
                <input type="hidden" id="operateAchievement" value="${userTacaIndustry.operateAchievement}"/>
                <input type="hidden" id="marketOccupancy" value="${userTacaIndustry.marketOccupancy}"/>
                <input type="hidden" id="intelligentManageLevel" value="${userTacaIndustry.intelligentManageLevel}"/>
                <input type="hidden" name="userTacaIndustry.id" value="${userTacaIndustry.id}"/>
                    <div class="bR-line">
                        <div class="bR-line-left bR-line-left1">企业规模</div>
                        <div class="bR-line-right">
                            <div>
                                <i style="margin: 0;">大型</i>
                                <label class="jqWrap">
										<input type="radio" attr="companyScale" name="userTacaIndustry.companyScale" value="1" class="" />
									</label>
                                <i style="margin: 0;">中型</i>
                                <label class="jqWrap">
										<input type="radio" attr="companyScale" name="userTacaIndustry.companyScale" value="2" class="" />
									</label>
                                <i style="margin: 0;">小型</i>
                                <label class="jqWrap">
										<input type="radio" attr="companyScale" name="userTacaIndustry.companyScale" value="3" class="" />
									</label>
                                <i style="margin: 0;">微型</i>
                                <label class="jqWrap">
										<input type="radio" attr="companyScale" name="userTacaIndustry.companyScale" value="4" class="" />
									</label>
                            </div>
                            <i style="margin: 0;">注：根据《统计上大中小微型企业划分办法》（国统字[2011]75号）划分的大、中、小、微型企业</i>
                            <div class="bR-bg bR-bg1 bR-bg2 bR-bg3">
                                <p class="bR-bg-p1"><span>占地面积</span><input type="text" name="userTacaIndustry.area" placeholder="单位：平方米" value="${userTacaIndustry.area}" readonly="readonly"/></p>
                                <p class="bR-bg-p2"><span>年营业收入</span><input type="text" name="userTacaIndustry.annualIncome" placeholder="单位：万元" value="${userTacaIndustry.annualIncome}" readonly="readonly"/></p>
                                <p class="bR-bg-p1"><span>年从业人员</span><input type="text" name="userTacaIndustry.annualStaff" placeholder="单位：人 " value="${userTacaIndustry.annualStaff}" readonly="readonly"/></p>
                                <p class="bR-bg-p2"><span>年末资产总额</span><input type="text" name="userTacaIndustry.annualAssets" placeholder="单位：万元" value="${userTacaIndustry.annualAssets}" readonly="readonly"/></p>
                                <p class="bR-bg-p1"><span>年产能产量</span><input type="text" name="userTacaIndustry.annualOutput" placeholder="" value="${userTacaIndustry.annualOutput}" readonly="readonly"/></p>
                                <p class="bR-bg-p2"><span>年主营业务收入</span><input type="text" name="userTacaIndustry.annualMainIncome" placeholder="单位：万元" value="${userTacaIndustry.annualMainIncome}" readonly="readonly"/></p>
                                <p class="bR-bg-p1"><span>年利润总额</span><input type="text" name="userTacaIndustry.annualProfit" placeholder="单位：万元" value="${userTacaIndustry.annualProfit}" readonly="readonly"/></p>
                            </div>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left bR-line-left1">企业规模</div>
                        <div class="bR-line-right">
                            <i style="margin: 0;">在省内主营商品（产品）行业市场中所处地位</i>
                            <div>
                                <em class="bR-em">经营业绩：</em>
                                <i style="margin: 0;">上游</i>
                                <label class="jqWrap">
										<input type="radio" attr="operateAchievement" name="userTacaIndustry.operateAchievement" value="1" class="" />
									</label>
                                <i style="margin: 0;">中游</i>
                                <label class="jqWrap">
										<input type="radio" attr="operateAchievement" name="userTacaIndustry.operateAchievement" value="2" class="" />
									</label>
                                <i style="margin: 0;">下游</i>
                                <label class="jqWrap">
										<input type="radio" attr="operateAchievement" name="userTacaIndustry.operateAchievement" value="3" class="" />
									</label>
                            </div>
                            <div>
                                <em class="bR-em">市场占有率：</em>
                                <i style="margin: 0;">上游</i>
                                <label class="jqWrap">
										<input type="radio" attr="marketOccupancy" name="userTacaIndustry.marketOccupancy" value="1" class="" />
									</label>
                                <i style="margin: 0;">中游</i>
                                <label class="jqWrap">
										<input type="radio" attr="marketOccupancy" name="userTacaIndustry.marketOccupancy" value="2" class="" />
									</label>
                                <i style="margin: 0;">下游</i>
                                <label class="jqWrap">
										<input type="radio" attr="marketOccupancy" name="userTacaIndustry.marketOccupancy" value="3" class="" />
									</label>
                            </div>
                            <div>
                                <em class="bR-em">智能化管理水平：</em>
                                <i style="margin: 0;">上游</i>
                                <label class="jqWrap">
										<input type="radio" attr="intelligentManageLevel" name="userTacaIndustry.intelligentManageLevel" value="1" class="" />
									</label>
                                <i style="margin: 0;">中游</i>
                                <label class="jqWrap">
										<input type="radio" attr="intelligentManageLevel" name="userTacaIndustry.intelligentManageLevel" value="2" class="" />
									</label>
                                <i style="margin: 0;">下游</i>
                                <label class="jqWrap">
										<input type="radio" attr="intelligentManageLevel" name="userTacaIndustry.intelligentManageLevel" value="3" class="" />
									</label>
                            </div>
                        </div>
                    </div>

                <h3 class="baseRight-tit"><span>企业商誉</span></h3>

                    <div class="bR-line" style="margin-top: 28px;">
                        <div class="bR-line-left bR-line-left1">证书信息</div>
                        <div class="bR-line-right">
                            <i style="margin: 0; display: block;">商誉具体指企业荣誉、商标、名牌、专利（市、省、国家级）证书。</i>
                            <i style="margin: 0;">请上传照片或扫描，格式为JPG、JPEG、PNG，小于2MB，最多可上传 5张</i>
                            <div class="baseUp">
                             	<c:forEach items="${tacaDatums}" var="datums" >
                                	<div class="baseUp-block baseUp-ul" id="filePicker1" style="background-color: #f8f8f8;padding: 0 !important;">
                                 	 	<a class="example-image-link" href="${basePath}/${datums.datumLink}" data-lightbox="example-set" >
                                     		<img src="${basePath }/${datums.datumLink}" style="width: 108px;height: 98px;margin-top: -10px;"/>
                                   		</a>
                              	 	</div>
                              	 </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left bR-line-left1">证书详情</div>
                        <div class="bR-line-right">
                            <c:choose>
                                <c:when test="${fn:length(userTacaCertificates) == 0}">
                                    <table cellpadding="0" cellspacing="0" border="0" class="base-tb1 base-tb2"  data-attr="repeat_table">
                                        <tr>
                                            <th class="bR-t2">名称</th>
                                            <th class="bR-t3">级别</th>
                                            <th class="bR-t2">认定单位</th>
                                            <th class="bR-t4">证件编号</th>
                                            <th class="bR-t5">发证日期</th>
                                            <th class="bR-t5">有效期至</th>
                                        </tr>
                                        <tr>
                                            <td class="bR-t2"><input type="text" name="userTacaCertificates[0].name" placeholder="荣誉、专利、名牌、商标" value="" readonly="readonly"/></td>
                                            <td class="bR-t3">
                                                <select name="userTacaCertificates[0].level" disabled="disabled">
                                                    <option value="">请选择</option>
                                                    <option value="1">市级</option>
                                                    <option value="2">省级</option>
                                                    <option value="3">国家级</option>
                                                </select>
                                            </td>
                                            <td class="bR-t2"><input type="text" name="userTacaCertificates[0].authorityOrgan"  value="" readonly="readonly"/></td>
                                            <td class="bR-t4"><input type="text" name="userTacaCertificates[0].certificateCode" placeholder="或认定文件文号" value="" readonly="readonly"/></td>
                                            <td class="bR-t5"><input onclick="laydate()" type="text" name="userTacaCertificates[0].issuingDate"  value="" readonly="readonly"/></td>
                                            <td class="bR-t5"><input onclick="laydate()" type="text" name="userTacaCertificates[0].validDate"    value="" readonly="readonly"/></td>
                                        </tr>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${userTacaCertificates}" var="utc" varStatus="status">
                                        <table data-attr="repeat_table" cellpadding="0" cellspacing="0" border="0" class="base-tb1 base-tb2">
                                            <input type="hidden" name="userTacaCertificates[${status.index}].id" value="${utc.id}" />
                                            <input type="hidden" id="level${status.index}" value="${utc.level}" />
                                            <tr>
                                                <th class="bR-t2">名称</th>
                                                <th class="bR-t3">级别</th>
                                                <th class="bR-t2">认定单位</th>
                                                <th class="bR-t4">证件编号</th>
                                                <th class="bR-t5">发证日期</th>
                                                <th class="bR-t5">有效期至</th>
                                            </tr>
                                            <tr>
                                                <td class="bR-t2"><input type="text" name="userTacaCertificates[${status.index}].name" placeholder="荣誉、专利、名牌、商标" value="${utc.name}" readonly="readonly"/></td>
                                                <td class="bR-t3">
                                                    <select data-attr="level${status.index}" name="userTacaCertificates[${status.index}].level" disabled="disabled">
                                                        <option value="">请选择</option>
                                                        <option value="1">市级</option>
                                                        <option value="2">省级</option>
                                                        <option value="3">国家级</option>
                                                    </select>
                                                </td>
                                                <td class="bR-t2"><input type="text" name="userTacaCertificates[${status.index}].authorityOrgan"  value="${utc.authorityOrgan}" readonly="readonly"/></td>
                                                <td class="bR-t4"><input type="text" name="userTacaCertificates[${status.index}].certificateCode" placeholder="或认定文件文号" value="${utc.certificateCode}" readonly="readonly"/></td>
                                                <td class="bR-t5"><input type="text" onclick="laydate()" name="userTacaCertificates[${status.index}].issuingDate"   value="${utc.issuingDate}"  readonly="readonly"/></td>
                                                <td class="bR-t5"><input type="text" onclick="laydate()" name="userTacaCertificates[${status.index}].validDate"     value="${utc.validDate}" readonly="readonly"/></td>
                                            </tr>
                                        </table>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="bR-button">
                        <button type="button"  class="bt2">上一页</button>
                        <button type="button" class="bt1">下一页</button>
                    </div>
            </div>
            <!--end -->
        </div>
    </div>
</div>
<script type="text/javascript">
    laydate.skin('molv'); //danlan ,dahong,molv
</script>
<jsp:include page="../../footer.jsp"/>
</body>
</html>