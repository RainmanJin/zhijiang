<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/path.jsp" %>

<div class="detail-list zsBlock_edit zsBlock_pad zs_b1215" id="registInfo">
	<h3>注册信息</h3>
    <div class="tab-block zstab-block">
	<div class="panel-body">
    	<table class="tax-table tax-tabl-top" cellpadding="0" cellspacing="0" border="0">
        	<tr>
            	<td class="sh48">组织机构代码：</td>
                <td class="sh49"><c:if test="${empty mongoCompany.orgCode}">暂无</c:if>${mongoCompany.orgCode}</td>
                <%--<td class="sh49">${bizCompany.companyNo}</td>--%>
                <td class="sh48">统一社会信用代码</td>
                <td class="sh49"><c:if test="${empty mongoCompany.creditNo}">暂无</c:if>${mongoCompany.creditNo}</td>
            </tr>
            <tr>
            	<td class="sh48">注册号：</td>
                <td class="sh49">${mongoCompany.companyCode}</td>
                <td class="sh48">登记状态：</td>
                <td class="sh49">${mongoCompany.companyStatus}</td>
            </tr>
            <tr>
            	<td class="sh48">法定代表：</td>
                <td class="sh49"><a href="${basePath}/search?key=${mongoCompany.legalPerson }" >${mongoCompany.legalPerson}</a></td>
                <td class="sh48">注册资本：</td>
                <td class="sh49" id="bizCompanyCapital">${fn:replace(mongoCompany.capital,'None','-')}</td>
            </tr>
            <tr>
            	<td class="sh48">公司类型：</td>
                <td class="sh49">${mongoCompany.companyType}</td>
                <td class="sh48">登记机关：</td>
                <td class="sh49">${mongoCompany.authority}</td>
            </tr>
            <tr>
            	<td class="sh48">成立日期：</td>
                <td class="sh49">${mongoCompany.establishDate}</td>
                <td class="sh48">营业期限：</td>
                <td class="sh49">${fn:replace(mongoCompany.operationStartdate,"00:00:00","")}至${fn:replace(mongoCompany.operationEnddate,"00:00:00","")}</td>
            </tr>
            <tr>
            	<td class="sh48">企业地址：</td>
                <td class="sh49" colspan="3" width="25%"><label>${fn:replace(mongoCompany.companyAddress,"查看地图附近公司","")}</label><c:if test="${not empty mongoCompany.companyAddress}">
					<%--<a href="javascript:;" data-map="${bizCompany.companyAddress}" style=" padding-left: 8px;">查看地图</a>--%>
					</c:if></td>
            </tr>
            <tr>
            	<td class="sh48">经营范围：</td>
                <td class="sh49" colspan="3" width="25%">${mongoCompany.businessScope}</td>
            </tr>
        </table>
	</div>
    </div>
