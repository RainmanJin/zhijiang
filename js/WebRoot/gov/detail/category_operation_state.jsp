<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/path.jsp" %>

<div class="detail-list zsBlock_edit zsBlock_pad zs_b1215" style="display: none" id="operationState">
    <div class="zsBlock_edit" style="margin-top: 0">
        <h3 id="annual_inspectDiv">年报信息
            <small id="searchbadge" class="searchbadge"
                   data-content="">${empty businessAnnualInspectPage ? '' : businessAnnualInspectPage.total}</small>
        </h3>
        <c:if test="${empty businessAnnualInspectPage || empty businessAnnualInspectPage.content }">
            <div class="detail_nodata">暂未收录该企业相关信息</div>
        </c:if>
        <c:if test="${not empty businessAnnualInspectPage && not empty businessAnnualInspectPage.content }">
        <div class="change zstab-block">

                <div class="panel-body" id="punish_list" list="1">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <th class="zs01">组织机构代码</th>
                            <%--<th class="zs01">企业名称</th>--%>
                            <th class="zs01">工商局内码</th>
                            <th class="zs02">年检结论</th>
                            <th class="zs02">年检日期</th>
                            <th class="zs02">状态</th>
                        </tr>
                        <tbody id="business_annual_inspect_tbody_list">
                        <tr model>
                            <td class="zs01" tag_attr="sht">{0}</td>
                            <%--<td class="zs01" tag_attr="sht" maxlength="18">{1}</td>--%>
                            <td class="zs01" tag_attr="sht">{2}</td>
                            <td class="zs02" tag_attr="sht">{3}</td>
                            <td class="zs02" tag_attr="sht">{4}</td>
                            <td class="zs02" tag_attr="sht">{5}</td>
                        </tr>
                        <c:forEach items="${businessAnnualInspectPage.content}" var="businessAnnualInspect"
                                   varStatus="i">
                            <tr tag_attr="now_data">
                                <td class="zs01"
                                    tag_attr="sht">${businessAnnualInspect.orgCode?'&nbsp;':businessAnnualInspect.orgCode }</td>
                           <%--     <td class="zs01" tag_attr="sht"
                                    maxlength="18">${empty businessAnnualInspect.companyName? '&nbsp;' : businessAnnualInspect.companyName}</td>--%>
                                <td class="zs01"
                                    tag_attr="sht">${empty businessAnnualInspect.icCode? '&nbsp;' : businessAnnualInspect.icCode}</td>
                                <td class="zs02"
                                    tag_attr="sht">${empty businessAnnualInspect.checkResult? '&nbsp;' : businessAnnualInspect.checkResult}</td>
                                <td class="zs02" tag_attr="sht"><fmt:formatDate
                                        value="${businessAnnualInspect.checkDate }" pattern="yyyy-MM-dd"/></td>
                                <td class="zs02"
                                    tag_attr="sht">${empty businessAnnualInspect.status? '&nbsp;' : businessAnnualInspect.status}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

        </div>
        <div class="d-page"style="display: none;" config='{name: "business_annual_inspect_name", url:"${basePath}/gov/company/businessAnnualInspect/list?companyNameDigest=${bizCompany.companyNameDigest}", nodata:"#nodataChange", npage:1, spage:${businessAnnualInspectPage.totalPages }, total:${businessAnnualInspectPage.total }, pin:2, isAjax:true, autoLoad:false}'></div>
        </c:if>
    </div>

    <div class="zsBlock_edit">
        <h3 id="taxStateDiv">纳税状态</h3>
        <div class="zsBlock_list zsTax">
            <p>
                <em>纳税信用等级：</em>
                <c:if test="${taxAList[0].taxLevel == 'A'}">
                    <span>A级</span>
                </c:if>
                <c:if test="${taxAList[0].taxLevel != 'A'}">
                    <span>低于A级</span>
                </c:if>
            </p>
            <p>
                <em>是否正常纳税：</em>
                <c:if test="${requestScope.bizCompanyTaxStatue.taxOwnedState==null }">
                    <span>未查见</span>
                </c:if>
                <c:if test="${requestScope.bizCompanyTaxStatue.taxOwnedState==0 }">
                    <span>不欠税</span>
                </c:if>
                <c:if test="${requestScope.bizCompanyTaxStatue.taxOwnedState==1 }">
                    <span>欠税</span>
                </c:if>
            </p>
            <p>
                <em>是否欠税：</em>
                <c:if test="${requestScope.bizCompanyTaxStatue.taxOwnedState==null }">
                    <span>未查见</span>
                </c:if>
                <c:if test="${requestScope.bizCompanyTaxStatue.taxOwnedState==0 }">
                    <span>不欠税</span>
                </c:if>
                <c:if test="${requestScope.bizCompanyTaxStatue.taxOwnedState==1 }">
                    <span>欠税</span>
                </c:if>
            </p>
            <p>
                <em>欠税余额：</em>
                <c:if test="${requestScope.bizCompanyTaxStatue.taxOwnedAmount == null}">
                    <span>——</span>
                </c:if>
                <c:if test="${requestScope.bizCompanyTaxStatue.taxOwnedAmount != null}">
                    <span>${requestScope.bizCompanyTaxStatue.taxOwnedAmount }</span>
                </c:if>
            </p>
        </div>
    </div>
    <div class="zsBlock_edit zsBlock_pad">
        <h3 id="water_electric_gas_fund">水、电、燃气、公积金缴费趋势</h3>
        <div id="water_electric_gas_fund_time" class="tb1213_time" style="float: right;margin: 10px 23px;z-index: 999;position: relative;">时间：
            <input class="Wdate" type="text"
                   id="startDate"
                   onchange="javascript:dateChang()"
                   onFocus="WdatePicker({skin:'whyGreen',isShowClear:false,readOnly:true,dateFmt:'yyyy-MM',maxDate:'#F{$dp.$D(\'endDate\')}'})"/> &nbsp;至&nbsp;
            <input class="Wdate" type="text"
                   id="endDate"
                   onchange="javascript:dateChang()"
                   onFocus="WdatePicker({skin:'whyGreen',isShowClear:false,readOnly:true,dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'startDate\')}'})"/>
        </div>
     <%--   <div class="zsBlock_list zsIn" id="water_electric_gas_fund_basic_noview">
            <p>需企业授权才可查看，点击
                &lt;%&ndash;<a href="#">申请授权</a>&ndash;%&gt;
                <a href="javascript:void(0);" onclick="applyAuthorizationInit(16)">申请授权</a>
            </p>
        </div>--%>
        <div class="" id="water_electric_gas_fund_trend" class="" style="width:765px;height:400px;/*display: none;*/"></div>
    </div>

    <div class="zsBlock_edit zsBlock_pad">
        <h3 class="" id="tax_div">税务信息
            <small id="searchbadge_taxsmall" class="searchbadge"
                   data-content="">0
            </small>
        </h3>
        <c:if test="${!empty taxBasicCount && taxBasicCount == 0 && !empty rentBasicCount && rentBasicCount == 0}">
            <div id="tax_nation_nodata" class="detail_nodata">暂未收录该企业相关信息</div>
        </c:if>
        <c:if test="${!empty taxBasicCount && taxBasicCount > 0 && !empty rentBasicCount && rentBasicCount > 0}">

            <div class="panel-body zstab-block">
                <div class="tax-list">
                    <small id="searchbadge_taxBasic" style="display: none;"
                           data-content="">${empty taxBasicCount ? 0 : taxBasicCount}</small>
                    <c:if test="${!empty taxBasicCount && taxBasicCount != 0}">
                        <p class="tax-list-p" style="    margin-top: 1px;">国税信息
                                <%--	<span class="tab-important" id="tax_nation_noview" style="color: #999;font-size: 12px;border: 1px;
                                    border: 1px solid #eaeaea;border-radius: 3px;padding-left: 15px;    padding: 0 3px 1px;">*该项信息需得到企业授权才能查看哦，立即
                                        <a href="javascript:void(0);" onclick="applyAuthorizationInit(14)" style="text-decoration:none;color:blue;">申请企业授权</a>
                                    </span>--%>
                        </p>
                        <div class="zsBlock_list zsIn" id="tax_nation_noview">
                            <p>需企业授权才可查看，点击
                                    <%--<a href="#">申请授权</a>--%>
                                <a href="javascript:void(0);" onclick="applyAuthorizationInit(14)">申请授权</a>
                            </p>
                        </div>

                    </c:if>
                    <!-- <div id="tax_nation_nodata" class="detail_nodata" style="display:none;">暂未收录该企业相关信息</div> -->
                    <div id="tax_nation_new" style="display:none;">
                        <table cellpadding="0" cellspacing="0" border="0" class="tax-table">
                            <tr>
                                <td class="sh48">税务登记号</td>
                                <td class="sh49">无数据</td>
                                <td class="sh48">税务部门编码</td>
                                <td class="sh49">无数据</td>
                            </tr>
                            <tr>
                                <td class="sh48">企业状态编码</td>
                                <td class="sh49">无数据</td>
                                <td class="sh48">税务登记日期</td>
                                <td class="sh49">无数据</td>
                            </tr>
                            <tr>
                                <td class="sh48">银行编码</td>
                                <td class="sh49">无数据</td>
                                <td class="sh48">缴税银行账号</td>
                                <td class="sh49">无数据</td>
                            </tr>
                            <tr>
                                <td class="sh48">经营方式</td>
                                <td class="sh49">无数据</td>
                                <td class="sh48">经营期限</td>
                                <td class="sh49">无数据</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="tax-list" style="     margin-bottom: 0px; ">
                    <small id="searchbadge_rentBasic" style="display: none;"
                           data-content="">${empty rentBasicCount ? 0 : rentBasicCount}</small>
                    <c:if test="${!empty rentBasicCount && rentBasicCount != 0}">
                        <p class="tax-list-p">地税信息
                                <%--	<span class="tab-important" id="tax_local_noview" style="color: #999;font-size: 12px;border: 1px;
                                    border: 1px solid #eaeaea;border-radius: 3px;padding-left: 15px;    padding: 0 3px 1px;">*该项信息需得到企业授权才能查看哦，立即
                                        <a href="javascript:void(0);" onclick="applyAuthorizationInit(15)" style="text-decoration:none;color:blue;">申请企业授权</a>
                                    </span>--%>
                        </p>

                        <div class="zsBlock_list zsIn" id="tax_local_noview">
                            <p>需企业授权才可查看，点击
                                    <%--<a href="#">申请授权</a>--%>
                                <a href="javascript:void(0);" onclick="applyAuthorizationInit(15)">申请授权</a>
                            </p>
                        </div>
                    </c:if>
                    <!-- <div id="tax_local_nodata" class="detail_nodata" style="display:none;">暂未收录该企业相关信息</div> -->
                    <div id="tax_local_new" style="display:none;">
                        <table cellpadding="0" cellspacing="0" border="0" class="tax-table">
                            <tr>
                                <td class="sh48">税务登记号</td>
                                <td class="sh49">无数据</td>
                                <td class="sh48">税务部门编码</td>
                                <td class="sh49">无数据</td>
                            </tr>
                            <tr>
                                <td class="sh48">企业状态编码</td>
                                <td class="sh49">无数据</td>
                                <td class="sh48">税务登记日期</td>
                                <td class="sh49">无数据</td>
                            </tr>
                            <tr>
                                <td class="sh48">银行编码</td>
                                <td class="sh49">无数据</td>
                                <td class="sh48">缴税银行账号</td>
                                <td class="sh49">无数据</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
    <!--end tab-block网站经营状况-->
    <div class=" zsBlock_edit zsBlock_pad">
        <h3 class="" id="qc_basic_div">质监信息
            <%--	<span class="tab-important" id="qc_basic_noview">*该项信息需得到企业授权才能查看哦，立即
                    <a href="javascript:void(0);" onclick="applyAuthorizationInit(5)">申请企业授权</a>
                </span>--%>
        </h3>
        <div class="zsBlock_list zsIn" id="qc_basic_noview">
            <p>需企业授权才可查看，点击
                <%--<a href="#">申请授权</a>--%>
                <a href="javascript:void(0);" onclick="applyAuthorizationInit(5)">申请授权</a>
            </p>
        </div>

        <div id="qc_basic_nodata" class="detail_nodata" style="display:none;">暂未收录该企业相关信息</div>
        <div class="panel-body zstab-block" id="qc_basic_new" style="display:none;">
            <div class="tax-list">
                <table cellpadding="0" cellspacing="0" border="0" class="tax-table tax-tabl-top">
                    <tr>
                        <td class="sh48">经济行业</td>
                        <td class="sh49">无数据</td>
                        <td class="sh48">经济类型</td>
                        <td class="sh49">无数据</td>
                    </tr>
                    <tr>
                        <td class="sh48">行政区划</td>
                        <td class="sh49">无数据</td>
                        <td class="sh48">职工人数</td>
                        <td class="sh49">无数据</td>
                    </tr>
                    <tr>
                        <td class="sh48">主要产品编码</td>
                        <td class="sh49">无数据</td>
                        <td class="sh48">质监批准单位</td>
                        <td class="sh49">无数据</td>
                    </tr>
                    <tr>
                        <td class="sh48">质监年检期限</td>
                        <td class="sh49">无数据</td>
                        <td class="sh48">质监年检日期</td>
                        <td class="sh49">无数据</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%--<!--end tab-block质监信息-->--%>
    <div class="zsBlock_edit zsBlock_pad">
        <h3 class="" id="customs_basic_div">海关信息
            <%--  	<span class="tab-important zstab-block" id="customs_basic_noview">*该项信息需得到企业授权才能查看哦，立即
                      <a href="javascript:void(0);" onclick="applyAuthorizationInit(6)">申请企业授权</a>
                  </span>--%>
        </h3>
        <div class="zsBlock_list zsIn" id="customs_basic_noview">
            <p>需企业授权才可查看，点击
                <%--<a href="#">申请授权</a>--%>
                <a href="javascript:void(0);" onclick="applyAuthorizationInit(6)">申请授权</a>
            </p>
        </div>
        <div id="customs_basic_nodata" class="detail_nodata" style="display:none;">暂未收录该企业相关信息</div>
        <div class="panel-body zstab-block" id="customs_basic_new" style="display:none;">
            <div class="tax-list">
                <table cellpadding="0" cellspacing="0" border="0" class="tax-table tax-tabl-top">
                    <tr>
                        <td class="sh48">海关注册号</td>
                        <td class="sh49">无数据</td>
                        <td class="sh48">注册日期</td>
                        <td class="sh49">无数据</td>
                    </tr>
                    <tr>
                        <td class="sh48">进出口权批准机关代码</td>
                        <td class="sh49">无数据</td>
                        <td class="sh48">批准文号</td>
                        <td class="sh49">无数据</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <!--end tab-block海关信息-->
    <div class="tab-block zsBlock_edit zsBlock_pad" id="Corporate_standard_info" style="margin-bottom: 0;">
        <h3 class="">企业标准情况信息</h3>
        <c:if test="${empty corpstdPage || empty corpstdPage.content }">
            <div class="detail_nodata">暂未收录该企业相关信息</div>
        </c:if>
        <c:if test="${not empty corpstdPage && not empty corpstdPage.content }">
            <div class="panel-body zstab-block">
                <table cellpadding="0" cellspacing="0" border="0" class="tax-table tax-tabl-top">
                    <tr>
                        <td class="sh48">企业标准编号</td>
                        <td class="sh49">${corpstdPage.content[0].uniqueCode}</td>
                        <td class="sh48">是否标准创新型企业</td>
                        <td class="sh49">${corpstdPage.content[0].isInnovative}</td>
                    </tr>
                    <tr>
                        <td class="sh48">标准化良好行为确认</td>
                        <td class="sh49">${corpstdPage.content[0].behaviorLevel}</td>
                        <td class="sh48"> 发布时间</td>
                        <td class="sh49"><fmt:formatDate value="${corpstdPage.content[0].foundTime}"
                                                         pattern="yyyy-MM-dd"/></td>
                    </tr>
                </table>
            </div>
        </c:if>
    </div>


