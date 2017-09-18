<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <script data-main="${basePath }/js/uzj/taca/taca_company_operate.js" src="${basePath }/js/lib/require.js"></script>
    <script type="text/javascript" src="${basePath}/js/lib/laydate/laydate.js"></script>
    <script type="text/javascript">
        var company_operate_cfg = {};
        company_operate_cfg['tacaDatums'] = '${tacaDatums}';
    </script>
</head>

<body style="background-color: #f2f4f8;" id="date_picker">
<jsp:include page="../user/top.jsp"/>

<jsp:include page="top.jsp"/>
<div class="n-layout base">
    <div class="base-write">
        <h2><span>申报资料</span><i>浙江省商贸诚信示范企业评选</i></h2>
        <div class="baseCredit">
            <jsp:include page="left.jsp"/>
            <!--end baseLeft-->
            <div class="baseRight">
                <h3 class="baseRight-tit"><span>企业经营信息</span></h3>
                <form id="taca_step_one" action="${basePath}/taca/apply/company/operate" method="post">
                    <input type="hidden" name="token" value="${token}"/>
                    <input type="hidden" name="userTacaOperation.id" value="${userTacaOperation.id}"/>
                    <input type="hidden" name="activityId" value="${activity.id}"/>
                   <div id="errorMsg" style="color:red;"></div>

                    <div class="bR-line">
                        <div class="bR-line-left">主要产品</div>
                        <div class="bR-line-right">
                            <input style="width: 210px" class="t-text" type="text" name="userTacaOperation.mainProduct"
                                   value="${userTacaOperation.mainProduct}" placeholder="请输入主要产品">
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">经营（生产网点数）</div>
                        <div class="bR-line-right">
                            <input style="width: 80px;" class="t-text" type="text" name="userTacaOperation.directSitesNum"
                                   value="${userTacaOperation.directSitesNum}"><i>家（直营）</i>
                            <input style="width: 80px;" class="t-text" type="text" name="userTacaOperation.affiliateSitesNum" value="${userTacaOperation.affiliateSitesNum}"><i>家（加盟）</i>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">主要员工</div>
                        <div class="bR-line-right">
                            <input id="datdd" style="width: 80px;" class="t-text" type="text" name="userTacaOperation.employeeNum"
                                   value="${userTacaOperation.employeeNum}"><i>人</i>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">开业时间</div>
                        <div class="bR-line-right">
                            <input  id="lala" style="width: 210px" class="date_picker t-text" type="text" name="userTacaOperation.openingDate"
                                   value="${userTacaOperation.openingDate}">
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">经营场所租赁合同</div>
                        <div class="bR-line-right">
                            <i style="margin: 0;">请上传照片或扫描，格式为JPG、JPEG、PNG，小于2MB，最多可上传 5张</i>
                            <div class="baseUp">
                                <span data-attr="upload">
                                <input type="hidden" name="userTacaDatums[0].id"/>
                                <input type="hidden" id="datumLink0" name="userTacaDatums[0].datumLink"/>
                                <input type="hidden"  name="userTacaDatums[0].datumName" value="房租租赁合同"/>
                                <input type="hidden"  name="userTacaDatums[0].datumType" value="1"/>
                                <div class="baseUp-block baseUp-ul" id="filePicker1" style="background-color: #f8f8f8;padding: 0 !important;">
                                    <input type="button"/>
                                    <img src="${basePath }/images/base-upload.png"/>
                                    <div id="datumLink0Div" class="uploader-list"></div>
                                </div>
                                </span>

                                <span data-attr="upload">
                                <input type="hidden" name="userTacaDatums[1].id" />
                                <input type="hidden" id="datumLink1" name="userTacaDatums[1].datumLink"/>
                                <input type="hidden"  name="userTacaDatums[1].datumName" value="房租租赁合同"/>
                                <input type="hidden"  name="userTacaDatums[1].datumType" value="1"/>
                                <div class="baseUp-block baseUp-ul" id="filePicker2" style="background-color: #f8f8f8;padding: 0 !important;">
                                    <input type="button"/>
                                    <img src="${basePath }/images/base-upload.png"/>
                                    <div id="datumLink1Div" class="uploader-list"></div>
                                </div>
                                </span>

                                <span data-attr="upload">
                                <input type="hidden" name="userTacaDatums[2].id"/>
                                <input type="hidden" id="datumLink2" name="userTacaDatums[2].datumLink"/>
                                <input type="hidden"  name="userTacaDatums[2].datumName" value="房租租赁合同"/>
                                <input type="hidden"  name="userTacaDatums[2].datumType" value="1"/>
                                <div class="baseUp-block baseUp-ul" id="filePicker3" style="background-color: #f8f8f8;padding: 0 !important;">
                                    <input type="button"/>
                                    <img src="${basePath }/images/base-upload.png"/>
                                    <div id="datumLink2Div" class="uploader-list"></div>
                                </div>
                                </span>

                                <span data-attr="upload">
                                <input type="hidden" name="userTacaDatums[3].id"/>
                                <input type="hidden" id="datumLink3" name="userTacaDatums[3].datumLink"/>
                                <input type="hidden"  name="userTacaDatums[3].datumName" value="房租租赁合同"/>
                                <input type="hidden"  name="userTacaDatums[3].datumType" value="1"/>
                                <div class="baseUp-block baseUp-ul" id="filePicker4" style="background-color: #f8f8f8;padding: 0 !important;">
                                    <input type="button"/>
                                    <img src="${basePath }/images/base-upload.png" />
                                    <div id="datumLink3Div" class="uploader-list"></div>
                                </div>
                                </span>

                                <span data-attr="upload">
                                <input type="hidden" name="userTacaDatums[4].id" />
                                <input type="hidden" id="datumLink4" name="userTacaDatums[4].datumLink"/>
                                <input type="hidden"  name="userTacaDatums[4].datumName" value="房租租赁合同"/>
                                <input type="hidden"  name="userTacaDatums[4].datumType" value="1"/>
                                <div class="baseUp-block baseUp-ul" id="filePicker5" style="background-color: #f8f8f8;padding: 0 !important;">
                                    <input type="button"/>
                                    <img src="${basePath }/images/base-upload.png"/>
                                    <div id="datumLink4Div" class="uploader-list"></div>
                                </div>
                                </span>
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
                                               value="${userTacaOperation.ownedAllForms}"></td>
                                    <td><input type="text" name="userTacaOperation.rentAllForms"
                                               value="${userTacaOperation.rentAllForms}"></td>
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
                                    <td><input type="text" name="userTacaOperation.ownedArea" value="${userTacaOperation.ownedArea}"></td>
                                    <td><input type="text" name="userTacaOperation.rentArea" value="${userTacaOperation.rentArea}"></td>
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
                                               value="${userTacaOperation.ownedProdFacility}"></td>
                                    <td><input type="text" name="userTacaOperation.rentProdFacility"
                                               value="${userTacaOperation.rentProdFacility}"></td>
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
                                                                        placeholder="省、市、区、局、所"></p>
                            <p class="bR-bg-p2"><span>工商部门</span><input type="text" name="userTacaSupervise.industryAndCommerce"
                                                                        value="${userTacaSupervise.industryAndCommerce}"
                                                                        placeholder="省、市、区、局、所"></p>
                            <p class="bR-bg-p1"><span>地税部门</span><input type="text" name="userTacaSupervise.landTax"
                                                                        value="${userTacaSupervise.landTax}"
                                                                        placeholder="省、市、区、局、所"></p>
                            <p class="bR-bg-p2"><span>物价部门</span><input type="text" name="userTacaSupervise.priceDepartment"
                                                                        value="${userTacaSupervise.priceDepartment}"
                                                                        placeholder="省、市、区、局、所"></p>
                            <p class="bR-bg-p1"><span>质监部门</span><input type="text" name="userTacaSupervise.quanlityControl"
                                                                        value="${userTacaSupervise.quanlityControl}"
                                                                        placeholder="省、市、区、局、所"></p>
                            <p class="bR-bg-p2"><span>消费者协会</span><input type="text" name="userTacaSupervise.consumerAssociation"
                                                                         value="${userTacaSupervise.consumerAssociation}"
                                                                         placeholder="省、市、区、局、协会"></p>
                            <p class="bR-bg-p1"><span>卫生部门</span><input type="text" name="userTacaSupervise.healthDepartment"
                                                                        value="${userTacaSupervise.healthDepartment}"
                                                                        placeholder="省、市、区、局、所"></p>
                            <p class="bR-bg-p2"><span>基本账户所在银行</span><input type="text" name="userTacaSupervise.baseAccountBank"
                                                                            value="${userTacaSupervise.baseAccountBank}"
                                                                            placeholder="省、市行、支行"></p>
                            <p class="bR-bg-p1"><span>劳动保障门</span><input type="text" name="userTacaSupervise.laborEnsure"
                                                                         value="${userTacaSupervise.laborEnsure}"
                                                                         placeholder="省、市、区、局、所"></p>
                        </div>
                    </div>
                    <div class="bR-line">
                        <div class="bR-line-left">行政许可信息</div>
                        <div class="bR-line-right">
                            <i style="margin: 0;">请上传照片或扫描，格式为JPG、JPEG、PNG，小于2MB，最多可上传 5张</i>
                            <div class="baseUp">
                                    <span data-attr="upload2">
                                    <input type="hidden" name="userTacaDatums[5].id" />
                                    <input type="hidden" id="datumLink5" name="userTacaDatums[5].datumLink"/>
                                    <input type="hidden" name="userTacaDatums[5].datumName" value="行政许可资质"/>
                                    <input type="hidden" name="userTacaDatums[5].datumType" value="2"/>
                                    <div class="baseUp-block baseUp-ul" id="filePicker6" style="background-color: #f8f8f8;padding: 0 !important;">
                                        <input type="button"/>
                                        <img src="${basePath }/images/base-upload.png"/>
                                        <div id="datumLink5Div" class="uploader-list"></div>
                                    </div>
                                    </span>

                                    <span data-attr="upload2">
                                    <input type="hidden" name="userTacaDatums[6].id"/>
                                    <input type="hidden" id="datumLink6" name="userTacaDatums[6].datumLink"/>
                                    <input type="hidden" name="userTacaDatums[6].datumName" value="行政许可资质"/>
                                    <input type="hidden" name="userTacaDatums[6].datumType" value="2"/>
                                    <div class="baseUp-block baseUp-ul" id="filePicker7" style="background-color: #f8f8f8;padding: 0 !important;">
                                        <input type="button"/>
                                        <img src="${basePath }/images/base-upload.png"/>
                                        <div id="datumLink6Div" class="uploader-list"></div>
                                    </div>
                                    </span>

                                    <span data-attr="upload2">
                                    <input type="hidden" name="userTacaDatums[7].id" />
                                    <input type="hidden" id="datumLink7" name="userTacaDatums[7].datumLink"/>
                                    <input type="hidden" name="userTacaDatums[7].datumName" value="行政许可资质"/>
                                    <input type="hidden" name="userTacaDatums[7].datumType" value="2"/>
                                    <div class="baseUp-block baseUp-ul" id="filePicker8" style="background-color: #f8f8f8;padding: 0 !important;">
                                        <input type="button"/>
                                        <img src="${basePath }/images/base-upload.png"/>
                                        <div id="datumLink7Div" class="uploader-list"></div>
                                    </div>
                                    </span>

                                    <span data-attr="upload2">
                                    <input type="hidden" name="userTacaDatums[8].id"/>
                                    <input type="hidden" id="datumLink8" name="userTacaDatums[8].datumLink"/>
                                    <input type="hidden" name="userTacaDatums[8].datumName" value="行政许可资质"/>
                                    <input type="hidden" name="userTacaDatums[8].datumType" value="2"/>
                                    <div class="baseUp-block baseUp-ul" id="filePicker9" style="background-color: #f8f8f8;padding: 0 !important;">
                                        <input type="button"/>
                                        <img src="${basePath }/images/base-upload.png" />
                                        <div id="datumLink8Div" class="uploader-list"></div>
                                    </div>
                                    </span>

                                    <span data-attr="upload2">
                                    <input type="hidden" name="userTacaDatums[9].id"/>
                                    <input type="hidden" id="datumLink9" name="userTacaDatums[9].datumLink"/>
                                    <input type="hidden" name="userTacaDatums[9].datumName" value="行政许可资质"/>
                                    <input type="hidden" name="userTacaDatums[9].datumType" value="2"/>
                                    <div class="baseUp-block baseUp-ul" id="filePicker10" style="background-color: #f8f8f8;padding: 0 !important;">
                                        <input type="button"/>
                                        <img src="${basePath }/images/base-upload.png"/>
                                        <div id="datumLink9Div" class="uploader-list"></div>
                                    </div>
                                    </span>
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
										<input type="radio" name="userTacaHonors[0].type" value="1">
								</label>
                                <i style="margin: 0;">食品流通许可证</i>
                                <label class="jqWrap">
										<input type="radio" name="userTacaHonors[0].type" value="2">
									</label>
                                <i style="margin: 0;">食品生产许可证</i>
                                <label class="jqWrap">
									<input type="radio" name="userTacaHonors[0].type" value="3">
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
                                                             value="${empty honorMap['top_three'] ?'':honorMap['top_three'].issuingOrgan}"></td>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[0].certificateCode"
                                                             value="${empty honorMap['top_three'] ?'':honorMap['top_three'].certificateCode}"></td>
                                    <td class="bR-t1"><input class="date_picker" type="text" name="userTacaHonors[0].issuingDate"
                                                             value="${empty honorMap['top_three'] ?'':honorMap['top_three'].issuingDate}"></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[0].validDate"
                                                             value="${empty honorMap['top_three'] ?'':honorMap['top_three'].validDate}" placeholder="无期限"></td>
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
                                                             value="${empty honorMap['4'] ?'':honorMap['4'].issuingOrgan}"></td>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[1].certificateCode"
                                                             value="${empty honorMap['4'] ?'':honorMap['4'].certificateCode}"></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[1].issuingDate"
                                                             value="${empty honorMap['4'] ?'':honorMap['4'].issuingDate}"></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[1].validDate"
                                                             value="${empty honorMap['4'] ?'':honorMap['4'].validDate}" placeholder="无期限"></td>
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
                                                             value="${empty honorMap['5'] ?'':honorMap['5'].issuingOrgan}"></td>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[2].certificateCode"
                                                             value="${empty honorMap['5'] ?'':honorMap['5'].certificateCode}"></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[2].issuingDate"
                                                             value="${empty honorMap['5'] ?'':honorMap['5'].issuingDate}"></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[2].validDate"
                                                             value="${empty honorMap['5'] ?'':honorMap['5'].validDate}" placeholder="无期限"></td>
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
                                                             value="${empty honorMap['6'] ?'':honorMap['6'].issuingOrgan}"></td>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[3].certificateCode"
                                                             value="${empty honorMap['6'] ?'':honorMap['6'].certificateCode}"></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[3].issuingDate"
                                                             value="${empty honorMap['6'] ?'':honorMap['6'].issuingDate}"></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[3].validDate"
                                                             value="${empty honorMap['6'] ?'':honorMap['6'].validDate}" placeholder="无期限"></td>
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
                                                             value="${empty honorMap['7'] ?'':honorMap['7'].issuingOrgan}"></td>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[4].certificateCode"
                                                             value="${empty honorMap['7'] ?'':honorMap['7'].certificateCode}"></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[4].issuingDate"
                                                             value="${empty honorMap['7'] ?'':honorMap['7'].issuingDate}"></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[4].validDate"
                                                             value="${empty honorMap['7'] ?'':honorMap['7'].validDate}" placeholder="无期限"></td>
                                </tr>
                            </table>

                            <div>
                                <i style="margin: 0;">其他</i>
                            </div>
                            <input type="hidden" name="userTacaHonors[5].id" value="${empty honorMap['8'] ?'':honorMap['8'].id}"/>
                            <input type="hidden" name="userTacaHonors[5].type" value="8"/>
                            <table cellpadding="0" cellspacing="0" border="0" class="base-tb1">
                                <tr>
                                    <th class="bR-t1">发证机关</th>
                                    <th class="bR-t1">证件编号</th>
                                    <th class="bR-t1">发证日期</th>
                                    <th class="bR-t1">有效日期</th>
                                </tr>
                                <tr>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[5].issuingOrgan"
                                                             value="${empty honorMap['8'] ?'':honorMap['8'].issuingOrgan}" /></td>
                                    <td class="bR-t1"><input type="text" name="userTacaHonors[5].certificateCode"
                                                             value="${empty honorMap['8'] ?'':honorMap['8'].certificateCode}" /></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[5].issuingDate"
                                                             value="${empty honorMap['8'] ?'':honorMap['8'].issuingDate}" /></td>
                                    <td class="bR-t1"><input class="date_picker"  type="text" name="userTacaHonors[5].validDate"
                                                             value="${empty honorMap['8'] ?'':honorMap['8'].validDate}" placeholder="无期限" /></td>
                                </tr>
                            </table>

                        </div>
                    </div>
                    <div class="bR-button">
                        <button type="submit" class="bt1">保存并进入下一页</button>
                    </div>
                </form>
            </div>

            <!--end -->
        </div>
    </div>
</div>
<script type="text/javascript">
    laydate({
        elem: "#date_picker .date_picker", //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        event: 'focus',//响应事件。如果没有传入event，则按照默认的click
    });
    laydate.skin('molv'); //danlan ,dahong,molv
</script>
<jsp:include page="../footer.jsp"/>
</body>
</html>