<!--注册信息-->
	<div class="zsBlock_edit zsBlock_pad tab-block">
        <h3 class="">行政许可信息
            <small id="searchbadge_small" class="searchbadge" data-content="">0</small>
        </h3>
        <c:if test="${empty ssQualificationInformationPage.content && empty safetyProductionLicensePage.content 
                      && empty qualityLicenseForSafetyPage.content && empty dischargePermitPage.content && empty corpProdUalsnbrfPage.content}">
            <div class="detail_nodata">暂未收录该企业相关信息</div>
        </c:if>
	
        <c:if test="${!(empty ssQualificationInformationPage.content)}">
		<div class="panel-body zstab-block">
			<div class="change-s">
				安监企业行政许可信息
			</div>
			<table cellpadding="0" cellspacing="0" border="0"
				class="tax-table tax-tabl-top">
				<tr>
					<th class="sh48">行政许可事项</th>
					<th class="sh48">许可范围</th>
					<th class="sh48">有效期</th>
					<th class="sh48">证书号码</th>
				</tr>
				<tr model_data style="display:none;">
					<td class="sd48" tag_attr="sht">{0}</td>
					<td class="sd48" tag_attr="sht">{1}</td>
					<td class="sd48" tag_attr="sht">{2}</td>
					<td class="sd48" tag_attr="sht">{3}</td>
				</tr>
				<c:forEach items="${ssQualificationInformationPage.content}"
					var="ssQua">
					<tr tag_attr="now_data">
						<td class="sd48" tag_attr="sht">${ssQua.licenseName}</td>
						<td class="sd48" tag_attr="sht">${ssQua.licenseScope}</td>
						<td class="sd48" tag_attr="sht">${ssQua.validDate}</td>
						<td class="sd48" tag_attr="sht">${ssQua.licenseCode}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</c:if>
    
        <c:if test="${!(empty safetyProductionLicensePage.content)}">
		<div class="panel-body zstab-block" id="safetyPermit">
			<div class="change-s">安全生产许可证信息</div>
			<table cellpadding="0" cellspacing="0" border="0"
				class="tax-table tax-tabl-top">
				<tr>
					<th class="sh48">许可范围</th>
					<th class="sh48">有效期</th>
					<th class="sh48">证书号码</th>
				</tr>
				<tr model_data style="display:none;">
					<td class="sd48" tag_attr="sht">{0}</td>
					<td class="sd48" tag_attr="sht">{1}</td>
					<td class="sd48" tag_attr="sht">{2}</td>
				</tr>
				<c:forEach items="${safetyProductionLicensePage.content}"
					var="safetyPr">
					<tr tag_attr="now_data">
						<td class="sd48" tag_attr="sht">${safetyPr.licenseScope}</td>
						<td class="sd48" tag_attr="sht">${safetyPr.validDate}</td>
						<td class="sd48" tag_attr="sht">${safetyPr.licenseCode}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</c:if>
        
        <c:if test="${!(empty qualityLicenseForSafetyPage.content)}">
		<div class="panel-body zstab-block" id="safetyOrg">
			<div class="change-s">安全评价机构资质许可</div>
			<table cellpadding="0" cellspacing="0" border="0" class="t"
				class="tax-table tax-tabl-top">
				<tr>
					<th class="sh48" maxlength="45">业务范围</th>
					<th class="sh48">有效期</th>
				</tr>
				<tr model_data style="display:none;">
					<td class="sd48" tag_attr="sht">{0}</td>
					<td class="sd48" tag_attr="sht">{1}</td>
				</tr>
				<c:forEach items="${qualityLicenseForSafetyPage.content}"
					var="qualityLi">
					<tr tag_attr="now_data">
						<td class="sd48" tag_attr="sht">${qualityLi.licenseScope}</td>
						<td class="sd48" tag_attr="sht"><fmt:formatDate
								value="${qualityLi.validDate}" pattern="yyyy/MM/dd" />
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</c:if>	
    
        <c:if test="${!(empty dischargePermitPage.content)}">
        <div class="panel-body zstab-block" id="dischargeLicense">
            <div class="change-s">排污许可证信息</div>
            <table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<th class="sh48">所属行业</th>
					<th class="sh48">排污许可证编号</th>
					<th class="sh48">排污许可证类型</th>
					<th class="sh48">发证机关名称</th>
					<th class="sh48">有效期</th>
				</tr>
				<tr model_data style="display:none;">
					<td class="sd48" tag_attr="sht">{0}</td>
					<td class="sd48" tag_attr="sht">{1}</td>
					<td class="sd48" tag_attr="sht">{2}</td>
					<td class="sd48" tag_attr="sht">{3}</td>
					<td class="sd48" tag_attr="sht">{4}</td>
				</tr>
				<c:forEach items="${dischargePermitPage.content}" var="dischargePe">
					<tr tag_attr="now_data">
						<td class="sd48" tag_attr="sht">${dischargePe.industryType}</td>
						<td class="sd48" tag_attr="sht">${dischargePe.licenseCode}</td>
						<td class="sd48" tag_attr="sht">${dischargePe.licenseType}</td>
						<td class="sd48" tag_attr="sht">${dischargePe.authority}</td>
						<td class="sd48" tag_attr="sht">${dischargePe.validDate}</td>
					</tr>
				</c:forEach>
			</table>
        </div>
        </c:if>
        
        <c:if test="${!(empty corpProdUalsnbrfPage.content)}">
        <div class="panel-body zstab-block" id="adminLicense">
            <div class="change-s">行政许可信息</div>
            <table cellpadding="0" cellspacing="0" border="0" class="tax-table">
            <c:forEach items="${corpProdUalsnbrfPage.content}" var="corpPr">
				<tr>
					<td class="sh48">发证机构</td>
					<td class="sh49">${corpPr.authority}</td>
					<td class="sh48">行政许可类别</td>
					<td class="sh49">${corpPr.licenseType}</td>
				</tr>
				<tr>
					<td class="sh48">产品类别</td>
					<td class="sh49">${corpPr.productType}</td>
					<td class="sh48">产品型号</td>
					<td class="sh49">${corpPr.productModel}</td>
				</tr>
				<tr>
					<td class="sh48">产品名称</td>
					<td class="sh49">${corpPr.productName}</td>
					<td class="sh48">明细</td>
					<td class="sh49">${corpPr.detail}</td>
				</tr>
				<tr>
					<td class="sh48">证书编号</td>
					<td class="sh49">${corpPr.docCode}</td>
					<td class="sh48">证书有效期满日期</td>
					<td class="sh49"><fmt:formatDate
							value="${corpPr.licenseValidDate}" pattern="yyyy/MM/dd" />
					</td>
				</tr>
				<tr>
					<td class="sh48">发证日期</td>
					<td class="sh49"><fmt:formatDate
							value="${corpPr.licenseDate}" pattern="yyyy/MM/dd" />
					</td>
					<td class="sh48"></td>
					<td class="sh49"></td>
				</tr>
			</c:forEach>
            </table>
        </div>
        </c:if>
	</div>