</div>

<!--电商趋势-->
<div class="detail-list zsBlock_edit zsBlock_pad zs_b1215" id="ecshopDiv" style="display: none">
    <h3 class="">电商趋势</h3>
    <div id="shopSaleTrend" class="" style="width:800px;height:400px;"></div>
</div>

<!--网店经营状况-->
<div class="detail-list  zsBlock_edit zsBlock_pad zs_b1215" id="manageCredit" style="display: none">
    <h3 class="">网站经营状况
        <small id="count_domains" class="searchbadge"
               data-content="">0
        </small>
    </h3>

    <div class="status zstab-block" id="domainList" style="display: none;">
        <ul id="domain_ti"></ul>
    </div>
    <div class="status-show zstab-block" id="website_info" style="display:none;">
        <div class="status-show-img"><span></span><img src="${basePath }/images/new/status-img.jpg" id="website_img"/>
        </div>
        <div class="status-tb">
            <p>站点7日流量信息</p>
        </div>
        <div class="status-zxt" id="sitepv" style="width:420px;height: 230px;">
            <img src='${basePath}/images/loading.gif' style='margin:110px 0 0 0px;'/>
        </div>
        <a href='http://www.laoniushuju.com' target='_blank' class='status-btn' style="margin-bottom: 4px;">查看更多网站相关数据，请访问老牛数据</a>
    </div>
