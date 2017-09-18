<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>之江信用-商贸联活动</title>
    <base href="${basePath }/" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
    <meta http-equiv="description" content="">
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/lightbox.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath}/js/uzj/taca/audit_detaile.js" src="${basePath }/js/lib/require.js"></script>
    <script>
      var  activityCfg = activityCfg || {page : 'company_operate'};
    </script>
</head>

<body  style="background-color: #f2f4f8;">
<jsp:include page="../../user/top.jsp" />
<jsp:include page="details_top.jsp" />
    <div class="n-layout base">
		<div class="base-write">
			<h2><span>申报资料</span><i>浙江省商贸诚信示范企业评选</i></h2>
			<div class="baseCredit">
			  <jsp:include page="details_left.jsp"/>
			  <div class="baseRight">
                <h3 class="baseRight-tit"><span>企业经营信息</span></h3>
                    <div class="bR-line" style="margin-top: 20px;">
                        <div class="bR-line-left">主要产品</div>
                        <div class="bR-line-right">
                            <input style="width: 210px" class="t-text" type="text" name="userTacaOperation.mainProduct"
                                   value="${userTacaOperation.mainProduct}" placeholder="请输入主要产品" readonly="readonly">
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">经营（生产网点数）</div>
                        <div class="bR-line-right">
                            <input style="width: 80px;" class="t-text" type="text" name="userTacaOperation.directSitesNum"
                                   value="${userTacaOperation.directSitesNum}" readonly="readonly"><i>家（直营）</i>
                            <input style="width: 80px;" class="t-text" type="text" name="userTacaOperation.affiliateSitesNum" value="${userTacaOperation.affiliateSitesNum}" readonly="readonly"><i>家（加盟）</i>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">主要员工</div>
                        <div class="bR-line-right">
                            <input id="datdd" style="width: 80px;" class="t-text" type="text" name="userTacaOperation.employeeNum"
                                   value="${userTacaOperation.employeeNum}" readonly="readonly"><i>人</i>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">开业时间</div>
                        <div class="bR-line-right">
                            <input  id="lala" style="width: 210px" class="date_picker t-text" type="text" name="userTacaOperation.openingDate"
                                   value="${userTacaOperation.openingDate}" readonly="readonly">
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">经营场所租赁合同</div>
                        <div class="bR-line-right">
                            <i style="margin: 0;">请上传照片或扫描，格式为JPG、JPEG、PNG，小于2MB，最多可上传 5张</i>
                            <div class="baseUp">
                              <c:forEach items="${tacaDatums}" var="datums" >
                                <c:if test="${datums.datumType == 1}">
                                  <div class="baseUp-block baseUp-ul" id="filePicker1" style="background-color: #f8f8f8;padding: 0 !important;">
                                     <a class="example-image-link" href="${basePath}/${datums.datumLink}" data-lightbox="example-set" >
                                     	<img src="${basePath }/${datums.datumLink}" style="width: 108px;height: 98px;margin-top: -10px;" />
                                     </a>
                                   </div>
                                </c:if>
                              </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">经营场所所有形态</div>
                        <div class="bR-line-right">
                            <table cellpadding="0" cellspacing="0" border="0" class="base-tb">
                                <tr>
                                    <th>自有</th>
                                    <th>租赁</th>
                                </tr>
                                <tr>
                                    <td><input type="text" name="userTacaOperation.ownedAllForms"
                                               value="${userTacaOperation.ownedAllForms}" readonly="readonly"></td>
                                    <td><input type="text" name="userTacaOperation.rentAllForms"
                                               value="${userTacaOperation.rentAllForms}" readonly="readonly"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">经营场所面积</div>
                        <div class="bR-line-right">
                            <table cellpadding="0" cellspacing="0" border="0" class="base-tb">
                                <tr>
                                    <th>自有</th>
                                    <th>租赁</th>
                                </tr>
                                <tr>
                                    <td><input type="text" name="userTacaOperation.ownedArea" value="${userTacaOperation.ownedArea}" readonly="readonly"></td>
                                    <td><input type="text" name="userTacaOperation.rentArea" value="${userTacaOperation.rentArea}" readonly="readonly"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">生产设备所有形态</div>
                        <div class="bR-line-right">
                            <table cellpadding="0" cellspacing="0" border="0" class="base-tb">
                                <tr>
                                    <th>自有</th>
                                    <th>租赁</th>
                                </tr>
                                <tr>
                                    <td><input type="text" name="userTacaOperation.ownedProdFacility"
                                               value="${userTacaOperation.ownedProdFacility}" readonly="readonly"></td>
                                    <td><input type="text" name="userTacaOperation.rentProdFacility"
                                               value="${userTacaOperation.rentProdFacility}" readonly="readonly"></td>
                                </tr>
                            </table>
                        </div>
                    </div>


                    <h3 class="baseRight-tit"><span>机关监管信息</span></h3>

                    <div class="bR-line" style="margin-top:28px;">
                        <div class="bR-line-left">机关信息</div>
                        <input type="hidden" name="userTacaSupervise.id" value="${userTacaSupervise.id}"/>
                        <div class="bR-line-right bR-bg">
                            <p class="bR-bg-p1"><span>国税部门</span><input type="text" name="userTacaSupervise.nationalTax"
                                                                        value="${userTacaSupervise.nationalTax}"
                                                                        placeholder="省、市、区、局、所" readonly="readonly"/></p>
                            <p class="bR-bg-p2"><span>工商部门</span><input type="text" name="userTacaSupervise.industryAndCommerce"
                                                                        value="${userTacaSupervise.industryAndCommerce}"
                                                                        placeholder="省、市、区、局、所" readonly="readonly"/></p>
                            <p class="bR-bg-p1"><span>地税部门</span><input type="text" name="userTacaSupervise.landTax"
                                                                        value="${userTacaSupervise.landTax}"
                                                                        placeholder="省、市、区、局、所" readonly="readonly"/></p>
                            <p class="bR-bg-p2"><span>物价部门</span><input type="text" name="userTacaSupervise.priceDepartment"
                                                                        value="${userTacaSupervise.priceDepartment}"
                                                                        placeholder="省、市、区、局、所" readonly="readonly"/></p>
                            <p class="bR-bg-p1"><span>质监部门</span><input type="text" name="userTacaSupervise.quanlityControl"
                                                                        value="${userTacaSupervise.quanlityControl}"
                                                                        placeholder="省、市、区、局、所" readonly="readonly"/></p>
                            <p class="bR-bg-p2"><span>消费者协会</span><input type="text" name="userTacaSupervise.consumerAssociation"
                                                                         value="${userTacaSupervise.consumerAssociation}"
                                                                         placeholder="省、市、区、局、协会" readonly="readonly"/></p>
                            <p class="bR-bg-p1"><span>卫生部门</span><input type="text" name="userTacaSupervise.healthDepartment"
                                                                        value="${userTacaSupervise.healthDepartment}"
                                                                        placeholder="省、市、区、局、所" readonly="readonly"/></p>
                            <p class="bR-bg-p2"><span>基本账户所在银行</span><input type="text" name="userTacaSupervise.baseAccountBank"
                                                                            value="${userTacaSupervise.baseAccountBank}"
                                                                            placeholder="省、市行、支行"></p>
                            <p class="bR-bg-p1"><span>劳动保障门</span><input type="text" name="userTacaSupervise.laborEnsure"
                                                                         value="${userTacaSupervise.laborEnsure}"
                                                                         placeholder="省、市、区、局、所" readonly="readonly"/></p>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">行政许可信息</div>
                        <div class="bR-line-right">
                            <i style="margin: 0;">请上传照片或扫描，格式为JPG、JPEG、PNG，小于2MB，最多可上传 5张</i>
                            <div class="baseUp">
                            	 <c:forEach items="${tacaDatums}" var="datums" >
                                    <c:if test="${datums.datumType == 2}">
                                    	<div class="baseUp-block baseUp-ul">
                                    	   <a class="example-image-link" href="${basePath}/${datums.datumLink}" data-lightbox="example-set" >
                                       	     <img src="${basePath }/${datums.datumLink}" style="width: 108px;height: 98px;margin-top: -10px;"/>
                                       	   </a>
                                     	</div>
                                     </c:if>
                                 </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">行政许可详情<br>(若无许可请忽略)</div>
                        <div class="bR-line-right">
                            <div id="check_box_id">
                                <c:if test="${honorMap != null && honorMap['top_three'] !=null}">
                                    <c:set var="select_v" value="${honorMap['top_three'].type}"/>
                                </c:if>
                                <input type="hidden" name="userTacaHonors[0].id" value="${empty honorMap['top_three'] ?'':honorMap['top_three'].id}"/>
                                <input type="hidden" id="honor_check_box_type"
                                       value="${honorMap['top_three'].type}"/>
                                <input type="hidden" id="select_v" value="${select_v}"/>

                                <i style="margin: 0;">食品药品监督局：</i>
                                <i style="margin: 0;">餐饮服务许可证</i>

                                <label class="jqWrap">
										<input type="radio" name="userTacaHonors[0].type" value="1"/>
								</label>
                                <i style="margin: 0;">食品流通许可证</i>
                                <label class="jqWrap">
										<input type="radio" name="userTacaHonors[0].type" value="2" />
									</label>
                                <i style="margin: 0;">食品生产许可证</i>
                                <label class="jqWrap">
									<input type="radio" name="userTacaHonors[0].type" value="3"/>
								</label>
                            </div>
                            <table cellpadding="0" cellspacing="0" border="0" class="base-tb1">
                                <tr>
                                    <th class="bR-t1">发证机关</th>
                                    <th class="bR-t1">证件编号</th>
                                    <th class="bR-t1">发证日期</th>
                                    <th class="bR-t1">有效日期</th>
                                </tr>
                                <tr>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[0].issuingOrgan"
                                                             value="${empty honorMap['top_three'] ?'':honorMap['top_three'].issuingOrgan}" readonly="readonly"/></td>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[0].certificateCode"
                                                             value="${empty honorMap['top_three'] ?'':honorMap['top_three'].certificateCode}" readonly="readonly"/></td>
                                    <td class="bR-t1"><input class="date_picker" type="text" name="userTacaHonors[0].issuingDate"
                                                             value="${empty honorMap['top_three'] ?'':honorMap['top_three'].issuingDate}" readonly="readonly"/></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[0].validDate"
                                                             value="${empty honorMap['top_three'] ?'':honorMap['top_three'].validDate}" readonly="readonly"/></td>
                                </tr>
                            </table>
                            <div>
                                <i style="margin: 0;">省（市）消防主管部门：消防合格证明</i>
                            </div>

                            <input type="hidden" name="userTacaHonors[1].id" value="${empty honorMap['4'] ?'':honorMap['4'].id}"/>
                            <input type="hidden" name="userTacaHonors[1].type" value="4"/>

                            <table cellpadding="0" cellspacing="0" border="0" class="base-tb1">
                                <tr>
                                    <th class="bR-t1">发证机关</th>
                                    <th class="bR-t1">证件编号</th>
                                    <th class="bR-t1">发证日期</th>
                                    <th class="bR-t1">有效日期</th>
                                </tr>
                                <tr>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[1].issuingOrgan"
                                                             value="${empty honorMap['4'] ?'':honorMap['4'].issuingOrgan}" readonly="readonly"/></td>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[1].certificateCode"
                                                             value="${empty honorMap['4'] ?'':honorMap['4'].certificateCode}" readonly="readonly"/></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[1].issuingDate"
                                                             value="${empty honorMap['4'] ?'':honorMap['4'].issuingDate}" readonly="readonly"/></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[1].validDate"
                                                             value="${empty honorMap['4'] ?'':honorMap['4'].validDate}" readonly="readonly"/></td>
                                </tr>
                            </table>
                            <div>
                                <i style="margin: 0;">环境保护行政主管部门：浙江省排污许可证/环保达标证明</i>
                            </div>
                            <input type="hidden" name="userTacaHonors[2].id" value="${empty honorMap['5'] ?'':honorMap['5'].id}"/>
                            <input type="hidden" name="userTacaHonors[2].type" value="5"/>
                            <table cellpadding="0" cellspacing="0" border="0" class="base-tb1">
                                <tr>
                                    <th class="bR-t1">发证机关</th>
                                    <th class="bR-t1">证件编号</th>
                                    <th class="bR-t1">发证日期</th>
                                    <th class="bR-t1">有效日期</th>
                                </tr>
                                <tr>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[2].issuingOrgan"
                                                             value="${empty honorMap['5'] ?'':honorMap['5'].issuingOrgan}" readonly="readonly"/></td>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[2].certificateCode"
                                                             value="${empty honorMap['5'] ?'':honorMap['5'].certificateCode}" readonly="readonly"/></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[2].issuingDate"
                                                             value="${empty honorMap['5'] ?'':honorMap['5'].issuingDate}" readonly="readonly"/></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[2].validDate"
                                                             value="${empty honorMap['5'] ?'':honorMap['5'].validDate}" readonly="readonly"/></td>
                                </tr>
                            </table>
                            <div>
                                <i style="margin: 0;">质监部门：计量合格证明</i>
                            </div>
                            <input type="hidden" name="userTacaHonors[3].id" value="${empty honorMap['6'] ?'':honorMap['6'].id}"/>
                            <input type="hidden" name="userTacaHonors[3].type" value="6"/>
                            <table cellpadding="0" cellspacing="0" border="0" class="base-tb1">
                                <tr>
                                    <th class="bR-t1">发证机关</th>
                                    <th class="bR-t1">证件编号</th>
                                    <th class="bR-t1">发证日期</th>
                                    <th class="bR-t1">有效日期</th>
                                </tr>
                                <tr>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[3].issuingOrgan"
                                                             value="${empty honorMap['6'] ?'':honorMap['6'].issuingOrgan}" readonly="readonly" /></td>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[3].certificateCode"
                                                             value="${empty honorMap['6'] ?'':honorMap['6'].certificateCode}" readonly="readonly" /></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[3].issuingDate"
                                                             value="${empty honorMap['6'] ?'':honorMap['6'].issuingDate}" readonly="readonly"/></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[3].validDate"
                                                             value="${empty honorMap['6'] ?'':honorMap['6'].validDate}" readonly="readonly"></td>
                                </tr>
                            </table>
                            <div>
                                <i style="margin: 0;">卫计委(卫生局)：公共场所卫生许可证/卫生防疫合格证明</i>
                            </div>
                            <input type="hidden" name="userTacaHonors[4].id" value="${empty honorMap['7'] ?'':honorMap['7'].id}"/>
                            <input type="hidden" name="userTacaHonors[4].type" value="7"/>
                            <table cellpadding="0" cellspacing="0" border="0" class="base-tb1">
                                <tr>
                                    <th class="bR-t1">发证机关</th>
                                    <th class="bR-t1">证件编号</th>
                                    <th class="bR-t1">发证日期</th>
                                    <th class="bR-t1">有效日期</th>
                                </tr>
                                <tr>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[4].issuingOrgan"
                                                             value="${empty honorMap['7'] ?'':honorMap['7'].issuingOrgan}" readonly="readonly" /></td>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[4].certificateCode"
                                                             value="${empty honorMap['7'] ?'':honorMap['7'].certificateCode}" readonly="readonly" /></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[4].issuingDate"
                                                             value="${empty honorMap['7'] ?'':honorMap['7'].issuingDate}" readonly="readonly" /></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[4].validDate"
                                                             value="${empty honorMap['7'] ?'':honorMap['7'].validDate}" readonly="readonly" /></td>
                                </tr>
                            </table>

                        </div>
                    </div>
                    <div class="bR-button">
                        <button type="button" class="bt1">下一页</button>
                    </div>
            </div>
		  </div>
		</div>
	</div>
<jsp:include page="../../footer.jsp" />
</body>
</html>