<!--主要人员--> 
	<div class="zsBlock_edit zsBlock_pad tab-block">
		<h3 class="">主要人员<small id="searchbadge" class="searchbadge" data-content="">${empty empList ? 0 : fn:length(empList)}</small></h3>
		<c:if test="${empty empList }"><div class="detail_nodata">暂未收录该企业相关信息</div></c:if>
		<div class="detail-people zstab-block" id="emp_list">
			<div  id="emp_nametocompany" class="base-look" style="display:none;left:43px; top:18px;">
				<img src="${basePath}/images/jt-icon.png">
				<span>点击查看"<em></em>"投资的其他公司</span>
			</div>
			<c:if test="${not empty empList}" >
				<c:forEach items="${empList}" var="emp">
					<a href="${basePath}/search?key=${emp.employeeName }">
						<div class="base-list">
							<span class="people-profile"><img src="${basePath}/images/new/${emp.positionImg}" style="cursor: auto;"></span>
							<div class="people-block">
								<h4 tag_attr="sht"  >${emp.employeeName }</h4>
								<h5 tag_attr="sht"  >${emp.position }</h5>
							</div>
						</div>
					</a>
				</c:forEach>
			</c:if>
		</div>
    </div>
    
    <!-- 股东 -->
	<div class="tab-block zsBlock_edit zsBlock_pad ">
        <h3 class="">股东信息<small id="searchbadge" class="searchbadge" data-content="">${empty partnerPage ? 0 : partnerPage.total}</small></h3>
        <c:if test="${empty partnerPage.content}">
            <div class="detail_nodata" id="nodataPartner">暂未收录该企业相关信息</div>
        </c:if>
        <c:if test="${!(empty partnerPage.content)}">
            <div class="panel-body zstab-block">
                <table cellpadding="0" cellspacing="0" border="0" class="tax-table tax-tabl-top">
                    <tr>
                        <th class="sh001">股东名称</th>
                        <th class="sh002">认缴出资额</th>
                        <th class="sh002">实缴出资额</th>
                        <th class="sh002">持股比例</th>
                    </tr>
                    <tbody id="partner_list">
	                    <tr model>
	                        <td class="sd48">{0}</th>
	                        <td class="sd48">{1}</th>
	                        <td class="sd48">{2}</th>
	                        <td class="sd48">{3}</th>
	                    </tr>
                    	<c:forEach items="${partnerPage.content}" var="partner">
                        <tr>
                            <td class="sd48">
                                <c:if test="${!(empty partner.companyNo)}">
                                    <a href="${fn:replace(companyDetailUrl,'companyNo',partner.companyNo) }" style="text-decoration: none" partner_name tag_attr="sht">${partner.stockName}</a>
                                </c:if>
                                <c:if test="${empty partner.companyNo}">
                                    <a href="${basePath}/search?key=${partner.stockName}" style="text-decoration: none" partner_name tag_attr="sht">${partner.stockName}</a>
                                </c:if>
                            </td>
                            <td class="sd48">${empty partner.stockCapital? "暂未公开" : partner.stockCapital}</td>
                            <td class="sd48">${empty partner.stockRealcapital? "暂未公开" : partner.stockRealcapital}</td>
                            <c:if test="${partner.proportion != 0}">
                                <td class="sd48">${partner.proportion}%</td>
                            </c:if>
                            <c:if test="${partner.proportion == 0}">
                                <td class="sd48">暂未公开</td>
                            </c:if>
                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="d-page" config='{name: "partner", url:"${basePath }/company/partner/list?companyNameDigest=${bizCompany.companyNameDigest}", npage:1, spage:${partnerPage.totalPages }, total:${partnerPage.total }, nodata:"#nodataPartner", pin:2, isAjax:true, autoLoad:false}'></div>
        </c:if>
    </div>
    
    <!-- 投资者信息 -->
	<div class="tab-block zsBlock_edit zsBlock_pad ">
		<h3 class="">投资者信息<small id="searchbadge_businessInvest" class="searchbadge" data-content="">0</small>&nbsp;&nbsp;&nbsp;
	<%--		<span id="businessInvest_no" class="tab-important">*该项信息需得到企业授权才能查看哦，立即<a href="javascript:void(0);"  onclick="applyAuthorizationInit(7)">申请企业授权</a>
			</span>--%>
		</h3>
		<div class="zsBlock_list zsIn" id="businessInvest_no">
			<p>需企业授权才可查看，点击
				<%--<a href="#">申请授权</a>--%>
				<a href="javascript:void(0);" onclick="applyAuthorizationInit(7)">申请授权</a>
			</p>
		</div>
        <div class="detail_nodata" style="display:none;" id="nodataInvest">暂未收录该企业相关信息</div>
        <div class="panel-body zstab-block" id="businessInvest_list_dpage">
            <table cellpadding="0" cellspacing="0" border="0" class="tax-table tax-tabl-top">
                <tr>
	                <th class="sh50">投资人名称</th>
	                <th class="sh50">投资人注册号</th>
	                <th class="sh50">投资人国籍编码</th>
	                <th class="sh50">投资金额（万元）</th>
	                <th class="sh51">投资币种编码</th>
	                <th class="sh50">投资比例</th>
                </tr>
                <tbody id="businessInvest_list" >
                	<tr model>
                		<td class="sh50">{0}</td>
                		<td class="sh50">{1}</td>
                		<td class="sh50">{2}</td>
                		<td class="sh50">{3}</td>
                		<td class="sh51">{4}</td>
                		<td class="sh50">{5}</td>
                	</tr>
                </tbody>
            </table>
        </div>
		<div class="d-page" style="display: none;" config='{name: "businessInvestInfo", url:"${basePath }/company/businessInvestInfo/list?companyNameDigest=${bizCompany.companyNameDigest}&authData=7", nodata:"#nodataInvest", pin:2, isAjax:true}'></div>

	</div>
	 
	<!--分支机构信息-->
	<div class="tab-block zsBlock_edit zsBlock_pad ">
		<h3 class="">分支机构
			<small id="searchbadge" class="searchbadge"
				   data-content="">${empty branchPage ? 0 : branchPage.total}</small>
		</h3>
		<c:if test="${empty branchPage || empty branchPage.content }">
			<div class="detail_nodata" id="nodataBranch">暂未收录该企业相关信息</div>
		</c:if>
		<c:if test="${not empty branchPage && not empty branchPage.content }">
			<div class="mechanism zstab-block" style="padding-right: 4px;" id="branch_list">

				<div class="mechanism-list zs_wn" style="display: none;" model>
					<a href="{0}" class="mechanism-link" target="_blank">{1}</a>
				</div>

				<c:forEach items="${branchPage.content}" var="branch" varStatus="i">
					<div class="mechanism-list zs_wn">
						<a <c:if
								test="${not empty branch.companyNo}"> href=${fn:replace(companyDetailUrl, 'companyNo', branch.companyNo)}
						</c:if> class="mechanism-link" target="_blank">${branch.companyName }</a>
					</div>
				</c:forEach>
			</div>
			<div class="d-page" config='{name: "branch", url:"${basePath }/company/branch/list?companyNameDigest=${bizCompany.companyNameDigest}", nodata:"#nodataBranch", npage:1, spage:${branchPage.totalPages }, total:${branchPage.total }, pin:2, isAjax:true, autoLoad:false}'></div>

		</c:if>

	</div>

	<!--变更记录--> 
	<div class="tab-block zsBlock_edit zsBlock_pad ">
        <h3 class="">
                        变更记录
            <small id="searchbadge" class="searchbadge" data-content="">${empty changepage ? 0 : changepage.total}</small>
        </h3>
        <c:if test="${empty changepage.content}">
            <div class="detail_nodata">暂未收录该企业相关信息</div>
        </c:if>
		<c:if test="${!(empty changepage.content)}">
			<div class="mechanism  zstab-block" id="change_list">
                <div  style="display: none;" model>
                    <div class="" style="overflow: hidden;">
                    <div class="mechanism-list zs_record" style="border-right:0;">
                        <p>变更项目：<span >{0}</span></p>
                        <p>变更前：<span maxlength="20">{1}</span></p>
                    </div>
                    <div class="mechanism-list zs_record" >
                        <p>变更日期：<span >{3}</span></p>
                        <p>变更后：<span maxlength="20">{2}</span></p>
                    </div>
                    </div>
                </div>


				<c:forEach items="${changepage.content}" var="change">

                     <div class="" style="overflow: hidden;">
					<div class="mechanism-list zs_record" style="border-right:0;">
						<p>变更项目：<span >${empty change.changeField?"":change.changeField}</span></p>
						<p>变更前：<span maxlength="20">${empty change.contentBefore?"":change.contentBefore}</span></p>
					</div>
                    <div class="mechanism-list zs_record">
                        <p>变更日期：<span >${fn:split(change.changeDate,' ')[0]}
                                                </span></p>
                        <p>变更后：<span maxlength="20">${empty change.contentAfter?"":change.contentAfter}</span></p>
                    </div>

                    </div>
				</c:forEach>


			</div>
			<div class="d-page" config='{name: "change", url:"${basePath }/company/change/list?companyNameDigest=${bizCompany.companyNameDigest}", nodata:"#nodataChange", npage:${empty param.npage ? '1' : param.npage}, spage:${changepage.totalPages }, total:${changepage.total }, pin:2, isAjax:true, autoLoad:false}'></div>

		</c:if>
    </div>

</div>