</div>


<div class="detail-list zsBlock_edit zsBlock_pad zs_b1215" style="display: none" id="adminPunishInfo">
    <h3 class="" id="adminPunish_div">工商部门监管信息
        <small id="searchbadge" class="searchbadge"
               data-content="">${empty adminPunishPage ? 0 : adminPunishPage.total}</small>
    </h3>
    <c:if test="${empty adminPunishPage || empty adminPunishPage.content }">
        <div class="detail_nodata">暂未收录该企业相关信息</div>
    </c:if>
    <c:if test="${not empty adminPunishPage && not empty adminPunishPage.content }">
    <div class="change zstab-block">
            <div class="panel-body" id="punish_list" list="1">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <th class="sd22">行政处罚决定书文号</th>
                        <!--  <th class="sh23">认缴出资额</th> -->
                        <th class="sd10">行政处罚内容</th>
                        <th class="sd24">处罚决定日期</th>
                        <th class="sd25">详情</th>
                    </tr>
                    <tbody id="adminPunish_tbody_list">
                    <tr model>
                        <td class="sd22" tag_attr="sht">{0}</td>
                        <td class="sd10" tag_attr="sht" maxlength="18">{2}</td>
                        <td class="sd24" tag_attr="sht">{3}</td>
                        <td class="sd25"><a href="javascript:punishDetail({4});">详情</a></td>
                    </tr>
                    <c:forEach items="${adminPunishPage.content}" var="adminPunish" varStatus="i">
                        <tr tag_attr="now_data">
                            <td class="sd22" tag_attr="sht">${adminPunish.punishNo }</td>
                            <td class="sd10" tag_attr="sht"
                                maxlength="18">${empty adminPunish.punishContent? '&nbsp;' : adminPunish.punishContent}</td>
                            <td class="sd24" tag_attr="sht"><fmt:formatDate value="${adminPunish.punishDate }"
                                                                            pattern="yyyy-MM-dd"/></td>
                            <td class="sd25"><a href="javascript:punishDetail(${adminPunish.punishId});">详情</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

    </div>
    <div class="d-page" config='{name: "adminpunish", url:"${basePath}/gov/company/adminpunish/list?companyName=${bizCompany.companyName}", nodata:"#nodataChange", npage:1, spage:${adminPunishPage.totalPages }, total:${adminPunishPage.total }, pin:2, isAjax:true, autoLoad:false}'></div>
    </c:if>
</div>


<div class="detail-list zsBlock_edit zsBlock_pad zs_b1215" id="credit_and_awards" style="display: none">


    <div class="tab-block" id="credit_enterpriseInfos_div" style="display: none;">
        <h3 class="">依法统计信用企业信息
            <small id="searchbadge" class="searchbadge"
                   data-content="">${empty credItenterpriseInfoPage ? '' : credItenterpriseInfoPage.total}</small>
        </h3>
        <c:if test="${empty credItenterpriseInfoPage || empty credItenterpriseInfoPage.content }">
            <div class="detail_nodata">暂未收录该企业相关信息</div>
        </c:if>
        <c:if test="${not empty credItenterpriseInfoPage && not empty credItenterpriseInfoPage.content }">

        <div class="change zstab-block">
                <div class="panel-body" id="punish_list" list="1">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <th class="sh48">组织机构代码</th>
                            <%--<th class="sd10">企业名称</th>--%>
                            <th class="sh48">统计标题</th>
                            <th class="sh48">统计时间</th>
                        </tr>
                        <tbody id="credit_enterprise_info_tbody_list">
                        <tr model>
                            <td class="sh48" tag_attr="sht">{0}</td>
                            <%--<td class="sd10" tag_attr="sht" maxlength="18">{1}</td>--%>
                            <td class="sh48" tag_attr="sht">{2}</td>
                            <td class="sh48" tag_attr="sht">{3}</td>
                        </tr>
                        <c:forEach items="${credItenterpriseInfoPage.content}" var="credItenterpriseInfo" varStatus="i">
                            <tr tag_attr="now_data">
                                <td class="sh48"
                                    tag_attr="sht">${credItenterpriseInfo.orgCode?'&nbsp;':credItenterpriseInfo.orgCode }</td>
                              <%--  <td class="sd10" tag_attr="sht"
                                    maxlength="18">${empty credItenterpriseInfo.companyName? '&nbsp;' : credItenterpriseInfo.companyName}</td>--%>
                                <td class="sh48" tag_attr="sht"
                                    maxlength="18">${empty credItenterpriseInfo.statTitle? '&nbsp;' : credItenterpriseInfo.statTitle}</td>
                                <td class="sh48" tag_attr="sht"><fmt:formatDate
                                        value="${credItenterpriseInfo.statDate }" pattern="yyyy-MM-dd"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

        </div>
        <div class="d-page" config='{name: "credItenterpriseInfo_name", url:"${basePath}/gov/company/credItenterpriseInfo/list?companyNameDigest=${bizCompany.companyNameDigest}", nodata:"#nodataChange", npage:1, spage:${credItenterpriseInfoPage.totalPages }, total:${credItenterpriseInfoPage.total }, pin:2, isAjax:true, autoLoad:false}'></div>
        </c:if>

    </div>


    <div class="tab-block zsBlock_edit" id="corp_prod_awards_div" style="display: none;">
        <h3 class="">奖励等良好行为记录
            <small id="searchbadge" class="searchbadge"
                   data-content="">${empty corpProdAwardPage ? '' : corpProdAwardPage.total}</small>
        </h3>
        <c:if test="${empty corpProdAwardPage || empty corpProdAwardPage.content }">
            <div class="detail_nodata">暂未收录该企业相关信息</div>
        </c:if>
        <c:if test="${not empty corpProdAwardPage && not empty corpProdAwardPage.content }">
        <div class="change zstab-block">
                <div class="panel-body" id="punish_list" list="1">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <th class="sd22">发证机构</th>
                            <%--  <th class=d10">企业名称</th>--%>
                            <th class="sd10">奖项名称</th>
                            <th class="sd24">证书有效期满日期</th>
                            <th class="sd25">详情</th>
                        </tr>
                        <tbody id="corp_prod_awards_tbody_list">
                        <tr model>
                            <td class="sd22" tag_attr="sht">{0}</td>
                            <td class="sd10" tag_attr="sht" maxlength="18">{1}</td>
                            <td class="sd24" tag_attr="sht">{2}</td>
                            <td class="sd25"><a href="javascript:corpProdAwardDetail({3});">详情</a></td>
                        </tr>
                        <c:forEach items="${corpProdAwardPage.content}" var="corpProdAward" varStatus="i">
                            <tr tag_attr="now_data">
                                <td class="sd22" tag_attr="sht">${corpProdAward.authority?'&nbsp;': corpProdAward.authority}</td>
                            <%--    <td class="sd10" tag_attr="sht"
                                    maxlength="18">${empty corpProdAward.companyName? '&nbsp;' : corpProdAward.companyName}</td>--%>
                                <td class="sd10" tag_attr="sht"
                                    maxlength="18">${empty corpProdAward.awardName? '&nbsp;' : corpProdAward.awardName}</td>
                                <td class="sd24" tag_attr="sht"><fmt:formatDate value="${corpProdAward.credentialValidDate }"
                                                                                      pattern="yyyy-MM-dd"/></td>
                                <td class="sd25"><a href="javascript:corpProdAwardDetail(${corpProdAward.id});">详情</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

        </div>
            <div class="d-page" config='{name: "corpProdAward_name", url:"${basePath}/gov/company/corpProdAward/list?companyNameDigest=${bizCompany.companyNameDigest}", nodata:"#nodataChange", npage:1, spage:${corpProdAwardPage.totalPages }, total:${corpProdAwardPage.total }, pin:2, isAjax:true, autoLoad:false}'></div>
        </c:if>

    </div>

</div>


<!--收录弹框-->
<div class="winbox">
    <div class="pop-consult-box showanimation" style="display:none;" id="includ_div">
        <div class="rel">
            <h2><a href="javascript:void(0)"><img src="${basePath}/images/close-icon.png" class="closeImg"/></a>申请企业授权
            </h2>

            <div class="rel-btn">
                <h3><strong>你已成功提交申请，请等待企业授权</strong></h3>
            </div>
        </div>
    </div>
</div>
